package apli;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserSearchServlet
 */
@WebServlet("/P2UserSearchServlet")
public class P2UserSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("P2UserSearchServlet実行");
        
        // 文字化け防止
        request.setCharacterEncoding("UTF-8");
        
        // セッションの生成
        HttpSession ses = request.getSession();
        
        // ログイン情報の取得
        User u = (User) ses.getAttribute("LOGIN");
        
        // URLの生成
        String url = "";
        
        // DBアクセス用部品の生成
        DBAcs dba = new DBAcs();

        try {
            // ユーザーIDの取得
            String userID = request.getParameter("userID");
            
            // ユーザー情報の取得
            ResultSet rsu = dba.selectExe("SELECT * FROM ユーザー WHERE ユーザーID = '" + userID + "'");
            if (rsu.next()) {
                String uid = rsu.getString("ユーザーID");
                String name = rsu.getString("名前");
                String icon = rsu.getString("アイコン");
                
                // ユーザー情報を設定
                User up = new User();
                up.setUserid(uid);
                up.setName(name);
                up.setIconImage(icon);
                
                // フォロー状態を確認
                boolean isFollowing = checkIfFollowing(dba, userID, u.getUserid());
                ses.setAttribute("isFollowing", isFollowing);
                
                int followCount = 0;
                int followerCount = 0;
                ses.setAttribute("followCount", followCount);
                ses.setAttribute("followerCount", followerCount);
                
                try (ResultSet rsFollow = dba.selectExe("SELECT COUNT(*) AS follow_count FROM フォロー WHERE フォロワー = '" + userID + "'")) {
                    if (rsFollow.next()) {
                        followCount = rsFollow.getInt("follow_count"); // フォローしている数
                        System.out.println("followCount："+followCount);
                    }
                }

                try (ResultSet rsFollower = dba.selectExe("SELECT COUNT(*) AS follower_count FROM フォロー WHERE フォロー = '" + userID + "'")) {
                    if (rsFollower.next()) {
                        followerCount = rsFollower.getInt("follower_count"); // フォロワー数
                        System.out.println("followerCount："+followerCount);
                    }
                }
                
                // リクエストスコープに保存
                request.setAttribute("PROF", up);
                request.setAttribute("isFollowing", isFollowing);
                request.setAttribute("followCount", followCount);
                request.setAttribute("followerCount", followerCount);
                
                // 投稿リストを取得してリクエストスコープに保存
                ArrayList<Post> postList = getPostList(dba, userID);
                request.setAttribute("postList", postList);
            
            } else {
                // ユーザーが見つからない場合の処理
                request.setAttribute("error", "ユーザーが見つかりませんでした。");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "エラーが発生しました。");
        } finally {
            // データベースを閉じる
            dba.closeDB();
        }

        // JSPへ遷移
        url = "P2ProfileStranger.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    private boolean checkIfFollowing(DBAcs dba, String followUserID, String followerUserID) {
        boolean result = false;
        System.out.println("result："+result);
        String query = "SELECT * FROM フォロー WHERE フォロー = ? AND フォロワー = ?";
        System.out.println("query："+query);
        try (PreparedStatement pstmt = dba.getConnection().prepareStatement(query)) {
            pstmt.setString(1, followUserID);
            System.out.println("followUserID："+followUserID);
            pstmt.setString(2, followerUserID);
            System.out.println("followerUserID："+followerUserID);
            try (ResultSet rs = pstmt.executeQuery()) {
                result = rs.next(); 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("return result："+result);
        return result;
        
    }

    private ArrayList<Post> getPostList(DBAcs dba, String userID) throws Exception {
        	ArrayList<Post> postList = new ArrayList<>();

        String query = "SELECT 投稿.投稿ID, 投稿.サムネイル, 投稿.作品," +
        		"(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = 投稿.投稿ID) AS コメント数, " +
        		"(SELECT COUNT(*) FROM いいね WHERE いいね.投稿ID = 投稿.投稿ID) AS いいね数 " +
        		"FROM 投稿 " +
        		"WHERE 投稿.ユーザーID = ? " +
        		"ORDER BY 投稿.アップロード日 DESC";
        System.out.println("クエリ："+query);

        try (PreparedStatement pstmt = dba.getConnection().prepareStatement(query)) {
            pstmt.setString(1, userID); 
            System.out.println("誰かな："+userID);

            try (ResultSet rsPosts = pstmt.executeQuery()) {
            	System.out.println("投稿リスト："+rsPosts);
                while (rsPosts.next()) {
                    // データを取得
                    String postId = rsPosts.getString("投稿ID");
                    System.out.println("投稿ID："+postId);
                    String thumbnailPath = rsPosts.getString("サムネイル");
                    System.out.println("サムネイルパス："+thumbnailPath);
                    String audioPath = rsPosts.getString("作品");
                    System.out.println("音声ファイルパス："+audioPath);
                    int commentCount = rsPosts.getInt("コメント数");
                    int likeCount = rsPosts.getInt("いいね数"); 
                    

                    // Postオブジェクトを作成
                    Post post = new Post();
                    post.setPostId(postId);
                    post.setThumbnailPath(thumbnailPath);
                    post.setAudioPath(audioPath);
                    post.setCommentCount(commentCount);
                    post.setLikeCount(likeCount); 

                    // リストに追加
                    postList.add(post);
                }
            }
        }
        return postList;
    }
}

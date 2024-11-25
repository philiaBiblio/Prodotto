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
 * 
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
        
        //投稿リストの生成
      	//以下変更します
      	ArrayList<User> UList = (ArrayList<User>) ses.getAttribute("USERLIST");
      	if (UList == null) {
      		UList = new ArrayList<>(); // 初回のみ新規作成
      	} else {
      		UList.clear(); // 既存データをクリア
      	}

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
                
                int followCount = 0;
                int followerCount = 0;
                
                try (ResultSet rsFollow = dba.selectExe("SELECT COUNT(*) AS follow_count FROM フォロー WHERE フォロワー = '" + userID + "'")) {
                    if (rsFollow.next()) {
                        followCount = rsFollow.getInt("follow_count"); // フォローしている数
                    }
                }

                try (ResultSet rsFollower = dba.selectExe("SELECT COUNT(*) AS follower_count FROM フォロー WHERE フォロー = '" + userID + "'")) {
                    if (rsFollower.next()) {
                        followerCount = rsFollower.getInt("follower_count"); // フォロワー数
                    }
                }
                
                // リクエストスコープに保存
                request.setAttribute("PROF", up);
                request.setAttribute("isFollowing", isFollowing);
                request.setAttribute("followCount", followCount);
                request.setAttribute("followerCount", followerCount);
            
            
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

    /**
     * フォロー状態を確認するメソッド
     */
    private boolean checkIfFollowing(DBAcs dba, String followUserID, String followerUserID) {
        boolean result = false;
        
        String query = "SELECT * FROM フォロー WHERE フォロー = ? AND フォロワー = ?";
        
        try (PreparedStatement pstmt = dba.getConnection().prepareStatement(query)) {
            pstmt.setString(1, followUserID);
            pstmt.setString(2, followerUserID);
            try (ResultSet rs = pstmt.executeQuery()) {
                result = rs.next(); // データが存在すればフォローしている
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}

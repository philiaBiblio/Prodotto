package apli;

import java.io.IOException;
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
 * Servlet implementation class P2ProfileServlet
 */
@WebServlet("/P2ProfileServletStranger")
public class P2ProfileServletStranger extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 System.out.println("P2ProfileServlet実行");
		 
		 // 文字化け防止
		 request.setCharacterEncoding("UTF-8");
		 // セッションの生成
		 HttpSession ses = request.getSession();
		 
		 // ログイン情報の取得
	     User u = (User) ses.getAttribute("LOGIN");
	     // アレイリストの取得
	     ArrayList<Toukou> upList = new ArrayList<Toukou>();
	     ArrayList<Post> postList = new ArrayList<Post>();
	     
	     // URLの生成
	     String url = "";   
	     // DBアクセス用部品の生成
	     DBAcs dba = new DBAcs();
	     DBAcs dba2 = new DBAcs();
	     DBAcs dba3 = new DBAcs();
	     
	     try {
	    	 // 自分の投稿を持ってくる
	    	 String sql = "select 投稿ID,ユーザーID,イベントID,派生ID,アップロード日,作品,サムネイル,タグID,"
	    	 		+ "(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = 投稿.投稿ID) AS コメント数,"
	    	 		+ "(SELECT COUNT(*) FROM いいね WHERE いいね.投稿ID = 投稿.投稿ID) AS いいね数 "
	    	 		+ "from 投稿 where ユーザーID = '" + u.getUserid() + "'";
	    	 
	    	 // sql文実行
	    	 ResultSet rs = dba.selectExe(sql);
	    	 while(rs.next()) {
	    		 String toukouId = rs.getString("投稿ID");
	    		 String userId = rs.getString("ユーザーID");
	    		 String eventId = rs.getString("イベントID");
	    		 String haseiId = rs.getString("派生ID");
	    		 String time = rs.getString("アップロード日");
	    		 String audio = rs.getString("作品");
	    		 String samune = rs.getString("サムネイル");
	    		 // タグID作るときはここに記入
	    		 int comm = rs.getInt("コメント数");
	    		 int iine = rs.getInt("いいね数");
	    		 
	    		 // インスタンス生成
	    		 Toukou toukou = new Toukou();
	    		 toukou.setToukouid(toukouId);
	    		 toukou.setUserid(userId);
	    		 toukou.setEventid(eventId);
	    		 toukou.setDeriveid(haseiId);
	    		 toukou.setUpday(time);
	    		 toukou.setSound(audio);
	    		 toukou.setThumbnail(samune);
	    		 
	    		 Post kazu = new Post();
	    		 kazu.setCommentCount(comm);
	    		 kazu.setLikeCount(iine);
	    		 
	    		 // アレイリストに追加
	    		 upList.add(toukou);
	    		 postList.add(kazu);
	    	 }
	    	 ses.setAttribute("UPLIST",upList);
	    	 ses.setAttribute("POSTLIST", postList);
	    	 
	    	 // フォロー数フォロワー数の確認
	    	 int followCount = 0;
             int followerCount = 0;
             
             try (ResultSet rsFollow = dba2.selectExe("SELECT COUNT(*) AS follow_count FROM フォロー WHERE フォロワー = '" + u.getUserid() + "'")) {
                 if (rsFollow.next()) {
                     followCount = rsFollow.getInt("follow_count"); // フォローしている数
                 }
             }

             try (ResultSet rsFollower = dba3.selectExe("SELECT COUNT(*) AS follower_count FROM フォロー WHERE フォロー = '" + u.getUserid() + "'")) {
                 if (rsFollower.next()) {
                     followerCount = rsFollower.getInt("follower_count"); // フォロワー数
                 }
             }
             
             ses.setAttribute("followCount", followCount);
             ses.setAttribute("followerCount", followerCount);
 
	    	// プロフィール画面へ
	    	 url = "P2ProfileMine.jsp";
	    	 System.out.println(url);

	    	 // 画面遷移
	    	 RequestDispatcher rd = request.getRequestDispatcher(url);
	    	 rd.forward(request, response);
	    	 
	    	 // ログアウト処理
	    	 dba.closeDB();
	    	 dba2.closeDB();
	    	 dba3.closeDB();
	    	 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// ログアウト処理
			dba.closeDB();
			dba2.closeDB();
			dba3.closeDB();
		}
	}

}

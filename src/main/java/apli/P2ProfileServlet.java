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
@WebServlet("/P2ProfileServlet")
public class P2ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 System.out.println("P2UserSearchServlet実行");
		 
		 // 文字化け防止
		 request.setCharacterEncoding("UTF-8");
		 // セッションの生成
		 HttpSession ses = request.getSession();
		 
		 // ログイン情報の取得
	     User u = (User) ses.getAttribute("LOGIN");
	     // アレイリストの取得
	     ArrayList<Toukou> upList = new ArrayList<Toukou>();
	     
	     // URLの生成
	     String url = "";   
	     // DBアクセス用部品の生成
	     DBAcs dba = new DBAcs();
	     
	     try {
	    	 // 自分の投稿を持ってくる
	    	 String sql = "select * from 投稿 where ユーザーID = '" + u.getUserid() + "'";
	    	 
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
	    		 
	    		 // インスタンス生成
	    		 Toukou toukou = new Toukou();
	    		 toukou.setToukouid(toukouId);
	    		 toukou.setUserid(userId);
	    		 toukou.setEventid(eventId);
	    		 toukou.setDeriveid(haseiId);
	    		 toukou.setUpday(time);
	    		 toukou.setSound(audio);
	    		 toukou.setThumbnail(samune);
	    		 
	    		 // アレイリストに追加
	    		 upList.add(toukou);
	    	 }
	    	 ses.setAttribute("UPLIST",upList);
	    	 
	    	// プロフィール画面へ
	    	 url = "P2ProfileMine.jsp";
	    	 System.out.println(url);
	 			
	    	 // 画面遷移
	    	 RequestDispatcher rd = request.getRequestDispatcher(url);
	    	 rd.forward(request, response);
	    	 
	    	 // ログアウト処理
	    	 dba.closeDB();
	    	 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// ログアウト処理
			dba.closeDB();
		}
	}

}

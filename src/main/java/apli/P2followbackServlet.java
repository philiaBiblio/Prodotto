package apli;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P2followbackServlet
 */
@WebServlet("/P2followbackServlet")
public class P2followbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2followbackServlet実行");
		 
		 // 文字化け防止
		 request.setCharacterEncoding("UTF-8");
		 // セッションの生成
		 HttpSession ses = request.getSession();
		 
		 // ログイン情報と相手の情報の取得
	     User u = (User) ses.getAttribute("LOGIN");
	     
	     // URLの生成
	     String url = "";
	        
	     // DBアクセス用部品の生成
	     DBAcs dba = new DBAcs();
	     DBAcs dba2 = new DBAcs();
	     
	     try {
//	    	 // ユーザーIDの取得
	    	 String userID = request.getParameter("followback");
	    	 
	    	 System.out.println("47：" + u.getUserid());
	    	 System.out.println("48：" + userID);
	        	
	    	 // 既にフォローしてるかのチェック
	    	 String sql = "select * from フォロー where フォロー = '" + u.getUserid() + "' and フォロワー = '" + userID + "'";
	    	 
	    	 // sql文実行
	    	 ResultSet rs = dba.selectExe(sql);
	    	 
	    	 if(rs.next()) {
	    		 System.out.println("フォローしていた場合");
	    		 // 既に存在していた場合デリートする
	    		 String deleteSQL = "DELETE FROM フォロー where フォロー = '" + u.getUserid() + "' and フォロワー = '"+ userID + "'"; 		        
	    		 // デリート文実行
	    		 dba2.UpdateExe(deleteSQL);
	    		 
	    		 String follower = "フォローを外しました";
		    	 ses.setAttribute("followNo", follower);
	    	 }else {
	    		 System.out.println("フォローしてなかった場合");
	    		// 存在してないのでインサートする
	    		 String insertSQL = 
		    			 "INSERT INTO フォロー values ('" + u.getUserid() + "','" + userID + "',to_char(systimestamp,'YYYY-MM-DD HH24:MI:SS'),'0')";
	    		 
		    	 // インサート文実行
			     dba2.UpdateExe(insertSQL);
			     
			     String follow = "フォロー出来ました";
		    	 ses.setAttribute("followOK", follow);
	    	 }
	    	 
	    	 url = "P2NotificationsServlet";
	    	 System.out.println(url);
	    
	    	 // 画面遷移
	    	 response.sendRedirect(url);
//	    	 RequestDispatcher rd = request.getRequestDispatcher(url);
//	    	 rd.forward(request, response);
	    	 
	    	 // ログアウト処理
	    	 dba.closeDB();
	    	 dba2.closeDB();
	    	 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// ログアウト処理
			dba.closeDB();
			dba2.closeDB();
		}
	}
}
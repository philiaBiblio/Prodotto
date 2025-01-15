package apli;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P1CommentDeliteServlet
 */
@WebServlet("/P1CommentDeliteServlet")
public class P1CommentDeliteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P1CommentDeliteServlet実行");
		 
		 // 文字化け防止
		 request.setCharacterEncoding("UTF-8");
		 // セッションの生成
		 HttpSession ses = request.getSession();
		 // コメントリストの取得
		 ArrayList<Comment> cmList = (ArrayList<Comment>) ses.getAttribute("CM");
		 String toukouId = (String)ses.getAttribute("comID");
		 
		 // URLの生成
	     String url = "";   
	     // DBアクセス用部品の生成
	     DBAcs dba = new DBAcs();
		
	     try {
	    	 // コメントIDを取得
	    	 String commId = request.getParameter("commId");
	    	 System.out.println("43：" + commId);
	    	 
	    	 String x = request.getParameter("hensuu");
	    	 Integer i = Integer.parseInt(x);
	    	 System.out.println("47：" + i); 
			
	    	// 存在するかどうか検索
	    	 ResultSet rs =
	    			 dba.selectExe("select * from コメント where コメントID = '" + commId + "'");
	    	 
	    	 if(rs.next()) {
	    		 String deleteSQL = "DELETE FROM コメント where コメントID = '" + commId + "'"; 		        
	    		 // デリート文実行
	    		 dba.UpdateExe(deleteSQL);
	    	 }
	    	 
	    	
	    	 
		     String trueMess = "変更できました。";
		     ses.setAttribute("DELEAT", trueMess);
		     
//		     String toukouId = cmList.get(i).getToukouId();
//		     ses.setAttribute("TTTTTOUKOUID", toukouId);
		     System.out.println("削除なう" + toukouId);
		     // リストから削除する
	    	 cmList.remove(i);  	        
		     // 画面へ遷移
		     url = "P1CommentJusinServlet";
		     response.sendRedirect(url);
		     
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

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
 * Servlet implementation class P2PostDeliteServlet
 */
@WebServlet("/P2PostDeliteServlet")
public class P2PostDeliteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2PostDeliteServlet実行");
		 
		 // 文字化け防止
		 request.setCharacterEncoding("UTF-8");
		 // セッションの生成
		 HttpSession ses = request.getSession();
		 
		 // ログイン情報の取得
	     User u = (User) ses.getAttribute("LOGIN");
	     // アレイリストの取得
	     ArrayList<Toukou> toukouList = (ArrayList) ses.getAttribute("TOUKOULIST");
	     ArrayList<Post> postList = (ArrayList<Post>) ses.getAttribute("postList");
	     
	     // URLの生成
	     String url = "";   
	     // DBアクセス用部品の生成
	     DBAcs dba = new DBAcs();
	     
	     try {
	    	 // どの投稿に対してか投稿IDを取得
	    	 String x = request.getParameter("hensuu");
	    	 Integer i = Integer.parseInt(x);
	    	 System.out.println("48：" + i); 

	    	 String sakuzyoId = request.getParameter("sakuzyoId");
	    	 System.out.println("51：" + sakuzyoId);
	    	 
	    	 // 投稿ID検索のsql文実行
	    	 ResultSet rs = dba.selectExe("select * from 投稿 where 投稿ID = '" + sakuzyoId + "'");
	    	 
	    	 if(rs.next()) {
	    		 String deleteSQL;
	    		 // 指定した投稿をテーブルから削除
	    		 deleteSQL =  "DELETE FROM 再生 where 投稿ID = '" + sakuzyoId + "'"; 		        
	    		 // デリート文実行
	    		 dba.UpdateExe(deleteSQL);
	    		 
	    		 deleteSQL = "DELETE FROM いいね where 投稿ID = '" + sakuzyoId + "'"; 		        
	    		 // デリート文実行
	    		 dba.UpdateExe(deleteSQL);
	    		 
	    		 deleteSQL = "DELETE FROM コメント where 投稿ID = '" + sakuzyoId + "'"; 		        
	    		 // デリート文実行
	    		 dba.UpdateExe(deleteSQL);
	    		 
	    		 deleteSQL = "DELETE FROM 投稿 where 投稿ID = '" + sakuzyoId + "'"; 		        
	    		 // デリート文実行
	    		 dba.UpdateExe(deleteSQL);
	    	 }
	    	 
	    	 //リストから削除する
	    	 if(toukouList != null) {
	    		 toukouList.remove(i);
	    		 ses.setAttribute("TOUKOULIST", toukouList);
	    	 }else if(postList != null) {
	    		 postList.remove(i);
	    		 ses.setAttribute("postList", postList);
	    	 }
	    	 
		     String trueMess = "変更できました。";
		     ses.setAttribute("DDDDELET", trueMess);
		        	        
		     // 画面へ遷移
		     
		  // どのページから来たかの把握
	    	 String pageFlg = request.getParameter("page");
	    	 
		     if(pageFlg.equals("deri")) {
				url = "P2DerivativesListServlet";
		     }else if(pageFlg.equals("tl")){
				url = "P2TimelineServlet";
		     }else if(pageFlg.equals("mine")){
					url = "P2ProfileServlet";
			 }
		     
		     
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

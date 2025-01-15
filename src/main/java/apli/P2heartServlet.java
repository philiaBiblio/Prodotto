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
 * Servlet implementation class P2heartServlet
 */
@WebServlet("/P2heartServlet")
public class P2heartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2heartServlet実行");
		 
		 // 文字化け防止
		 request.setCharacterEncoding("UTF-8");
		 // セッションの生成
		 HttpSession ses = request.getSession();
		 
		 // ログイン情報の取得
	     User u = (User) ses.getAttribute("LOGIN");
	     // アレイリストの取得
	     // タイムライン用
	 	 ArrayList<Post> postList = (ArrayList) ses.getAttribute("POSTLIST");
	 	 // ランキング用
	 	 ArrayList<Post> postList1 = (ArrayList) ses.getAttribute("POSTLIST1");
		 ArrayList<Post> postList2 = (ArrayList) ses.getAttribute("POSTLIST2");
		 ArrayList<Post> postList3 = (ArrayList) ses.getAttribute("POSTLIST3");
	     
	     // URLの生成
	     String url = "";   
	     // DBアクセス用部品の生成
	     DBAcs dba = new DBAcs();
	     DBAcs dba2 = new DBAcs();
	     
	     try {
	    	 // どのページから来たかの把握
	    	 String pageFlg = request.getParameter("page");
	    	 System.out.println("53：" + pageFlg);
	    	 
	    	 // どの投稿に対してか投稿IDを取得
	    	 String x = request.getParameter("hensuu");
	    	 Integer i = Integer.parseInt(x);
	    	 System.out.println("46：" + i); 

	    	 String heartId = request.getParameter("heartId");
	    	 System.out.println("49：" + heartId);
	    	 if(pageFlg.equals("Ranking")) {
	    		 System.out.println("62：" + postList1.get(i).getLikeCount());
	    		 System.out.println("63：" + postList2.get(i).getLikeCount());
	    		 System.out.println("64：" + postList3.get(i).getLikeCount());
	    		 
	    	 }else {
	    		 System.out.println("67：" + postList.get(i).getLikeCount());
	    	 }
	    	 
	    	 // 既にいいねを押してるかのチェック
	    	 String sql = "select * from いいね where 投稿ID = '" + heartId + "' and ユーザーID = '" + u.getUserid() + "'";
	    	 
	    	 // sql文実行
	    	 ResultSet rs = dba.selectExe(sql);
	    	 
	    	 if(rs.next()) {
	    		 // 既に存在していた場合デリートする
	    		 String deleteSQL = "DELETE FROM いいね where 投稿ID = '" + heartId + "' and ユーザーID = '"+ u.getUserid() + "'"; 		        
	    		 // デリート文実行
	    		 dba2.UpdateExe(deleteSQL);
	    	 }else {
	    		 // 存在してないのでインサートする
	    		 String insertSQL = 
		    			 "INSERT INTO いいね values ('" + heartId + "','" + u.getUserid() +
		    			 "',to_char(systimestamp,'YYYY-MM-DD HH24:MI:SS'),'0')";
		    	 // インサート文実行
			     dba2.UpdateExe(insertSQL);
	    	 }
	    	 
	    	 if(pageFlg.equals("TL")) {
				url = "P2TimelineServlet";
				}else if(pageFlg.equals("mine")){
					url = "P2ProfileServlet";
				}else if(pageFlg.equals("stranger")) {
					url = "P2UserSearchServlet";
				}else if(pageFlg.equals("Ranking")) {
					url = "P2RankingServlet";
				}else if(pageFlg.equals("Deri")){
					url = "P2DerivativesListServlet";
				}
	    	 
			System.out.println(url);
			
			// 画面遷移
			response.sendRedirect(url);

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

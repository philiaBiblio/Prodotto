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
 * Servlet implementation class P2NotificationsServlet
 */
@WebServlet("/P2NotificationsServlet")
public class P2NotificationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2NotificationsServlet実行開始");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの取得
		HttpSession ses = request.getSession();
		User u = (User) ses.getAttribute("LOGIN");
		
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		DBAcs dba2 = new DBAcs();
		// アレイリストの生成
		ArrayList<Tuchi> tuchiList = new ArrayList<Tuchi>();
		ArrayList<Follow> followList = new ArrayList<Follow>();
		
		try {
			String sql = "select 種類,投稿ID,通知.ユーザーID,タイムスタンプ,通知,内容,フォローされた人,受信元,名前,アイコン from "
					+ "(select 'いいね' as 種類,投稿ID,ユーザーID,リアクション日 as タイムスタンプ,通知,'' as 内容,'' as フォローされた人,''as 受信元 from いいね "
					+ "where いいね.投稿ID in (select 投稿ID from 投稿 where ユーザーID = '" + u.getUserid() + "') "
					+ "union "
					+ "select 'コメント' as 種類,投稿ID,ユーザーID,タイムスタンプ,通知,内容 ,'','' from コメント "
					+ "where コメント.投稿ID in (select 投稿ID from 投稿 where ユーザーID = '" + u.getUserid() + "') "
					+ "union "
					+ "select 'フォロー' as 種類,'',フォロー as ユーザーID,タイムスタンプ,通知,'',フォロワー as フォローされた人,'' from フォロー "
					+ "where フォロワー = '" + u.getUserid() + "' "
					+ "union "
					+ "select 'DM' as 種類,'',送信元 as ユーザーID,タイムスタンプ,既読未読 as 通知,内容,'',受信元 from DM "
					+ "where 受信元 = '" + u.getUserid() + "') 通知 "
					+ "join ユーザー on 通知.ユーザーID = ユーザー.ユーザーID order by タイムスタンプ desc";
			
	    	 // sql文実行
	    	 ResultSet rs = dba.selectExe(sql);
	    	 
	    	 while(rs.next()) {
	    		 String syurui = rs.getString("種類");
	    		 String toukouId = rs.getString("投稿ID");
	    		 String userId = rs.getString("ユーザーID");
	    		 String time = rs.getString("タイムスタンプ");
	    		 String kidoku = rs.getString("通知");
	    		 String naiyou = rs.getString("内容");
	    		 String yName = rs.getString("名前");
	    		 String yIcon = rs.getString("アイコン");
	    		 
	    		// インスタンス生成
				Tuchi tuchi = new Tuchi();
				tuchi.setSyurui(syurui);
				tuchi.setToukouId(toukouId);
				tuchi.setUserId(userId);
				tuchi.setTime(time);
				tuchi.setKidoku(kidoku);
				tuchi.setNaiyou(naiyou);
				tuchi.setYourName(yName);
				tuchi.setYourIcon(yIcon);
				
				// アレイリストに追加
				tuchiList.add(tuchi);
	    	 }
	    	 
	    	 ses.setAttribute("TUCHILIST", tuchiList);
	    	 
	    	// 既にフォローしてるかのチェック
	    	 String sqlFollow = "select * from フォロー where フォロー = '" + u.getUserid() + "'";
	    	 
	    	// sql文実行
	    	 ResultSet rs1 = dba2.selectExe(sqlFollow);
	    	 
	    	 // 全件抜き出し
	    	 while(rs1.next()) {
	    		 String follower = rs1.getString("フォロワー");
	    		 
	    		 // インスタンス生成
	    		 Follow f = new Follow();
	    		 f.setFollower(follower);
	    		 
	    		 // アレイリストに追加
	    		 followList.add(f);
	    	 }
	    	 
	    	 ses.setAttribute("followList", followList);
	    	 
	    	 
	    	 // 通知画面へ戻る
	    	 url = "P2Notifications.jsp";
	    	 System.out.println(url);
	    	 
	    	 // 画面遷移
	    	 RequestDispatcher rd = request.getRequestDispatcher(url);
	    	 rd.forward(request, response);
	    	 
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
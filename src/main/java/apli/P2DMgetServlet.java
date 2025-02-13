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
 * Servlet implementation class P2DMgetServlet
 */
@WebServlet("/P2DMgetServlet")
public class P2DMgetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2DMgetServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// ログイン情報の取得
		User u = (User)ses.getAttribute("LOGIN");
		
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// dm情報の取得
			String sqldm = "select max(タイムスタンプ) as タイムスタンプ,相手,アイコン,sum(CASE WHEN 既読未読 = '1' THEN 1 ELSE 0 END) as 未読数,"
					+ "名前 from (select タイムスタンプ,y1.ユーザーID as 相手,case when 既読未読 = '1' and 送信元  = '" + u.getUserid() + "' then 0"
					+ " when 既読未読 = '0' and 送信元  = '" + u.getUserid() + "' then 0"
					+ " when 既読未読 = '1' and 送信元 <> '" + u.getUserid() + "' then 1 else 0 end as 既読未読,"
					+ "y1.名前,y1.アイコン from DM "
					+ "join ユーザー y1 on y1.ユーザーID = DM.送信元 join ユーザー y2 on y2.ユーザーID = DM.受信元 where DMID like '%"
					+ u.getUserid() + "-%' union select タイムスタンプ,y2.ユーザーID as 相手,case when 既読未読 = '1' and 送信元  = '" + u.getUserid() + "' then 0"
					+ " when 既読未読 = '0' and 送信元  = '" + u.getUserid() + "' then 0"
					+ " when 既読未読 = '1' and 送信元 <> '" + u.getUserid() + "' then 1"
					+ " else 0 end as 既読未読,y2.名前,y2.アイコン from DM"
					+ " join ユーザー y1 on y1.ユーザーID = DM.送信元 join ユーザー y2 on y2.ユーザーID = DM.受信元 where DMID like '%"
					+ u.getUserid() + "-%') group by 相手,名前,アイコン order by タイムスタンプ desc";
			
			// sql文実行
			ResultSet rs = dba.selectExe(sqldm);
			// アレイリストの取得
			ArrayList<DM> dmssList = new ArrayList<DM>();
			
			// 繰り返しでsqlからすべての情報を得る
			while(rs.next()) {
				String time = rs.getString("タイムスタンプ");
				System.out.println("タイムスタンプ：" + time);
				String your = rs.getString("相手");
				System.out.println("相手：" + your);
				String yourIcon = rs.getString("アイコン");
				System.out.println("アイコン：" + yourIcon);
				String midoku = rs.getString("未読数");
				System.out.println("未読数：" + midoku);
				String yourName = rs.getString("名前");
				
				if(your.equals(u.getUserid())) {
					System.out.println("相手の名前とログインしてるIDが一緒なのでアレイリストに入れない");
				}else {
					// インスタンス生成
					DM dm = new DM();
					dm.setTime(time);
					dm.setYour(your);
					dm.setYourIcon(yourIcon);
					dm.setKidoku(midoku);
					dm.setYourName(yourName);
					// アレイリストに追加
					dmssList.add(dm);
					System.out.println(dm.getKidoku());
				}
			}
			ses.setAttribute("DMSSLIST", dmssList);
			
			// DM画面へ戻る
			url = "P2DM.jsp";
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

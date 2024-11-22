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
 * Servlet implementation class P2LoginServlet
 */
@WebServlet("/P2LoginServlet")
public class P2LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2LoginServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
				
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		DBAcs dba2 = new DBAcs();
		DBAcs dba3 = new DBAcs();
		
		try {
			// 入力したメールアドレスを取得
			String inMailadd = request.getParameter("mailadd");
			// sql用にシングルコーテーションで囲む
			inMailadd = "'" + inMailadd + "'";
			
			// 入力したパスワードを取得
			String inPassword = request.getParameter("pw");
			
//			//inpass暗号化
//			//暗号化部品の生成
//			Angou a = new Angou();
//			
//			//暗号化前のinPasswordをmojiに入れる
//			String moji = inPassword;
//			//暗号化実行(半角64文字に変換)
//			String AinPassword = a.getAngo(moji);
//			System.out.println("暗号化後："+AinPassword);
//			
//			// sql用にシングルコーテーションで囲む
//			AinPassword = "'" + AinPassword + "'";
			inPassword = "'" + inPassword + "'";
//			
//			// ログイン用のsql文
//			String sql = "select * from ユーザー where メールアドレス = " + inMailadd + " and パスワード = " + AinPassword;
			String sql = "select * from ユーザー where メールアドレス = " + inMailadd + " and パスワード = " + inPassword;
			// sql文実行
			ResultSet rs = dba.selectExe(sql);
			
			if(rs.next()) {
				System.out.println("ユーザーログイン実行");
				// ユーザー情報をDBから取得
				String userid = rs.getString("ユーザーID");
				String name = rs.getString("名前");
				String sex = rs.getString("性別");
				String history = rs.getString("楽器歴");
				String fq = rs.getString("頻度");
				String birth = rs.getString("生年月日");
				String iconImage = rs.getString("アイコン");
				String mailadd = rs.getString("メールアドレス");
				
				// ユーザーインスタンス生成
				User u = new User();
				
				// 取得した情報を保存
				u.setUserid(userid);
				u.setName(name);
				u.setSex(sex);
				u.setHistory(history);
				u.setFq(fq);
				u.setBirth(birth.substring(0,10));
				u.setIconImage(iconImage);
				u.setMailadd(inMailadd);
				
				// ログインしたユーザー情報を保存
				ses.setAttribute("LOGIN", u);
				System.out.println(sex);
				System.out.println(userid);
				System.out.println("ユーザーログイン成功");
				
				// dm情報の取得
				String sqldm = "select max(タイムスタンプ) as タイムスタンプ,相手,sum(CASE WHEN 既読未読 = '0' THEN 1 ELSE 0 END) as 未読数 from (select タイムスタンプ,y1.ユーザーID as 相手,既読未読 from DM join ユーザー y1 on y1.ユーザーID = DM.送信元 join ユーザー y2 on y2.ユーザーID = DM.受信元 where DMID like '%"
						+ u.getUserid() + "%' union select タイムスタンプ,y2.ユーザーID as 相手,既読未読 from DM join ユーザー y1 on y1.ユーザーID = DM.送信元 join ユーザー y2 on y2.ユーザーID = DM.受信元 where DMID like '%"
								+ u.getUserid() + "%') group by 相手 order by タイムスタンプ desc";	
				
				// sql文実行
				ResultSet rs3 = dba3.selectExe(sqldm);
				// アレイリストの取得
				ArrayList<DM> dmssList = new ArrayList<DM>();
				System.out.println(rs3);
				// 繰り返しでsqlからすべての情報を得る
				while(rs3.next()) {
					String time = rs3.getString("タイムスタンプ");
					System.out.println("DB処理番号：" + time);
					String your = rs3.getString("相手");
					System.out.println("DB処理番号：" + your);
					System.out.println("116:" + u.getUserid());
					String midoku = rs3.getString("未読数");
					System.out.println("DB処理番号：" + midoku);
					
					if(your.equals(u.getUserid())) {
						System.out.println("相手の名前とログインしてるIDが一緒なのでアレイリストに入れない");
					}else {
						// インスタンス生成
						DM dm = new DM();
						dm.setTime(time);
						dm.setYour(your);
						dm.setKidoku(midoku);
						// アレイリストに追加
						dmssList.add(dm);
					}
				}
				ses.setAttribute("DMLIST", dmssList);
		
				// タイムラインへ
				url = "P2Timeline.jsp";
				System.out.println(url);
				
				// ログアウト処理
				dba.closeDB();
				dba3.closeDB();
			}else {
				System.out.println("管理者ログイン実行");
				// ユーザーログイン失敗後管理者用データベースへ接続
//				String sql2 = "select * from 管理者 where メールアドレス = " + inMailadd + " and パスワード = " + AinPassword;
				String sql2 = "select * from 管理者 where メールアドレス = " + inMailadd + " and パスワード = " + inPassword;
				// sql文実行
				ResultSet rs2 = dba2.selectExe(sql2);
	
				if(rs2.next()) {
					// ユーザー情報をDBから取得
					String AdminUserid = rs2.getString("管理者ID");
					String AdminName = rs2.getString("名前");
					String AdminSex = rs2.getString("性別");
					String AdminBirth = rs2.getString("生年月日");
					String AdminMailadd = rs2.getString("メールアドレス");
					String AdminLevel = rs2.getString("管理者レベル");
					
					// 管理者インスタンス生成
					AdminUser au = new AdminUser();
					
					// 取得した情報を保存
					au.setAdminUserid(AdminUserid);
					au.setAdminName(AdminName);
					au.setAdminSex(AdminSex);
					au.setAdminBirth(AdminBirth);
					au.setAdminMailadd(AdminMailadd);
					au.setAdminLevel(AdminLevel);
					
					// ログインした管理者情報を保存
					ses.setAttribute("ADMINLOGIN", au);
					System.out.println("管理者ログイン成功");
					
					// タイムラインへ
					url = "P1TLManagement.jsp";
					System.out.println(url);
					// ログアウト処理
					dba2.closeDB();
				}
			}
			
			// マイページへ画面遷移
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
			
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
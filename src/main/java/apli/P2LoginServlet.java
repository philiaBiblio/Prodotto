package apli;

import java.io.IOException;
import java.sql.ResultSet;

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
			System.out.println(inPassword);
			
			// ユーザーか管理者か判定するためのフラグ
			boolean isUser = false; 
			
			//まずはパスワードを暗号化
			// inpass暗号化
			// 暗号化部品の生成
			Angou a = new Angou();
					
			// 暗号化前のinPasswordをmojiに入れる
			String moji = inPassword;
			// 暗号化実行(半角64文字に変換)
			String AinPassword = a.getAngo(moji);
			System.out.println("暗号化後："+AinPassword);
			
			// sql用にシングルコーテーションで囲む
			AinPassword = "'" + AinPassword + "'";
			
			
			// ユーザーのメールアドレスが存在するかチェック
		    String emailCheckSql = "SELECT * FROM ユーザー WHERE メールアドレス = " + inMailadd;
		    ResultSet emailCheckRs = dba.selectExe(emailCheckSql);
		    
		    // ユーザーにメールアドレスが存在する場合
		    if (emailCheckRs.next()) {
		    	
		    	// パスワードをチェック
		        String passwordCheckSql = "SELECT * FROM ユーザー WHERE メールアドレス = " + inMailadd + " AND パスワード = " + AinPassword;
		        ResultSet passwordCheckRs = dba.selectExe(passwordCheckSql);
		        
		        if (passwordCheckRs.next()) {
		            isUser = true; // ユーザーが確認された
		        } 
		        else {
		            // メールアドレスは存在するがパスワードが違う
		            request.setAttribute("errorMessage", "※メールアドレスかパスワードが違います");
		            RequestDispatcher rd = request.getRequestDispatcher("P2Login.jsp");
		            rd.forward(request, response);
		            return;
		        }
		    }
		    // ユーザーにメールアドレスが存在しなかった場合
		    else {
		    	// 管理者のメールアドレスをチェック
		        String adminEmailCheckSql = "SELECT * FROM 管理者 WHERE メールアドレス = " + inMailadd;
		        ResultSet adminEmailCheckRs = dba.selectExe(adminEmailCheckSql);
		        
		        if (adminEmailCheckRs.next()) {		        	
		            // 管理者のパスワードをチェック
		            String adminPasswordCheckSql = 
		                "SELECT * FROM 管理者 WHERE メールアドレス = " + inMailadd + " AND パスワード = " + AinPassword;
		            ResultSet adminPasswordCheckRs = dba.selectExe(adminPasswordCheckSql);
		            
		            if (!adminPasswordCheckRs.next()) {
		                // 管理者にメールアドレスは存在するがパスワードが違う
		                request.setAttribute("errorMessage", "※メールアドレスかパスワードが違います");
		                RequestDispatcher rd = request.getRequestDispatcher("P2Login.jsp");
		                rd.forward(request, response);
		                return;
		            }
		        }
		        // 両方のテーブルにメールアドレスが存在しない場合
		        else {
		        	//エラーメッセージを表示
		        	request.setAttribute("errorMessage", "※メールアドレスかパスワードが違います");
		            RequestDispatcher rd = request.getRequestDispatcher("P2Login.jsp");
		            rd.forward(request, response);
		            return;
		        }
		    }
		    
			
				// ログイン用のsql文
				String sql = "select * from ユーザー where メールアドレス = " + inMailadd + " and パスワード = " + AinPassword;
			
				// sql文実行
				ResultSet rs = dba.selectExe(sql);
			
			if(isUser && rs.next()) {
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
				
//				// dm情報の取得
//				String sqldm = "select max(タイムスタンプ) as タイムスタンプ,相手,アイコン,sum(CASE WHEN 既読未読 = '1' THEN 1 ELSE 0 END) as 未読数,"
//						+ "名前 from (select タイムスタンプ,y1.ユーザーID as 相手,case when 既読未読 = '1' and 送信元  = '" + u.getUserid() + "' then 0"
//						+ " when 既読未読 = '0' and 送信元  = '" + u.getUserid() + "' then 0"
//						+ " when 既読未読 = '1' and 送信元 <> '" + u.getUserid() + "' then 1 else 0 end as 既読未読,"
//						+ "y1.名前,y1.アイコン from DM "
//						+ "join ユーザー y1 on y1.ユーザーID = DM.送信元 join ユーザー y2 on y2.ユーザーID = DM.受信元 where DMID like '%"
//						+ u.getUserid() + "-%' union select タイムスタンプ,y2.ユーザーID as 相手,case when 既読未読 = '1' and 送信元  = '" + u.getUserid() + "' then 0"
//						+ " when 既読未読 = '0' and 送信元  = '" + u.getUserid() + "' then 0"
//						+ " when 既読未読 = '1' and 送信元 <> '" + u.getUserid() + "' then 1"
//						+ " else 0 end as 既読未読,y2.名前,y2.アイコン from DM"
//						+ " join ユーザー y1 on y1.ユーザーID = DM.送信元 join ユーザー y2 on y2.ユーザーID = DM.受信元 where DMID like '%"
//						+ u.getUserid() + "-%') group by 相手,名前,アイコン order by タイムスタンプ desc";
//				
//				// sql文実行
//				ResultSet rs3 = dba3.selectExe(sqldm);
//				// アレイリストの取得
//				ArrayList<DM> dmssList = new ArrayList<DM>();
//				// 繰り返しでsqlからすべての情報を得る
//				while(rs3.next()) {
//					String time = rs3.getString("タイムスタンプ");
//					System.out.println("タイムスタンプ：" + time);
//					String your = rs3.getString("相手");
//					System.out.println("相手：" + your);
//					String yourIcon = rs3.getString("アイコン");
//					System.out.println("アイコン：" + yourIcon);
//					String midoku = rs3.getString("未読数");
//					System.out.println("未読数：" + midoku);
//					String yourName = rs3.getString("名前");
//					
//					if(your.equals(u.getUserid())) {
//						System.out.println("相手の名前とログインしてるIDが一緒なのでアレイリストに入れない");
//					}else {
//						// インスタンス生成
//						DM dm = new DM();
//						dm.setTime(time);
//						dm.setYour(your);
//						dm.setYourIcon(yourIcon);
//						dm.setKidoku(midoku);
//						dm.setYourName(yourName);
//						// アレイリストに追加
//						dmssList.add(dm);
//						System.out.println(dm.getKidoku());
//					}
//				}
//				ses.setAttribute("DMSSLIST", dmssList);
		
				// タイムラインのためのサーブレットへ
				url = "P2TimelineServlet";
				System.out.println(url);
				
				// 画面遷移
				response.sendRedirect(url);

				// ログアウト処理
				dba.closeDB();
				dba3.closeDB();
			}
			else {
				System.out.println("管理者ログイン実行");
				// ユーザーログイン失敗後管理者用データベースへ接続
				String sql2 = "select * from 管理者 where メールアドレス = " + inMailadd + " and パスワード = " + AinPassword;
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
					
					System.out.println("管理者ログイン成功");
					
					if(au.getAdminLevel().equals("1")) {
						// 管理者管理画面へ
						url = "P1AdminManegement.jsp";
						System.out.println(url);
						// 画面遷移
						RequestDispatcher rd = request.getRequestDispatcher(url);
						rd.forward(request, response);
						
					}else {
						// タイムラインのためのサーブレットへ
						url = "TLManagementServlet";
						System.out.println(url);
						
						// 画面遷移
						response.sendRedirect(url);
						
						// ログインした管理者情報を保存
						ses.setAttribute("ADMINLOGIN", au);
					}
					// ログアウト処理
					dba2.closeDB();
				}
			}
			
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
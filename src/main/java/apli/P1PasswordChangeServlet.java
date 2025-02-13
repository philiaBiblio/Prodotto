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
 * Servlet implementation class PasswordChangeServlet
 */
@WebServlet("/PasswordChangeServlet")
public class P1PasswordChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P1PasswordChangeServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// ログイン情報の取得
		AdminUser au = (AdminUser)ses.getAttribute("ADMINLOGIN");
				
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 入力された情報の取得
			String inPass = request.getParameter("pw");
			String inPass2 = request.getParameter("newPw");
			String inPass3 = request.getParameter("newPw2");
			System.out.println(inPass);
			System.out.println(inPass2);
			System.out.println(inPass3);
			
			// inpass暗号化
			// 暗号化部品の生成
			Angou a = new Angou();
						
			// 暗号化前のinPasswordをmojiに入れる
			String moji = inPass;
			String moji2 = inPass2;
			String moji3 = inPass3;
			
			// 暗号化実行(半角64文字に変換)
			String AinPassword = a.getAngo(moji);
			System.out.println("暗号化後："+AinPassword);
			String AinPassword2 = a.getAngo(moji2);
			System.out.println("暗号化後："+AinPassword2);
			String AinPassword3 = a.getAngo(moji3);
			System.out.println("暗号化後："+AinPassword3);

			// 現在のパスワードが正しいかの処理
			ResultSet rs = dba.selectExe("select * from 管理者 where 管理者ID = '" + au.getAdminUserid() + "'");
			if(rs.next()) {
				String pass = rs.getString("パスワード");
				System.out.println(pass);

				if(pass.equals(AinPassword)) {
					System.out.println("パスワード一致◎");
					int flg = 0;
					// 二回入力のチェック処理
					if(AinPassword2.equals(AinPassword3)) {
						System.out.println("パスワードの入力値が一緒なのでOK、セキュリティチェックへ");
						
						if(inPass2.length() >= 6) {
							System.out.println("桁数◎");
							flg = flg + 1;
						}
						if(inPass2.matches(".*[0-9].*") == true &&
								inPass2.matches(".*[a-z].*") == true) {
							System.out.println("セキュリティチェック◎");
							flg = flg + 1;
						}
						
						if(flg == 2) {
							// データベースの情報をアップデート
					        String updateSQL = 
					        		"UPDATE 管理者 SET パスワード = '" + AinPassword2 +
					        		"' WHERE 管理者ID = '" + au.getAdminUserid() + "'";
					        
					        // アップデート文実行
					        dba.UpdateExe(updateSQL);
					        
					        // 取得した情報を保存
					        au.setPassword(AinPassword2);
					        // 情報を保存
					        ses.setAttribute("ADMINLOGIN", au);
					        String trueMess = "変更できました。";
							ses.setAttribute("TRUEMESS", trueMess);
						}else{
							System.out.println("セキュリティチェック×なので弾く");
							String messPass3 = "※パスワードが英数字6文字以上ではありません。<br>別のパスワードを使用してください。";
							ses.setAttribute("ERRORPASS3", messPass3);
						}
					}else {
						System.out.println("二回入力のパスワードの入力値が違うので変更しない");
						String messPass = "※パスワードが一致しません。<br>もう一度入力してください。";
						ses.setAttribute("ERRORPASS", messPass);
						}
				}else {
					System.out.println("そもそものパスワードが違うので弾く");
					String messPass2 = "※現在のパスワードが違います。<br>もう一度入力してください。";
					ses.setAttribute("ERRORPASS2", messPass2);
				 }
			 }
			
			url = "P1PasswordChange.jsp";
			
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

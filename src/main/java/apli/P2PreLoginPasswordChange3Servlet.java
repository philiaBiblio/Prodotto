package apli;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P2PreLoginPasswordChange3Servlet
 */
@WebServlet("/P2PreLoginPasswordChange3Servlet")
public class P2PreLoginPasswordChange3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2PreLoginPasswordChange3Servlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// 送られてきたメールアドレスの取得
		String mail = (String)ses.getAttribute("INMAIL");
		System.out.println(mail);
		
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 入力された番号の取得
			String pass1 = request.getParameter("new-password");
			String pass2 = request.getParameter("confirm-password");
			int flg = 0;
			
			// 二回入力のチェック処理
			if(pass1.equals(pass2)) {
				System.out.println("二回入力チェック◎ セキュリティチェックへ");
				if(pass1.length() >= 6) {
					System.out.println("桁数チェック◎");
					flg = flg + 1;
				}
				if(pass1.matches(".*[0-9].*") == true &&
						pass1.matches(".*[a-z].*") == true) {
					System.out.println("セキュリティチェック◎");
					flg = flg + 1;
				}
				if(flg == 2) {
					// データベースの情報をアップデート
			        String updateSQL = 
			        		"UPDATE ユーザー SET パスワード = '" + pass1 +
			        		"' WHERE メールアドレス = '" + mail + "'";
			        
			        // アップデート文実行
			        dba.UpdateExe(updateSQL);
			        
			        String trueMess = "変更できました。";
					ses.setAttribute("TRUEMESS", trueMess);
					
					url = "P2Login.jsp";
					
					// 画面遷移
					RequestDispatcher rd = request.getRequestDispatcher(url);
					rd.forward(request, response);
					
				}else {
					System.out.println("セキュリティチェック×なので弾く");
					String messPass1 = "※パスワードが英数字6文字以上ではありません。<br>別のパスワードを使用してください。";
					ses.setAttribute("ERRORPASS1", messPass1);
					url = "P2PreLoginPasswordChange3.jsp";
					
					// 画面遷移
					RequestDispatcher rd = request.getRequestDispatcher(url);
					rd.forward(request, response);
				}
			}else {
				System.out.println("二回入力チェックが×なので弾く");
				String messPass = "※パスワードが一致しません。<br>もう一度入力してください。";
				ses.setAttribute("ERRORPASS", messPass);	
				url = "P2PreLoginPasswordChange3.jsp";
				
				// 画面遷移
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
			}
			
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

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
 * Servlet implementation class P2PasswordChangeServlet
 */
@WebServlet("/P2PasswordChangeServlet")
public class P2PasswordChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2PasswordChangeServlet実行");
		
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
			// 入力された情報の取得
			String inPass = request.getParameter("pw");
			String inPass2 = request.getParameter("newPw");
			String inPass3 = request.getParameter("newPw2");
			System.out.println(inPass);

			// 現在のパスワードが正しいかの処理
			ResultSet rs = dba.selectExe("select * from ユーザー where ユーザーID = '" + u.getUserid() + "'");
			if(rs.next()) {
				String pass = rs.getString("パスワード");
				pass = pass.trim();
				System.out.println(pass);
				System.out.println(inPass);
				System.out.println(inPass2);
				System.out.println(inPass3);
				if(pass.equals(inPass)) {
					System.out.println("パスワードが一致していた場合");
					int flg = 0;
					// 二回入力のチェック処理
					if(inPass2.equals(inPass3)) {
						System.out.println("パスワードの入力値が一緒なのでOK、セキュリティチェックへ");
						if(inPass2.length() >= 4 && inPass2.length() <= 14) {
							System.out.println("桁数◎");
							flg = flg + 1;
						}
						if(inPass2.matches("^[0-9a-zA-Z]*$") == true) {
							System.out.println("セキュリティチェック◎");
							flg = flg + 1;
						}
						if(flg == 2) {
							// データベースの情報をアップデート
					        String updateSQL = 
					        		"UPDATE ユーザー SET パスワード = '" + inPass2 +
					        		"' WHERE ユーザーID = '" + u.getUserid() + "'";
					        
					        // アップデート文実行
					        dba.UpdateExe(updateSQL);
					        
					        // 取得した情報を保存
					        u.setPassword(inPass2);
					        // 情報を保存
					        ses.setAttribute("LOGIN", u);
					        String trueMess = "変更できました。";
							ses.setAttribute("TRUEMESS", trueMess);	
						}else {
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
			
			url = "P2PasswordChange.jsp";
			
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

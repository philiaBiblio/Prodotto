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
 * Servlet implementation class EmailChangeServlet
 */
@WebServlet("/EmailChangeServlet")
public class P1EmailChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("EmailChangeServlet実行");
		
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
			// 変更された情報の取得
			String inMail = request.getParameter("mailadd");
			String inMail2 = request.getParameter("mailadd2");
			
			// 二回入力のチェック処理
			if(inMail.equals(inMail2)) {
				System.out.println("メールアドレスの入力値が一緒なのでOK、メールアドレスを変更する");
				
				// ユーザーの検索のsql文実行
				ResultSet rs = dba.selectExe("select * from 管理者 where 管理者ID = '" + au.getAdminUserid() + "'");
				
				if(rs.next()) {
					// データベースの情報をアップデート
			        String updateSQL = 
			        		"UPDATE 管理者 SET メールアドレス = '" + inMail +
			        		"' WHERE 管理者ID = '" + au.getAdminUserid() + "'";
			        
			        // アップデート文実行
			        dba.UpdateExe(updateSQL);
			        
			        // 取得した情報を保存
			        au.setAdminMailadd(inMail);
			        // 情報を保存
			        ses.setAttribute("ADMINLOGIN", au);
			        String trueMess = "変更できました。";
					ses.setAttribute("TRUEMESS", trueMess);
				}
			}else {
				System.out.println("メールアドレスの入力値が違うので変更しない");
				String messMail = "※メールアドレスが一致しません。<br>もう一度入力してください。";
				ses.setAttribute("ERRORMAIL", messMail);
			}
			
			url = "P1EmailChange.jsp";
			
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

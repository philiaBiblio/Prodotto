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
 * Servlet implementation class P2AccountDeletionServlet
 */
@WebServlet("/P2AccountDeletionServlet")
public class P2AccountDeletionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2AccountDeletionServlet実行開始");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの取得
		HttpSession ses = request.getSession();
		
		// ログイン情報の取得
		User u = (User)ses.getAttribute("LOGIN");
		
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// ユーザーの検索のsql文実行
			ResultSet rs = dba.selectExe("select * from ユーザー where ユーザーID = '" + u.getUserid() + "'");
			
			if(rs.next()) {
				// データベースからユーザーを削除
		        String deleteSQL = 
		        		"DELETE FROM ユーザー where ユーザーID = '" + u.getUserid() + "'"; 
		        
		        // デリート文実行
		        dba.UpdateExe(deleteSQL);
		        
		        // セッションの削除
				ses.removeAttribute("LOGIN");
				System.out.println("セッション削除");
				
				// ログイン画面へ遷移
				url = "P2Login.jsp";
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

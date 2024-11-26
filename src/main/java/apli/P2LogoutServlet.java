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
 * Servlet implementation class P2LogoutServlet
 */
@WebServlet("/P2LogoutServlet")
public class P2LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2LogoutServlet実行開始");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの取得
		HttpSession ses = request.getSession();
		
		// セッションの削除
		ses.removeAttribute("LOGIN");
		ses.removeAttribute("DMSSLIST");
		ses.removeAttribute("DMLIST");
		ses.removeAttribute("I");
		ses.removeAttribute("YOU");
		ses.removeAttribute("MESS");
		
		System.out.println("セッション削除");
		
		// ログイン画面へ遷移
		String url = "P2Login.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}

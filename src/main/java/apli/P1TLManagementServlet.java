package apli;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TLManagementServlet
 */
@WebServlet("/TLManagementServlet")
public class P1TLManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// タイムライン画面へ
					String url = "P1TLManagement.jsp";
					System.out.println(url);
					
					// 画面遷移
					RequestDispatcher rd = request.getRequestDispatcher(url);
					rd.forward(request, response);
		
	}

}

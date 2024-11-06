package apli;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StartServlet
 */
@WebServlet("/StartSampleServlet")
//@WebServlet("/index.html")//に変更することで
//http://localhost:8080/2J1E　のようにプロジェクト名のみのアクセスでスタートのサーブレットを起動できる

public class StartSampleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("★StartSampleServletを起動");
		//画面遷移
		String url = "StartSample.jsp";
		RequestDispatcher rd=
				request.getRequestDispatcher(url);
		rd.forward(request, response);

	}


}

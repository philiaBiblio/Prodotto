package apli;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MailServlet
 */
@WebServlet("/MailServlet")
public class MailServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//メール送信用部品の生成
		MailSend ma = new MailSend();
		//３つの引数はそれぞれ（宛先アドレス、タイトル、本文）に対応
		//★x17j000@chiba-fjb.ac.jpは実際にないアドレスの為、エラーになります
		ma.send("x23j058@mitsuhashi.ac.jp","テストメール","これは本文です");

		//遷移先url
		String url="mailtest2.jsp";
		//画面遷移部品の生成とurlのセット
		RequestDispatcher rd = request.getRequestDispatcher(url);
		//遷移実行
		rd.forward(request, response);

	}

}

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
 * Servlet implementation class P2PreLoginPasswordChange2Servlet
 */
@WebServlet("/P2PreLoginPasswordChange2Servlet")
public class P2PreLoginPasswordChange2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2PreLoginPasswordChange2Servlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		String url = "";
		
		// 送ったナンバーの取得
		int num1 = (int)ses.getAttribute("NUM");
		String num = String.valueOf(num1);
		System.out.println(num);
		
		// 入力された番号の取得
		String inNum0 = request.getParameter("text1");
		String inNum1 = request.getParameter("text2");
		String inNum2 = request.getParameter("text3");
		String inNum3 = request.getParameter("text4");
		String inNum4 = request.getParameter("text5");
		
		// numと入力された値が正しいかのチェック
		String [] numLi = num.split("");
		
		if(numLi[0].equals(inNum0)) {
			if(numLi[1].equals(inNum1)) {
				if(numLi[2].equals(inNum2)) {
					if(numLi[3].equals(inNum3)) {
						if(numLi[4].equals(inNum4)) {
							System.out.println("入力チェック◎ 次の画面へ映る");
							//遷移先url
							url="P2PreLoginPasswordChange3.jsp";
							//画面遷移部品の生成とurlのセット
							RequestDispatcher rd = request.getRequestDispatcher(url);
							//遷移実行
							rd.forward(request, response);
						}
					}
				}
			}
		}else {
			// 正しくないので画面遷移しない
			System.out.println("入力チェック×なので元の画面へ戻る");
			String messCheck = "※入力された値が違います。<br>もう一度入力してください。";
			ses.setAttribute("ERRORPASS", messCheck);
			
			url="P2PreLoginPasswordChange2.jsp";
			//画面遷移部品の生成とurlのセット
			RequestDispatcher rd = request.getRequestDispatcher(url);
			//遷移実行
			rd.forward(request, response);
		}
	}
}

package apli;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P2DMServlet
 */
@WebServlet("/P2DMServlet")
public class P2DMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2DMServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// ログイン情報の取得
		User u = (User)ses.getAttribute("LOGIN");
		ArrayList<DM> dmssList = (ArrayList)ses.getAttribute("DMLIST");
				
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// やり取りしてる相手の名前の取得
			String yourId = request.getParameter("yourId");
			// ゲットパラメータでdmssList.get(i).getYour()
			// DMの新しいインスタンスを生成して内容を引っ張ってくる
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// ログアウト処理
			dba.closeDB();
		}
		
		
		
	}

}

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
 * Servlet implementation class P2PostAndRecordingServlet
 */
@WebServlet("/P2PostAndRecordingServlet")
public class P2PostAndRecordingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//起動確認
		System.out.println("P2PostAndRecordingServlet実行");
        // 文字化け防止
        request.setCharacterEncoding("UTF-8");
        // セッションの生成
        HttpSession ses = request.getSession();
        // DBアクセス用クラス
        DBAcs dba = new DBAcs();
		
		try {
			
			
			
			
			// 画面遷移
            String url="P2PostAndRecording.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            // ログアウト処理
            dba.closeDB();
		}
		catch (Exception e) {
			e.printStackTrace();
            // エラーメッセージをセッションに保存
            ses.setAttribute("ERROR_MESSAGE", "エラーが発生しました: " + e.getMessage());
            response.sendRedirect("errorPage.jsp"); // エラーページへの遷移
            // ログアウト処理
            dba.closeDB();
		}
	}

}

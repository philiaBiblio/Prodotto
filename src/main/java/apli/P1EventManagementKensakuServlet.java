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
 * Servlet implementation class P1EventManagementKensakuServlet
 */
@WebServlet("/P1EventManagementKensakuServlet")
public class P1EventManagementKensakuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P1EventManagementKensakuServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
				
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 入力された値を取得
			String inkakoNen = request.getParameter("kako-nen");
			String inkakoTuki = request.getParameter("kako-tuki");
			
			System.out.println(inkakoNen);
			System.out.println(inkakoTuki);
			
			// DB用に生成
			String id = "" + inkakoNen + inkakoTuki;
			System.out.println(id);
			
			// sqlで検索
			ResultSet rs = dba.selectExe("select * from イベント where イベントID = '" + id + "'");
			
			if(rs.next()) {
				String evId = rs.getString("イベントID");
				String odai = rs.getString("お題");
				
				// ユーザーインスタンス生成
				Event e = new Event();
				
				// 取得した情報を保存
				e.setEventId(evId);
				e.setOdai(odai);
				
				// 	イベント情報を保存
				ses.setAttribute("EVENT", e);
			}
			
			url = "P1EventManegement.jsp";
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

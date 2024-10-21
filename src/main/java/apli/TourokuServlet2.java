package apli;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TourokuServlet2")
public class TourokuServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		DBAcs dba = new DBAcs();
		//全角文字対応
		req.setCharacterEncoding("UTF-8");
		try {
			//jspからの文字取得処理
			//学籍番号の取得、本来は全ての項目（氏名、クラス、得点）の処理が必要
			String gaku = req.getParameter("gaku");
			gaku = "'"+gaku+"'";
			//インサート文生成
			String sql = "INSERT INTO 生徒表 VALUES("+gaku+",'kiyota','3-1',99)";
			//インサート、アップデート文実行 
			dba.UpdateExe(sql);//インサート文、アップデート文共にdba.UpdateExeを使います
			dba.closeDB();

			String url="Gtouroku2.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			dba.closeDB();//ログアウト		}
		}
	}
}
package apli;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P2ProfileEditServlet
 */
@WebServlet("/P2ProfileEditServlet")
public class P2ProfileEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2ProfileEditServlet実行");
		request.setCharacterEncoding("UTF-8"); // 文字化け防止
		
		// セッションの生成
		HttpSession ses = request.getSession();
						
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// sqlの読み込み
			String inMondai = request.getParameter("bangou");
			ResultSet rs = dba.selectExe("select * from 問題表 where 番号 = "+inMondai);
			rs.next();
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}

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
 * Servlet implementation class P2SignUpServlet
 */
@WebServlet("/P2SignUpServlet")
public class P2SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2SignUpServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 入力されたユーザーIDを取得
			String inUserid = request.getParameter("userid");
			// sql用にシングルコーテーションで囲む
			inUserid = "'" + inUserid + "'";
			
			// 同じユーザーIDのアカウントがあるか検索するsql文
			String sql = "select * from ユーザー where ユーザーID = " + inUserid;
			// sql文実行
			ResultSet rs = dba.selectExe(sql);
			
			while(rs.next()) {
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
	}

}

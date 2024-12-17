package apli;

import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P2DerivativesListServlet
 */
@WebServlet("/P2DerivativesListServlet")
public class P2DerivativesListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("P2DerivativesListServlet実行");

		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();

		// ログイン情報の取得
		User u = (User)ses.getAttribute("LOGIN");
		ArrayList<Toukou> DList = (ArrayList)ses.getAttribute("DL");
		
		LocalDate currentDate = LocalDate.now();
        int year = currentDate.getYear();
        int month = currentDate.getMonthValue(); // 月を数値で取得（1〜12）

		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();

		try {
			
			//お題を取得
	        System.out.println("Year: " + year + "Month: " + month);
	        String Year = Integer.toString(year);
	        String Month = Integer.toString(month);
	        String odai = Year+Month;
	        
			//投稿を取得(お題が今のと同じものを持ってくる)
			String sql1 = "select * from 投稿 where 投稿ID like '"+odai+"%'" ;
			System.out.println(sql1);
			
			ResultSet rs = dba.selectExe(sql1);
			
			System.out.println(rs);
			
			//P2DerivativesListへ
			url = "P2DerivativesList.jsp";
			System.out.println(url);
			
			// 情報を保存
	        ses.setAttribute("TLsit", rs);
			
	        //画面遷移を行う
	        
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
			
			dba.closeDB();
		} catch (Exception e) {
			// TODO: handle exception
			//P2DerivativesListへ
			
			url = "P2DerivativesList.jsp";
			System.out.println(url);
			
			//画面遷移を行う
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
			
			dba.closeDB();
		}
	}

}

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
 * Servlet implementation class P2SignUpConfirmationServlet
 */
@WebServlet("/P2SignUpConfirmationServlet")
public class P2SignUpConfirmationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2SignUpConfirmationServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		
		User u = (User)ses.getAttribute("NYURYOKU");
		
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 入力された情報の取得			
			System.out.println(u.getName());
			System.out.println(u.getUserid());
			System.out.println(u.getSex());
			System.out.println(u.getHistory());
			System.out.println(u.getFq());
			System.out.println(u.getBirth().replace("-", ""));
			System.out.println(u.getMailadd());
			System.out.println(u.getPassword());
			
			// このデータをDBにインサートする
	        String insertSQL = 
	        		"INSERT INTO ユーザー values ('" + u.getUserid() + "','"
	        				+ u.getName() + "','" + u.getSex() + "','" + u.getHistory()
	        				+ "','" + u.getFq() + "',to_date('" + u.getBirth().replace("-", "")
	        				+ "','YYYY/MM/DD'),'" + "aaa" + "','" + u.getPassword() + "','" + u.getMailadd() + "')";
	        // インサート文実行
	        dba.UpdateExe(insertSQL);
	        
	        // その会員情報を保存
	        ses.setAttribute("LOGIN", u);
	        
	        // プロフィール編集画面へ
	        url = "P2Timeline.jsp";
	        System.out.println(url);
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

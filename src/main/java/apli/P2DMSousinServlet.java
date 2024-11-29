package apli;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P2DMSousinServlet
 */
@WebServlet("/P2DMSousinServlet")
public class P2DMSousinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2DMSousinServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// ログイン情報の取得
		User u = (User)ses.getAttribute("LOGIN");
		ArrayList<DM> dmList = (ArrayList)ses.getAttribute("DMLIST");
		Integer kazu = (Integer)ses.getAttribute("I");
		String name = (String)ses.getAttribute("YOU");
		System.out.println(name);
				
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 送信したメッセージの取得
			String mess = request.getParameter("letter");
			
			// データベースにインサート
	        String insertSQL = 
	        		"INSERT INTO DM values ('" + u.getUserid() + "-" + name + "-' || to_char(systimestamp,'yyyymmdd') || '-' || LPAD(連番.nextval,3,'0'),'"
	        				+ u.getUserid() + "','" + name + "','" + mess + "','0', to_char(systimestamp,'yyyy-mm-dd HH24:MI:SS'))";
	        ses.setAttribute("MESS", mess);
	        				
	        // インサート文実行
	        dba.UpdateExe(insertSQL);
	        
			// DM画面へ戻る
			url = "P2DMServlet?yourId=" + name + "&hensuu=" + kazu + "&mess=" + URLEncoder.encode(mess,"UTF-8");
			
			System.out.println(url);
						
			// 画面遷移
			response.sendRedirect(url);
			
			
//			RequestDispatcher rd = request.getRequestDispatcher(url);
//			rd.forward(request, response);
						
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

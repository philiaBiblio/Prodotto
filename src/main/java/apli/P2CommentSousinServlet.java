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
 * Servlet implementation class P2CommentSousinServlet
 */
@WebServlet("/P2CommentSousinServlet")
public class P2CommentSousinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2CommentSousinServlet始動");

		//文字化け防止策
		request.setCharacterEncoding("UTF-8");

		//セッション生成
		HttpSession ses = request.getSession();
		User u = (User) ses.getAttribute("LOGIN");
		//どの投稿に対してか投稿IDを取得
		String comID = (String)ses.getAttribute("comID");

		DBAcs send = new DBAcs();

		//URLの生成
		String url="";
		try {		
			//コメントの内容を受け取る
			String comment = request.getParameter("comment");
			System.out.println(comment);

			String sql = "insert into コメント values ('" + comID + "-' || LPAD(連番.nextval,10),'"
					+ comID + "','" + u.getUserid() + "','" + comment + "', to_char(systimestamp,'yyyy-mm-dd HH24:MI:SS'))";
			
			ResultSet rs = send.selectExe(sql);

			//popupへ
			url = "P2CommentJusinServlet?toukouId=" + comID;
			System.out.println(url);
			
			//画面遷移を行う
			response.sendRedirect(url);

			//ログアウト処理
			send.closeDB();
		} catch (Exception e) {
			// TODO: handle exceptio
			e.printStackTrace();
			//ログアウト処理
			send.closeDB();
		}
	}
}
package apli;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2CommentSousinServlet始動");

		//文字化け防止策
		request.setCharacterEncoding("UTF-8");

		//セッション生成
		HttpSession ses = request.getSession();

		DBAcs count = new DBAcs();
		DBAcs send = new DBAcs();

		//URLの生成
		String url="";
		try {
			//どの投稿に対してか投稿IDを取得
			String toukouId = request.getParameter("toukouId");

			// コメントを書いた相手の名前の取得
			String csender = request.getParameter("username");
			System.out.println(csender);
			ses.setAttribute("csender", csender);

			//タイムスタンプ取得
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			System.out.println(timestamp);
			ses.setAttribute("timestamp", timestamp);

			// 受け取る側の名前の取得
			String creciver =request.getParameter("creciver");
			System.out.println(creciver);
			ses.setAttribute("creciver", creciver);

			//コメントの内容を受け取る
			String ccontent = request.getParameter("ccontent");
			System.out.println(ccontent);
			ses.setAttribute("ccontent",ccontent);

			//投稿ID指定して今あるコメントの数を数えてコメントIDをつける
			String sql1 = "select count* from コメント where 投稿ID="+ toukouId;

			ResultSet rs = count.selectExe(sql1);
			int cnt = rs.getInt(""); // カラム名を指定
			System.out.println("取得した値: " + cnt);

			//つけたら追加
			cnt=cnt+1;
			String cmtId=toukouId+Integer.toString(cnt);
			String sql2 = "insert into コメント values ("+cmtId+","+toukouId+","+csender+","+timestamp+")";

			ResultSet rs2 = send.selectExe(sql2);

			//popupへ
			url = "P2popup.jsp";
			System.out.println(url);
			
			//画面遷移を行う
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);

			//ログアウト処理
			count.closeDB();
			send.closeDB();
		} catch (Exception e) {
			// TODO: handle exception
			//ログアウト処理
			count.closeDB();
			send.closeDB();
		}
	}

}

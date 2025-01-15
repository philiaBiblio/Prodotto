package apli;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P1CommentJusinServlet
 */
@WebServlet("/P1CommentJusinServlet")
public class P1CommentJusinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P1CommentJusinServlet実行");

		//文字化け防止
		request.setCharacterEncoding("UTF-8");
		//セッションの生成
		HttpSession ses = request.getSession();
		ArrayList<Toukou> toukouList = (ArrayList) ses.getAttribute("TOUKOULIST");

		DBAcs dl = new DBAcs();
		DBAcs cnt = new DBAcs();

		// URLの生成
		String url = "";
		
		try {
			String toukouId;
			//どの投稿に対してか投稿IDを取得
			toukouId = request.getParameter("toukouId");
			if(toukouId == null) {
				System.out.println("test");
				toukouId = (String)ses.getAttribute("comID");
				System.out.println(toukouId);
			}
			System.out.println("toukouId" + toukouId);
			
			ses.setAttribute("comID", toukouId);
			
			//sqlでその投稿に対するコメント詳細を受け取る
			//sql内のユーザーIDは送信元である
			String sql = "select コメントID,投稿ID,コメント.ユーザーID,内容,タイムスタンプ,名前,アイコン from コメント "
					+ "join ユーザー on コメント.ユーザーID = ユーザー.ユーザーID where 投稿ID = '" + toukouId + "'"
					+ " ORDER BY コメント.タイムスタンプ DESC";
			
			System.out.println("sqliiiiii："+sql);
			String sql1 = "select count(*) as コメント数 from コメント where 投稿ID='" + toukouId + "'";
			System.out.println("sql1ooooo："+sql1);
			//sql実行
			ResultSet rs = dl.selectExe(sql);
			ResultSet rs1 = cnt.selectExe(sql1);

			//もってきた情報を保存
			//保存用のArraylistの作成
			ArrayList<Comment> cmList = new ArrayList<Comment>();
			//繰り返しで全ての情報を得る
			
			while (rs.next()) {
				String icon = rs.getString("アイコン");
				String name = rs.getString("名前");
				String csender = rs.getString("ユーザーID");
				String ccontent = rs.getString("内容");
				String commentID = rs.getString("コメントID");
				
				/*表示しないので一旦コメントアウト*/
				/*String time = rs.getString("タイムスタンプ");*/
				
				//インスタンス
				Comment CM = new Comment();
				CM.setCicon(icon);
				CM.setcName(name);
				CM.setCsender(csender);
				CM.setCcontent(ccontent);
				CM.setCommentId(commentID);
				
				/*表示しないので一旦コメントアウト*/
				/*CM.setTimestamp(time);*/
				//Arraylistに追加
				cmList.add(CM);
			}
			
			int comeKazu = 0;
			if(rs1.next()) {
				comeKazu = rs1.getInt("コメント数"); 
			}
			System.out.println(comeKazu);
			
			ses.setAttribute("CM", cmList);
			ses.setAttribute("comeKazu", comeKazu);
			//タイムラインへ
			url = "P1popup.jsp";
			System.out.println("url:" + url);

			//画面遷移を行う
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);

			//ログアウト処理
			dl.closeDB();
			cnt.closeDB();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			dl.closeDB();
			cnt.closeDB();
		}
	}		
}
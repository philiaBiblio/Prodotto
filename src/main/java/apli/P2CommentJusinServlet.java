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
 * Servlet implementation class P2CommentJusinServlet
 */
@WebServlet("/P2CommentJusinServlet")
public class P2CommentJusinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2CommentJusinServlet実行");

		//文字化け防止
		request.setCharacterEncoding("UTF-8");
		//セッションの生成
		HttpSession ses = request.getSession();
		
		DBAcs dl = new DBAcs();
		
		// URLの生成
		String url = "";
		try {
			//どの投稿に対してか投稿IDを取得
			String toukouId = request.getParameter("toukouId");
			
			//sqlでその投稿に対するコメント詳細を受け取る
			//sql内のユーザーIDは送信元である
			String sql = "select コメントID,投稿ID,ユーザーID,内容 from コメント where 投稿ID ="+toukouId;
			
			//sql実行
			ResultSet rs = dl.selectExe(sql);
			
			//もってきた情報を保存
				//保存用のArraylistの作成
			ArrayList<Comment> cmList = new ArrayList<Comment>();
			//繰り返しで全ての情報を得る
			while(rs.next()) {
				String commentID = rs.getString("コメントID");
				String toukouID = rs.getString("投稿ID");
				String csender = rs.getString("ユーザーID");
				String ccontent = rs.getString("内容");
				String time = rs.getString("時間");
				//インスタンス
			Comment CM = new Comment();
			CM.setCommentId(commentID);
			CM.setToukouId(toukouID);
			CM.setCsender(csender);
			CM.setCcontent(ccontent);
			CM.setTimestamp(time);
			
			//Arraylistに追加
			cmList.add(CM);
			}
			ses.setAttribute("CM", cmList);
			
			//popupへ
			url = "P2popup.jsp";
			System.out.println(url);
			
			//画面遷移を行う
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
			
			//ログアウト処理
			dl.closeDB();
			
		} catch (Exception e) {
			// TODO: handle exception
			dl.closeDB();
		}
	}

}

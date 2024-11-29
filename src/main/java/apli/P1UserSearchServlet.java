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
 * Servlet implementation class UserSearchServlet
 */
@WebServlet("/P1UserSearchServlet")
public class P1UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P1UserSearchServlet実行");
				
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// ログイン情報の取得
		User u = (User)ses.getAttribute("LOGIN");
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		//ユーザーリストの生成
		// セッションからUSERLISTを取得
		ArrayList<User> UList = (ArrayList<User>) ses.getAttribute("USERLIST");
		if (UList == null) {
		    UList = new ArrayList<>(); // 初回のみ新規作成
		} else {
		    UList.clear(); // 既存データをクリア
		}

		
		try {
			// 検索キーワードの取得
			String username = request.getParameter("usersearch");
			System.out.println(username);

			// 検索キーワードが空の場合の処理
			if (username == null || username.trim().isEmpty()) {
				System.out.println("検索キーワードが空です。");
				// USERLIST をクリア
				UList.clear();
				ses.setAttribute("USERLIST", UList);

				// 検索結果がない状態で画面遷移
				url = "P2UserSearch.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
				return; // 処理終了
			}

			// SELECT文ユーザー情報を取得
			ResultSet rs = dba.selectExe("SELECT * FROM ユーザー WHERE 名前 LIKE '%" + username + "%'");

			// カーソルを１行ずらす。flgに結果を保存。
			boolean flg = rs.next();

			// 検索結果の数分繰り返す。
			while (flg) {
				// ユーザー情報を変数に保存する
				String uid = rs.getString("ユーザーID");
				String name = rs.getString("名前");
				String icon = rs.getString("アイコン");

				// ユーザーインスタンスの生成
				User uu = new User();
				uu.setUserid(uid);
				uu.setName(name);
				uu.setIconImage(icon);

				// ユーザーリストにユーザー情報を保存する
				UList.add(uu);

				// カーソルを一行ずらす
				flg = rs.next();
			}

			// 会員の一覧を保存
			ses.setAttribute("USERLIST", UList);

			// 画面遷移
			url = "P1UserSearch.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);

			// ログアウト処理
			dba.closeDB();
		} 
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				// ログアウト処理
				dba.closeDB();
			}
	}

}

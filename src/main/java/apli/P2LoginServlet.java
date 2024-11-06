package apli;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P2LoginServlet
 */
@WebServlet("/P2LoginServlet")
public class P2LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2LoginServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
				
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 入力した会員IDを取得
			String inMailadd = request.getParameter("mailadd");
			// sql用にシングルコーテーションで囲む
			inMailadd = "'" + inMailadd + "'";
			
			// 入力したパスワードを取得
			String inPassword = request.getParameter("pw");
			// sql用にシングルコーテーションで囲む
			inPassword = "'" + inPassword + "'";
			
			// ログイン用のsql文
			String sql = "select * from ユーザー where メールアドレス = " + inMailadd + " and パスワード = " + inPassword;
			// sql文実行
			ResultSet rs = dba.selectExe(sql);
			
			if(rs.next()) {
				// ユーザー情報をDBから取得
				String userid = rs.getString("ユーザーID");
				String name = rs.getString("名前");
				String sex = rs.getString("性別");
				String history = rs.getString("楽器歴");
				String fq = rs.getString("頻度");
				String birth = rs.getString("生年月日");
				String iconImage = rs.getString("アイコン");
				String mailadd = rs.getString("メールアドレス");
				
				// ユーザーインスタンス生成
				User u = new User();
				
				// 取得した情報を保存
				u.setUserid(userid);
				u.setName(name);
				u.setSex(sex);
				u.setHistory(history);
				u.setFq(fq);
				u.setBirth(birth);
				u.setIconImage(iconImage);
				u.setMailadd(inMailadd);
				
				// ログインした会員情報を保存
				ses.setAttribute("LOGIN", u);
				
				// マイページへ
				url = "P2Timeline.jsp";
				System.out.println(url);
			}else {
				// ログイン失敗時
				System.out.println(url);
//				String mess = "ログインに失敗しました<br>会員IDまたはパスワードが間違っています";
//				ses.setAttribute("LOGINERROR", mess);
				url = "P2Login.jsp";
			}
			
			// マイページへ画面遷移
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

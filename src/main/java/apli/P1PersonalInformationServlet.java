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
 * Servlet implementation class PersonalInformationServlet
 */
@WebServlet("/PersonalInformationServlet")
public class P1PersonalInformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		System.out.println("P2ProfileEditServlet実行");

		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// ログイン情報の取得
		AdminUser au = (AdminUser) ses.getAttribute("ADMINLOGIN");

		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();

		try {
			// 変更された情報の取得
			String inIconImage = request.getParameter("iconImage");
			String inName = request.getParameter("name");
			String inUserid = request.getParameter("userid");
			String inSex = request.getParameter("sexy");
			String inBirth = request.getParameter("birth");
			System.out.println(inSex);

			// ユーザーの検索のsql文実行
			ResultSet rs = dba.selectExe("select * from ユーザー where ユーザーID = '" + au.getAdminUserid() + "'");

			if (rs.next()) {
				// データベースの情報をアップデート
				String updateSQL = "UPDATE ユーザー SET アイコン = '" + inIconImage +
						"', 名前 = '" + inName +
						"', ユーザーID = '" + inUserid +
						"', 性別 = '" + inSex +
						"', 生年月日 = '" + inBirth +
						"' WHERE ユーザーID = '" + au.getAdminUserid() + "'";
				// アップデート文実行
				dba.UpdateExe(updateSQL);

				// 取得した情報を保存
				au.setAdminIconImage(inIconImage);
				au.setAdminName(inName);
				au.setAdminUserid(inUserid);
				au.setAdminSex(inSex);
				au.setAdminBirth(inBirth.substring(0, 10));

				// ログインした会員情報を保存
				ses.setAttribute("ADMINLOGIN", au);

				// プロフィール編集画面へ
				url = "P2ProfileEdit.jsp";
				System.out.println(url);
				// 画面遷移
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);

			}
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

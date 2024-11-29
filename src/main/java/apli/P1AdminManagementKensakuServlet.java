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
 * Servlet implementation class P1AdminManagementKensakuServlet
 */
@WebServlet("/P1AdminManagementKensakuServlet")
public class P1AdminManagementKensakuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P1AdminManagementKensakuServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// ログイン情報の取得
		AdminUser au = (AdminUser)ses.getAttribute("ADMINLOGIN");
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		//リストの生成
		ArrayList<AdminUser> auList = (ArrayList<AdminUser>) ses.getAttribute("ADMINLIST");
		if (auList == null) {
			auList = new ArrayList<>(); // 初回のみ新規作成
		} else {
				auList.clear(); // 既存データをクリア
		}
		
		try {
			// 検索キーワードの取得
			String admin = request.getParameter("kensaku");
			System.out.println(admin);
			
			// ユーザーの検索実行
			ResultSet rs = dba.selectExe
					("SELECT * FROM 管理者 WHERE 名前 LIKE '%" + admin + "%' "
					+ "OR 管理者ID LIKE '%" + admin + "%'");
			
			// rs.nextした結果、行が存在する場合 true
			boolean flg = rs.next(); 
			while(flg == true) {
				String id = rs.getString("管理者ID");
				String name = rs.getString("名前");
				
				// アドミンインスタンスの生成
				AdminUser a = new AdminUser();
				a.setAdminUserid(id);
				a.setAdminName(name);
				
				// 管理者リストに情報を保存する
				auList.add(a);
				
				// カーソルを一行ずらす
				flg = rs.next();
			}
			
			// リストをセッションに保存
			ses.setAttribute("ADMINLIST", auList);
					
			// ログアウト処理
			dba.closeDB();
		
		// 画面遷移
		url = "P1AdminManegement.jsp";
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

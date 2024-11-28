package apli;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P1AdminManagementDeliteServlet
 */
@WebServlet("/P1AdminManagementDeliteServlet")
public class P1AdminManagementDeliteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P1AdminManagementDeliteServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		//リストを取得
		ArrayList<AdminUser> auList = (ArrayList<AdminUser>)ses.getAttribute("ADMINLIST");

		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		//リストの番号を取得
		String i = request.getParameter("adminID");
		int aIndex = Integer.parseInt(i);
		
		try {
			// 指定したユーザーを再生テーブルから削除
			String deleteSQL = 
	        "DELETE FROM 管理者 where 管理者ID = '" + auList.get(aIndex).getAdminUserid() + "'";        
	        // デリート文実行
	        dba.UpdateExe(deleteSQL);
			
	        //リストから削除する
	        auList.remove(aIndex);
	        	        
			// 画面へ遷移
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

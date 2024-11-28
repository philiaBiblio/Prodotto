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
 * Servlet implementation class AdminManagementServlet
 */
@WebServlet("/AdminManagementServlet")
public class P1AdminManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P1AdminManagementServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		
		int level = 0;
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		try {
			// 入力した情報を取得
			String inID = request.getParameter("idtext");
			String inpass = request.getParameter("passtext");
			String inName = request.getParameter("name");
			String inSexy = request.getParameter("sexy");
			String inBirth = request.getParameter("birth");
			String inMail = request.getParameter("mailadd");
			
			// 同じIDがないかのチェック
			String sql = "select * from 管理者 where 管理者ID = '" + inID + "'";
			// sql文実行
			ResultSet rs = dba.selectExe(sql);
			
			if(rs.next()) {
				System.out.println("既にユーザーが存在している場合なので弾きたい");
				
				String messID = "※既に存在しているIDです。<br>別のIDを使用してください。";
				ses.setAttribute("ERRORID", messID);
				
				// ログアウト処理
				dba.closeDB();
				
			}else {
				System.out.println("重複しているIDがなかったのでパスワードのチェック");
				
				// パスワードのセキュリティチェック			
				if(inpass.matches(".*[0-9].*") == true &&
						inpass.matches(".*[a-z].*") == true){
					System.out.println("セキュリティチェック◎");
					level = level + 1;
				}
				if(inpass.length() >= 6) {
					System.out.println("桁数◎");
					level = level + 1;
				}
				
				if(level != 2){
					System.out.println("パスワードのセキュリティが低いので弾く");
					String messPass = "※パスワードが英数字6文字以上ではありません。<br>別のパスワードを使用してください。";
					ses.setAttribute("ERRORPASS", messPass);
				}else {
					System.out.println("パスワードも問題ないのでインサートする");
					
					// パスワードの暗号化
					//暗号化部品の生成
					Angou a = new Angou();
					
					String moji = inpass;
					//暗号化実行(半角64文字に変換)
					String AinPass = a.getAngo(moji);
					System.out.println("暗号化後："+AinPass);
					
					// このデータをDBにインサートする
			        String insertSQL = 
			        		"INSERT INTO 管理者 values ('" + inID + "','"
			        				+ inName + "','" + inSexy + "',to_date('" + inBirth.replace("-", "")
			        				+ "','YYYY/MM/DD'),'" + AinPass + "','" + inMail + "','2')";
			        // インサート文実行
			        dba.UpdateExe(insertSQL);
			        
			        // ログアウト処理
					dba.closeDB();
				}
			}
			
			url = "P1AdminManegement.jsp";
			
			// 画面遷移
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// ログアウト処理
			dba.closeDB();
		}
	}
}
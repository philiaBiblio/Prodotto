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
 * Servlet implementation class P2SignUpServlet
 */
@WebServlet("/P2SignUpServlet")
public class P2SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2SignUpServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		
		int pageFlg;
		
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 入力されたユーザーIDを取得
			String inUserid = request.getParameter("userid");
			
			// 同じユーザーIDのアカウントがあるか検索するsql文
			String sql = "select * from ユーザー where ユーザーID = '" + inUserid + "'";
			// sql文実行
			ResultSet rs = dba.selectExe(sql);
			
			if(rs.next()) {
				System.out.println("ユーザー存在している場合なので弾きたい");
				
				String messID = "※既に存在しているIDです。<br>別のIDを使用してください。";
				ses.setAttribute("ERRORID", messID);
				
				// 元の画面へ
				pageFlg = 0;
				}else {
				System.out.println("存在しなかったので桁数チェック");
				if(inUserid.length() >= 4 && inUserid.length() <= 14) {
					System.out.println("桁数◎");
					// 登録確認画面へ
					pageFlg = 1;
				}else {
					System.out.println("桁数×");
					String messKeta = "※ユーザーIDの桁数が正しくありません。<br>桁数を規定の通りに合わせてください。";
					ses.setAttribute("ERRORKETA", messKeta);
					pageFlg = 0;	
				}
			}
			
			// 二回入力のチェック処理
			// メールアドレス
			String inMail = request.getParameter("mailadd");
			String inMail2 = request.getParameter("mailadd2");
			
			if(inMail.equals(inMail2)) {
				System.out.println("メールアドレスの入力値が一緒なのでOK");
			}else {
				System.out.println("メールアドレスの入力値が違うので弾く");
				String messMail = "※メールアドレスが一致しません。<br>もう一度入力してください。";
				ses.setAttribute("ERRORMAIL", messMail);
				pageFlg = 0;
			}
			
			// パスワード
			String inPass = request.getParameter("pw");
			String inPass2 = request.getParameter("pw2");
			
			int level = 0;
			if(inPass.equals(inPass2)) {
				System.out.println("パスワードの入力値が一緒なのでOK");
				// パスワードのセキュリティチェック			
				if(inPass.matches(".*[0-9].*") == true &&
						inPass.matches(".*[a-z].*") == true){
					System.out.println("セキュリティチェック◎");
					level = level + 1;
				}
				if(inPass.length() >= 6) {
					System.out.println("93:桁数◎");
					level = level + 1;
				}
				
				if(level != 2){
					System.out.println("パスワードのセキュリティが低いので弾く");
					String messPass2 = "※パスワードが英数字6文字以上ではありません。<br>別のパスワードを使用してください。";
					ses.setAttribute("ERRORPASS2", messPass2);
					pageFlg = 0;
				}
			}else {
				System.out.println("パスワードの入力値が違うので弾く");
				String messPass = "※パスワードが一致しません。<br>もう一度入力してください。";
				ses.setAttribute("ERRORPASS", messPass);
				pageFlg = 0;
			}
			System.out.println(inPass);
			// 次の画面の準備
			if(pageFlg == 0) {
				url = "P2SignUp.jsp";
			}else if(pageFlg == 1) {
				url = "P2SignUpConfirmation.jsp";
			}
			
			//inpass暗号化
			//暗号化部品の生成
			Angou a = new Angou();
			
			String moji = inPass;
			//暗号化実行(半角64文字に変換)
			String AinPass = a.getAngo(moji);
			System.out.println("暗号化後："+AinPass);
			
			
			// 入力情報の保存
			String inName = request.getParameter("name");
			String inSexy = request.getParameter("sexy");
			String inBirth = request.getParameter("birth");
			String inFq = request.getParameter("fq");
			String inHistory = request.getParameter("history");
			
			// ユーザーインスタンス生成
			User u = new User();
			
			// 取得した情報を保存
			u.setName(inName);
			u.setUserid(inUserid);
			u.setMailadd(inMail);
			u.setPassword(AinPass);
			u.setSex(inSexy);
			u.setBirth(inBirth);
			u.setFq(inFq);
			u.setHistory(inHistory);
			
			// 入力された情報を保存
			ses.setAttribute("NYURYOKU", u);
			
			// 画面遷移
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

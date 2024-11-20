package apli;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P2PreLoginPasswordChange1Servlet
 */
@WebServlet("/P2PreLoginPasswordChange1Servlet")
public class P2PreLoginPasswordChange1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2PreLoginPasswordChange1Servlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		
		String url = "";
		
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 入力されたメールアドレスの取得
			String inMail = request.getParameter("email");
			
			// メールアドレスがあってるかどうか
			ResultSet rs = dba.selectExe("select * from ユーザー where メールアドレス = '" + inMail + "'");
			if(rs.next()) {
				System.out.println("メールアドレスがデータベースに存在する");
				
				//メール送信用部品の生成
				MailSend ma = new MailSend();
				
				// 送信する確認番号の生成
				Random rand = new Random();
				int num;
				do {
					num = rand.nextInt(99999);
					}while(num < 10000);
				System.out.println(num);

				// 送った数字とメールアドレスをセッションに保存
			    ses.setAttribute("NUM", num);
			    ses.setAttribute("INMAIL", inMail);
			    
				//３つの引数はそれぞれ（宛先アドレス、タイトル、本文）に対応
				ma.send(inMail,"パスワード変更について","確認番号は" + num + "です。");
				
				//遷移先url
				url="P2PreLoginPasswordChange2.jsp";
				//画面遷移部品の生成とurlのセット
				RequestDispatcher rd = request.getRequestDispatcher(url);
				//遷移実行
				rd.forward(request, response);
			}else {
				System.out.println("メールアドレスが存在してないので弾く");
				String messCheck = "※登録したメールアドレスと一致しません。<br>もう一度入力してください。";
				ses.setAttribute("ERROR", messCheck);
				//遷移先url
				url="P2PreLoginPasswordChange1.jsp";
				//画面遷移部品の生成とurlのセット
				RequestDispatcher rd = request.getRequestDispatcher(url);
				//遷移実行
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

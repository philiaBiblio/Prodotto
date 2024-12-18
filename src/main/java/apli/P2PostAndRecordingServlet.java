package apli;

import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P2PostAndRecordingServlet
 */
@WebServlet("/P2PostAndRecordingServlet")
public class P2PostAndRecordingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//起動確認
		System.out.println("P2PostAndRecordingServlet実行");
        // 文字化け防止
        request.setCharacterEncoding("UTF-8");
        // セッションの生成
        HttpSession ses = request.getSession();
        // DBアクセス用クラス
        DBAcs dba = new DBAcs();
		
        // 現在の年月を取得
        LocalDate currentDate = LocalDate.now();
        String yearMonth = currentDate.format(DateTimeFormatter.ofPattern("yyyyMM"));
        
        // 中身の確認
        response.setContentType("text/plain");
		System.out.println("現在の年月: " + yearMonth);
        
        
		try {
			
			// SELECT文イベント情報を取得
			ResultSet rs = dba.selectExe("SELECT * FROM イベント WHERE イベントID = '"+yearMonth+"'");

			if(rs.next()) {
				//DBからイベントを取得
				String EveId = rs.getString("イベントID");
				String Eve = rs.getString("お題");
				// お題を保存
				ses.setAttribute("ODAI",Eve);
				ses.setAttribute("ODAITEXST",Eve);
			}
			else {
				System.out.println("イベントがありません");
			}
			
			// 画面遷移
            String url="P2PostAndRecording.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            // ログアウト処理
            dba.closeDB();
		}
		catch (Exception e) {
			e.printStackTrace();
            // エラーメッセージをセッションに保存
            ses.setAttribute("ERROR_MESSAGE", "エラーが発生しました: " + e.getMessage());
            response.sendRedirect("errorPage.jsp"); // エラーページへの遷移
            // ログアウト処理
            dba.closeDB();
		}
	}

}

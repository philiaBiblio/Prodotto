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
 * Servlet implementation class P2SessionParticipation
 */
@WebServlet("/P2SessionParticipation")

public class P2SessionParticipation extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	System.out.println("P2SessionParticipation実行");
    	
        // 文字化け防止
        request.setCharacterEncoding("UTF-8");
        
        // セッションの取得
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
        	}
        	else {
        		System.out.println("イベントがありません");
        	}
        	
        // セッション参加ボタンから音声ファイル名を取得
        String audioFile = request.getParameter("audioFile");  
        System.out.println("////////////////"+audioFile+"//////////////");
        
        // セッション参加ボタンから投稿IDを取得
        String toukouID = request.getParameter("ID");
        System.out.println("////////////////"+toukouID+"//////////////");
        
        
        // 音声ファイルのパスをセッションに保存
        request.setAttribute("audioFile", audioFile);
        
        // 投稿IDをセッションに保存
        ses.setAttribute("ID", toukouID);
        
        //画面遷移
        RequestDispatcher dispatcher = request.getRequestDispatcher("P2Recording.jsp");
        dispatcher.forward(request, response);     	

        	
        	
        }
        catch (Exception e) {
        	// TODO: handle exception
        	e.printStackTrace();
        	// ログアウト処理
        	dba.closeDB();
		}
     }
}       


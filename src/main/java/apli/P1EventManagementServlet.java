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
 * Servlet implementation class EventManagementServlet
 */
@WebServlet("/EventManagementServlet")
public class P1EventManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P1EventManagementServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
				
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		DBAcs dba2 = new DBAcs();
		
		try {
			// 入力された値を取得
			String nen = request.getParameter("nen");
			int inNen = Integer.parseInt(nen);
			String tuki = request.getParameter("tuki");
			int inTuki = Integer.parseInt(tuki);
			String inOdai = request.getParameter("odai");
			
			System.out.println(inNen);
			System.out.println(inTuki);
			
			// DB用に生成
			String id = "" + inNen + tuki;
			System.out.println(id);
			
			// 同じイベントIDがあるかどうかの検索
			ResultSet rs = dba.selectExe("select * from イベント where イベントID = '" + id + "'");
			if(rs.next()) {
				System.out.println("同じIDがあったのでお題をアップデートする");
				// データベースの情報をアップデート
		        String updateSQL = 
		        		"UPDATE イベント SET お題 = '" + inOdai +
		        		"' WHERE イベントID= '" + id + "'";
		        // アップデート文実行
		        dba2.UpdateExe(updateSQL);
		        
		        // ログアウト処理
				dba.closeDB();
				dba2.closeDB();
			}else{
				System.out.println("同じIDがなかったので過去のお題を作ろうとしていないかチェック");
				
				// 現在日付を生成
			    LocalDate day = LocalDate.now();
			    // java.time.LocalDateからStringに変換する
			    String y = day.format(DateTimeFormatter.ofPattern("yyyy"));
			    int yyyy = Integer.parseInt(y);
			    String m = day.format(DateTimeFormatter.ofPattern("MM"));
			    int mm = Integer.parseInt(m);
			    
			    System.out.println(yyyy);
			    System.out.println(mm);
			    
			    if(inNen > yyyy) {
			    	System.out.println("過去の年でないのでインサートする");
		    		
			        String insertSQL = 
			        		"INSERT INTO イベント values ('" + id + "','" + inOdai + "')";
			        // インサート文実行
			        dba.UpdateExe(insertSQL);
			        
			        // ログアウト処理
					dba.closeDB();
			    }else if(inNen == yyyy) {
			    	if(mm <= inTuki) {
			    		System.out.println("過去の年でないのでインサートする");
			    		
				        String insertSQL = 
				        		"INSERT INTO イベント values ('" + id + "','" + inOdai + "')";
				        // インサート文実行
				        dba.UpdateExe(insertSQL);
				        
				        // ログアウト処理
						dba.closeDB();
			    	}else {
			    		 System.out.println("106：過去へ登録してしまうので弾く");
					    	String mess = "※過去の期間へのお題の登録は出来ません。<br>期間を選択しなおしてください。";
					    	ses.setAttribute("ERROR", mess);
			    	}
			    }else {
			    	System.out.println("111：過去へ登録してしまうので弾く");
			    	String mess = "※過去の期間へのお題の登録は出来ません。<br>期間を選択しなおしてください。";
			    	ses.setAttribute("ERROR", mess);
			    }
			}
			
			// イベント管理画面へ戻る
			url = "P1EventManegement.jsp";
			// 画面遷移
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// ログアウト処理
			dba.closeDB();
			dba2.closeDB();
		}
	}
}
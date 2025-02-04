package apli;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

@WebServlet("/P2SaiseiCountServlet")
public class P2SaiseiCountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	//Servlet実行確認
    	System.out.println("P2SaiseiCountServlet実行");
    	
    	// 文字化け防止
    	request.setCharacterEncoding("UTF-8");
    	// セッションの生成
    	HttpSession ses = request.getSession();
    					
    	// URLの生成
    	String url = "";
    	// DBアクセス用部品の生成
    	DBAcs dba = new DBAcs();
    	DBAcs dba2 = new DBAcs();
    	
    	// 現在の年月を取得
        LocalDate currentDate = LocalDate.now();
        String yearMonth = currentDate.format(DateTimeFormatter.ofPattern("yy-MM-dd"));
        
        // 中身の確認
        response.setContentType("text/plain");
		System.out.println("現在の年月: " + yearMonth);
		
        try {
        	// JSONデータを読み取る
            StringBuilder sb = new StringBuilder();
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            
            //.getする
            JSONObject json = new JSONObject(sb.toString());
            String toukouUserid = json.getString("toukouUserid");
            String toukouId = json.getString("toukouId");
            String userId = json.getString("userId");

            // 中身の確認
            System.out.println("toukouUserid: " + toukouUserid);
            System.out.println("toukouId: " + toukouId);
            System.out.println("userId: " + userId);
            
			ResultSet rs1 = dba.selectExe("select * from ユーザー where ユーザーID = '"+userId+"'");

            
            if(toukouUserid.equals(userId) || !rs1.next()) {
            	System.out.println("再生したのが自分だから何もしない");
            }
            else {
            	System.out.println("再生したのが自分以外");
            	
    			// 再生テーブル検索のsql文実行
    			ResultSet rs = dba.selectExe("select * from 再生 where "
    					+ "投稿ID = '" + toukouId 
    					+ "' AND ユーザーID = '"+ userId 
    					+"' AND 再生日 = '"+ yearMonth + "'");

            	if(rs.next()) {
            		System.out.println("既に今日再生したからカウントしない");
            	}
            	else {
            		System.out.println("まだ観てないからカウントする");
            		
            		// このデータをDBにインサートする
        	        String insertSQL = 
        	        		"INSERT INTO 再生 values ('" + toukouId + "','"
        	        				+ userId +"',to_date('" + yearMonth.replace("-", "")
        	        				+ "','YY/MM/DD'),NUll)";
        	        // インサート文実行
        	        dba.UpdateExe(insertSQL);
        	        
        	        System.out.println("再生数増えました");
            	}
            	
            }
            // ログアウト処理
	    	dba.closeDB();
        }
        catch (Exception e) {
			// TODO: handle exception
        	e.printStackTrace();
			// ログアウト処理
			dba.closeDB();
		}   
    }
}
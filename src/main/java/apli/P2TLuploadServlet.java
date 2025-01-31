package apli;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class P2TLuploadServlet
 */
@WebServlet("/P2TLuploadServlet")
@MultipartConfig(
	    location="/org", // ディレクトリパスを指定することも出来る (しなくても良い)
	    fileSizeThreshold=32768,
	    maxFileSize=5242880,
	    maxRequestSize=27262976
	)

public class P2TLuploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2TLuploadServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		
		// セッションの取得
		HttpSession ses = request.getSession();
		
		//音声ファイルのパスを取得
	    String filename = (String)ses.getAttribute("audioPath");
	    System.out.println("///////////////"+filename+"//////////////");
		
		//投稿IDの取得
        String toukouID = (String)ses.getAttribute("ID");		
        System.out.println("///////////////"+toukouID+"//////////////");      
        
        //ユーザー情報を取得
      	User u = (User)ses.getAttribute("LOGIN");       
        
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		
		try {
			// タグの取得
			String title = request.getParameter("search");
			System.out.println("113：" + title);
			
			ObjectMapper mapper = new ObjectMapper();
			
			String taguID1 = "";
		    String taguID2 = "";
		    String taguID3 = "";
		    String taguID4 = "";
		    String taguID5 = "";
			
			try {
				TypeReference<List<Map<String, String>>> type = new TypeReference<List<Map<String, String>>>() {};
			    List<Map<String, String>> list = mapper.readValue(title, type);
			    
			      System.out.println("129：" + list);
			      title = "";
			      if(list.size() != 0) {
			    	  for(int i = 0; i < list.size(); i++) {
			    		  if(i >= 1) {
			    			  title = title + "," + list.get(i).get("value");
			    			//  System.out.println("134：" + title);
			    		  }else {
			    			  title = title + list.get(i).get("value");
			    		  }
			    	  }
			      }
			      System.out.println("147：" + title);
			      
			      
			      // 複数の「,」区切りのものをばらす
			      String word[] = title.split(",");
			      
			      //////////タグ名をタグIDに変換/////////
			      
			      String sql = "";
			      ResultSet rs;
			      
			      ////////// １個目 ////////			      
			      if(word.length >= 1) {
			      sql = "SELECT タグID FROM タグ WHERE タグ名 = '"+word[0]+"'";
			      rs = dba.selectExe(sql);
			      // SELECT文タグIDを取得
			    	  while(rs.next()) {
			    		  taguID1 = rs.getString("タグID");
			      	}
			      }
			      else {
			    	  taguID1="";
			      }
			      
			      ////////// ２個目 ////////
				  if(word.length >= 2) {
				  sql = "SELECT タグID FROM タグ WHERE タグ名 = '"+word[1]+"'";
				  // SELECT文タグIDを取得
				  rs = dba.selectExe(sql);
					  while(rs.next()) {
						  taguID2 = rs.getString("タグID");
					  } 
				  }	
				  else {
			    	  taguID2="";
			      }
				  
				  ////////// ３個目 ////////
				  if(word.length >= 3) {
				  sql = "SELECT タグID FROM タグ WHERE タグ名 = '"+word[2]+"'";
				  // SELECT文タグIDを取得
				  rs = dba.selectExe(sql);
					  while(rs.next()) {
						  taguID3 = rs.getString("タグID");
					  }     
				  }
				  else {
			    	  taguID3="";
			      }
				  
				  ////////// ４個目 ////////
				  if(word.length >= 4) {
				  sql = "SELECT タグID FROM タグ WHERE タグ名 = '"+word[3]+"'";
				  // SELECT文タグIDを取得
				  rs = dba.selectExe(sql);
					  while(rs.next()) {
						  taguID4 = rs.getString("タグID");
					  }
				  }
				  else {
			    	  taguID4="";
			      }
				  
				  ////////// ５個目 ////////
				  if(word.length >= 5) {
				  sql = "SELECT タグID FROM タグ WHERE タグ名 = '"+word[4]+"'";
				  // SELECT文タグIDを取得
				  rs = dba.selectExe(sql);
					  while(rs.next()) {
						  taguID5 = rs.getString("タグID");
				  	}
				  }
				  else {
			    	  taguID5="";
			      }
				  
				  
				  System.out.println("//// "+taguID1+" ////");
				  System.out.println("//// "+taguID2+" ////");
				  System.out.println("//// "+taguID3+" ////");
				  System.out.println("//// "+taguID4+" ////");
				  System.out.println("//// "+taguID5+" ////");
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			
			// 画像の受け取り
			Part part = request.getPart("samune");
			
			//jspからアップロードしたい画像ファイル名を取得
			String name = this.getFileName(part);
			System.out.println("fileName："+name);
			
			//音声ファイルの取得
		    String audiopath = (String) ses.getAttribute("audioPath");
		    audiopath = audiopath.substring(6);
			
		    
		    ///////////////サムネイルの設定//////////////
			System.out.println("///////////////// "+name+" //////////////////");
		    
			//サムネイル画像未設定の場合
			if(name.equals("")) {
				name = u.getIconImage();
			}
			//設定した場合
			else {
				//WebContent内のimgフォルダまでのパスを取得
				String pathfilename = getServletContext().getRealPath("\\image");
				//imgフォルダまでのパスとアップロードしたい画像ファイルを文字連結する
				pathfilename=pathfilename+"\\"+name;
				System.out.println("pathfilename"+pathfilename);
				//画像ファイルのアップロードを実行
				part.write(pathfilename);
			}
		    
		    
		    if(toukouID == null) {
			    //////////// 「ひとりでセッション」から投稿 //////////////
		    	if(ses.getAttribute("ODAITEXST") == null){
		    		System.out.println("*************** 「ひとりでセッション」から投稿 ****************");
				 	String insertSQL = 
			    		    "INSERT INTO 投稿 VALUES (" +
			    		        "'000000' || '-a0000' || '-' || LPAD(連番2.nextval, 8, '0'), " +
			    		        "'" + u.getUserid() + "', " +
			    		        "'000000', " +
			    		        "'a0000', " +
			    		        "to_char(systimestamp, 'yyyy-mm-dd HH24:MI:SS'), " +
			    		        "'" + audiopath + "', " +
			    		        "'" + name + "', " +
			    		        "'" +taguID1+ "',"+"'" +taguID2+ "',"+"'" +taguID3+ "',"+"'" +taguID4+ "',"+"'" +taguID5+ "'"+
			    		    ")";
			    	
				 	// インサート文実行
				 	dba.UpdateExe(insertSQL);
		    	}
			    //////////// 「セッションを始める」から投稿 //////////////		    	
		    	else {
		    		System.out.println("*************** 「セッションを始める」から投稿 ****************");
		    		// シーケンスの連番を1回だけ取得
		    		ResultSet rs = dba.selectExe("SELECT 連番1.nextval AS seq_val FROM dual");
		    		rs.next(); // カーソルを1行目に進める
		    		String seq_val = rs.getString("seq_val"); // 取得したシーケンス値

		    		// SQL文の作成
		    		String insertSQL = 
		    		    "INSERT INTO 投稿 VALUES (" +
		    		        "to_char(systimestamp, 'yyyymm') || '-a' || LPAD(" + seq_val + ", 4, '0') || '-' || LPAD(連番2.nextval, 8, '0'), " +
		    		        "'" + u.getUserid() + "', " +
		    		        "to_char(systimestamp, 'yyyymm'), " +  
		    		        "'a' ||LPAD(" + seq_val + ", 4, '0'), " +    
		    		        "to_char(systimestamp, 'yyyy-mm-dd HH24:MI:SS'), " +
		    		        "'" + audiopath + "', " +
		    		        "'" + name + "', " +
		    		        "'" +taguID1+ "',"+"'" +taguID2+ "',"+"'" +taguID3+ "',"+"'" +taguID4+ "',"+"'" +taguID5+ "'"+
		    		    ")";			    	
				 	// インサート文実行
				 	dba.UpdateExe(insertSQL);
		    	}
		    	
		    }
		    //////////// 「セッションに参加」から投稿 //////////////		    
		    else {
		    	System.out.println("*************** 「セッションに参加」から投稿 ****************");
		    	//投稿IDからイベントIDと派生IDを取得するSQL
			    System.out.println("///////////////"+audiopath+"////////////////");
			    String sql = "SELECT * FROM 投稿 WHERE 投稿ID = '"+toukouID+"'";
			    
			    
			    // SQL文実行
			 	ResultSet rs = dba.selectExe(sql);
			 	// カーソルを1行目に進める
			 	rs.next();
			 	
			 	String eventID = rs.getString("イベントID");
			 	String haseiID = rs.getString("派生ID");

			 	// 取得したシーケンス値を使ってSQL文を作成
			 	String insertSQL = 
			 	    "INSERT INTO 投稿 VALUES (" +
			 	        eventID +"||'-' || '" + haseiID + "' || '-' || LPAD(連番2.nextval, 8, '0'), " +
			 	        "'" + u.getUserid() + "', " +
			 	        "'" + eventID + "','" +
			 	        haseiID + "', " + 
			 	        "to_char(systimestamp, 'yyyy-mm-dd HH24:MI:SS'), " +
			 	        "'" + audiopath + "', " +
			 	        "'" + name + "', " +
			 	       "'" +taguID1+ "',"+"'" +taguID2+ "',"+"'" +taguID3+ "',"+"'" +taguID4+ "',"+"'" +taguID5+ "'"+
			 	    ")";		    	
			 	// インサート文実行
			 	dba.UpdateExe(insertSQL);
		    }    
			
		    
	        
	        // タイムライン画面へ
	        url = "P2TimelineServlet";
	        System.out.println(url);
	        // 画面遷移
	        response.sendRedirect(url);
			
	     // ログアウト処理
	     dba.closeDB();		
	     
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// ログアウト処理
			dba.closeDB();	
		}	
	}
	
	//ファイル名取得メソッド(サーブレット内に作成、コピーしてそのまま貼り付けてください)
    private String getFileName(Part part) {
        String name = null;
        for (String dispotion : part.getHeader("Content-Disposition").split(";")) {
            if (dispotion.trim().startsWith("filename")) {
                name = dispotion.substring(dispotion.indexOf("=") + 1).replace("\"", "").trim();
                name = name.substring(name.lastIndexOf("\\") + 1);
                break;
            }
        }
        return name;
    }

}
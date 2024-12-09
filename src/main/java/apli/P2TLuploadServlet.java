package apli;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
		// セッションの生成
		HttpSession ses = request.getSession();
	    String filename = (String) ses.getAttribute("audioPath");
		User u = (User)ses.getAttribute("LOGIN");
		
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 画像の受け取り
			Part part = request.getPart("samune");
			
			//jspからアップロードしたい画像ファイル名を取得
			String name = this.getFileName(part);
			System.out.println("fileName："+name);
			
			//音声ファイルの取得
		    String adpath = (String) ses.getAttribute("audioPath");
		    adpath=adpath.substring(6);
			
			// このデータをDBにインサートする
			String insertSQL = 
				    "INSERT INTO 投稿 VALUES (" +
				    "to_char(systimestamp,'yyyymm') || '-a' || LPAD(連番1.nextval, 4, '0') || '-' || LPAD(連番2.nextval, 8, '0'),'" +
				    u.getUserid() + "', '000000', 'a0000', " +
				    "to_char(systimestamp,'yyyy-mm-dd HH24:MI:SS'), " +
				    "'" + adpath + "', '" + name + "', NULL)";
			
			
	        //WebContent内のimgフォルダまでのパスを取得
	        String pathfilename = getServletContext().getRealPath("\\image");
	        //imgフォルダまでのパスとアップロードしたい画像ファイルを文字連結する
	        pathfilename=pathfilename+"\\"+name;
	        System.out.println("pathfilename"+pathfilename);
	        //画像ファイルのアップロードを実行
	        part.write(pathfilename);
			
	        // インサート文実行
	        dba.UpdateExe(insertSQL);
	        
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
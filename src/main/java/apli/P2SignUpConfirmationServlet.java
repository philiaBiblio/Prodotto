package apli;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class P2SignUpConfirmationServlet
 */
@WebServlet("/P2SignUpConfirmationServlet")
@MultipartConfig(
	    location="/org", // ディレクトリパスを指定することも出来る (しなくても良い)
	    fileSizeThreshold=32768,
	    maxFileSize=5242880,
	    maxRequestSize=27262976
	)
public class P2SignUpConfirmationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2SignUpConfirmationServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		
		User u = (User)ses.getAttribute("NYURYOKU");
		
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 入力された情報の取得			
			System.out.println(u.getName());
			System.out.println(u.getUserid());
			System.out.println(u.getSex());
			System.out.println(u.getHistory());
			System.out.println(u.getFq());
			System.out.println(u.getBirth().replace("-", ""));
			System.out.println(u.getMailadd());
			System.out.println(u.getPassword());
			
			// 画像の受け取り
			Part part = request.getPart("icon");		//jspのtype="file"のnameを指定
			
			//jspからアップロードしたい画像ファイル名を取得
	        String name = this.getFileName(part);
	        System.out.println("fileName："+name);
	        
	        //ファイルが選択されてない場合
	        if(name.equals("")) {
	        	System.out.println("画像選択なし");
	        	name = "ききゅう.jpg";
	        }
	        else {
	        	//WebContent内のimgフォルダまでのパスを取得
	        	String pathfilename=getServletContext().getRealPath("\\image");
	        	//imgフォルダまでのパスとアップロードしたい画像ファイルを文字連結する
	        	pathfilename=pathfilename+"\\"+name;
	        	System.out.println("pathfilename："+pathfilename);	
	        	//画像ファイルのアップロードを実行
	        	part.write(pathfilename);	
	        }
			
			// このデータをDBにインサートする
	        String insertSQL = 
	        		"INSERT INTO ユーザー values ('" + u.getUserid() + "','"
	        				+ u.getName() + "','" + u.getSex() + "','" + u.getHistory()
	        				+ "','" + u.getFq() + "',to_date('" + u.getBirth().replace("-", "")
	        				+ "','YYYY/MM/DD'),'" + name + "','" + u.getPassword() + "','" + u.getMailadd() + "')";
	        // インサート文実行
	        dba.UpdateExe(insertSQL);
	        
	        u.setIconImage(name);
	        
	        // その会員情報を保存
	        ses.setAttribute("LOGIN", u);
	        
	        // DMのための準備
			ArrayList<DM> dmssList = new ArrayList<DM>();
			ses.setAttribute("DMSSLIST", dmssList);
	        
	        // タイムラインのためのサーブレットへ
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

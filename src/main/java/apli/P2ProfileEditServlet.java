package apli;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class P2ProfileEditServlet
 */
@WebServlet("/P2ProfileEditServlet")
@MultipartConfig(
	    location="/org", // ディレクトリパスを指定することも出来る (しなくても良い)
	    fileSizeThreshold=32768,
	    maxFileSize=5242880,
	    maxRequestSize=27262976
	)
public class P2ProfileEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2ProfileEditServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// ログイン情報の取得
		User u = (User)ses.getAttribute("LOGIN");
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 変更された情報の取得
			String inIconImage = request.getParameter("iconImage");
			String inName = request.getParameter("name");
		//	String inUserid = request.getParameter("userid");
			String inSex = request.getParameter("sexy");
			String inBirth = request.getParameter("birth");
			System.out.println(inName);
			System.out.println(inSex);
			
			// 画像の受け取り
			Part part = request.getPart("icon");		//jspのtype="file"のnameを指定						
			//jspからアップロードしたい画像ファイル名を取得
			String name = this.getFileName(part);
			System.out.println("fileName："+name);
			
			if (!(name.equals("")) ) {
				//WebContent内のimgフォルダまでのパスを取得
				String pathfilename=getServletContext().getRealPath("\\image");
				//imgフォルダまでのパスとアップロードしたい画像ファイルを文字連結する
				pathfilename=pathfilename+"\\"+name;
				System.out.println("pathfilename："+pathfilename);
				//画像ファイルのアップロードを実行
				part.write(pathfilename);
				
				inIconImage = name;
			}
			else {
				System.out.println(inIconImage);
				System.out.println("アイコン変更なし");
			}
			
			// ユーザーの検索のsql文実行
			ResultSet rs = dba.selectExe("select * from ユーザー where ユーザーID = '" + u.getUserid() + "'");
			
			if(rs.next()) {
				
				// データベースの情報をアップデート
		        String updateSQL = 
		        		"UPDATE ユーザー SET アイコン = '" + inIconImage +
		        		"', 名前 = '" + inName +
		        	//	"', ユーザーID = '" + inUserid +
		        		"', 性別 = '" + inSex +
		        		"', 生年月日 = '" + inBirth +
		        		"'WHERE ユーザーID = '" + u.getUserid() + "'";
		        
		        // アップデート文実行
		        dba.UpdateExe(updateSQL);
		        
		        // 取得した情報を保存
		        System.out.println(u.getIconImage());
		        u.setIconImage(inIconImage);
		        u.setName(inName);
		      //  u.setUserid(inUserid);
		        u.setSex(inSex);
		        u.setBirth(inBirth.substring(0,10));
		        
		        System.out.println(inIconImage);
		        System.out.println(u.getIconImage());
		        // ログインした会員情報を保存
		        ses.setAttribute("LOGIN", u);
		        
		        // プロフィール編集画面へ
		        url = "P2ProfileEdit.jsp";
		        System.out.println(url);
		        // 画面遷移
		        RequestDispatcher rd = request.getRequestDispatcher(url);
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

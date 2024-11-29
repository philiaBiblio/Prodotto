package apli;

import java.io.IOException;

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
 * Servlet implementation class UserSearchServlet
 */
@WebServlet("/P2UploadServlet")
@MultipartConfig(
	    location="/org", // ディレクトリパスを指定することも出来る (しなくても良い)
	    fileSizeThreshold=32768,
	    maxFileSize=5242880,
	    maxRequestSize=27262976
	)
public class P2UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("P2UploadServlet実行");
        
        // 文字化け防止
        request.setCharacterEncoding("UTF-8");
        
        // セッションの生成
        HttpSession ses = request.getSession();
        
        // ログイン情報の取得
        User u = (User) ses.getAttribute("LOGIN");
        
        // URLの生成
        String url = "";
        
        // DBアクセス用部品の生成
        DBAcs dba = new DBAcs();
        
        //jspのtype="file"のnameを指定
        Part part = request.getPart("samplefile");
        
        //jspからアップロードしたい画像ファイル名を取得
        String name = this.getFileName(part);
        System.out.println("fileName"+name);
        
        //WebContent内のimgフォルダまでのパスを取得
        String pathfilename=getServletContext().getRealPath("\\img");
        
        //imgフォルダまでのパスとアップロードしたい画像ファイルを文字連結する
        pathfilename=pathfilename+"\\"+name;
        System.out.println("pathfilename"+pathfilename);
        
        //画像ファイルのアップロードを実行
        part.write(pathfilename);

		//画面遷移(修正)
        url = "";
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

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
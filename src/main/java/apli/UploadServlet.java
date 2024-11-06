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

@WebServlet("/UploadServlet")
@MultipartConfig(
	    location="/org", // ディレクトリパスを指定することも出来る (しなくても良い)
	    fileSizeThreshold=32768,
	    maxFileSize=5242880,
	    maxRequestSize=27262976
	)
public class UploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession ses =request.getSession();
    	Part part = request.getPart("samplefile");//jspのtype="file"のnameを指定

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

		//画面遷移(最初画面に戻っている為、必要に応じて修正)
        String url = "fileUp.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(url);
		//遷移実行
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
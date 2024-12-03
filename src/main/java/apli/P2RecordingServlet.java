package apli;

import java.io.File;
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

@WebServlet("/P2RecordingServlet")
@MultipartConfig(location = "/org", 
		fileSizeThreshold = 32768, 
		maxFileSize = 104857600, 
		maxRequestSize = 104857600)
public class P2RecordingServlet extends HttpServlet {

	// GETリクエスト処理（画面遷移）
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        // 画面遷移
        String url = "P2RecordingConfirmation.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
	}

	// POSTリクエスト処理（ファイルアップロード処理）
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession ses = request.getSession();
		Part part = request.getPart("audioData"); // jspのtype="file"のnameを指定
		if (part == null) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ファイルが送信されていません");
			return;
		}
		System.out.println("アップロードされたファイル: " + part.getSubmittedFileName());

		// jspからアップロードしたい音声ファイル名を取得
		String name = this.getFileName(part); // getFileName メソッドを呼び出す
		System.out.println("fileName: " + name);

		// WebContent内のaudioフォルダまでのパスを取得s
		String uniqueFileName = System.currentTimeMillis() + "_" + name;
		System.out.println("uniqueFileName: " + uniqueFileName);
		String pathfilename = getServletContext().getRealPath("audio") + File.separator + uniqueFileName;
		System.out.println("pathfilename: " + pathfilename);

		// ディレクトリが存在しない場合は作成
		File uploadDir = new File(getServletContext().getRealPath("audio"));
		if (!uploadDir.exists()) {
			uploadDir.mkdirs(); // ディレクトリを作成
		}
		
		// ファイル保存
		try {
			part.write(pathfilename);
		} catch (IOException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "ファイルの保存に失敗しました。");
			return;
		} 
		System.out.println("68");
		// 次画面に保存されたファイルパスを渡す
		(request.getSession()).setAttribute("audioPath", "audio/" + uniqueFileName);
		System.out.println("72" + uniqueFileName);
		RequestDispatcher rd = request.getRequestDispatcher("P2RecordingConfirmation.jsp");
		rd.forward(request, response);
		
	}

	// ファイル名を取得するメソッド
	private String getFileName(Part part) {
		String name = null;
		for (String disposition : part.getHeader("Content-Disposition").split(";")) {
			if (disposition.trim().startsWith("filename")) {
				name = disposition.substring(disposition.indexOf("=") + 1).replace("\"", "").trim();
				name = name.substring(name.lastIndexOf("\\") + 1); // Windowsのパス区切りを除去
				break;
			}
		}
		return name;
	}
}
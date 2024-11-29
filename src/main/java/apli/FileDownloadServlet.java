package apli;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class FileDownloadServlet
 */
@WebServlet("/FileDownloadServlet")
@MultipartConfig
public class FileDownloadServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 音声ファイルを取得
            Part audioPart = request.getPart("audioFile");
            if (audioPart == null) {
                throw new IOException("音声ファイルがありません");
            }
            String fileName = Paths.get(audioPart.getSubmittedFileName()).getFileName().toString(); // ファイル名を取得

            // 保存先のディレクトリを指定
            String uploadDir = getServletContext().getRealPath("/") + "uploads";
            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdir(); // ディレクトリが存在しない場合は作成
            }

            // ファイルを保存
            File file = new File(uploadDir, fileName);
            try (InputStream inputStream = audioPart.getInputStream();
                 OutputStream outputStream = new FileOutputStream(file)) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }

            // 録音確定画面に遷移（必要であればメッセージを設定）
            response.sendRedirect("confirmation.jsp");
        } catch (Exception e) {
            e.printStackTrace(); // エラーをログに出力
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "ファイルの処理中にエラーが発生しました");
        }
    }
}

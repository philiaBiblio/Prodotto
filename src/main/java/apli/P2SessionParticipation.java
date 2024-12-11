package apli;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class P2SessionParticipation
 */
@WebServlet("/P2SessionParticipation")
public class P2SessionParticipation extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String audioFile = request.getParameter("audioFile");  // URLパラメータから音声ファイル名を取得
        System.out.println(audioFile);
        // ここで音声ファイルを録音画面に渡す処理を実行
        request.setAttribute("audioFile", audioFile);
        RequestDispatcher dispatcher = request.getRequestDispatcher("P2Recording.jsp");
        dispatcher.forward(request, response);
    }
}
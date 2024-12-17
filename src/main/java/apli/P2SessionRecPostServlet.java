package apli;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/P2SessionRecPostServlet")
public class P2SessionRecPostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("P2SessionRecPostServlet実行");

        
        
        
        /////////////  使ってなさそうだから、後で消すかも  //////////////////////
        
        
        
        
        
        // 文字化け防止
        request.setCharacterEncoding("UTF-8");
        // セッションの生成
        HttpSession ses = request.getSession();
        // DBアクセス用クラス
        DBAcs dba = new DBAcs();

        String url = "";

        try (Connection connection = dba.getConnection()) {
            // 検索キーワードの取得
            String postId = request.getParameter("postId");
            if (postId == null || postId.isEmpty()) {
                throw new IllegalArgumentException("投稿IDが見つかりません");
            }

            // 投稿IDからイベントIDを抽出
            String eventId = postId.substring(0, 6);

            // SQLクエリの準備
            String sql = "SELECT 投稿.作品, イベント.お題 "
                       + "FROM 投稿テーブル AS 投稿 "
                       + "JOIN イベントテーブル AS イベント "
                       + "ON 投稿.イベントID = イベント.イベントID "
                       + "WHERE 投稿.投稿ID = ? "
                       + "AND イベント.イベントID = ?";

            // クエリ実行
            try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setString(1, postId);
                stmt.setString(2, eventId);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // 結果の取得
                        String theme = rs.getString("お題");
                        String postPath = rs.getString("作品");

                        // イベントインスタンスの生成
                        Event event = new Event();
                        event.setPostId(postId);
                        event.setOdai(theme);
                        event.setPostPath(postPath);

                        // セッションに保存
                        ses.setAttribute("SESSION", event);
                      } 
                      else {
                        // 結果がない場合の処理
                        System.out.println("データが見つかりませんでした");
                        ses.setAttribute("ERROR_MESSAGE", "指定された投稿は見つかりませんでした");
                      }
                }
            }            
            
            // 画面遷移
            url="P2Recording.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            // ログアウト処理
            dba.closeDB();

        } catch (Exception e) {
            e.printStackTrace();
            // エラーメッセージをセッションに保存
            ses.setAttribute("ERROR_MESSAGE", "エラーが発生しました: " + e.getMessage());
            response.sendRedirect("errorPage.jsp"); // エラーページへの遷移
            // ログアウト処理
            dba.closeDB();
        }
    }
}

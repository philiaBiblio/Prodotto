package apli;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P2TimelineServlet
 */
@WebServlet("/P2SessionDerivationServlet")
public class P2SessionDerivationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2SessionDerivationServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// アレイリストの生成
		ArrayList<Toukou> toukouList = new ArrayList<Toukou>();
		ArrayList<User> userIconList = new ArrayList<User>();
		ArrayList<Post> postList = new ArrayList<Post>();
		
		

		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			
			
			java.util.Calendar cal = java.util.Calendar.getInstance();
			int year = cal.get(java.util.Calendar.YEAR); // 現在の西暦年
			int month = cal.get(java.util.Calendar.MONTH) + 1; // 現在の月 (0ベースなので+1)
			String noweventId = String.format("%04d%02d", year, month);

			// SQL文の準備（直接 eventId を埋め込む）
			String sql = "select 投稿.投稿ID, 投稿.ユーザーID, 投稿.イベントID, 投稿.派生ID, アップロード日, 作品, サムネイル, タグID, 名前, アイコン,"
			           + "(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = 投稿.投稿ID) AS コメント数,"
			           + "(SELECT COUNT(*) FROM いいね WHERE いいね.投稿ID = 投稿.投稿ID) AS いいね数 "
			           + "from 投稿 "
			           + "join ユーザー on 投稿.ユーザーID = ユーザー.ユーザーID "
			           + "where 投稿.イベントID = '" + noweventId + "' "
			           + "order by アップロード日 desc";

			// sql文実行
			ResultSet rs = dba.selectExe(sql);
			
			// 繰り返しでsqlからすべての情報を得る
			while(rs.next()) {
				String toukouId = rs.getString("投稿ID");
				String userId = rs.getString("ユーザーID");
				String eventId = rs.getString("イベントID");
				String haseiId = rs.getString("派生ID");
				String time = rs.getString("アップロード日");
				String audio = rs.getString("作品");
				String samune = rs.getString("サムネイル");
				System.out.println("サムネイル："+samune);
				// タグID作るときはここに記入
				String upName = rs.getString("名前");
				String toukouIcon = rs.getString("アイコン");
				
				int comm; 
				if (rs.getInt("コメント数") > 0) {
				    comm = rs.getInt("コメント数") - 1;
				} else {
				    comm = rs.getInt("コメント数");
				}
				
				
				int iine = rs.getInt("いいね数");
//				System.out.println(toukouId.substring(0,6));
				
				// インスタンス生成
				Toukou toukou = new Toukou();
				toukou.setToukouid(toukouId);
				toukou.setUserid(userId);
				toukou.setEventid(eventId);
				toukou.setDeriveid(haseiId);
				toukou.setUpday(time);
				toukou.setSound(audio);
				toukou.setThumbnail(samune);
				
				User up = new User();
				up.setName(upName);
				up.setIconImage(toukouIcon);
				
				Post kazu = new Post();
				kazu.setCommentCount(comm);
				kazu.setLikeCount(iine);
				
				// アレイリストに追加
				toukouList.add(toukou);
				userIconList.add(up);
				postList.add(kazu);
			}
			ses.setAttribute("TOUKOULIST", toukouList);
			ses.setAttribute("ICONLIST", userIconList);
			ses.setAttribute("POSTLIST", postList);
			
			// タイムライン画面へ
			url = "P2Timeline.jsp";
			System.out.println(url);
			
			// 画面遷移
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
			
			// ログアウト処理
			dba.closeDB();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// ログアウト処理
			dba.closeDB();
		}
	}
}

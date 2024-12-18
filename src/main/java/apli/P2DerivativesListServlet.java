package apli;

import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P2DerivativesListServlet
 */
@WebServlet("/P2DerivativesListServlet")
public class P2DerivativesListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("P2DerivativesListServlet実行");

		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();

		// ログイン情報の取得
		User u = (User)ses.getAttribute("LOGIN");
		
		ArrayList<Toukou> DtoukouList = new ArrayList<Toukou>();
		ArrayList<User> DuserIconList = new ArrayList<User>();
		ArrayList<Post> DpostList = new ArrayList<Post>();
		ArrayList<Heart> DheartList = new ArrayList<Heart>();

		LocalDate currentDate = LocalDate.now();
		int year = currentDate.getYear();
		int month = currentDate.getMonthValue(); // 月を数値で取得（1〜12）

		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		DBAcs dba2 = new DBAcs();
		
		try {

			//お題を取得
			System.out.println("Year: " + year + "Month: " + month);
			String Year = Integer.toString(year);
			String Month = Integer.toString(month);
			String odai = Year+Month;

			//投稿を取得(お題が今のと同じものを持ってくる)
			String sql1 = "select 投稿.投稿ID,投稿.ユーザーID,投稿.イベントID,投稿.派生ID,アップロード日,作品,サムネイル,タグID,名前,アイコン,"
			           + "(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = 投稿.投稿ID) AS コメント数,"
			           + "(SELECT COUNT(*) FROM いいね WHERE いいね.投稿ID = 投稿.投稿ID) AS いいね数"
			           + " from 投稿"
			           + " join ユーザー on 投稿.ユーザーID = ユーザー.ユーザーID"
			           + " where 投稿.イベントID = '202412'"
			           + " order by アップロード日 desc";

			// sql文実行
			ResultSet rs = dba.selectExe(sql1);
			

			
			if(!rs.isBeforeFirst()) {
				System.out.println("結果が空です。");
			}else {
			// 繰り返しでsqlからすべての情報を得る
			while(rs.next()) {
				String toukouId = rs.getString("投稿ID");
				System.out.println("投稿ID："+toukouId);
				
				String userId = rs.getString("ユーザーID");
				System.out.println("ユーザーID："+userId);
				
				String eventId = rs.getString("イベントID");
				System.out.println("イベントID："+eventId);
				
				String haseiId = rs.getString("派生ID");
				System.out.println("派生ID："+haseiId);
				
				String time = rs.getString("アップロード日");
				System.out.println("アップロード日*"+time);
				
				String audio = rs.getString("作品");
				System.out.println("作品："+audio);
				
				String samune = rs.getString("サムネイル");
				System.out.println("サムネイル："+samune);
				
				
				String upName = rs.getString("名前");
				System.out.println("名前："+upName);
				
				String toukouIcon = rs.getString("アイコン");
				System.out.println("名前："+upName);
				
				int comm = rs.getInt("コメント数");
				System.out.println("コメント数:"+comm);
				
				int iine = rs.getInt("いいね数");
				System.out.println("いいね数："+iine);

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
				DtoukouList.add(toukou);
				DuserIconList.add(up);
				DpostList.add(kazu);
			}}
			ses.setAttribute("DTOUKOULIST", DtoukouList);
			ses.setAttribute("DICONLIST", DuserIconList);
			ses.setAttribute("DPOSTLIST", DpostList);

			// 自分がいいねしたかの判別用のsql
			String sql2 = "select * from いいね";
			// sql文実行
			ResultSet rs2 = dba2.selectExe(sql2);

			while(rs2.next()) {
				String toukouId = rs2.getString("投稿ID");
				String userId = rs2.getString("ユーザーID");

				// インスタンス生成
				Heart Dheart = new Heart();
				Dheart.setPostId(toukouId);
				Dheart.setUserId(userId);

				// アレイリストに追加
				DheartList.add(Dheart);
			}
			ses.setAttribute("DHEARTLIST", DheartList);

			//P2DerivativesListへ
			url = "P2DerivativesList.jsp";
			System.out.println(url);

			//画面遷移
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);

			// ログアウト処理
			dba.closeDB();
			dba2.closeDB();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// ログアウト処理
			dba.closeDB();
			dba2.closeDB();
		}
	}

}

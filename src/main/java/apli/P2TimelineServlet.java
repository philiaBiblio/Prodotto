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
@WebServlet("/P2TimelineServlet")
public class P2TimelineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2TimelineServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// アレイリストの取得
		ArrayList<Toukou> toukouList = new ArrayList<Toukou>();

		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// 投稿用のsql文
			String sql = "select * from 投稿";
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
				
				 //WebContent内のimgフォルダまでのパスを取得
		        String pathfilename=getServletContext().getRealPath("\\image");
		        //imgフォルダまでのパスと画像ファイルを文字連結する
		        pathfilename=pathfilename+"\\"+samune;
		        System.out.println("pathfilename："+pathfilename);
		        
		      //WebContent内のimgフォルダまでのパスを取得
		        String pathfilename2=getServletContext().getRealPath("\\audio");
		        //imgフォルダまでのパスと画像ファイルを文字連結する
		        pathfilename2=pathfilename2+"\\"+audio;
		        System.out.println("pathfilename2："+pathfilename2);
				
				// インスタンス生成
				Toukou toukou = new Toukou();
				toukou.setToukouid(toukouId);
				toukou.setUserid(userId);
				toukou.setEventid(eventId);
				toukou.setDeriveid(haseiId);
				toukou.setUpday(time);
				toukou.setSound(audio);
				toukou.setThumbnail(samune);
				
				// アレイリストに追加
				toukouList.add(toukou);
			}
			ses.setAttribute("TOUKOULIST", toukouList);
			
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

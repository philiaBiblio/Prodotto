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
 * Servlet implementation class P2DMServlet
 */
@WebServlet("/P2DMServlet")
public class P2DMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2DMServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// ログイン情報の取得
		User u = (User)ses.getAttribute("LOGIN");
		ArrayList<DM> dmssList = (ArrayList)ses.getAttribute("DMSSLIST");
				
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		DBAcs dba2 = new DBAcs();
		
		try {
			// やり取りしてる相手の名前の取得
			String yourId = request.getParameter("yourId");
			System.out.println(yourId);
			ses.setAttribute("YOU", yourId);
			String test = request.getParameter("hensuu");
			Integer i = Integer.parseInt(test);
			ses.setAttribute("I", i);
			System.out.println(i);
			
			// データベースの既読未読の情報をアップデート
	        String updateSQL = 
	        		"UPDATE DM SET 既読未読 = '0' WHERE 受信元 = '" + u.getUserid() + "'"
	        		+ "and 送信元 = '" + yourId + "'";
	        
	        // アップデート文実行
	        dba2.UpdateExe(updateSQL);
	        
	        // dmssListの未読既読を更新
	        dmssList.get(i).setKidoku("0");
	        
			// その相手とのDM履歴を検索するsql文
			String sql = "select DMID,送信元,受信元,内容,既読未読,タイムスタンプ from DM "
					+ "join ユーザー y1 on y1.ユーザーID = DM.送信元 "
					+ "join ユーザー y2 on y2.ユーザーID = DM.受信元 "
					+ "where (送信元 = '" + u.getUserid() + "'"
					+ " and 受信元 = '" + yourId + "') or (受信元 = '" + u.getUserid() + "'"
					+ " and 送信元 = '" + yourId + "')order by タイムスタンプ";
			
			// sql文実行
			ResultSet rs = dba.selectExe(sql);
			ses.setAttribute("DMSSLIST", dmssList);
			
			// アレイリストの取得
			ArrayList<DM> dmList = new ArrayList<DM>();
			
			// 繰り返しでsqlからすべての情報を得る
			while(rs.next()) {
				String dmId = rs.getString("DMID");
				String sousin = rs.getString("送信元");
				String zyusin = rs.getString("受信元");
				String naiyou = rs.getString("内容");
				String kidoku = rs.getString("既読未読");
				String time = rs.getString("タイムスタンプ");
				
				// インスタンス生成
				DM dmYou = new DM();
				dmYou.setDmId(dmId);
				dmYou.setSousin(sousin);
				dmYou.setZyusin(zyusin);
				dmYou.setNaiyou(naiyou);
				dmYou.setKidoku(kidoku);
				dmYou.setTime(time);
				
				// アレイリストに追加
				dmList.add(dmYou);
			}
			ses.setAttribute("DMLIST", dmList);
			
			// DM画面へ戻る
			url = "P2DM.jsp";
			System.out.println(url);
			
			// 画面遷移
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

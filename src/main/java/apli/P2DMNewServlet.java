package apli;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P2DMfirstServlet
 */
@WebServlet("/P2DMNewServlet")
public class P2DMNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2DMNewServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
				
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		User u = (User)ses.getAttribute("LOGIN");
		User up = (User) ses.getAttribute("PROF");
		ArrayList<DM> dmssList = (ArrayList)ses.getAttribute("DMSSLIST");
		
		try {
			// 仮でそのユーザーをアレイリストに追加する
			String yourId = request.getParameter("ID");
			
			// インスタンス生成
			DM dm = new DM();
			dm.setYour(up.getUserid());
			dm.setYourIcon(up.getIconImage());
			dm.setYourName(up.getName());
			dm.setKidoku("0");
			
			boolean flg = false;
			// リスト内で重複しないようにチェック
			if(dmssList != null) {
				for(int x = 0; x < dmssList.size(); x++) {
					if(dmssList.get(x).getYour().equals(up.getUserid())) {
						System.out.println("重複してるので弾きたい");
						flg = true;
						// 重複してたのを消して一番前に追加
						dmssList.remove(x);
						dmssList.add(0,dm);
						break;
					}
				}
			}
			if(flg == false) {
				// アレイリストに追加
				dmssList.add(0,dm);
			}
			
			ses.setAttribute("DMSSLIST", dmssList);
			
			Integer i = 0;
			ses.setAttribute("I", i);
			
			// DMのためのサーブレットへ
			url = "P2DM.jsp";
			System.out.println(url);
			
			// 画面遷移
//			response.sendRedirect(url);
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

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
 * Servlet implementation class P2AccountDeletionServlet
 */
@WebServlet("/P2AccountDeletionServlet")
public class P2AccountDeletionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2AccountDeletionServlet実行開始");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの取得
		HttpSession ses = request.getSession();
		
		// ログイン情報の取得
		User u = (User)ses.getAttribute("LOGIN");
		
		//投稿IDリストの生成
		ArrayList<String> PList = (ArrayList<String>) ses.getAttribute("POSTLIST");
		if (PList == null) {
			PList = new ArrayList<>(); // 初回のみ新規作成
		} else {
			 PList.clear(); // 既存データをクリア
		}
		
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		
		try {
			// ユーザーの検索のsql文実行
			ResultSet rss = dba.selectExe("select * from 投稿 where ユーザーID = '" + u.getUserid() + "'");

			// 検索結果が存在する場合
			while (rss.next()) {
			// 投稿情報を変数に保存する
			String pid = rss.getString("投稿ID");
						    
			// 投稿IDリストにユーザー情報を保存する
			PList.add(pid);

			// デバッグ用に表示
			System.out.println("////////////////" + pid);
			}
			
			// ユーザーの検索のsql文実行
			ResultSet rs = dba.selectExe("select * from ユーザー where ユーザーID = '" + u.getUserid() + "'");
			
			if(rs.next()) {
				String deleteSQL;
				
				for(int x = 0; x < PList.size(); x++) {
					
					// 指定したユーザーの投稿を再生テーブルから削除
			        deleteSQL = 
			        "DELETE FROM 再生 where ユーザーID = '" + u.getUserid() + "' OR 投稿ID = '"+ PList.get(x) + "'"; 		        
			        // デリート文実行
			        dba.UpdateExe(deleteSQL);
					}
					
					for(int x = 0; x < PList.size(); x++) {
					// 指定したユーザーをいいねテーブルから削除
				    deleteSQL = 
				    "DELETE FROM いいね where ユーザーID = '" + u.getUserid() + "' OR 投稿ID = '"+ PList.get(x) + "'"; 		        
				    // デリート文実行
				    dba.UpdateExe(deleteSQL);
					}
					
					for(int x = 0; x < PList.size(); x++) {
					// 指定したユーザーをコメントテーブルから削除
					deleteSQL = 
					"DELETE FROM コメント where ユーザーID = '" + u.getUserid() + "' OR 投稿ID = '"+ PList.get(x) + "'"; 		        
					// デリート文実行
					dba.UpdateExe(deleteSQL);
					}
				
				
				// 指定したユーザーを再生テーブルから削除
		        deleteSQL = 
		        "DELETE FROM 再生 where ユーザーID = '" + u.getUserid() + "'"; 		        
		        // デリート文実行
		        dba.UpdateExe(deleteSQL);
				
				// 指定したユーザーをいいねテーブルから削除
				deleteSQL = 
				"DELETE FROM いいね where ユーザーID = '" + u.getUserid() + "'"; 		        
				// デリート文実行
				dba.UpdateExe(deleteSQL);
				
				// 指定したユーザーをコメントテーブルから削除
				deleteSQL = 
				"DELETE FROM コメント where ユーザーID = '" + u.getUserid() + "'"; 		        
				// デリート文実行
				dba.UpdateExe(deleteSQL);
				
				
				// 指定したユーザーをDMテーブルから削除
		        deleteSQL = 
		        "DELETE FROM DM where 送信元 = '" + u.getUserid() + "' OR 受信元 = '" + u.getUserid() + "'";
		        // デリート文実行
		        dba.UpdateExe(deleteSQL);
		        
		        // 指定したユーザーをフォローテーブルから削除
		        deleteSQL = 
		        "DELETE FROM フォロー where フォロー = '" + u.getUserid() + "' OR フォロワー = '" + u.getUserid() + "'"; 		        
		        // デリート文実行
		        dba.UpdateExe(deleteSQL);	        
		        
		        // 指定したユーザーを投稿テーブルから削除
		        deleteSQL = 
		        "DELETE FROM 投稿 where ユーザーID = '" + u.getUserid() + "'"; 		        
		        // デリート文実行
		        dba.UpdateExe(deleteSQL);
		        
		        // 指定したユーザーをユーザーテーブルから削除
		        deleteSQL = 
		        "DELETE FROM ユーザー where ユーザーID = '" + u.getUserid() + "'"; 		        
		        // デリート文実行
		        dba.UpdateExe(deleteSQL);
	
		        // セッションの削除
				ses.removeAttribute("LOGIN");
				System.out.println("セッション削除");
				
				// ログイン画面へ遷移
				url = "P2Login.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
			}
			
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

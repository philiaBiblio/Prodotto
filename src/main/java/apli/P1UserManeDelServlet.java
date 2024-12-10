package apli;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;

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
@WebServlet("/P1UserManeDelServlet")
public class P1UserManeDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P1UserManeDelServlet実行開始");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの取得
		HttpSession ses = request.getSession();
		
		//リストを取得
		ArrayList<User> u = (ArrayList<User>)ses.getAttribute("USERLIST");
		
		
		
		Enumeration<String> parameterNames = request.getParameterNames();
		int uIndex = -1;

		// 動的に生成されたパラメータを走査
		while (parameterNames.hasMoreElements()) {
		    String paramName = parameterNames.nextElement();
		    
		    // 動的な`USERID<i>`に一致するものを探す
		    if (paramName.startsWith("USERID")) {
		        String paramValue = request.getParameter(paramName);
		        uIndex = Integer.parseInt(paramValue);
		        break; // 目的のパラメータが見つかったら終了
		    }
		}

		// uIndexが-1のままならエラー
		if (uIndex == -1) {
		    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ユーザーIDが見つかりません");
		    return;
		}

		// uIndexを使用して処理を続行
		System.out.println("取得したインデックス: " + uIndex);
		
		
		
		
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
			ResultSet rss = dba.selectExe("select * from 投稿 where ユーザーID = '" + u.get(uIndex).getUserid() + "'");
			System.out.println("uiの値："+uIndex);
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
			ResultSet rs = dba.selectExe("select * from ユーザー where ユーザーID = '" + u.get(uIndex).getUserid() + "'");
			
			if(rs.next()) {
				String deleteSQL;
				
				for(int x = 0; x < PList.size(); x++) {
				// 指定したユーザーを再生テーブルから削除
		        deleteSQL = 
		        "DELETE FROM 再生 where ユーザーID = '" + u.get(uIndex).getUserid() + "' OR 投稿ID = '"+ PList.get(x) + "'"; 		        
		        // デリート文実行
		        dba.UpdateExe(deleteSQL);
				}
				
				for(int x = 0; x < PList.size(); x++) {
				// 指定したユーザーをいいねテーブルから削除
			    deleteSQL = 
			    "DELETE FROM いいね where ユーザーID = '" + u.get(uIndex).getUserid() + "' OR 投稿ID = '"+ PList.get(x) + "'"; 		        
			    // デリート文実行
			    dba.UpdateExe(deleteSQL);
				}
				
				for(int x = 0; x < PList.size(); x++) {
				// 指定したユーザーをコメントテーブルから削除
				deleteSQL = 
				"DELETE FROM コメント where ユーザーID = '" + u.get(uIndex).getUserid() + "' OR 投稿ID = '"+ PList.get(x) + "'"; 		        
				// デリート文実行
				dba.UpdateExe(deleteSQL);
				}
				
		        // 指定したユーザーをDMテーブルから削除
		        deleteSQL = 
		        "DELETE FROM DM where 送信元 = '" + u.get(uIndex).getUserid() + "' OR 受信元 = '" + u.get(uIndex).getUserid() + "'";
		        // デリート文実行
		        dba.UpdateExe(deleteSQL);
		        
		        // 指定したユーザーをフォローテーブルから削除
		        deleteSQL = 
		        "DELETE FROM フォロー where フォロー = '" + u.get(uIndex).getUserid() + "' OR フォロワー = '" + u.get(uIndex).getUserid() + "'"; 		        
		        // デリート文実行
		        dba.UpdateExe(deleteSQL);	        
		        
		        // 指定したユーザーを投稿テーブルから削除
		        deleteSQL = 
		        "DELETE FROM 投稿 where ユーザーID = '" + u.get(uIndex).getUserid() + "'"; 		        
		        // デリート文実行
		        dba.UpdateExe(deleteSQL);
		        
		        // 指定したユーザーをユーザーテーブルから削除
		        deleteSQL = 
		        "DELETE FROM ユーザー where ユーザーID = '" + u.get(uIndex).getUserid() + "'"; 		        
		        // デリート文実行
		        dba.UpdateExe(deleteSQL);
		        
		        //リストから削除する
		        u.remove(uIndex);
		        
		        String trueMess = "変更できました。";
				ses.setAttribute("TRUEMESS", trueMess);
		        	        
				// 画面へ遷移
				url = "P1UserManegement.jsp";
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

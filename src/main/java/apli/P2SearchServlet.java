package apli;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class P2SearchServlet
 */
@WebServlet("/P2SearchServlet")
public class P2SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("P2SearchServlet実行");

		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		// セッションの生成
		HttpSession ses = request.getSession();
		// ログイン情報の取得
		User u = (User) ses.getAttribute("LOGIN");
		// URLの生成
		String url = "";
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		DBAcs dba2 = new DBAcs();
		//ユーザーリストの生成
		// セッションからUSERLISTを取得
		ArrayList<User> UList = (ArrayList<User>) ses.getAttribute("USERLIST");
		if (UList == null) {
			UList = new ArrayList<>(); // 初回のみ新規作成
		} else {
			UList.clear(); // 既存データをクリア
		}
		
		// 動画用のlistの生成
		ArrayList<Toukou> toukouList = (ArrayList) ses.getAttribute("KENSAKUTOUKOULIST");
		ArrayList<User> userIconList = (ArrayList) ses.getAttribute("KENSAKUICONLIST");
		ArrayList<Post> postList = (ArrayList) ses.getAttribute("KENSAKUPOSTLIST");
		ArrayList<Heart> heartList = (ArrayList) ses.getAttribute("KENSAKUHEARTLIST");
		if(toukouList == null) {
			toukouList = new ArrayList<Toukou>();
			userIconList = new ArrayList<User>();
			postList = new ArrayList<Post>();
			heartList = new ArrayList<Heart>();
		}
		
		System.out.println("どっちの検索か：" + request.getParameter("url"));
		
		try {
			
			if("P2UserSearch.jsp".equals(request.getParameter("url"))) {
				
				// 検索キーワードの取得
				String username = request.getParameter("search");
				System.out.println(username);
	
				// 検索キーワードが空の場合の処理
				if (username == null || username.trim().isEmpty()) {
					System.out.println("検索キーワードが空です。");
					// USERLIST をクリア
					UList.clear();
					ses.setAttribute("USERLIST", UList);
	
					// 検索結果がない状態で画面遷移
					url = "P2UserSearch.jsp";
					RequestDispatcher rd = request.getRequestDispatcher(url);
					rd.forward(request, response);
					return; // 処理終了
				}
	
				// SELECT文ユーザー情報を取得
				ResultSet rs = dba.selectExe("SELECT * FROM ユーザー WHERE 名前 LIKE '%"+username+"%' "
						+ "OR ユーザーID LIKE '%"+username+"%'");
	
				// カーソルを１行ずらす。flgに結果を保存。
				boolean flg = rs.next();
	
				// 検索結果の数分繰り返す。
				while (flg) {
					// ユーザー情報を変数に保存する
					String uid = rs.getString("ユーザーID");
					String name = rs.getString("名前");
					String icon = rs.getString("アイコン");
	
					// ユーザーインスタンスの生成
					User uu = new User();
					uu.setUserid(uid);
					uu.setName(name);
					uu.setIconImage(icon);
	
					// ユーザーリストにユーザー情報を保存する
					UList.add(uu);
	
					// カーソルを一行ずらす
					flg = rs.next();
				}
	
				// 会員の一覧を保存
				ses.setAttribute("USERLIST", UList);
	
				// 画面遷移
				url = "P2UserSearch.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
	
				// ログアウト処理
				dba.closeDB();
			}else {
				
				// ここからタグ検索 
				// 検索キーワードの取得
				String title = request.getParameter("search");
				System.out.println("113：" + title);
				
				// 検索キーワードが空の場合の処理
				String listword = "";
				if (title == null || title.trim().isEmpty()) {
					System.out.println("検索キーワードが空です。");
					if(toukouList != null) {
						for(int i = 0; i < toukouList.size(); i++) {
							if(i >= 1) {
								System.out.println("140：" + toukouList.get(i).getToukouid());
				    			listword = listword + ",'" + toukouList.get(i).getToukouid() + "'";
				    			System.out.println("142：" + listword);
				    			}else {
				    				System.out.println("144：" + toukouList.get(i).getToukouid());
					    			listword = listword + "'" + toukouList.get(i).getToukouid() + "'";
					    			System.out.println("146：" + listword);
				    		  }	
						}
					}
					
					// 検索画面内でいいねしたときの処理
					String sql = "select 投稿.投稿ID,投稿.ユーザーID,(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = 投稿.投稿ID) AS コメント数,"
							+ "(SELECT COUNT(*) FROM いいね WHERE いいね.投稿ID = 投稿.投稿ID) AS いいね数 "
							+ "from 投稿 join ユーザー on 投稿.ユーザーID = ユーザー.ユーザーID where 投稿ID in(" + listword + ")"
							+ "order by アップロード日 desc";
					
					// sql文実行
					ResultSet rs = dba.selectExe(sql);
					
					while(rs.next()) {
						postList.clear();
						int 	comm = rs.getInt("コメント数");
						int iine = rs.getInt("いいね数");
						System.out.println("164：" + iine);
						
						Post kazu = new Post();
						kazu.setCommentCount(comm);
						kazu.setLikeCount(iine);
						
						// アレイリストに追加
						postList.add(kazu);
					}
					ses.setAttribute("KENSAKUPOSTLIST", postList);
					
					for(int i = 0; i < postList.size(); i++) {
						System.out.println("179：" + i + "：" + postList.get(i).getLikeCount());
					}
					
					// 自分がいいねしたかの判別用のsql
					String sql2 = "select * from いいね";
					// sql文実行
					ResultSet rs2 = dba2.selectExe(sql2);
					
					while(rs2.next()) {
						String toukouId = rs2.getString("投稿ID");
						String userId = rs2.getString("ユーザーID");
						
						// インスタンス生成
						Heart heart = new Heart();
						heart.setPostId(toukouId);
						heart.setUserId(userId);
						
						// アレイリストに追加
						heartList.add(heart);
					}
					ses.setAttribute("KENSAKUHEARTLIST", heartList);
					
					// ログアウト処理
					dba.closeDB();
					dba2.closeDB();
					
					// 検索結果がない状態で画面遷移
					url = "P2Search.jsp";
					RequestDispatcher rd = request.getRequestDispatcher(url);
					rd.forward(request, response);
					return; // 処理終了
				}
				
				// 既存データをクリア
				toukouList.clear();
				userIconList.clear();
				postList.clear();
				heartList.clear();
				
				ObjectMapper mapper = new ObjectMapper();
				 
			    try {
			    	TypeReference<List<Map<String, String>>> type = new TypeReference<List<Map<String, String>>>() {};
			    	List<Map<String, String>> list = mapper.readValue(title, type);
			    
			      System.out.println("129：" + list);
			      title = "";
			      if(list.size() != 0) {
			    	  for(int i = 0; i < list.size(); i++) {
			    		  if(i >= 1) {
			    			  title = title + "," + list.get(i).get("value");
			    			//  System.out.println("134：" + title);
			    		  }else {
			    			  title = title + list.get(i).get("value");
			    		  }
			    	  }
			      }
			      System.out.println("147：" + title);
			      // 複数の「,」区切りのものをばらす
			      String search;
			      String search2;
			      String search3;
			      String search4;
			      String search5;
			      
			      String sql = "";
			      
			      String word[] = title.split(",");
			      if(word.length != 0) {
			    	  System.out.println("aa" + word.length);
			    	  switch(word.length) {
			    	  case 1:
			    		  search = "'" + word[0] + "'";
			    		  System.out.println("174：" + search);
			    		  sql = "SELECT 投稿ID, 投稿.ユーザーID, イベントID, 派生ID, アップロード日, 作品, サムネイル, 投稿.タグID, "
			    		  		+ "t1.タグ名 AS タグ名1, 投稿.タグID2, t2.タグ名 AS タグ名2, タグID3, t3.タグ名 AS タグ名3, 投稿.タグID4, t4.タグ名 AS タグ名4, 投稿.タグID5, t5.タグ名 AS タグ名5,名前,アイコン,"
			    				+ "(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = 投稿.投稿ID) AS コメント数, "
			    				+ "(SELECT COUNT(*) FROM いいね WHERE いいね.投稿ID = 投稿.投稿ID) AS いいね数 "
			    		  		+ "FROM 投稿 LEFT JOIN タグ t1 ON 投稿.タグID = t1.タグID "
			    		  		+ "LEFT JOIN タグ t2 ON 投稿.タグID2 = t2.タグID "
			    		  		+ "LEFT JOIN タグ t3 ON 投稿.タグID3 = t3.タグID "
			    		  		+ "LEFT JOIN タグ t4 ON 投稿.タグID4 = t4.タグID "
			    		  		+ "LEFT JOIN タグ t5 ON 投稿.タグID5 = t5.タグID "
			    		  		+ "join ユーザー on 投稿.ユーザーID = ユーザー.ユーザーID "
			    		  		+ "WHERE" + search + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
			    		  		+ "order by アップロード日 desc";  
			    		  break;
			    	  case 2:
			    		  search = "'" + word[0] + "'";
			    		  search2 = "'" + word[1] + "'";
			    		  System.out.println("187：" + search);
			    		  System.out.println("188：" + search2);
			    		  sql = "SELECT 投稿ID, 投稿.ユーザーID, イベントID, 派生ID, アップロード日, 作品, サムネイル, 投稿.タグID, "
				    		  	+ "t1.タグ名 AS タグ名1, 投稿.タグID2, t2.タグ名 AS タグ名2, タグID3, t3.タグ名 AS タグ名3, 投稿.タグID4, t4.タグ名 AS タグ名4, 投稿.タグID5, t5.タグ名 AS タグ名5,名前,アイコン,"
				    		  	+ "(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = 投稿.投稿ID) AS コメント数, "
			    				+ "(SELECT COUNT(*) FROM いいね WHERE いいね.投稿ID = 投稿.投稿ID) AS いいね数 "
				    		  	+ "FROM 投稿 LEFT JOIN タグ t1 ON 投稿.タグID = t1.タグID "
				    		  	+ "LEFT JOIN タグ t2 ON 投稿.タグID2 = t2.タグID "
				    		  	+ "LEFT JOIN タグ t3 ON 投稿.タグID3 = t3.タグID "
				    		  	+ "LEFT JOIN タグ t4 ON 投稿.タグID4 = t4.タグID "
				    		  	+ "LEFT JOIN タグ t5 ON 投稿.タグID5 = t5.タグID "
				    		  	+ "join ユーザー on 投稿.ユーザーID = ユーザー.ユーザーID "
				    		  	+ "WHERE " + search + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "OR " + search2 + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "order by アップロード日 desc";
			    		  break;
			    	  case 3:
			    		  search = "'" + word[0] + "'";
			    		  search2 = "'" + word[1] + "'";
			    		  search3 = "'" + word[2] + "'";
			    		  System.out.println("203：" + search);
			    		  System.out.println("204：" + search2);
			    		  System.out.println("205：" + search3);
			    		  sql = "SELECT 投稿ID, 投稿.ユーザーID, イベントID, 派生ID, アップロード日, 作品, サムネイル, 投稿.タグID, "
				    		  	+ "t1.タグ名 AS タグ名1, 投稿.タグID2, t2.タグ名 AS タグ名2, タグID3, t3.タグ名 AS タグ名3, 投稿.タグID4, t4.タグ名 AS タグ名4, 投稿.タグID5, t5.タグ名 AS タグ名5,名前,アイコン,"
				    		  	+ "(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = 投稿.投稿ID) AS コメント数, "
			    				+ "(SELECT COUNT(*) FROM いいね WHERE いいね.投稿ID = 投稿.投稿ID) AS いいね数 "
				    		  	+ "FROM 投稿 LEFT JOIN タグ t1 ON 投稿.タグID = t1.タグID "
				    		  	+ "LEFT JOIN タグ t2 ON 投稿.タグID2 = t2.タグID "
				    		  	+ "LEFT JOIN タグ t3 ON 投稿.タグID3 = t3.タグID "
				    		  	+ "LEFT JOIN タグ t4 ON 投稿.タグID4 = t4.タグID "
				    		  	+ "LEFT JOIN タグ t5 ON 投稿.タグID5 = t5.タグID "
				    		  	+ "join ユーザー on 投稿.ユーザーID = ユーザー.ユーザーID "
				    		  	+ "WHERE " + search + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "OR " + search2 + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "OR " + search3 + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "order by アップロード日 desc";
			    		  break;
			    	  case 4:
			    		  search = "'" + word[0] + "'";
			    		  search2 = "'" + word[1] + "'";
			    		  search3 = "'" + word[2] + "'";
			    		  search4 = "'" + word[3] + "'";
			    		  System.out.println("222：" + search);
			    		  System.out.println("223：" + search2);
			    		  System.out.println("224：" + search3);
			    		  System.out.println("225：" + search4);
			    		  sql = "SELECT 投稿ID, 投稿.ユーザーID, イベントID, 派生ID, アップロード日, 作品, サムネイル, 投稿.タグID, "
				    		  	+ "t1.タグ名 AS タグ名1, 投稿.タグID2, t2.タグ名 AS タグ名2, タグID3, t3.タグ名 AS タグ名3, 投稿.タグID4, t4.タグ名 AS タグ名4, 投稿.タグID5, t5.タグ名 AS タグ名5,名前,アイコン,"
				    		  	+ "(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = 投稿.投稿ID) AS コメント数, "
			    				+ "(SELECT COUNT(*) FROM いいね WHERE いいね.投稿ID = 投稿.投稿ID) AS いいね数 "
				    		  	+ "FROM 投稿 LEFT JOIN タグ t1 ON 投稿.タグID = t1.タグID "
				    		 	+ "LEFT JOIN タグ t2 ON 投稿.タグID2 = t2.タグID "
				    		  	+ "LEFT JOIN タグ t3 ON 投稿.タグID3 = t3.タグID "
				    		  	+ "LEFT JOIN タグ t4 ON 投稿.タグID4 = t4.タグID "
				    		  	+ "LEFT JOIN タグ t5 ON 投稿.タグID5 = t5.タグID "
				    		  	+ "join ユーザー on 投稿.ユーザーID = ユーザー.ユーザーID "
				    		  	+ "WHERE " + search + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "OR " + search2 + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "OR " + search3 + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "OR " + search4 + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "order by アップロード日 desc";
			    		  
			    		  break;
			    	  case 5:
			    		  search = "'" + word[0] + "'";
			    		  search2 = "'" + word[1] + "'";
			    		  search3 = "'" + word[2] + "'";
			    		  search4 = "'" + word[3] + "'";
			    		  search5 = "'" + word[4] + "'";
			    		  System.out.println("245：" + search);
			    		  System.out.println("246：" + search2);
			    		  System.out.println("247：" + search3);
			    		  System.out.println("248：" + search4);
			    		  System.out.println("249：" + search5);
			    		  sql = "SELECT 投稿ID, 投稿.ユーザーID, イベントID, 派生ID, アップロード日, 作品, サムネイル, 投稿.タグID, "
				    		  	+ "t1.タグ名 AS タグ名1, 投稿.タグID2, t2.タグ名 AS タグ名2, タグID3, t3.タグ名 AS タグ名3, 投稿.タグID4, t4.タグ名 AS タグ名4, 投稿.タグID5, t5.タグ名 AS タグ名5,名前,アイコン,"
				    		  	+ "(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = 投稿.投稿ID) AS コメント数, "
			    				+ "(SELECT COUNT(*) FROM いいね WHERE いいね.投稿ID = 投稿.投稿ID) AS いいね数 "
				    		  	+ "FROM 投稿 LEFT JOIN タグ t1 ON 投稿.タグID = t1.タグID "
				    		  	+ "LEFT JOIN タグ t2 ON 投稿.タグID2 = t2.タグID "
				    		  	+ "LEFT JOIN タグ t3 ON 投稿.タグID3 = t3.タグID "
				    		  	+ "LEFT JOIN タグ t4 ON 投稿.タグID4 = t4.タグID "
				    		  	+ "LEFT JOIN タグ t5 ON 投稿.タグID5 = t5.タグID "
				    		  	+ "join ユーザー on 投稿.ユーザーID = ユーザー.ユーザーID "
				    		  	+ "WHERE " + search + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "OR " + search2 + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "OR " + search3 + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "OR " + search4 + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "OR " + search5 + " IN (t1.タグ名, t2.タグ名, t3.タグ名, t4.タグ名, t5.タグ名)"
				    		  	+ "order by アップロード日 desc";
			    	  }
			      }
			      
			      // SELECT文ユーザー情報を取得
			      ResultSet rs = dba.selectExe(sql);
			      // 検索結果の数分繰り返す。
			      while(rs.next()) {
			    	  String toukouId = rs.getString("投稿ID");
			    	  String userId = rs.getString("ユーザーID");
			    	  String eventId = rs.getString("イベントID");
			    	  String haseiId = rs.getString("派生ID");
			    	  String time = rs.getString("アップロード日");
			    	  String audio = rs.getString("作品");
			    	  String samune = rs.getString("サムネイル");
			    	  
			    	  String upName = rs.getString("名前");
			    	  String toukouIcon = rs.getString("アイコン");
						
			    	  int comm = rs.getInt("コメント数");
			    	  int iine = rs.getInt("いいね数");
			    	  //System.out.println(toukouId.substring(0,6));
						
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
					ses.setAttribute("KENSAKUTOUKOULIST", toukouList);
					ses.setAttribute("KENSAKUICONLIST", userIconList);
					ses.setAttribute("KENSAKUPOSTLIST", postList);
					
					// 最初にページに飛んだ時用のいいね処理
					// 自分がいいねしたかの判別用のsql
					String sql2 = "select * from いいね";
					// sql文実行
					ResultSet rs2 = dba2.selectExe(sql2);
					
					while(rs2.next()) {
						String toukouId = rs2.getString("投稿ID");
						String userId = rs2.getString("ユーザーID");
						
						// インスタンス生成
						Heart heart = new Heart();
						heart.setPostId(toukouId);
						heart.setUserId(userId);
						
						// アレイリストに追加
						heartList.add(heart);
					}
					ses.setAttribute("KENSAKUHEARTLIST", heartList);
					
					// 画面遷移
					url = "P2Search.jsp";
					RequestDispatcher rd = request.getRequestDispatcher(url);
					rd.forward(request, response);
		
					// ログアウト処理
					dba.closeDB();
					dba2.closeDB();
					
			    } catch (JsonProcessingException e) {
			      e.printStackTrace();
			    }
			}
		} catch (Exception e) {
			e.printStackTrace();
			// ログアウト処理
			dba.closeDB();
			dba2.closeDB();
		}
	}

}

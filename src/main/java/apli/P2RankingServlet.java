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
 * Servlet implementation class P2RankingServlet
 */
@WebServlet("/P2RankingServlet")
public class P2RankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("P2RankingServlet実行");
		
		// 文字化け防止
		request.setCharacterEncoding("UTF-8");
		
		// セッションの生成
		HttpSession ses = request.getSession();
		
		// アレイリストの準備
		ArrayList<Toukou> toukouList1 = new ArrayList<Toukou>();
		ArrayList<Toukou> toukouList2 = new ArrayList<Toukou>();
		ArrayList<Toukou> toukouList3 = new ArrayList<Toukou>();
		ArrayList<User> userIconList1 = new ArrayList<User>();
		ArrayList<User> userIconList2 = new ArrayList<User>();
		ArrayList<User> userIconList3 = new ArrayList<User>();
		ArrayList<Post> postList1 = new ArrayList<Post>();
		ArrayList<Post> postList2 = new ArrayList<Post>();
		ArrayList<Post> postList3 = new ArrayList<Post>();
		ArrayList<Heart> heartList = new ArrayList<Heart>();
		
		
		// URLの生成
		String url = "";
		
		// DBアクセス用部品の生成
		DBAcs dba = new DBAcs();
		DBAcs dba2 = new DBAcs();			
	
		
		try {	
			
////////////////  こっから再生回数順リスト  /////////////////////////////						
			
			// 投稿を再生回数順に並び替えるSQL
			String sql = "SELECT p.投稿ID, p.ユーザーID, p.イベントID, p.派生ID, p.アップロード日, p.作品, p.サムネイル, p.タグID, "
			           + "u.名前, u.アイコン, "
			           + "COALESCE(r.再生回数, 0) AS 再生回数, "
			           + "(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = p.投稿ID) AS コメント数, "
			           + "(SELECT COUNT(*) FROM いいね WHERE いいね.投稿ID = p.投稿ID) AS いいね数 "
			           + "FROM 投稿 p "
			           + "JOIN ユーザー u ON p.ユーザーID = u.ユーザーID "
			           + "LEFT JOIN ("
			           + "    SELECT 投稿ID, COUNT(*) AS 再生回数 "
			           + "    FROM 再生 "
			           + "    GROUP BY 投稿ID "
			           + ") r ON p.投稿ID = r.投稿ID "
			           + "ORDER BY 再生回数 DESC";

			// SQL文実行
			ResultSet rs = dba.selectExe(sql);

			
			while(rs.next()) {
				System.out.println("//////////再生数わいるぶんかいし///////////");
				String toukouId = rs.getString("投稿ID");
				String userId = rs.getString("ユーザーID");
				String eventId = rs.getString("イベントID");
				String haseiId = rs.getString("派生ID");
				String time = rs.getString("アップロード日");
				String audio = rs.getString("作品");
				String samune = rs.getString("サムネイル");
		        //System.out.println("サムネイル："+samune);
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
				toukouList1.add(toukou);
				userIconList1.add(up);
				postList1.add(kazu);
			}
			
			//リストをセッションに保存
			ses.setAttribute("TOUKOULIST1", toukouList1);
			ses.setAttribute("ICONLIST1", userIconList1);
			ses.setAttribute("POSTLIST1", postList1);
			
			
			
////////////////  こっからいいね数順リスト  /////////////////////////////						
			
			// 投稿をイイね数順に並び替えるSQL
			sql = "SELECT p.投稿ID, p.ユーザーID, p.イベントID, p.派生ID, p.アップロード日, p.作品, p.サムネイル, p.タグID, "
			    + "u.名前, u.アイコン, "
			    + "COALESCE(l.いいね数, 0) AS いいね数, "
			    + "(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = p.投稿ID) AS コメント数 "
			    + "FROM 投稿 p "
			    + "JOIN ユーザー u ON p.ユーザーID = u.ユーザーID "
			    + "LEFT JOIN ("
			    + "    SELECT 投稿ID, COUNT(*) AS いいね数 "
			    + "    FROM いいね "
			    + "    GROUP BY 投稿ID "
			    + ") l ON p.投稿ID = l.投稿ID "
			    + "ORDER BY いいね数 DESC";

			// SQL文実行
			ResultSet rs2 = dba.selectExe(sql);

			
			while(rs2.next()) {
				System.out.println("//////////イイね数わいるぶんかいし///////////");
				String toukouId = rs2.getString("投稿ID");
				String userId = rs2.getString("ユーザーID");
				String eventId = rs2.getString("イベントID");
				String haseiId = rs2.getString("派生ID");
				String time = rs2.getString("アップロード日");
				String audio = rs2.getString("作品");
				String samune = rs2.getString("サムネイル");
		        //System.out.println("サムネイル："+samune);
				// タグID作るときはここに記入
				String upName = rs2.getString("名前");
				String toukouIcon = rs2.getString("アイコン");
				
				int comm; 
				if (rs2.getInt("コメント数") > 0) {
				    comm = rs2.getInt("コメント数") - 1;
				} else {
				    comm = rs2.getInt("コメント数");
				}
				
				int iine = rs2.getInt("いいね数");
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
				toukouList2.add(toukou);
				userIconList2.add(up);
				postList2.add(kazu);
			}
			
			//リストをセッションに保存
			ses.setAttribute("TOUKOULIST2", toukouList2);
			ses.setAttribute("ICONLIST2", userIconList2);
			ses.setAttribute("POSTLIST2", postList2);
			
////////////////  ここからイイね、再生の総合  /////////////////////////////	
			
			// イイね、再生数順に並び替えるSQL
			sql = "SELECT p.投稿ID, p.ユーザーID, p.イベントID, p.派生ID, p.アップロード日, p.作品, p.サムネイル, p.タグID, "
			           + "u.名前, u.アイコン, "
			           + "COALESCE(l.いいね数, 0) AS いいね数, "
			           + "COALESCE(r.再生回数, 0) AS 再生回数, "
			           + "(SELECT COUNT(*) FROM コメント WHERE コメント.投稿ID = p.投稿ID) AS コメント数 "
			           + "FROM 投稿 p "
			           + "JOIN ユーザー u ON p.ユーザーID = u.ユーザーID "
			           + "LEFT JOIN ("
			           + "    SELECT 投稿ID, COUNT(*) AS いいね数 "
			           + "    FROM いいね "
			           + "    GROUP BY 投稿ID "
			           + ") l ON p.投稿ID = l.投稿ID "
			           + "LEFT JOIN ("
			           + "    SELECT 投稿ID, COUNT(*) AS 再生回数 "
			           + "    FROM 再生 "
			           + "    GROUP BY 投稿ID "
			           + ") r ON p.投稿ID = r.投稿ID "
			           + "ORDER BY 再生回数 DESC";

						// SQL文実行
						ResultSet rs3 = dba.selectExe(sql);

						
						while(rs3.next()) {
							System.out.println("//////////イイね数わいるぶんかいし///////////");
							String toukouId = rs3.getString("投稿ID");
							String userId = rs3.getString("ユーザーID");
							String eventId = rs3.getString("イベントID");
							String haseiId = rs3.getString("派生ID");
							String time = rs3.getString("アップロード日");
							String audio = rs3.getString("作品");
							String samune = rs3.getString("サムネイル");
					        //System.out.println("サムネイル："+samune);
							// タグID作るときはここに記入
							String upName = rs3.getString("名前");
							String toukouIcon = rs3.getString("アイコン");
							
							int comm; 
							if (rs3.getInt("コメント数") > 0) {
							    comm = rs3.getInt("コメント数") - 1;
							} else {
							    comm = rs3.getInt("コメント数");
							}
							
							int iine = rs3.getInt("いいね数");
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
							toukouList3.add(toukou);
							userIconList3.add(up);
							postList3.add(kazu);
						}
						
						//リストをセッションに保存
						ses.setAttribute("TOUKOULIST3", toukouList3);
						ses.setAttribute("ICONLIST3", userIconList3);
						ses.setAttribute("POSTLIST3", postList3);
			
			
			
			
			
////////////////  こっからいいねアイコン切り替えのやつ  /////////////////////////////			
			
			// 自分がいいねしたかの判別用のsql
			sql = "select * from いいね";
			// sql文実行
			ResultSet rs4 = dba.selectExe(sql);
						
			while(rs4.next()) {				
				String toukouId = rs4.getString("投稿ID");
				String userId = rs4.getString("ユーザーID");
							
				// インスタンス生成
				Heart heart = new Heart();
				heart.setPostId(toukouId);
				heart.setUserId(userId);
							
				// アレイリストに追加
				heartList.add(heart);
			}
			ses.setAttribute("HEARTLIST", heartList);
						
			
			// ランキング画面へ
			url = "P2Ranking.jsp";
			System.out.println(url);
						
			// 画面遷移
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
						
			// ログアウト処理
			dba.closeDB();
			dba2.closeDB();
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// ログアウト処理
			dba.closeDB();
			dba.closeDB();		}
		
	}

}

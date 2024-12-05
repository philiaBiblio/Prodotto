<%@page import="apli.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="images/png" rel="icon" href="images/icons8-youtube.png" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
      integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=settings"
    />
    <link rel="stylesheet" href="P2ProfileMine.css" />
    <title>ProDotto</title>
  </head>
  
 <%
 //一旦コピペ
 HttpSession ses = request.getSession();

 User u = (User)ses.getAttribute("LOGIN");
 
 int followCount = (int)ses.getAttribute("followCount");
 int followerCount = (int)ses.getAttribute("followerCount");

 ArrayList<Post> postList = (ArrayList<Post>) request.getAttribute("postList");
%>

  <body>
    <header class="profile-header">
        
      <div class="leftheader">
        <img
          src="image/<%= up.getIconImage()%>"
          alt="Profile Icon"
          class="profile-header-icon"
        />

        <div class="user-details">
            <h2 class="username"><%= up.getName() %></h2>
            <p class="user-id">@<%= up.getUserid() %></p>
            <div class="follower-info">
              <span class="follower-count">フォロワー: <%= followCount%></span>
              <span class="following-count">フォロー中: <%= followerCount%></span>
            </div>
        </div>

      </div>
      <!-- 通知画面に飛ぶのでサーブレットありますが一旦無視 -->
      <div class="rightheader">
        <div class="button-group2">
          <a href="P2Notifications.jsp">
            <button class="notification-button toggle-notification" id="notificationButton">
              <i class="fas fa-bell  changeb"></i>
            </button>
          </a>
          
		<!-- プロフ編集画面に飛ぶのでサーブレットたてな -->
		<a href="P2ProfileEdit.jsp" class="edit-profile-button">
			<i class="fas fa-pen changeb"></i>
		</a>
		</div>
	</div>
       

    </header>
    
    

  <!-- 1行目のタイトルと左右ボタン -->
    <div class="section-header">
        <h3 class="section-title">セッション</h3>
        <button class="show-all-button">すべて表示</button>
      </div>
      <div class="scroll-container">
        <button class="scroll-left" id="scroll-left-1">◀</button>
        <div class="video-grid" id="video-grid-1">
	        
	    <!-- セッションのビデオカード生成 -->
		<% for (int i = 0; i <postList.size() ; i++) { %>
			
			<!-- 投稿IDの頭六桁が000000じゃなかったら。-->
		<% String postId = postList.get(i).getPostId();%>
			<%if (!postId.startsWith("000000")){ %>
	          <div class="video-card">
	            <div class="thumbnail-placeholder">
	              <img
	                src="<%= postList.get(i).getThumbnailPath() %>"
	                alt="Video Thumbnail"
	                class="thumbnail"
	              />
	              <button class="play-button">▶️</button>
	              <!-- 音声再生ボタン -->
	              <audio class="audio-player" src="<%= postList.get(i).getAudioPath()%>"></audio>
	            </div>
	  
	            <div class="video-info">
	              <a href="P1AdminProfile.jsp" class="profile-info">
	                <img
	                  src="<%= up.getIconImage()%>"
	                  alt="profile icon"
	                  class="profile-icon"
	                />
	              </a>
	              
	              
	              
	              <div class="like-comment">
					<form action="P2CommentJusinServlet" method="post">
						<input type="hidden" name="toukouId" value="<%= postList.get(i).getPostId() %>" />
						<button type="submit" class="comment" onclick="openPopup()">
							<img
							src="image/こめんと1.png"
							alt="comment icon"
							style="width: 20px; height: 20px"
							>
							<span><%= postList.get(i).getCommentCount() %></span>
						</button>
					</form>

	                <button class="heart"
							onclick="changeImage('heartImage<%=postList.get(i)%>')">
							<img id="heartImage<%=postList.get(i)%>"
								src="image/Heart-512x512 test.png" alt="like icon"
								style="width: 20px; height: 20px" /> 
								<span><%=postList.get(i).getLikeCount()%></span>
						</button>
	                
	                
	                <!-- チャットGPTからそのまま拝借 -->
	                <!-- 合っているかわからん -->
					<%
					// タイムスタンプからイベントIDを生成
					java.util.Calendar cal = java.util.Calendar.getInstance();
					int year = cal.get(java.util.Calendar.YEAR);      // 現在の西暦年
					int month = cal.get(java.util.Calendar.MONTH) + 1; // 現在の月 (0ベースなので+1)
					String eventId = String.format("%04d%02d", year, month); // 西暦4桁+月2桁のイベントID
					
					// 投稿IDの頭六桁とイベントIDを比較
					String postIdPrefix = postId.substring(0, 6); // 投稿IDの頭六桁
					%>

					<form action="P2SessionRecPostServlet" method="post">
					    <% if (postIdPrefix.equals(eventId)) { %> <!-- 投稿IDの頭六桁とイベントIDが一致 -->
					        <input type="hidden" name="postId" value="<%= postList.get(i).getPostId() %>" />
					        <button type="submit">
					            <span>
					                <div class="nav_icon">
					                    <i class="gg-duplicate"></i>
					                </div>
					            </span>
					        </button>
					    <% } %>
					</form>


	                <!-- css崩れた時用で残しとく -->
	                <!-- <button type="submit" >
		                <span>
		                  <a href="P2Recording.jsp">
		                    <div class="nav_icon">
		                      <i class="gg-duplicate"></i>
		                    </div>
		                  </a>
		                </span>
		              </button> -->
		              
					<!--  自分の投稿なら表示-->
					<!--  今回はマイプロフィール画面なので表示しておきます。-->
	                <% if (up.getUserid()==u.getUserid()) { %>
	                
	                <button id="openDialog<%= postList.get(i).getPostId()%>" onclick="test('trash<%= up.getUserid() %>')">
	                  <span>
	                    <div class="nav_icon trash">
	                      <i class="gg-trash"></i>
	                    </div>
	                  </span>
	                </button>
	  
	  				<!-- 削除サーブレットへ。元のページに戻りダイアログ表示 -->
	                <dialog id="myDialog<%= postList.get(i).getPostId()%>">
	                  <p>この投稿を削除しますか？</p>
	                  <div class="buttonContainer">
	                    <button type="button" class="dialogButton" id="yesButton<%= postList.get(i).getPostId()%>">
	                      はい
	                    </button>
	                    <button type="button" class="dialogButton" id="noButton<%= postList.get(i).getPostId()%>">
	                      いいえ
	                    </button>
	                  </div>
	                </dialog>
	  
	                <dialog id="confirmationDialog<%= postList.get(i).getPostId()%>">
	                  <p>削除しました</p>
	                  <button
	                    type="button"
	                    class="dialogButton"
	                    id="closeConfirmationButton<%= postList.get(i).getPostId()%>">
	                    閉じる
	                  </button>
	                </dialog>
	                <%}%>
	                
	              </div>
	            </div>
	          </div>
			<%}} %>
        </div>
        <button class="scroll-right" id="scroll-right-1">▶</button>
      </div>


      <!-- 2行目のタイトルと左右ボタン -->
      <div class="section-header">
        <h3 class="section-title">自由投稿</h3>
        <button class="show-all-button">すべて表示</button>
      </div>
      <div class="scroll-container">
        <button class="scroll-left" id="scroll-left-2">◀</button>
        <div class="video-grid" id="video-grid-1">
        <!-- セッションのビデオカード生成 -->
		<% for (int i = 0; i <postList.size() ; i++) { %>
			<!-- 投稿IDの頭六桁が000000だったら。-->
		<%	String postId2 = postList.get(i).getPostId(); %>
			<%if (postId2.startsWith("000000")){ %>
	          <div class="video-card">
	            <div class="thumbnail-placeholder">
	              <img
	                src="<%= postList.get(i).getThumbnailPath() %>"
	                alt="Video Thumbnail"
	                class="thumbnail"
	              />
	              <button class="play-button">▶️</button>
	              <!-- 音声再生ボタン -->
	              <audio class="audio-player" src="<%= postList.get(i).getAudioPath()%>"></audio>
	            </div>
	  
	            <div class="video-info">
	              <a href="P1AdminProfile.jsp" class="profile-info">
	                <img
	                  src="<%= up.getIconImage()%>"
	                  alt="profile icon"
	                  class="profile-icon"
	                />
	              </a>
	              <div class="like-comment">
	              <!-- コメントボタン -->
	                <form action="P2CommentJusinServlet" method="post">
						<input type="hidden" name="toukouId" value="<%= postList.get(i).getPostId() %>" />
						<button type="submit" class="comment" onclick="openPopup()">
							<img
							src="image/こめんと1.png"
							alt="comment icon"
							style="width: 20px; height: 20px"
							>
							<span><%= postList.get(i).getCommentCount() %></span>
						</button>
					</form>
	  				<!-- いいねボタン -->
	                <button class="heart"
							onclick="changeImage('heartImageS<%=postList.get(i)%>')">
							<img id="heartImageS<%=postList.get(i)%>"
								src="image/Heart-512x512 test.png" alt="like icon"
								style="width: 20px; height: 20px" /> <span><%=postList.get(i).getLikeCount()%></span>
						</button>
	                
		              
					<!--  自分の投稿なら表示-->
					<!--  今回はマイプロフィール画面なので表示しておきます。-->
	                <% if (up.getUserid()==u.getUserid()) { %>
	                
	                <button id="openDialog<%= postList.get(i).getPostId()%>" onclick="test('trash<%= up.getUserid() %>')">
	                  <span>
	                    <div class="nav_icon trash">
	                      <i class="gg-trash"></i>
	                    </div>
	                  </span>
	                </button>
	  
	                <dialog id="myDialog<%= postList.get(i).getPostId()%>">
	                  <p>この投稿を削除しますか？</p>
	                  <div class="buttonContainer">
	                    <button type="button" class="dialogButton" id="yesButton<%= postList.get(i).getPostId()%>">
	                      はい
	                    </button>
	                    <button type="button" class="dialogButton" id="noButton<%= postList.get(i).getPostId()%>">
	                      いいえ
	                    </button>
	                  </div>
	                </dialog>
	  
	                <dialog id="confirmationDialog<%= postList.get(i).getPostId()%>">
	                  <p>削除しました</p>
	                  <button
	                    type="button"
	                    class="dialogButton"
	                    id="closeConfirmationButton<%= postList.get(i).getPostId()%>">
	                    閉じる
	                  </button>
	                </dialog>
	                <%}%>
	               
	              </div>
	            </div>
	          </div>
			<%}} %>
        </div>
        <button class="scroll-right" id="scroll-right-2">▶</button>
      </div>

      




      <main>
      <!-- 音楽プレイヤー -->
      <div class="music-player" style="display: none">
        <!-- 初期表示を非表示に -->
        <div class="song-bar">
          <div class="song-infos">
            <div class="image-container">
              <!-- ここうまく切り替わらん場合はセッション入れればいいにょ -->
              <img src="." alt="" />
            </div>
            <div class="song-description">
              <!-- このタイトルはいらないから一旦コメントアウト -->
              <!-- 
              <p class="title">
                Watashitachi wa Sou Yatte Ikite Iku Jinshu na no
              </p> 
              -->
              <p class="artist"><%= up.getName()%></p>
            </div>
          </div>
          <div class="icons">
            <i class="far fa-heart"></i>
            <i class="fas fa-compress"></i>
          </div>
        </div>
        <div class="progress-controller">
          <div class="control-buttons">
            <i class="fas fa-random"></i>
            <i class="fas fa-step-backward"></i>
            <i class="play-pause fas fa-play"></i>
            <i class="fas fa-step-forward"></i>
            <i class="fas fa-undo-alt"></i>
          </div>
          <div class="progress-container">
            <span class="current-time">0:00</span>
            <!-- 現在の再生時間 -->
            <div class="progress-bar">
              <div class="progress"></div>
            </div>
            <span class="duration">3:15</span>
            <!-- 全体の音楽の時間 -->
          </div>
        </div>
        <div class="other-features">
          <i class="fas fa-list-ul"></i>
          <i class="fas fa-desktop"></i>

          <!-- 音量コントロール -->
          <div class="volume-bar">
            <i class="fas fa-volume-down"></i>
            <div class="progress-bar">
              <div class="progress"></div>
            </div>
          </div>
        </div>
      </div>
    </main>
    
  <jsp:include page="P2kensaku.jsp"></jsp:include>


    <script src="audioPlayer.js"></script>
    <script>
      const scrollLeftButton1 = document.getElementById("scroll-left-1");
      const scrollRightButton1 = document.getElementById("scroll-right-1");
      const videoGrid1 = document.getElementById("video-grid-1");

      scrollLeftButton1.addEventListener("click", () => {
        videoGrid1.scrollBy({
          left: -150, // スクロールする距離（左）
          behavior: "smooth", // スムーズスクロール
        });
      });

      scrollRightButton1.addEventListener("click", () => {
        videoGrid1.scrollBy({
          left: 150, // スクロールする距離（右）
          behavior: "smooth", // スムーズスクロール
        });
      });

      // 2行目のボタンのイベントハンドラー
      const scrollLeftButton2 = document.getElementById("scroll-left-2");
      const scrollRightButton2 = document.getElementById("scroll-right-2");
      const videoGrid2 = document.getElementById("video-grid-2");

      scrollLeftButton2.addEventListener("click", () => {
        videoGrid2.scrollBy({
          left: -150, // スクロールする距離（左）
          behavior: "smooth", // スムーズスクロール
        });
      });

      scrollRightButton2.addEventListener("click", () => {
        videoGrid2.scrollBy({
          left: 150, // スクロールする距離（右）
          behavior: "smooth", // スムーズスクロール
        });
      });

    </script>
    <script src="https://unpkg.com/wavesurfer.js"></script>
  </body>
</html>

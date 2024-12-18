<%@page import="apli.Heart"%>
<%@page import="apli.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="apli.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="images/png" rel="icon" href="images/icons8-youtube.png" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
	integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=settings" />
<link rel="stylesheet" href="P2ProfileStranger.css" />
<title>プロフィール画面</title>
</head>


<%
HttpSession ses = request.getSession();

User u = (User) ses.getAttribute("LOGIN");
User up = (User) ses.getAttribute("PROF");
String userID = (String) ses.getAttribute("USERID");
boolean isFollowing = (boolean) ses.getAttribute("isFollowing");
int followCount = (int) ses.getAttribute("followCount");
int followerCount = (int) ses.getAttribute("followerCount");
System.out.println("followCount：" + followCount);
System.out.println("followerCount：" + followerCount);

ArrayList<Post> postList = (ArrayList<Post>) ses.getAttribute("postList");
ArrayList<Heart> heartList = (ArrayList) ses.getAttribute("HEARTLIST");
%>


<%
// タイムスタンプからイベントIDを生成
java.util.Calendar cal = java.util.Calendar.getInstance();
int year = cal.get(java.util.Calendar.YEAR); // 現在の西暦年
int month = cal.get(java.util.Calendar.MONTH) + 1; // 現在の月 (0ベースなので+1)
String noweventId = String.format("%04d%02d", year, month); // 西暦4桁+月2桁のイベントID
%>

<script>
	//コメント表示用
	function openPopup(toukouId) {
  		window.open(
    	"P2CommentJusinServlet?toukouId=" + toukouId,
    	"popupWindow",
    	"width=500,height=300,scrollbars=yes"
  		);
	}
</script>

<body>
	<header class="profile-header">

		<div class="leftheader">
			<img src="image/<%=up.getIconImage()%>" alt="Profile Icon"
				class="profile-header-icon" />

			<div class="user-details">
				<h2 class="username"><%=up.getName()%></h2>
				<p class="user-id">
					@<%=up.getUserid()%></p>
				<div class="follower-info">
					<span class="follower-count">フォロワー: <%=followCount%></span> <span
						class="following-count">フォロー中: <%=followerCount%></span>
				</div>
			</div>

		</div>

		<!-- フォロー中/フォローボタン切り替えに変更 -->
		<!-- isFollowingがtrueならフォローしているのでフォロー済みボタン -->
		<!-- isFollowingがfolseならフォローしていないのでフォローボタン表示 -->
		<div class="rightheader">
			<div class="button-group2">
				<form action="P2followServlet" method="post">
					<button type="submit"
						class="notification-button toggle-notification"
						id="notificationButton">
						<%-- <input type="hidden" name="userID2" value="<%=up.getUserid()%>" /> --%>
						<i class="fas changeb"> <span class="dli-user-plus"> <span
								class="user"></span>
						</span>
						</i>
					</button>
					<p class="follow">
						<%
						if (isFollowing == true) {
						%>
						フォロー中
						<%
						} else {
						%>
						フォローする
						<% } %>
					</p>
				</form>

				<a href="P2DMNewServlet?ID=<%=up.getUserid()%>"
					class="edit-profile-button"> <i class="fas fa-envelope changeb"></i>
				</a>
				<!--
            	css崩れた時ように元の用意 
            	<a href="P2DM.html" class="edit-profile-button">
            		<i class="fas fa-envelope changeb"></i>
          		</a> 
          		-->
			</div>
		</div>
	</header>

	<!-- 1行目のタイトルと左右ボタン -->
	<div class="section-header">
		<h3 class="section-title">セッション</h3>
		<!-- 	<button class="show-all-button">すべて表示</button> -->
	</div>
	<div class="scroll-container">
		<button class="scroll-left" id="scroll-left-1">◀</button>
		<div class="video-grid" id="video-grid-1">

			<section class="video-grid" id="video-grid-1">
				<%
				if (postList != null) {
					for (int i = 0; i < postList.size(); i++) {
						boolean flgin = false;

						String postId = postList.get(i).getPostId();
						if (!postId.startsWith("000000")) {
				%>
				<div class="video-card">
					<div class="thumbnail-placeholder">
						<img src="image/<%=postList.get(i).getThumbnailPath()%>"
							alt="Video Thumbnail" class="thumbnail" />
						<button class="play-button"
							onclick="sendData('<%=up.getUserid()%>', 
					'<%=postList.get(i).getPostId()%>', 
					'<%=u.getUserid()%>')">▶️</button>
						<!-- 音声再生ボタン -->
						<audio class="audio-player"
							src="audio/<%=postList.get(i).getAudioPath()%>"></audio>
					</div>

					<div class="video-info">
						<form action="P2UserSearchServlet" method="get">
							<input type="hidden" name="userID" value="<%=up.getUserid()%>" />
							<button type="submit" class="profile-info"
								style="all: unset; cursor: pointer;">
								<a> <img src="image/<%=up.getIconImage()%>"
									alt="profile icon" class="profile-icon" />
								</a>
							</button>
						</form>

						<div class="like-comment">
							<!-- <form action="P2CommentJusinServlet"> -->
							<input type="hidden" name="toukouId" value="<%=i%>" />
							<button class="submit comment"
								onclick="openPopup('<%=postList.get(i).getPostId()%>')">
								<img src="image/こめんと1.png" alt="comment icon"
									style="width: 20px; height: 20px" /> <span><%=postList.get(i).getCommentCount()%></span>
							</button>
							<!-- </form> -->

							<a
								href="P2heartServlet?hensuu=<%=i%>&heartId=<%=postList.get(i).getPostId()%>&page=stranger">
								<button class="heart"
									onclick="changeImage('heartImage<%=postList.get(i)%>')">
									<img id="heartImage<%=postList.get(i)%>"
										<%for (int j = 0; j < heartList.size(); j++) {
											//	System.out.println("for文開始" + i);
											if (flgin == false) {
												//	System.out.println(postList.get(i).getPostId()+":"+heartList.get(j).getPostId());
												if (postList.get(i).getPostId().equals(heartList.get(j).getPostId())) {
													// System.out.println(u.getUserid()+":"+heartList.get(j).getUserId());	
													if (u.getUserid().equals(heartList.get(j).getUserId())) {
														//	System.out.println("152");
														flgin = true;
													} else {
														//	System.out.println("158");					
													}
												} else {
													//	System.out.println("162");
												}
												//	System.out.println("for文終わり" + i);
											}
										}
										if (flgin == true) {%>
										src="image/Heart-512x512 test2.png" <%} else {%>
										src="image/Heart-512x512 test.png" <%}%> alt="like icon"
										style="width: 20px; height: 20px" /> <span><%=postList.get(i).getLikeCount()%></span>
								</button>
							</a>

							<%
							String postIdPrefix = postId.substring(0, 6);
							//	System.out.print("postIdPrefix："+postIdPrefix);
							//	System.out.print("postIdPrefix："+postIdPrefix);
							//	System.out.print("noweventId："+noweventId);
							%>

							<!-- 今のイベントIDとこの投稿のイベントIDが同じなら表示 -->
							<%
							if (postIdPrefix.equals(noweventId)) {
							%>


							<%-- 
							<form action="P2SessionRecPostServlet" method="post">
								<input type="hidden" name="postId"
									value="<%=postList.get(i).getPostId()%>" />
								<button type="submit">
									<span>
										<div class="nav_icon">
											<i class="gg-duplicate"></i>
										</div>
									</span>
								</button>
							</form> 
							
							 --%>


							<button type="session-btn">
								<span> <a
									href="P2SessionParticipation?audioFile=<%=postList.get(i).getAudioPath()%>&ID=<%=postList.get(i).getPostId()%>&hitoride=2">
										<div class="nav_icon">
											<i class="gg-duplicate"></i>
										</div>
								</a>
								</span>
							</button>
							<% } %>
						</div>
					</div>
				</div>
				<% } %>
				<% } %>
				<% } %>
			</section>
		</div>
		<button class="scroll-right" id="scroll-right-1">▶</button>
	</div>

	<!-- 2行目のタイトルと左右ボタン -->
	<div class="section-header">
		<h3 class="section-title">自由投稿</h3>
		<!-- <button class="show-all-button">すべて表示</button> -->
	</div>
	<div class="scroll-container">
		<button class="scroll-left" id="scroll-left-2">◀</button>
		<div class="video-grid" id="video-grid-2">
			<!-- セッションのビデオカード生成 -->
			<%
			for (int i = 0; i < postList.size(); i++) {
			%>
			<!-- 投稿IDの頭六桁が000000だったら。-->
			<%
			String postId2 = postList.get(i).getPostId();
			boolean flg = false;
			if (postId2.startsWith("000000")) {
			%>
			<div class="video-card">
				<div class="thumbnail-placeholder">
					<img src="image/<%=postList.get(i).getThumbnailPath()%>"
						alt="Video Thumbnail" class="thumbnail" />
					<button class="play-button"
						onclick="sendData('<%=up.getUserid()%>', 
					'<%=postList.get(i).getPostId()%>', 
					'<%=u.getUserid()%>')">▶️</button>
					<!-- 音声再生ボタン -->
					<audio class="audio-player"
						src="<%=postList.get(i).getAudioPath()%>"></audio>
				</div>

				<div class="video-info">
					<form action="P2UserSearchServlet" method="get">
						<input type="hidden" name="userID" value="<%=up.getUserid()%>" />

						<button type="submit" class="profile-info"
							style="all: unset; cursor: pointer;">
							<a> <img src="image/<%=up.getIconImage()%>"
								alt="profile icon" class="profile-icon" />
							</a>
						</button>
					</form>

					<div class="like-comment">
						<!-- コメントボタン -->
						<!-- <form action="P2CommentJusinServlet"> -->
						<input type="hidden" name="toukouId" value="<%=i%>" />
						<button class="submit comment"
							onclick="openPopup('<%=postList.get(i).getPostId()%>')">
							<img src="image/こめんと1.png" alt="comment icon"
								style="width: 20px; height: 20px" /> <span><%=postList.get(i).getCommentCount()%></span>
						</button>
						<!-- </form> -->

						<!-- いいねボタン -->
						<a
							href="P2heartServlet?hensuu=<%=i%>&heartId=<%=postList.get(i).getPostId()%>&page=stranger">
							<button class="heart"
								onclick="changeImage('heartImage<%=postList.get(i)%>')">
								<img id="heartImage<%=postList.get(i)%>"
									<%for (int j = 0; j < heartList.size(); j++) {
										//		System.out.println("for文開始" + i);
										if (flg == false) {
											//	System.out.println(postList.get(i).getPostId()+":"+heartList.get(j).getPostId());
											if (postList.get(i).getPostId().equals(heartList.get(j).getPostId())) {
												// System.out.println(u.getUserid()+":"+heartList.get(j).getUserId());	
												if (u.getUserid().equals(heartList.get(j).getUserId())) {
													flg = true;
													// System.out.println("152" + flg);
												} else {
													// System.out.println("158");					
												}
											} else {
												// System.out.println("162");
											}
											// System.out.println("for文終わり" + i);
										}
									}
									//	System.out.println("324" + flg);
									
									if (flg == true) {
										//	System.out.println("trueの処理" + flg);%>
									src="image/Heart-512x512 test2.png"
									<%} else {
									//	System.out.println("elseの処理" + flg);%>
									src="image/Heart-512x512 test.png" <%}%> alt="like icon"
									style="width: 20px; height: 20px" /> <span><%=postList.get(i).getLikeCount()%></span>
							</button>
						</a>

					</div>
				</div>
			</div>
			<% } %>
			<% } %>
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
						<img src="." alt="" />
					</div>
					<div class="song-description">
						<p class="artist" id="artistName"></p>
					</div>
				</div>
			</div>
			<div class="progress-controller">
				<div class="control-buttons">
					<i class="fas fa-random"></i> <i class="fas fa-step-backward"></i>
					<i class="play-pause fas fa-play"></i> <i
						class="fas fa-step-forward"></i> <i class="fas fa-undo-alt"></i>
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
			<!-- 非表示ボタンを追加 -->
        	<button class="hide-player-button">×</button>
			<div class="other-features">
				<i class="fas fa-list-ul"></i> <i class="fas fa-desktop"></i>
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

	<script>
      const scrollLeftButton1 = document.getElementById("scroll-left-1");
      const scrollRightButton1 = document.getElementById("scroll-right-1");
      const videoGrid1 = document.getElementById("video-grid-1");

      scrollLeftButton1.addEventListener("click", () => {
        videoGrid1.scrollBy({
          left: -350, // スクロールする距離（左）
          behavior: "smooth", // スムーズスクロール
        });
      });

      scrollRightButton1.addEventListener("click", () => {
        videoGrid1.scrollBy({
          left: 350, // スクロールする距離（右）
          behavior: "smooth", // スムーズスクロール
        });
      });

      // 2行目のボタンのイベントハンドラー
      const scrollLeftButton2 = document.getElementById("scroll-left-2");
      const scrollRightButton2 = document.getElementById("scroll-right-2");
      const videoGrid2 = document.getElementById("video-grid-2");

      scrollLeftButton2.addEventListener("click", () => {
        videoGrid2.scrollBy({
          left: -350, // スクロールする距離（左）
          behavior: "smooth", // スムーズスクロール
        });
      });

      scrollRightButton2.addEventListener("click", () => {
        videoGrid2.scrollBy({
          left: 350, // スクロールする距離（右）
          behavior: "smooth", // スムーズスクロール
        });
      });


//////////////再生回数カウント//////////////////	

function sendData(toukouUserid, toukouId, userId) {
// データを準備
const data = {
toukouUserid: toukouUserid,
toukouId: toukouId,
userId: userId
};

// AJAXリクエストを送信
fetch('P2SaiseiCountServlet', {
method: 'POST',
headers: {
    'Content-Type': 'application/json'
},
body: JSON.stringify(data) // データをJSONに変換
})
.then(response => response.json()) // サーバーからのレスポンスをJSONとして処理
.then(result => {
console.log('Success:', result); // 結果をコンソールに表示
})
.catch(error => {
console.error('Error:', error); // エラーをコンソールに表示
});
}


    </script>
	<script src="https://unpkg.com/wavesurfer.js"></script>
</body>
</html>

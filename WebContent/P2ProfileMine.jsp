<%@page import="apli.Heart"%>
<%@page import="apli.Post"%>
<%@page import="apli.Toukou"%>
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
<link rel="stylesheet" href="P2ProfileMine.css" />
<title>プロフィール画面</title>
</head>

<%
//一旦コピペ
HttpSession ses = request.getSession();

User u = (User) ses.getAttribute("LOGIN");
ArrayList<Toukou> toukouList = (ArrayList) ses.getAttribute("TOUKOULIST");
ArrayList<User> userIconList = (ArrayList) ses.getAttribute("ICONLIST");
ArrayList<Toukou> upList = (ArrayList) ses.getAttribute("UPLIST");
ArrayList<Post> postList = (ArrayList) ses.getAttribute("POSTLIST");
ArrayList<Heart> heartList = (ArrayList) ses.getAttribute("HEARTLIST");

int followCount = (int) ses.getAttribute("followCount");
int followerCount = (int) ses.getAttribute("followerCount");
String DELET = (String) ses.getAttribute("DDDDELET");
%>


<%
// タイムスタンプからイベントIDを生成
java.util.Calendar cal = java.util.Calendar.getInstance();
int year = cal.get(java.util.Calendar.YEAR); // 現在の西暦年
int month = cal.get(java.util.Calendar.MONTH) + 1; // 現在の月 (0ベースなので+1)
String noweventId = String.format("%04d%02d", year, month); // 西暦4桁+月2桁のイベントID
%>


<script>
//ダイアログのスクリプト
function dialog(id){
	console.log("id:" + id);
	const openDialogButton = document.getElementById('openDialogButton');
	const yesButton = document.getElementById('yesButton' + id);
	const noButton = document.getElementById('noButton' + id);
	const myDialog = document.getElementById('myDialog' + id);
	const confirmationDialog = document.getElementById('confirmationDialog');
	const closeConfirmationButton = document.getElementById('closeConfirmationButton');
	myDialog.showModal();
	console.log("no" + noButton)
	  if (noButton) {
          noButton.addEventListener('click', () => {
              if (myDialog) {
                  console.log("80")
                  myDialog.close();
              }
          });
      }
}
document.addEventListener('DOMContentLoaded', (event) => {
    function dialog(id) {
        const openDialogButton = document.getElementById('openDialogButton');
        const yesButton = document.getElementById('yesButton' + id);
        const noButton = document.getElementById('noButton' + id);
        console.log("no" + noButton)
        const myDialog = document.getElementById('myDialog' + id);
        const confirmationDialog = document.getElementById('confirmationDialog');
        const closeConfirmationButton = document.getElementById('closeConfirmationButton');
    }

    // dialog関数を呼び出す
    dialog();
});

<%if (DELET != null) {%>
	window.onload = function(){
	const dialog = document.querySelector("#confirmationDialog");
	dialog.showModal();
	} 	
<%}%>
<%ses.removeAttribute("DDDDELET");%>

// コメント表示用
function openPopup(toukouId) {
  window.open(
    "P2CommentJusinServlet?toukouId=" + toukouId,
    "popupWindow",
    "width=500,height=300,scrollbars=yes"
  );
}

//いいねのスクロールバー
var scrollPosition; 
var STORAGE_KEY = "scrollY";

function saveScrollPosition(){
	scrollPosition = window.pageYOffset; 
	localStorage.setItem(STORAGE_KEY, scrollPosition);
	}

window.addEventListener("load", function(){
	scrollPosition = localStorage.getItem(STORAGE_KEY);
	if(scrollPosition !== null){
		scrollTo(0, scrollPosition);
		}
	window.addEventListener("scroll", saveScrollPosition, false);
	});
</script>


<body>
	<header class="profile-header">

		<div class="leftheader">
			<img src="image/<%=u.getIconImage()%>" alt="Profile Icon"
				class="profile-header-icon" />

			<div class="user-details">
				<h2 class="username"><%=u.getName()%></h2>
				<p class="user-id">
					@<%=u.getUserid()%></p>
				<div class="follower-info">
					<span class="follower-count">フォロワー: <%=followCount%></span> <span
						class="following-count">フォロー中: <%=followerCount%></span>
				</div>
			</div>

		</div>

		<!-- 通知画面に飛ぶのでサーブレットありますが一旦無視 -->
		<div class="rightheader">
			<div class="button-group2">
			<form action="P2NotificationsServlet">
					<button type="submit"
					class="notification-button toggle-notification"
						id="notificationButton">
						<i class="fas fa-bell  changeb"></i></button>
			</form>
				<a href="P2ProfileEdit.jsp" class="edit-profile-button"> <i
					class="fas fa-pen changeb"></i>
				</a>
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
		
			<%
			if (upList != null) {
				for (int i = 0; i < upList.size(); i++) {
					boolean flgin = false;

					String postId = upList.get(i).getToukouid();
					System.out.println("postId:" + postId);
					if (!postId.startsWith("000000")) {
						System.out.println("IF.postId:" + postId);
			%>

			<%boolean flg = false; %>
			<div class="video-card">
				<div class="thumbnail-placeholder">

					<img src="image/<%=upList.get(i).getThumbnail()%>"
						alt="Video Thumbnail" class="thumbnail"/>
						
					<button class="play-button" 
					onclick="saiseiName('<%= i%>');sendData('<%= upList.get(i).getUserid() %>', 
					'<%= upList.get(i).getToukouid() %>', 
					'<%= u.getUserid() %>')">
					▶️</button>
					
					<input type="hidden" value="<%=userIconList.get(i).getName() %>" id="<%=i%>">
					
					<!-- 音声再生ボタン -->
					<audio class="audio-player"
						src="audio/<%=upList.get(i).getSound()%>"></audio>
				</div>

				<div class="video-info">
				
						<form action="P2ProfileServlet" method="get">
    					<input type="hidden" name="userID" value="" />
    					<button type="submit" class="profile-info" style="all: unset; cursor: pointer;">
	    					<a>
	    						<img src="image/<%=u.getIconImage()%>" alt="profile icon" class="profile-icon" />
	    					</a>
        				</button>
					</form> 

					<div class="like-comment">
						<!-- <form action="P2CommentJusinServlet"> -->
							<input type="hidden" name="toukouId" value="<%=i%>" />
							<button class="submit comment" onclick="openPopup('<%=upList.get(i).getToukouid()%>')">
								<img src="image/こめんと1.png" alt="comment icon"
									style="width: 20px; height: 20px" /> <span><%=postList.get(i).getCommentCount()%></span>
							</button>
						<!-- </form> -->

						<a href="P2heartServlet?hensuu=<%=i%>&heartId=<%= upList.get(i).getToukouid() %>&page=mine">
						<button class="heart" onclick="changeImage('heartImage<%=upList.get(i)%>')">
							<img id="heartImage<%=upList.get(i)%>"
							
							<%for(int j = 0; j < heartList.size(); j++){
							//	System.out.println("for文開始" + i);
								if(flg == false){
							//		System.out.println(toukouList.get(i).getToukouid()+":"+heartList.get(j).getPostId());
									if(upList.get(i).getToukouid().equals(heartList.get(j).getPostId())){
							//			System.out.println(u.getUserid()+":"+heartList.get(j).getUserId());	
										if(u.getUserid().equals(heartList.get(j).getUserId())){
							//				System.out.println("152");
											flg = true;
										}else{
							//				System.out.println("158");					
										}
									}else{
							//			System.out.println("162");
									}
							//	System.out.println("for文終わり" + i);
								} 
							}
							
							if(flg == true){ %>
							src="image/Heart-512x512 test2.png"
							<%}else{ %>
							src="image/Heart-512x512 test.png"
							<%} %>
							alt="like icon" style="width: 20px; height: 20px" /> 
							<span><%=postList.get(i).getLikeCount()%></span>
						</button></a>

						<%
						String postIdPrefix = postId.substring(0, 6);
						%>
							
						<%if(postIdPrefix.equals(noweventId)) {%>
						<button class = session-btn>
							<span> <a href="P2SessionParticipation?audioFile=<%= upList.get(i).getSound() %>">
									<div class="nav_icon">
										<i class="gg-duplicate"></i>
									</div>
							</a>
							</span>
						</button>
						<%}%>

						
						<script>
							console.log("i:" + "<%= i %>");
    						console.log("upList.get(i).getUserid()：" + "<%= upList.get(i).getUserid() %>");
    						console.log("u.getUserid()：" + "<%= u.getUserid() %>");
						</script>
						
						<button type="button" class="trashbutton" id="openDialogButton<%=upList.get(i).getToukouid() %>"
						 onclick="dialog('<%=i%>')">
							<span>
								<div class="nav_icon trash">
									<i class="gg-trash"></i>
								</div>
							</span>
						</button> 
						 <dialog id="myDialog<%= i %>">
            				<p>この投稿を削除しますか？</p>
            			<div class="buttonContainer">
            			<a href="P2PostDeliteServlet?hensuu=<%=i%>&sakuzyoId=<%= upList.get(i).getToukouid() %>&page=mine">
                			<button type="button" class="dialogButton" id="yesButton<%= i%>">はい</button></a>
                			<button type="button" class="dialogButton" id="noButton<%= i %>">いいえ</button>
            			</div>
        				</dialog>
					</div>
				</div>
			</div>
			<% } %>
			<% } %>
			<% } %>
		</div>
		<button class="scroll-right" id="scroll-right-1">▶</button>
	</div>


	<!-- 2行目のタイトルと左右ボタン -->
	<div class="section-header">
		<h3 class="section-title">自由投稿</h3>
		<!-- 	<button class="show-all-button">すべて表示</button> -->
	</div>
	<div class="scroll-container">
		<button class="scroll-left" id="scroll-left-2">◀</button>
		<div class="video-grid" id="video-grid-2">
			<% if (upList != null) {
					for (int i = 0; i < upList.size(); i++) {
					boolean flgin = false;

					String postId = upList.get(i).getToukouid();
					System.out.println("postId:" + postId);
					if (postId.startsWith("000000")) {
					System.out.println("IF.postId:" + postId);
			%>

			<div class="video-card">
				<div class="thumbnail-placeholder">
					<img src="image/<%=upList.get(i).getThumbnail()%>"
						alt="Video Thumbnail" class="thumbnail" />
					<button class="play-button">▶️</button>
					<!-- 音声再生ボタン -->
					<audio class="audio-player"
						src="audio/<%=upList.get(i).getSound()%>">
					</audio>
				</div>

				<div class="video-info">

					<!-- アイコン -->
					<form action="P2ProfileServlet" method="get">
						<input type="hidden" name="userID" value="" />
						<button type="submit" class="profile-info"
							style="all: unset; cursor: pointer;">
							<a> <img src="image/<%=u.getIconImage()%>" alt="profile icon"
								class="profile-icon" />
							</a>
						</button>
					</form>

					<div class="like-comment">
						<!-- <form action="P2CommentJusinServlet"> -->
							<input type="hidden" name="toukouId" value="<%=i%>" />
							<button class="submit comment" onclick="openPopup('<%=upList.get(i).getToukouid()%>')">
								<img src="image/こめんと1.png" alt="comment icon"
									style="width: 20px; height: 20px" /> 
									<span><%=postList.get(i).getCommentCount()%></span>
							</button>
						<!-- </form> -->

						<a
							href="P2heartServlet?hensuu=<%=i%>&heartId=<%=upList.get(i).getToukouid()%>&page=mine">
							<button class="heart"
								onclick="changeImage('heartImage<%=postList.get(i)%>')">
								<img id="heartImage<%=postList.get(i)%>"
									<%for (int j = 0; j < heartList.size(); j++) {
										//	System.out.println("for文開始" + i);
											if (flgin == false) {
										//		System.out.println(upList.get(i).getToukouid() + ":" + heartList.get(j).getPostId());
												if (upList.get(i).getToukouid().equals(heartList.get(j).getPostId())) {
										//			System.out.println(u.getUserid() + ":" + heartList.get(j).getUserId());
													if (u.getUserid().equals(heartList.get(j).getUserId())) {
										//				System.out.println("152");
														flgin = true;
													} else {
										//				System.out.println("158");
													}
												} else {
										//			System.out.println("162");
												}
										//		System.out.println("for文終わり" + i);
											}
										}
										
										if (flgin == true) {%>
											src="image/Heart-512x512 test2.png" 
										<%} else {%>
											src="image/Heart-512x512 test.png" 
										<%}%> 
											alt="like icon"
											style="width: 20px; height: 20px" /> 
											<span><%=postList.get(i).getLikeCount()%></span>
							</button>
						</a>



						<%
						String mpostId = upList.get(i).getToukouid();
						String postIdPrefix = mpostId.substring(0, 6);
						System.out.println("postIdPrefix：" + postIdPrefix + "i:" + i);
						System.out.println("noweventId：" + noweventId);
						%>

						<%
						if (postIdPrefix.equals(noweventId)) {
						%>
						<button>
							<span> <a
								href="P2SessionParticipation?audioFile=<%=upList.get(i).getSound()%>">
									<div class="nav_icon">
										<i class="gg-duplicate"></i>
									</div>
							</a>
							</span>
						</button>
						<%
						}
						%>

						<!-- 削除ボタン -->
						<!-- <form action="P2PostDeliteServlet" method="post"> -->
						<%-- <input type="hidden" name="toukouId" value="<%=i%>" /> --%>
						<button type="button"
							id="openDialogButton<%=upList.get(i).getToukouid()%>"
							onclick="dialog('<%=i%>')"
							class="trashButton"
							>
							<span>
								<div class="nav_icon trash">
									<i class="gg-trash"></i>
								</div>
							</span>
						</button>
						<dialog id="myDialog<%=i%>">
							<p>この投稿を削除しますか？</p>
							<div class="buttonContainer">
								<a href="P2PostDeliteServlet?hensuu=<%=i%>&sakuzyoId=<%=upList.get(i).getToukouid()%>&page=mine">
									<button type="button" class="dialogButton" id="yesButton<%=i%>">はい</button>
								</a>
								<button type="button" class="dialogButton" id="noButton<%=i%>">いいえ</button>
							</div>
						</dialog>
					</div>
				</div>
			</div>
			<% } %>
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
						<p class="artist" id="artistName"><%=u.getName() %></p>
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


    













	/* 	
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
 */
    </script>
	<script src="https://unpkg.com/wavesurfer.js"></script>
	
	<dialog id="confirmationDialog" class="confirmationDialog">
		<p>削除しました</p>
		<button type="button" class="dialogButton" id="closeConfirmationButton" onclick="confirmationDialog.close();">閉じる</button>
	</dialog>
	
</body>
</html>
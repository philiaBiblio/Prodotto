<%@page import="apli.AdminUser"%>
<%@page import="apli.Heart"%>
<%@page
	import="org.eclipse.jdt.internal.compiler.env.IUpdatableModule.UpdateKind"%>
<%@page import="apli.Post"%>
<%@page import="apli.Toukou"%>
<%@page import="apli.DM"%>
<%@page import="java.util.ArrayList"%>
<%@page import="apli.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
	integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=settings" />
<link rel="stylesheet" href="P1TLManagement.css" />

<title>ProDotto</title>
</head>


<%
	// セッションの取得
	HttpSession ses = request.getSession();
	// ログイン情報の取得
	AdminUser au = (AdminUser)ses.getAttribute("ADMINLOGIN");
	// 音声情報の取得
	ArrayList<Toukou> toukouList = (ArrayList) ses.getAttribute("TOUKOULIST");
	ArrayList<User> userIconList = (ArrayList) ses.getAttribute("ICONLIST");
	ArrayList<Post> postList = (ArrayList) ses.getAttribute("POSTLIST");
	ArrayList<Heart> heartList = (ArrayList) ses.getAttribute("HEARTLIST");
	String DELEAT = (String)ses.getAttribute("DELEAT");
%>


<jsp:include page="P1kensaku.jsp"></jsp:include>

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

<%if(DELEAT != null ){ %>
window.onload = function(){
	const dialog = document.querySelector("#confirmationDialog");
	dialog.showModal();
	} 	
	<%} %>
	<%ses.removeAttribute("DELEAT"); %>

	// コメント表示用
	function openPopup(toukouId) {
	  window.open(
	    "P1CommentJusinServlet?toukouId=" + toukouId,
	    "popupWindow",
	    "width=500,height=300,scrollbars=yes"
	  );
	}

	// 再生バーの名前
	function saiseiName(id){
		const kazu = document.getElementById('' + id);
		console.log("46" + kazu.value);
		const artist = document.getElementById('artistName');
		artist.innerText = kazu.value;
		}
	
</script>

<body>
	<%
		// タイムスタンプからイベントIDを生成
		java.util.Calendar cal = java.util.Calendar.getInstance();
		int year = cal.get(java.util.Calendar.YEAR); // 現在の西暦年
		int month = cal.get(java.util.Calendar.MONTH) + 1; // 現在の月 (0ベースなので+1)
		String noweventId = String.format("%04d%02d", year, month); // 西暦4桁+月2桁のイベントID
	%>

	<!-- 追加するコード -->
	<main>
		<!-- グリッドコンテナ -->
		<section class="video-grid">
			
			<%if (toukouList != null) {%>
			<%for (int i = 0; i < toukouList.size(); i++) {%>
			<%boolean flg = false; %>
			<div class="video-card">
				<div class="thumbnail-placeholder">

					<img src="image/<%=toukouList.get(i).getThumbnail()%>"
						alt="Video Thumbnail" class="thumbnail"/>
						
					<button class="play-button" 
					onclick="saiseiName('<%= i%>');">
					▶️</button>
					
					<input type="hidden" value="<%=userIconList.get(i).getName() %>" id="<%=i%>">
					
					<!-- 音声再生ボタン -->
					<audio class="audio-player"
						src="audio/<%=toukouList.get(i).getSound()%>"></audio>
				</div>

				<div class="video-info">
					<!-- 他人プロフィール画面へ -->
					<form action="P1UserSearchServlet" method="get">
    				<input type="hidden" name="userID" value="<%=toukouList.get(i).getUserid()%>"/>
    					<button type="submit" class="profile-info" style="all: unset; cursor: pointer;">
	    					<a>
	    						<img src="image/<%=userIconList.get(i).getIconImage()%>" alt="profile icon" class="profile-icon" />
	    					</a>
        				</button>
					</form>

					<div class="like-comment">
						<!-- <form action="P2CommentJusinServlet"> -->
							<input type="hidden" name="toukouId" value="<%=i%>" />
							<button class="submit comment" onclick="openPopup('<%=toukouList.get(i).getToukouid()%>')">
								<img src="image/こめんと1.png" alt="comment icon"
									style="width: 20px; height: 20px" /> <span><%=postList.get(i).getCommentCount()%></span>
							</button>
						<!-- </form> -->


						<%
						String postId = toukouList.get(i).getToukouid();
						String postIdPrefix = postId.substring(0, 6);
						//System.out.println("postIdPrefix："+postIdPrefix+"i:"+i);
						//System.out.println("noweventId："+noweventId);
						
						%>
						
						
						<!-- 削除ボタン --> 
						<script>
							console.log("i:" + "<%= i %>");
    						console.log("toukouList.get(i).getUserid()：" + "<%= toukouList.get(i).getUserid() %>");
						</script>
						<!-- <form action="P2PostDeliteServlet" method="post"> -->
						<%-- <input type="hidden" name="toukouId" value="<%=i%>" /> --%>
						<button type="button" id="openDialogButton<%=toukouList.get(i).getToukouid() %>"
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
            			<a href="P1PostDeliteServlet?hensuu=<%=i%>&sakuzyoId=<%= toukouList.get(i).getToukouid() %>&page=TL">
                			<button type="button" class="dialogButton" id="yesButton<%= i%>">はい</button></a>
                			<button type="button" class="dialogButton" id="noButton<%= i %>">いいえ</button>
            			</div>
        				</dialog>

					</div>
				</div>
			</div>
			<%}%>
			<%}%>
		</section>

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
	
	<script src="https://unpkg.com/wavesurfer.js"></script>
	
	<dialog id="confirmationDialog" class="confirmationDialog">
		<p>削除しました</p>
		<button type="button" class="dialogButton" id="closeConfirmationButton" onclick="confirmationDialog.close();">閉じる</button>
	</dialog>
</body>
</html>
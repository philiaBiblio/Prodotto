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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
	integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=settings" />
<link rel="stylesheet" href="P2Timeline.css" />
<title>派生一覧画面</title>
</head>


<%
	// セッションの取得
	HttpSession ses = request.getSession();
	// ログイン情報の取得
	User u = (User) ses.getAttribute("LOGIN");
	// 音声情報の取得
	ArrayList<Toukou> dtoukouList = (ArrayList) ses.getAttribute("DTOUKOULIST");
	ArrayList<User> duserIconList = (ArrayList) ses.getAttribute("DICONLIST");
	ArrayList<Post> dpostList = (ArrayList) ses.getAttribute("DPOSTLIST");
	ArrayList<Heart> dheartList = (ArrayList) ses.getAttribute("DHEARTLIST");
	String DELET = (String)ses.getAttribute("DDDDELET");
%>

<jsp:include page="P2kensaku.jsp"></jsp:include>
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

<%if(DELET != null ){ %>
window.onload = function(){
	const dialog = document.querySelector("#confirmationDialog");
	dialog.showModal();
	} 	
	<%} %>
	<%ses.removeAttribute("DDDDELET"); %>

	// コメント表示用
	function openPopup(toukouId) {
	  window.open(
	    "P2CommentJusinServlet?toukouId=" + toukouId,
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
			
			<%if (dtoukouList != null) {%>
			<%for (int i = 0; i < dtoukouList.size(); i++) {%>
			<%boolean flg = false; %>
			<div class="video-card">
				<div class="thumbnail-placeholder">

					<img src="image/<%=dtoukouList.get(i).getThumbnail()%>"
						alt="Video Thumbnail" class="thumbnail"/>
						
					<button class="play-button" 
					onclick="saiseiName('<%= i%>');sendData('<%= dtoukouList.get(i).getUserid() %>', 
					'<%= dtoukouList.get(i).getToukouid() %>', 
					'<%= u.getUserid() %>')">
					▶️</button>
					
					<input type="hidden" value="<%= duserIconList.get(i).getName() %>" id="<%=i%>">
					
					<!-- 音声再生ボタン -->
					<audio class="audio-player"
						src="audio/<%=dtoukouList.get(i).getSound()%>"></audio>
				</div>

				<div class="video-info">
					<!-- 他人なら他人プロフ。自分ならマイページへ -->
					<%if (!dtoukouList.get(i).getUserid().equals(u.getUserid())) {%>
					<form action="P2UserSearchServlet" method="get">
    				<input type="hidden" name="userID" value="<%=dtoukouList.get(i).getUserid()%>"/>
    					<button type="submit" class="profile-info" style="all: unset; cursor: pointer;">
	    					<a>
	    						<img src="image/<%=duserIconList.get(i).getIconImage()%>" alt="profile icon" class="profile-icon" />
	    					</a>
        				</button>
					</form>
					<%}else{%>
						<form action="P2ProfileServlet" method="get">
    					<input type="hidden" name="userID" value="" />
    					<button type="submit" class="profile-info" style="all: unset; cursor: pointer;">
	    					<a>
	    						<img src="image/<%=u.getIconImage()%>" alt="profile icon" class="profile-icon" />
	    					</a>
        				</button>
					</form>
					<%} %> 

					<div class="like-comment">
						<!-- <form action="P2CommentJusinServlet"> -->
							<input type="hidden" name="toukouId" value="<%=i%>" />
							<button class="submit comment" onclick="openPopup('<%=dtoukouList.get(i).getToukouid()%>')">
								<img src="image/こめんと1.png" alt="comment icon"
									style="width: 20px; height: 20px" /> <span><%=dpostList.get(i).getCommentCount()%></span>
							</button>
						<!-- </form> -->

						<a href="P2heartServlet?hensuu=<%=i%>&heartId=<%= dtoukouList.get(i).getToukouid() %>&page=Deri">
						<button class="heart" onclick="changeImage('heartImage<%=dpostList.get(i)%>')">
							<img id="heartImage<%=dpostList.get(i)%>"
							
							<%for(int j = 0; j < dheartList.size(); j++){
							//	System.out.println("for文開始" + i);
								if(flg == false){
							//		System.out.println(toukouList.get(i).getToukouid()+":"+heartList.get(j).getPostId());
									if(dtoukouList.get(i).getToukouid().equals(dheartList.get(j).getPostId())){
							//			System.out.println(u.getUserid()+":"+heartList.get(j).getUserId());	
										if(u.getUserid().equals(dheartList.get(j).getUserId())){
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
							<span><%=dpostList.get(i).getLikeCount()%></span>
						</button></a>

						<%
						String postId = dtoukouList.get(i).getToukouid();
						String postIdPrefix = postId.substring(0, 6);
						//System.out.println("postIdPrefix："+postIdPrefix+"i:"+i);
						//System.out.println("noweventId："+noweventId);
						
						%>
						
						
						
						<!-- セッションボタンイフ -->				
						<%if(postIdPrefix.equals(noweventId)) {%>
						<button class = session-btn>
							<span> <a href="P2SessionParticipation?audioFile=<%= dtoukouList.get(i).getSound() %>&ID=<%=dtoukouList.get(i).getToukouid()%>&hitoride=2">

									<div class="nav_icon">
										<i class="gg-duplicate"></i>
									</div>
							</a>
							</span>
						</button>
						<%}%>

						<!-- 削除ボタンイフ --> 
						<%if (dtoukouList.get(i).getUserid().equals(u.getUserid())) {%>
						<script>
							console.log("i:" + "<%= i %>");
    						console.log("dtoukouList.get(i).getUserid()：" + "<%= dtoukouList.get(i).getUserid() %>");
    						console.log("u.getUserid()：" + "<%= u.getUserid() %>");
						</script>
						<!-- <form action="P2PostDeliteServlet" method="post"> -->
						<%-- <input type="hidden" name="toukouId" value="<%=i%>" /> --%>
						<button type="button" id="openDialogButton<%=dtoukouList.get(i).getToukouid() %>"
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
            			<a href="P2PostDeliteServlet?hensuu=<%=i%>&sakuzyoId=<%= dtoukouList.get(i).getToukouid() %>&page=deri">
                			<button type="button" class="dialogButton" id="yesButton<%= i%>">はい</button></a>
                			<button type="button" class="dialogButton" id="noButton<%= i %>">いいえ</button>
            			</div>
        				</dialog>

						<%}%>
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
	
	
<script>
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
        console.log('Error:', error); // エラーをコンソールに表示
    });
}
</script>		
	
	
	
	<script src="https://unpkg.com/wavesurfer.js"></script>
	
	<dialog id="confirmationDialog" class="confirmationDialog">
		<p>削除しました</p>
		<button type="button" class="dialogButton" id="closeConfirmationButton" onclick="confirmationDialog.close();">閉じる</button>
	</dialog>
</body>
</html>
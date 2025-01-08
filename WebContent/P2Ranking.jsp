<%@page import="apli.Heart"%>
<%@page import="org.eclipse.jdt.internal.compiler.env.IUpdatableModule.UpdateKind"%>
<%@page import="apli.Post"%>
<%@page import="apli.Toukou"%>
<%@page import="apli.DM"%>
<%@page import="java.util.ArrayList"%>
<%@page import="apli.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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
<link rel="stylesheet" href="P2Ranking.css" />

<title>ランキング画面</title>
</head>

<%
	// セッションの取得
	HttpSession ses = request.getSession();
	// ログイン情報の取得
	User u = (User) ses.getAttribute("LOGIN");
	// 音声情報の取得
	ArrayList<Toukou> toukouList1 = (ArrayList) ses.getAttribute("TOUKOULIST1");
	ArrayList<Toukou> toukouList2 = (ArrayList) ses.getAttribute("TOUKOULIST2");
	ArrayList<Toukou> toukouList3 = (ArrayList) ses.getAttribute("TOUKOULIST3");
	ArrayList<User> userIconList1 = (ArrayList) ses.getAttribute("ICONLIST1");
	ArrayList<User> userIconList2 = (ArrayList) ses.getAttribute("ICONLIST2");
	ArrayList<User> userIconList3 = (ArrayList) ses.getAttribute("ICONLIST3");
	ArrayList<Post> postList1 = (ArrayList) ses.getAttribute("POSTLIST1");
	ArrayList<Post> postList2 = (ArrayList) ses.getAttribute("POSTLIST2");
	ArrayList<Post> postList3 = (ArrayList) ses.getAttribute("POSTLIST3");
	ArrayList<Heart> heartList = (ArrayList) ses.getAttribute("HEARTLIST");
	String DELET = (String)ses.getAttribute("DDDDELET");
%>

<jsp:include page="P2kensaku.jsp"></jsp:include>
<script src="https://unpkg.com/wavesurfer.js"></script>

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
		console.log("45：" + id);
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
  
  
       <!-- ************************１***************************** -->
      <div class="section-header">
        <h3 class="section-title">総合ランキング</h3>
        
      </div>
      <div class="scroll-container">
        <button class="scroll-left" id="scroll-left-3">◀</button>
        <div class="video-grid" id="video-grid-3">

          <!-- 動画カードがここに配置される -->
          <%if (toukouList3 != null) {%>
			<%for (int i = 0; i < postList3.size(); i++) {%>
			<%boolean flg = false; %>
			<div class="video-card">
				<div class="thumbnail-placeholder">
				
					<img src="image/<%=toukouList3.get(i).getThumbnail()%>"
						alt="Video Thumbnail" class="thumbnail" />
						
					<button class="play-button" 
					onclick="saiseiName('1<%= i%>');sendData('<%= toukouList3.get(i).getUserid() %>', 
					'<%= toukouList3.get(i).getToukouid() %>', 
					'<%= u.getUserid() %>')">
					▶️</button>
					
					<input type="hidden" value="<%=userIconList3.get(i).getName() %>" id="1<%=i%>">
					
					<!-- 音声再生ボタン -->
					<audio class="audio-player"
						src="audio/<%=toukouList3.get(i).getSound()%>"></audio>
				</div>


				<div class="video-info">
					<!-- 他人なら他人プロフ。自分ならマイページへ -->
					<%if (!toukouList3.get(i).getUserid().equals(u.getUserid())) {%>
					<form action="P2UserSearchServlet" method="get">
    				<input type="hidden" name="userID" value="<%=toukouList3.get(i).getUserid()%>" />
    				
    					<button type="submit" class="profile-info" style="all: unset; cursor: pointer;">
	    					<a>
	    						<img src="image/<%=userIconList3.get(i).getIconImage()%>" alt="profile icon" class="profile-icon" />
	    					</a>
        				</button>
					</form>
					<%}else{%>
						<form action="P2ProfileServlet" method="get">
    					<input type="hidden" name="userID" value="" />
    					<button type="submit" class="profile-info" style="all: unset; cursor: pointer;">
	    					<a>
	    						<img src="image/<%=userIconList3.get(i).getIconImage()%>" alt="profile icon" class="profile-icon" />
	    					</a>
        				</button>
					</form>
					<%} %> 

					<div class="like-comment">
						<!-- <form action="P2CommentJusinServlet"> -->
							<input type="hidden" name="toukouId" value="<%=i%>" />
							<button class="submit comment" onclick="openPopup('<%=toukouList3.get(i).getToukouid()%>')">
								<img src="image/こめんと1.png" alt="comment icon"
									style="width: 20px; height: 20px" /> <span><%=postList3.get(i).getCommentCount()%></span>
							</button>
						<!-- </form> -->

						<a href="P2heartServlet?hensuu=<%=i%>&heartId=<%= toukouList3.get(i).getToukouid() %>&page=Ranking">
						<button class="heart" onclick="changeImage('heartImage<%=postList1.get(i)%>')">
							<img id="heartImage<%=postList3.get(i)%>"
							
							<%for(int j = 0; j < heartList.size(); j++){
							//	System.out.println("for文開始" + i);
								if(flg == false){
							//		System.out.println(toukouList.get(i).getToukouid()+":"+heartList.get(j).getPostId());
									if(toukouList3.get(i).getToukouid().equals(heartList.get(j).getPostId())){
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
							<span><%=postList3.get(i).getLikeCount()%></span>
						</button></a>

						<%
						String postId = toukouList1.get(i).getToukouid();
						String postIdPrefix = postId.substring(0, 6);
						//System.out.println("postIdPrefix："+postIdPrefix+"i:"+i);
						//System.out.println("noweventId："+noweventId);
						
						%>

						<%if(postIdPrefix.equals(noweventId)) {%>
						<button class = session-btn>
							<span> <a href="P2SessionParticipation?audioFile=<%= toukouList3.get(i).getSound() %>">
									<div class="nav_icon">
										<i class="gg-duplicate"></i>
									</div>
							</a>
							</span>
						</button>
						<%}%>

						<!-- 削除ボタンイフ --> 
						<%if (toukouList3.get(i).getUserid().equals(u.getUserid())) {%>
						<script>
							console.log("i:" + "<%= i %>");
    						console.log("toukouList.get(i).getUserid()：" + "<%= toukouList1.get(i).getUserid() %>");
    						console.log("u.getUserid()：" + "<%= u.getUserid() %>");
						</script>
						<!-- <form action="P2PostDeliteServlet" method="post"> -->
						<%-- <input type="hidden" name="toukouId" value="<%=i%>" /> --%>
						<button type="button" id="openDialogButton<%=toukouList3.get(i).getToukouid() %>"
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
            			<a href="P2PostDeliteServlet?hensuu=<%=i%>&sakuzyoId=<%= toukouList3.get(i).getToukouid() %>">
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
          
          
          
        </div>
        <button class="scroll-right" id="scroll-right-3">▶</button>
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
  
  
  
    <!-- ***********************２***************************** -->
    <div class="section-header">
        <h3 class="section-title">再生数ランキング</h3>
        
      </div>
      <div class="scroll-container">
        <button class="scroll-left" id="scroll-left-1">◀</button>
        <div class="video-grid" id="video-grid-1">


          <!-- 動画カードがここに配置される -->
          <%if (toukouList1 != null) {%>
			<%for (int i = 0; i < postList1.size(); i++) {%>
			<%boolean flg = false; %>
			<div class="video-card">
				<div class="thumbnail-placeholder">

					<img src="image/<%=toukouList1.get(i).getThumbnail()%>"
						alt="Video Thumbnail" class="thumbnail" />
						
					<button class="play-button" 
					onclick="saiseiName('2<%= i%>');sendData('<%= toukouList1.get(i).getUserid() %>', 
					'<%= toukouList1.get(i).getToukouid() %>', 
					'<%= u.getUserid() %>')">
					▶️</button>
					
					<input type="hidden" value="<%=userIconList1.get(i).getName() %>" id="2<%=i%>">
					
					<!-- 音声再生ボタン -->
					<audio class="audio-player"
						src="audio/<%=toukouList1.get(i).getSound()%>"></audio>
				</div>


				<div class="video-info">
					<!-- 他人なら他人プロフ。自分ならマイページへ -->
					<%if (!toukouList1.get(i).getUserid().equals(u.getUserid())) {%>
					<form action="P2UserSearchServlet" method="get">
    				<input type="hidden" name="userID" value="<%=toukouList1.get(i).getUserid()%>" />
    				
    					<button type="submit" class="profile-info" style="all: unset; cursor: pointer;">
	    					<a>
	    						<img src="image/<%=userIconList1.get(i).getIconImage()%>" alt="profile icon" class="profile-icon" />
	    					</a>
        				</button>
					</form>
					<%}else{%>
						<form action="P2ProfileServlet" method="get">
    					<input type="hidden" name="userID" value="" />
    					<button type="submit" class="profile-info" style="all: unset; cursor: pointer;">
	    					<a>
	    						<img src="image/<%=userIconList1.get(i).getIconImage()%>" alt="profile icon" class="profile-icon" />
	    					</a>
        				</button>
					</form>
					<%} %> 

					<div class="like-comment">
						<!-- <form action="P2CommentJusinServlet"> -->
							<input type="hidden" name="toukouId" value="<%=i%>" />
							<button class="submit comment" onclick="openPopup('<%=toukouList1.get(i).getToukouid()%>')">
								<img src="image/こめんと1.png" alt="comment icon"
									style="width: 20px; height: 20px" /> <span><%=postList1.get(i).getCommentCount()%></span>
							</button>
						<!-- </form> -->

						<a href="P2heartServlet?hensuu=<%=i%>&heartId=<%= toukouList1.get(i).getToukouid() %>&page=Ranking">
						<button class="heart" onclick="changeImage('heartImage<%=postList1.get(i)%>')">
							<img id="heartImage<%=postList1.get(i)%>"
							
							<%for(int j = 0; j < heartList.size(); j++){
							//	System.out.println("for文開始" + i);
								if(flg == false){
							//		System.out.println(toukouList.get(i).getToukouid()+":"+heartList.get(j).getPostId());
									if(toukouList1.get(i).getToukouid().equals(heartList.get(j).getPostId())){
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
							<span><%=postList1.get(i).getLikeCount()%></span>
						</button></a>

						<%
						String postId = toukouList1.get(i).getToukouid();
						String postIdPrefix = postId.substring(0, 6);
						//System.out.println("postIdPrefix："+postIdPrefix+"i:"+i);
						//System.out.println("noweventId："+noweventId);
						
						%>

						<%if(postIdPrefix.equals(noweventId)) {%>
						<button class = session-btn>
							<span> <a href="P2SessionParticipation?audioFile=<%= toukouList1.get(i).getSound() %>">
									<div class="nav_icon">
										<i class="gg-duplicate"></i>
									</div>
							</a>
							</span>
						</button>
						<%}%>

						<!-- 削除ボタンイフ --> 
						<%if (toukouList1.get(i).getUserid().equals(u.getUserid())) {%>
						<script>
							console.log("i:" + "<%= i %>");
    						console.log("toukouList.get(i).getUserid()：" + "<%= toukouList1.get(i).getUserid() %>");
    						console.log("u.getUserid()：" + "<%= u.getUserid() %>");
						</script>
						<!-- <form action="P2PostDeliteServlet" method="post"> -->
						<%-- <input type="hidden" name="toukouId" value="<%=i%>" /> --%>
						<button type="button" id="openDialogButton<%=toukouList1.get(i).getToukouid() %>"
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
            			<a href="P2PostDeliteServlet?hensuu=<%=i%>&sakuzyoId=<%= toukouList1.get(i).getToukouid() %>">
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
          
          
        </div>
        <button class="scroll-right" id="scroll-right-1">▶</button>
      </div>
  
  
  
  
      <!-- ************************３***************************** -->
      <div class="section-header">
        <h3 class="section-title">イイね数ランキング</h3>
        
      </div>
      <div class="scroll-container">
        <button class="scroll-left" id="scroll-left-2">◀</button>
        <div class="video-grid" id="video-grid-2">
          

          <!-- 動画カードがここに配置される -->
          <%if (toukouList2 != null) {%>
			<%for (int i = 0; i < postList2.size(); i++) {%>
			<%boolean flg = false; %>
			<div class="video-card">
				<div class="thumbnail-placeholder">

					<img src="image/<%=toukouList2.get(i).getThumbnail()%>"
						alt="Video Thumbnail" class="thumbnail" />
						
					<button class="play-button" 
					onclick="saiseiName('3<%= i%>');sendData('<%= toukouList2.get(i).getUserid() %>', 
					'<%= toukouList2.get(i).getToukouid() %>', 
					'<%= u.getUserid() %>')">
					▶️</button>
					
					<input type="hidden" value="<%=userIconList2.get(i).getName() %>" id="3<%=i%>">
					
					<!-- 音声再生ボタン -->
					<audio class="audio-player"
						src="audio/<%=toukouList2.get(i).getSound()%>"></audio>
				</div>


				<div class="video-info">
					<!-- 他人なら他人プロフ。自分ならマイページへ -->
					<%if (!toukouList2.get(i).getUserid().equals(u.getUserid())) {%>
					<form action="P2UserSearchServlet" method="get">
    				<input type="hidden" name="userID" value="<%=toukouList2.get(i).getUserid()%>" />
    				
    					<button type="submit" class="profile-info" style="all: unset; cursor: pointer;">
	    					<a>
	    						<img src="image/<%=userIconList2.get(i).getIconImage()%>" alt="profile icon" class="profile-icon" />
	    					</a>
        				</button>
					</form>
					<%}else{%>
						<form action="P2ProfileServlet" method="get">
    					<input type="hidden" name="userID" value="" />
    					<button type="submit" class="profile-info" style="all: unset; cursor: pointer;">
	    					<a>
	    						<img src="image/<%=userIconList2.get(i).getIconImage()%>" alt="profile icon" class="profile-icon" />
	    					</a>
        				</button>
					</form>
					<%} %> 

					<div class="like-comment">
						<!-- <form action="P2CommentJusinServlet"> -->
							<input type="hidden" name="toukouId" value="<%=i%>" />
							<button class="submit comment" onclick="openPopup('<%=toukouList2.get(i).getToukouid()%>')">
								<img src="image/こめんと1.png" alt="comment icon"
									style="width: 20px; height: 20px" /> <span><%=postList2.get(i).getCommentCount()%></span>
							</button>
						<!-- </form> -->

						<a href="P2heartServlet?hensuu=<%=i%>&heartId=<%= toukouList2.get(i).getToukouid() %>&page=Ranking">
						<button class="heart" onclick="changeImage('heartImage<%=postList2.get(i)%>')">
							<img id="heartImage<%=postList2.get(i)%>"
							
							<%for(int j = 0; j < heartList.size(); j++){
							//	System.out.println("for文開始" + i);
								if(flg == false){
							//		System.out.println(toukouList.get(i).getToukouid()+":"+heartList.get(j).getPostId());
									if(toukouList2.get(i).getToukouid().equals(heartList.get(j).getPostId())){
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
							<span><%=postList2.get(i).getLikeCount()%></span>
						</button></a>

						<%
						String postId = toukouList2.get(i).getToukouid();
						String postIdPrefix = postId.substring(0, 6);
						//System.out.println("postIdPrefix："+postIdPrefix+"i:"+i);
						//System.out.println("noweventId："+noweventId);
						
						%>

						<%if(postIdPrefix.equals(noweventId)) {%>
						<button class = session-btn>
							<span> <a href="P2SessionParticipation?audioFile=<%= toukouList2.get(i).getSound() %>">
									<div class="nav_icon">
										<i class="gg-duplicate"></i>
									</div>
							</a>
							</span>
						</button>
						<%}%>

						<!-- 削除ボタンイフ --> 
						<%if (toukouList2.get(i).getUserid().equals(u.getUserid())) {%>
						<script>
							console.log("i:" + "<%= i %>");
    						console.log("toukouList.get(i).getUserid()：" + "<%= toukouList2.get(i).getUserid() %>");
    						console.log("u.getUserid()：" + "<%= u.getUserid() %>");
						</script>
						<!-- <form action="P2PostDeliteServlet" method="post"> -->
						<%-- <input type="hidden" name="toukouId" value="<%=i%>" /> --%>
						<button type="button" id="openDialogButton<%=toukouList2.get(i).getToukouid() %>"
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
            			<a href="P2PostDeliteServlet?hensuu=<%=i%>&sakuzyoId=<%= toukouList2.get(i).getToukouid() %>">
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
          
          
        </div>
        <button class="scroll-right" id="scroll-right-2">▶</button>
      </div>


    

     
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


      // 3行目のボタンのイベントハンドラー
	  const scrollLeftButton3 = document.getElementById("scroll-left-3");
	  const scrollRightButton3 = document.getElementById("scroll-right-3");
	  const videoGrid3 = document.getElementById("video-grid-3");

	  scrollLeftButton3.addEventListener("click", () => {
		  videoGrid3.scrollBy({
			  left: -150, // スクロールする距離（左）
			  behavior: "smooth", // スムーズスクロール
			  });
		  });

	  scrollRightButton3.addEventListener("click", () => {
		  videoGrid3.scrollBy({
			  left: 150, // スクロールする距離（右）
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
    
  </body>
</html>

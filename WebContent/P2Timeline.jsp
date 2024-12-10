<%@page import="org.eclipse.jdt.internal.compiler.env.IUpdatableModule.UpdateKind"%>
<%@page import="apli.Post"%>
<%@page import="apli.Toukou"%>
<%@page import="apli.DM"%>
<%@page import="java.util.ArrayList"%>
<%@page import="apli.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.0.0/css/all.css" 
          integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=settings" />
    <link rel="stylesheet" href="P2Timeline.css" />
    <title>ProDotto</title>
</head>

<body>
    <% 
        HttpSession ses = request.getSession();
        User u = (User) ses.getAttribute("LOGIN");
        ArrayList<Toukou> toukouList = (ArrayList<Toukou>) ses.getAttribute("TOUKOULIST");
        ArrayList<User> userIconList = (ArrayList<User>) ses.getAttribute("ICONLIST");
        ArrayList<Post> postList = (ArrayList<Post>) ses.getAttribute("POSTLIST");
    %>

    <jsp:include page="P2kensaku.jsp"></jsp:include>

    <script>
        // ダイアログのスクリプト
        function dialog(id) {
            const myDialog = document.getElementById('myDialog');
            const yesButton = document.getElementById('yesButton');
            const noButton = document.getElementById('noButton');
            const confirmationDialog = document.getElementById('confirmationDialog');
            const closeConfirmationButton = document.getElementById('closeConfirmationButton');

            myDialog.showModal();

            if (yesButton) {
                yesButton.addEventListener('click', () => {
                    myDialog.close();
                    confirmationDialog.showModal();
                });
            }

            if (noButton) {
                noButton.addEventListener('click', () => {
                    myDialog.close();
                });
            }

            if (closeConfirmationButton) {
                closeConfirmationButton.addEventListener('click', () => {
                    confirmationDialog.close();
                });
            }
        }

        document.addEventListener('DOMContentLoaded', () => {
            dialog();
        });
    </script>

    <main>
        <section class="video-grid">
            <% if (toukouList != null) { %>
                <% for (int i = 1; i < toukouList.size(); i++) { %>
                    <div class="video-card">
                        <div class="thumbnail-placeholder">
                            <img src="image/<%=toukouList.get(i).getThumbnail()%>" alt="Video Thumbnail" class="thumbnail" />
                            <button class="play-button">▶️</button>
                            <audio class="audio-player" src="audio/<%=toukouList.get(i).getSound()%>"></audio>
                        </div>

                        <div class="video-info">
                            <form action="P2ProfileServletStrangerServlet" method="get" style="margin: 0; padding: 0; display: inline;">
                                <input type="hidden" name="StrangertoukouId" value="<%=toukouList.get(i).getToukouid()%>" />
                                <button type="submit" class="profile-info" style="all: unset; cursor: pointer;">
                                    <a>
                                        <img src="image/<%=userIconList.get(i).getIconImage()%>" alt="profile icon" class="profile-icon" />
                                    </a>
                                </button>
                            </form>

                            <div class="like-comment">
                                <form action="P2CommentJusinServlet">
                                    <input type="hidden" name="toukouId" value="<%=i%>" />
                                    <button class="submit comment" onclick="openPopup()">
                                        <img src="image/こめんと1.png" alt="comment icon" style="width: 20px; height: 20px" />
                                        <span><%=postList.get(i).getCommentCount()%></span>
                                    </button>
                                </form>

                                <button class="heart" onclick="changeImage('heartImage<%=postList.get(i)%>')">
                                    <img id="heartImage<%=postList.get(i)%>" src="image/Heart-512x512 test.png" alt="like icon" style="width: 20px; height: 20px" />
                                    <span><%=postList.get(i).getLikeCount()%></span>
                                </button>

                                <% if (!toukouList.get(i).getToukouid().substring(0, 6).equals("000000")) { %>
                                    <button>
                                        <span>
                                            <a href="P2Recording.html">
                                                <div class="nav_icon">
                                                    <i class="gg-duplicate"></i>
                                                </div>
                                            </a>
                                        </span>
                                    </button>
                                <% } %>

                                <% if (toukouList.get(i).getUserid().equals(u.getUserid())) { %>
                                    <form action="P2PostDeliteServlet" method="post">
                                        <input type="hidden" name="toukouId" value="<%=i%>" />
                                        <button type="button" id="openDialogButton<%=toukouList.get(i).getToukouid() %>" onclick="dialog('trash')">
                                            <span>
                                                <div class="nav_icon trash">
                                                    <i class="gg-trash"></i>
                                                </div>
                                            </span>
                                        </button>

                                        <dialog id="myDialog">
                                            <p>この投稿を削除しますか？</p>
                                            <div class="buttonContainer">
                                                <button type="submit" class="dialogButton" id="yesButton">はい</button>
                                                <button type="button" class="dialogButton" id="noButton">いいえ</button>
                                            </div>
                                        </dialog>
                                    </form>
                                <% } %>
                            </div>
                        </div>
                    </div>
                <% } %>
            <% } %>
        </section>

        <!-- 音楽プレイヤー -->
        <div class="music-player" style="display: none;">
            <!-- 初期表示を非表示に -->
            <div class="song-bar">
				<div class="song-infos">
					<div class="image-container">
						<img src="." alt="" />
					</div>
					<div class="song-description">
						<p class="title"></p>
						<p class="artist"></p>
					</div>
				</div>
				<div class="icons">
					<i class="far fa-heart"></i> <i class="fas fa-compress"></i>
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

    <script src="audioPlayer.js"></script>
    <script src="https://unpkg.com/wavesurfer.js"></script>
</body>

</html>

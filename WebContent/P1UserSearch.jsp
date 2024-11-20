<%@page import="apli.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ユーザー検索画面</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
	integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=settings" />
<link rel="stylesheet" href="P1kensaku.css" />
<link rel="stylesheet" href="P1UserSearch.css">
</head>

<%
//セッションの取得
HttpSession ses = request.getSession();
//会員リストを取得
ArrayList<User> u = (ArrayList<User>) ses.getAttribute("USERLIST");
%>

<body>
	<form action="P1UserSearchServlet">

		<div class="user-section">
			<%
			if (u == null) {
			%>
			<p>検索キーワードを入力してください</p>
			<%
			} else if (u.isEmpty()) {
			%>
			<p>検索結果が見つかりません</p>
			<%
			} else {
			for (int i = 0; i < u.size(); i++) {
			%>
			<div class="user-item">
				<div class="soroe">
					<a href="P2ProfileStranger.jsp"> <img src="image/ききゅう.jpg"
						alt="アイコン" class="icon">
					</a>
				</div>
				<div class="user-content">
					<p class="username">
						<%=u.get(i).getName()%>
					</p>
				</div>
			</div>
			<hr>
			<%
			}
			}
			ses.removeAttribute("USERLIST");
			%>

		</div>

		<header class="header">
			<div class="header_container">
				<div class="none"></div>
				<div class="search">
					<!-- フィルターボタン -->
					<select id="filter" class="filter-button"
						onChange="location.href=value;">
						<option value="title">動画タイトル</option>
						<option value="P1UserSearch.jsp">アカウント名</option>
					</select>

					<!-- 検索バー -->
					<input type="text" name="usersearch" id="search"
						placeholder="Search" />
					<button type="submit" class="fa-solid fa-magnifying-glass"></button>
				</div>

			</div>
		</header>

		<section class="nav" id="navbar">
			<nav class="nav_container">
				<div>
					<a href="#" class="nav_link nav_logo"> <i
						class="fa-solid fa-bars nav_icon"></i> <span class="logo_name">
							<!-- ここにProDottoアイコンを入れる --> <i class="fab fa-"></i> ProDotto
					</span>
					</a>

					<div class="nav_list">
						<div class="nav_items navtop">
							<a href="P1UserManegement.jsp" class="nav_link navtop"> <!-- <i class="fa fa-house nav_icon"></i> -->
								<div class="nav_icon">
									<i class="gg-profile"></i>
								</div> <span class="nav_name">ユーザー管理</span>
							</a> <a href="P1EventManegement.jsp" class="nav_link navtop"> <!-- <i class="fa fa-house nav_icon"></i> -->
								<div class="nav_icon nav_soroe">
									<i class="gg-flag-alt"></i>
								</div> <span class="nav_name">イベント管理</span>
							</a> <a href="P1AdminSetting.jsp" class="nav_link navtop"> <!-- <i class="fa-solid fa-video nav_icon"></i> -->
								<div class="nav_icon">
									<span class="material-symbols-outlined"> settings </span>
								</div> <span class="nav_name">設定</span>
							</a> <a href="P1TLManagement.jsp" class="nav_link navtop active">
								<i class="fa fa-house nav_icon"></i> <span class="nav_name">管理者タイムライン</span>
							</a>

						</div>
					</div>
				</div>
			</nav>
		</section>

		<script src="audioPlayer.js"></script>
		<script src="https://unpkg.com/wavesurfer.js"></script>
	</form>
</body>
</html>

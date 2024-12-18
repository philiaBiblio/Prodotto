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
			<%if (u == null) {%>
			<p class="no-results">検索キーワードを入力してください</p>
			<%} else if (u.isEmpty()) {%>
			<p class="no-results">検索結果が見つかりません</p>
			<%} else {
			for (int i = 0; i < u.size(); i++) {%>
			<div class="user-item">
				<div class="soroe">
				<input type="hidden" name="userID" value="<%= u.get(i).getUserid() %>">
					<button type="submit" class="icon-button">
						<img src="image/<%= u.get(i).getIconImage()%>" alt="アイコン" class="icon">
					</button>
				</div>
				<div class="user-content">
					<p class="username">
						<%=u.get(i).getName()%>
					</p>
					<p class="user-subtext">
						<%=u.get(i).getUserid()%>
					</p>
				</div>
			</div>
			<hr>
			<%}}
			ses.removeAttribute("USERLIST");
			%>
		</div>
	</form>
	
	<jsp:include page="P1kensaku.jsp"></jsp:include>
	<script src="https://unpkg.com/wavesurfer.js"></script>
	
</body>
</html>

<%@page import="apli.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="images/png" rel="icon" href="images/icons8-youtube.png">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
	integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=settings" />
<link rel="stylesheet" href="P2kensaku.css">
<link rel="stylesheet" href="P2UserSearch.css">
<title>ProDotto</title>

</head>

<%
//セッションの取得
HttpSession ses = request.getSession();
//会員リストを取得
ArrayList<User> searchU = (ArrayList<User>) ses.getAttribute("USERLIST");
%>

<body>

	<form action = "P2UserSearchServlet">

		<div class="user-section">
			<% if (searchU == null || searchU.isEmpty()) { %>
			<p class="no-results">検索結果が見つかりません</p>
			<% } else { 
				for (int i = 0; i < searchU.size(); i++) { %>
			<div class="user-item">
				<div class="soroe">
					<input type="hidden" name="userID" value="<%= searchU.get(i).getUserid() %>">
					<button type="submit" class="icon-button">
						<img src="image/<%= searchU.get(i).getIconImage()%>" alt="アイコン" class="icon">
					</button>
				</div>
				<div class="user-content">
					<p class="username">
						<%=searchU.get(i).getName()%>
					</p>
					<p class="user-subtext">
						<%=searchU.get(i).getUserid()%>
					</p>
				</div>
			</div>
			<hr>
			<% } } %>
			


		</div>
	</form>
		<jsp:include page="P2kensaku.jsp"></jsp:include>

		<script src="https://unpkg.com/wavesurfer.js"></script>
	
</body>
</html>

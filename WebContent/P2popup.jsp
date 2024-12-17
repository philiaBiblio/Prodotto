<%@page import="apli.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="apli.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>コメント画面</title>
<link rel="stylesheet" href="P2popup.css">
</head>
<body>

	<div class="comment-section">
		<%
		//セッションの取得
		HttpSession ses = request.getSession();
		// ログイン情報の取得
		User u = (User) ses.getAttribute("LOGIN");
		//AllayListの取得
		ArrayList<Comment> cmList = (ArrayList<Comment>) ses.getAttribute("CM");
		System.out.println("ポップ:");
/* 		System.out.println("a:"+cmList.get(1).getCsender());
		System.out.println("b:"+cmList.get(1).getCcontent()) */;
	
		/* Integer cnt = (Integer)ses.getAttribute("rs1");
		System.out.println(cnt); */
		%>

		<%-- <%if(cnt!=null){ %> --%>
		<% for (int i = 0; i < cmList.size(); i++) { %>
		<div class="comment-item">
			<!-- <a href="P2UserSearchServlet"> -->
			<img src="image/<%=cmList.get(i).getCicon() %>" alt="アイコン" class="icon">
			<!-- </a> -->
			<div class="comment-content">
				<p class="username"><%=cmList.get(i).getcName()%></p>
				<p class="comment"><%=cmList.get(i).getCcontent()%></p>
			</div>
		</div>
		<% } %>
		<%-- <%} %> --%>
	</div>

	<!-- 入力ボックスをDM画面から持ってくる -->
	<form action="P2CommentSousinServlet" method="post" class="chat-form">
		<div class="chat-input">
			<input type="text" name="comment" id="comment" required
				placeholder="コメントを入力"> 
				<input type="submit" name="submit" id="submit" value="送信">
		</div>
	</form>

</body>
</html>

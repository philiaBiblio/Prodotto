<%@page import="apli.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>管理者用設定画面</title>
    <link rel="stylesheet" href="P1AdminSetting.css" />
    <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
	integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS"
	crossorigin="anonymous" />
  </head>
  
<%
	HttpSession ses = request.getSession();
	ArrayList<User> u = (ArrayList<User>)ses.getAttribute("P1USERLIST");
	if(u != null){
		u.clear();
	}
%>
  
  <body>
    <div class="container">
      <div class="header">
        <a class="back-button">設定</a>
      </div>
      <div class="menu">
        <ul>
          <li><a href="P1PaersonalInformation.jsp">プロフィール編集<div class="arrow02"></div></a></li>
          <div class="divider" ></div>
          <li><a href="P1PasswordChange.jsp">パスワード変更<div class="arrow02"></div></a></li>
          <div class="divider" ></div>
          <li><a href="P1EmailChange.jsp">メールアドレス変更<div class="arrow02"></div></a></li>
          <div class="divider" ></div>
          <li><a href="P1Logout.jsp">ログアウト<div class="arrow02"></div></a></li>
        </ul>
      </div>
    </div>
    
    <jsp:include page="P1kensaku.jsp"></jsp:include>
    
  </body>
</html>

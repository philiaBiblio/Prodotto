<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>設定画面</title>
    <link rel="stylesheet" href="P2Settings.css" />
  </head>
  <body>
    <div class="container">
      <div class="header">
        <a class="back-button">設定</a>
      </div>
      <div class="menu">
        <ul>
          <li><a href="P2ProfileEdit.jsp">プロフィール編集<div class="arrow02"></div></a></li>
          <div class="divider" ></div>
          <li><a href="P2PasswordChange.jsp">パスワード変更<div class="arrow02"></div></a></li>
          <div class="divider" ></div>
          <li><a href="P2EmailChange.jsp">メールアドレス変更<div class="arrow02"></div></a></li>
          <div class="divider" ></div>
          <li><a href="P2Logout.jsp">ログアウト<div class="arrow02"></div></a></li>
          <div class="divider" id="ab"></div>
          <li><a href="P2AccountDeletion.jsp">アカウント退会<div class="arrow02"></div></a></li>
        </ul>
      </div>
    </div>
  </body>
</html>

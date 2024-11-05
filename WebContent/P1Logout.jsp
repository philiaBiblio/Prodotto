<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ログアウト画面</title>
    <link rel="stylesheet" href="P1Logout.css" />
  </head>
  <body>
    <div class="header" onclick="history.back()">
      <div class="back-button">
        <div class="arrow01"></div>
        ログアウト
      </div>
    </div>

    <div class="container">
      <h2>ログアウトしますか</h2>

      <div class="menu">
        <ul>
          <a onclick="history.back()"><li>いいえ</li></a>
          <a href="P2Login.jsp"><li>はい</li></a>
        </ul>
      </div>
    </div>
    
    <jsp:include page="P1kensaku.jsp"></jsp:include>
    
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>アカウント退会画面</title>
    <link rel="stylesheet" href="P2AccountDeletion.css" />
  </head>
  <body>
  <form action="P2AccountDeletionServlet">
    <div class="header" onclick="history.back()">
      <div class="back-button">
        <div class="arrow01"></div>
        アカウント退会
      </div>
    </div>
    <div class="container">
      <h2>アカウントを削除しますか</h2>
      <p>一度削除したら復元できません。</p>

      <div class="menu">
        <ul>
         <!--   <a onclick="history.back()"><li>いいえ</li></a> -->
         <input type="button" onclick="history.back()" value="いいえ">
         <!-- アカウント削除 -->
         <!--  <a href="P2Login.jsp"><li>はい</li></a> -->
         <input type="submit" value="はい">
        </ul>
      </div>
    </div>
   </form>
    
     <jsp:include page="P2kensaku.jsp"></jsp:include>
     
  </body>
</html>

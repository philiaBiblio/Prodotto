<%@page import="apli.Tuchi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="apli.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>通知画面</title>
    <link rel="stylesheet" href="P2Notifications.css" />
  </head>
  
<%
	HttpSession ses = request.getSession();

	User u = (User) ses.getAttribute("LOGIN");
	ArrayList<Tuchi> tuchiList = (ArrayList) ses.getAttribute("TUCHILIST");
%>
  
  <body>  
  <div class="notifications">
  		<%if(tuchiList != null){
  			for(int i = 0; i < tuchiList.size(); i++){ 
  				// いいねの場合
  				if(tuchiList.get(i).getSyurui().equals("いいね")){ %>
  				 <div class="notification">
            		<img src="image/<%=tuchiList.get(i).getYourIcon() %>" class="icon">
            		<p><%=tuchiList.get(i).getYourName() %>があなたの投稿にイイネをしました。</p>
            	</div>
  				<% } 
  				// フォローの場合
  				else if(tuchiList.get(i).getSyurui().equals("フォロー")){%>
  				<div class="notification">
            		<img src="image/<%=tuchiList.get(i).getYourIcon() %>" class="icon">
            		<p><%=tuchiList.get(i).getYourName() %>があなたをフォローしました。</p>
            		<button class="follow-button">フォローバックする</button>
          		</div>
  				<% }
  				// コメントの場合
  				else if(tuchiList.get(i).getSyurui().equals("コメント")){%>
  				<div class="notification">
            		<img src="image/<%=tuchiList.get(i).getYourIcon() %>" class="icon">
            		<p><%= tuchiList.get(i).getYourName()%>があなたの投稿にコメントしました。「<%=tuchiList.get(i).getNaiyou() %>」</p>
          		</div>
  				<% } 
  				// DMの場合
  				else if(tuchiList.get(i).getSyurui().equals("DM")){%>
  				<div class="notification">
            		<img src="image/<%=tuchiList.get(i).getYourIcon() %>" class="icon">
            		<p><%= tuchiList.get(i).getYourName()%>があなたにDMしました。「<%=tuchiList.get(i).getNaiyou() %>」</p>
          		</div>
  				<% }%>
  			<% }%>
  		<% }%>
        <!-- 通知リスト -->
        
        
          
          
          
   </div>
        
         <jsp:include page="P2kensaku.jsp"></jsp:include>
        
    <script>
      // 全てのフォローボタンを取得
      const followButtons = document.querySelectorAll(".follow-button");

      // ボタンがクリックされた時の処理
      followButtons.forEach((button) => {
        button.addEventListener("click", function () {
          if (this.textContent === "フォローバックする") {
            this.textContent = "フォローしました"; // ボタンテキストを変更
          } else {
            this.textContent = "フォローバックする"; // 元に戻す
          }
        });
      });
    </script>
    <!-- トグル機能の実装:
    if-else文を使い、クリックされたボタンのテキストが「フォローバックする」か「フォローしました」かを確認し、テキストを切り替えてる。
    テキストが「フォローバックする」なら「フォローしました」に変更し、そうでなければ「フォローバックする」に戻るようにしてるからね。
    上記スクリプトにより、ユーザーがボタンを押すたびにテキストが交互に変わる動作が実現。 -->
  </body>
</html>

<%@page import="apli.Follow"%>
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
	ArrayList<Follow> followList = (ArrayList) ses.getAttribute("followList");
	String followOK = (String)ses.getAttribute("followOK");
%>
  
  <body>
  <!-- 通知リスト --> 
  <div class="notifications">
  		<%if(tuchiList != null){
  			for(int i = 0; i < tuchiList.size(); i++){ 
  				// いいねの場合
  				if(tuchiList.get(i).getSyurui().equals("いいね")){ %>
  				 <div class="notification">
  				 <a href="P2UserSearchServlet?userID=<%=tuchiList.get(i).getUserId()%>">
            		<img src="image/<%=tuchiList.get(i).getYourIcon() %>" class="icon"></a>
            		<p><%=tuchiList.get(i).getYourName() %>があなたの投稿にイイネをしました。</p>
            	</div>
  				<% } 
  				// フォローの場合
  				else if(tuchiList.get(i).getSyurui().equals("フォロー")){%>
  				<div class="notification">
  				<a href="P2UserSearchServlet?userID=<%=tuchiList.get(i).getUserId()%>">
            		<img src="image/<%=tuchiList.get(i).getYourIcon() %>" class="icon"></a>
            		<p><%=tuchiList.get(i).getYourName() %>があなたをフォローしました。</p>
            		<form action="P2followbackServlet">
            			<input type="hidden" name="followback" value="<%= tuchiList.get(i).getUserId()%>">
            			<button type="submit" class="follow-button">
            			<%
            				boolean flg = false;
            				for(int j = 0; j < followList.size(); j++){
            					if(tuchiList.get(i).getUserId().equals(followList.get(j).getFollower())){%>
            						<% flg = true;
            					}%>
            				<%}
            				if(flg == true){%>
            				フォローしました
            				<%}else{%>
            				フォローバックする
            				<%}
            				flg = false;
            				%>
            	<%-- 		<%if(followOK == null){
            					for(int j = 0; j < followList.size(); j++){
            						if(tuchiList.get(i).getUserId().equals(followList.get(j).getFollower())){%>
            						フォローしました
            						<% }else{%>
            						フォローバックする
            						<% }
            					}
            			}%>

            			<%if(followOK != null){ %>
            				フォローしました
            			<% }else{%>
            				フォローバックする
            			<% }%>
            			<%ses.removeAttribute("followOK"); %> --%>
            			</button>
            		</form>
          		</div>
  				<% }
  				// コメントの場合
  				else if(tuchiList.get(i).getSyurui().equals("コメント")){%>
  				<div class="notification">
  				<a href="P2UserSearchServlet?userID=<%=tuchiList.get(i).getUserId()%>">
            		<img src="image/<%=tuchiList.get(i).getYourIcon() %>" class="icon"></a>
            		<p><%= tuchiList.get(i).getYourName()%>があなたの投稿にコメントしました。「<%=tuchiList.get(i).getNaiyou() %>」</p>
          		</div>
  				<% } 
  				// DMの場合
  				else if(tuchiList.get(i).getSyurui().equals("DM")){%>
  				<div class="notification">
  				<a href="P2UserSearchServlet?userID=<%=tuchiList.get(i).getUserId()%>">
            		<img src="image/<%=tuchiList.get(i).getYourIcon() %>" class="icon"></a>
            		<p><%= tuchiList.get(i).getYourName()%>があなたにDMしました。「<%=tuchiList.get(i).getNaiyou() %>」</p>
          		</div>
  				<% }%>
  			<% }%>
  		<% }%> 
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

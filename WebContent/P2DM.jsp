<%@page import="apli.DM"%>
<%@page import="java.util.ArrayList"%>
<%@page import="apli.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DM画面</title>
    <link rel="stylesheet" href="P2DM.css" />
  </head>
<%
	//セッションの取得
	HttpSession ses = request.getSession();
	// ログイン情報の取得
	User u = (User)ses.getAttribute("LOGIN");
	// DM画面に必要な情報
	ArrayList<DM> dmssList = (ArrayList)ses.getAttribute("DMSSLIST");
	ArrayList<DM> dmList = (ArrayList)ses.getAttribute("DMLIST");
 	Integer kazu = (Integer)ses.getAttribute("I");
 	System.out.println(kazu);
 	String name = (String)ses.getAttribute("YOU");
 	String mess = (String)ses.getAttribute("MESS");
%>

  <body style="margin: 70px 0 0 0;">
    <!-- メインコンテンツ -->
    <div class="main-content">
    <!-- メッセージリスト -->
    <!--class="message-item"選択するとユーザIDをサーバへ飛ばす。
    ほんでそいつとのトーク履歴持ってくる。それをclass="chat-messages"に持って行っちゃおう-->
        <div class="message-list">
        <%if(dmssList != null){ %>
        	<% for (int i = 0; i < dmssList.size(); i++) { %>
        		<form action="P2DMServlet" method="post">
        		<a href="P2DMServlet?yourId=<%= dmssList.get(i).getYour() %>&hensuu=<%=i%>"><div class="message-item">
            		<img src="image/<%=dmssList.get(i).getYourIcon() %>" alt="アイコン" class="icon" />
            		<%= dmssList.get(i).getYourName() %>
            		<!--未読アイコン-->
            		<!--画面読み込み時、未読ある人はここに未読数表示-->
            		<%if(!dmssList.get(i).getKidoku().equals("0")){ %>
            			<div class="notification-badge"><%=dmssList.get(i).getKidoku() %></div>
        			<% } %>
        		</div></a>
        		</form>
         	<% } %>			
	 	<%} %>
	 	</div>

      <!-- DMチャットエリア -->
     <%if(dmList != null){ %>
      	<div class="chat-container">
        <!-- ヘッダーにはユーザネームを表示 -->
		<div class="chat-header">
    		<span class="chat-partner"><%= dmssList.get(kazu).getYourName() %></span>
		</div>
        <!--もってきたトークを上から表示していく-->
        <div class="chat-messages">
        <% for (int j = 0; j < dmList.size(); j++) { %>
        <div class="<%=u.getUserid().equals(dmList.get(j).getSousin()) ? "message sent" : "message received" %>">
        	<div class="bubble"><%=dmList.get(j).getNaiyou() %></div>
        </div>
        <%} %>
        </div>

        <form action="P2DMSousinServlet" method="post">
          <div class="chat-input">
            <input
              type="text"
              name="letter"
              id="letter"
              required
              placeholder="メッセージを入力"
            />
            <input type="submit" name="sousin1" id="sousin1" value="送信" />
          </div>
        </form>
      </div>
      <%} %>
      	<%ses.removeAttribute("DMLIST"); %>

     <jsp:include page="P2kensaku.jsp"></jsp:include>
    
    <script>
      // 全てのmessage-itemを取得
      const messageItems = document.querySelectorAll('.message-item');
  
      // クリックイベントを各message-itemに追加
      messageItems.forEach(item => {
        item.addEventListener('click', () => {
          // まず、すべてのmessage-itemから選択状態を解除
          messageItems.forEach(i => i.classList.remove('selected'));
          
          // クリックされたmessage-itemにselectedクラスを追加
          item.classList.add('selected');
        });
      });

      
   // チャットエリアのスクロールバーを一番下に設定
      document.addEventListener("DOMContentLoaded", () => {
        const chatMessages = document.querySelector('.chat-messages');
        if (chatMessages) {
          chatMessages.scrollTop = chatMessages.scrollHeight;
        }
      });


      document.addEventListener("DOMContentLoaded", function () {
    	  const messageList = document.querySelector(".message-list");

    	  // ページ読み込み時にスクロール位置を復元
    	  const savedScrollPosition = localStorage.getItem("messageListScrollPosition");
    	  if (savedScrollPosition) {
    	    messageList.scrollTop = parseInt(savedScrollPosition, 10);
    	  }

    	  // スクロール位置を保存
    	  messageList.addEventListener("scroll", function () {
    	    localStorage.setItem("messageListScrollPosition", messageList.scrollTop);
    	  });
    	});


      
      
    </script>
  </body>

</html>

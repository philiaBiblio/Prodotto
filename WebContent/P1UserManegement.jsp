<%@page import="apli.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ユーザー管理画面</title>
    <link rel="stylesheet" href="P1UserManegement.css">
  </head>
  
   <%
	//セッションの取得
	HttpSession ses = request.getSession();
	//会員リストを取得
	ArrayList<User> u = (ArrayList<User>)ses.getAttribute("USERLIST");
	String trueMess = (String)ses.getAttribute("TRUEMESS");
   %>
  
  <body>
  <form action="UserManagementServlet">
    <h1>ユーザー管理画面</h1>
    <div class="search-container">
      <input type="text" name="usersearch" class="search-box" placeholder="検索..." />
      <button type="submit" class="search-button">一括</button>
    </div>
	</form>
    <table>
      <tr>
        <th>ユーザー名</th>
        <th>ユーザーID</th>
        <th>削除ボタン</th>
      </tr>
      
      
      <%if(u != null){ %>
		<% for (int i = 0; i < u.size(); i++) { %>
		<form action="P1UserManeDelServlet">
		<tr>
        <td><%= u.get(i).getName() %></td>
        <td><%= u.get(i).getUserid() %></td>
        <td class="delete-button">
        <input type="hidden" name="USERID" value="<%=i%>">
        <button type="button" id="openDialogButton" onclick="dialog('sakuzyo')">アカウント削除</button>
        <dialog id="myDialog">
        	<p>このアカウントを削除しますか？</p>
        	<div class="buttonContainer">
        		<button type="submit" class="dialogButton" id="yesButton">はい</button>
        		<button type="button" class="dialogButton" id="noButton">いいえ</button>
        	</div>
        </dialog>
  
        <dialog id="confirmationDialog">
        	<p>削除しました</p>
            <button type="button" class="dialogButton" id="closeConfirmationButton">閉じる</button>
        </dialog>
        </td>
      	</tr>
      	</form>
		<% } %>			
	  <%} %>
    </table>
    <dialog id="confirmationDialog">
    	<p>削除しました</p>
        <button type="button" class="dialogButton" id="closeConfirmationButton" onclick="confirmationDialog.close();">閉じる</button>
    </dialog>
    
     <jsp:include page="P1kensaku.jsp"></jsp:include>

    <script>
      const searchBox = document.querySelector('.search-box');
      const searchButton = document.querySelector('.search-button');
    
      searchBox.addEventListener('input', function () {
        if (searchBox.value.trim() !== '') {
          searchButton.textContent = '検索';
        } else {
          searchButton.textContent = '一括';
        }
      });

      <%if(trueMess != null ){ %>
      window.onload = function(){
  		const dialog = document.querySelector("#confirmationDialog");
      	dialog.showModal();
      	} 	
      	<%} %>
      	<%ses.removeAttribute("TRUEMESS"); %>

      // ダイアログのスクリプト
      function dialog(id){
          console.log("274")
      const openDialogButton = document.getElementById('openDialogButton');
      const yesButton = document.getElementById('yesButton');
      const noButton = document.getElementById('noButton');
      const myDialog = document.getElementById('myDialog');
      const confirmationDialog = document.getElementById('confirmationDialog');
      const closeConfirmationButton = document.getElementById('closeConfirmationButton');
      myDialog.showModal();

      openDialogButton.addEventListener('click', () => {
         myDialog.showModal();
      });

      yesButton.addEventListener('click', () => {
        myDialog.close();
        confirmationDialog.showModal();
      });

      noButton.addEventListener('click', () => {
        myDialog.close();
      });

      closeConfirmationButton.addEventListener('click', () => {
        confirmationDialog.close();
      });
      }
    </script>
  </body>
</html>

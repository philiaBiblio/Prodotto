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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
	integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS"
	crossorigin="anonymous" />    
    <link rel="stylesheet" href="P1UserManegement.css">
  </head>
  
   <%
	//セッションの取得
	HttpSession ses = request.getSession();
	//会員リストを取得
	ArrayList<User> u = (ArrayList<User>)ses.getAttribute("P1USERLIST");
	String trueMess = (String)ses.getAttribute("TRUEMESS");
   %>
   
  	<script>
  	function dialog(id){
  		console.log("id:" + id);
  		const openDialogButton = document.getElementById('openDialogButton');
  		const yesButton = document.getElementById('yesButton' + id);
  		const noButton = document.getElementById('noButton' + id);
  		const myDialog = document.getElementById('myDialog' + id);
  		const confirmationDialog = document.getElementById('confirmationDialog');
  		const closeConfirmationButton = document.getElementById('closeConfirmationButton');
  		myDialog.showModal();
  		console.log("no" + noButton)
  		  if (noButton) {
  	          noButton.addEventListener('click', () => {
  	              if (myDialog) {
  	                  console.log("80")
  	                  myDialog.close();
  	              }
  	          });
  	      }
  		globalId = id;
  	}
  	 
  	document.addEventListener('DOMContentLoaded', (event) => {
  	    function dialog(id) {
  	        const openDialogButton = document.getElementById('openDialogButton');
  	        const yesButton = document.getElementById('yesButton' + id);
  	        const noButton = document.getElementById('noButton' + id);
  	        console.log("no" + noButton)
  	        const myDialog = document.getElementById('myDialog' + id);
  	        const confirmationDialog = document.getElementById('confirmationDialog');
  	        const closeConfirmationButton = document.getElementById('closeConfirmationButton');
  	    }
  	 
  		});
  		</script>

  
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
      
      
    <% if (u != null) { %>
    	<% for (int i = 0; i < u.size(); i++) { %>
        <tr>
            <td><%= u.get(i).getName() %></td>
            <td><%= u.get(i).getUserid() %></td>
            <td class="delete-button">
            
                <!-- 動的に生成されたIDやName -->
                <input type="hidden" name="USERID<%=i%>" value="<%=i%>">
                
                <!-- 動的に生成されたIDを付与 -->
                <button type="button" id="openDialogButton" onclick = "dialog('<%=i%>')" >アカウント削除</button>
                <dialog id="myDialog<%=i%>">
                    <p>このアカウントを削除しますか？</p>
                    <div class="buttonContainer">
                    <a href="P1UserManeDelServlet?Index=<%=i%>">
                        <button type="submit" class="dialogButton" id="yesButton<%=i%>">はい</button></a>
                        <button type="button" class="dialogButton" id="noButton<%=i%>" onclick="closeDialog('<%=i%>')">いいえ</button>
                    </div>
                </dialog>
            </td>
            
        </tr>
    	<% } %>
	<% } %>
		
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
      	
    </script>
  </body>
</html>

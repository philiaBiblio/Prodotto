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
<link rel="stylesheet" href="P1popup.css">
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
		String comeDELEAT = (String)ses.getAttribute("comeDELEAT");
		/* Integer cnt = (Integer)ses.getAttribute("rs1");
		System.out.println(cnt); */
		%>
		
<script>
//ダイアログのスクリプト
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

    // dialog関数を呼び出す
    dialog();
});

<%if(comeDELEAT != null ){ %>
window.onload = function(){
	const dialog = document.querySelector("#confirmationDialog");
	dialog.showModal();
	} 	
	<%} %>
	<%ses.removeAttribute("comeDELEAT"); %>

</script>

		<%-- <%if(cnt!=null){ %> --%>
		<% for (int i = 0; i < cmList.size(); i++) { %>
		<div class="comment-item">
			<!-- <a href="P2UserSearchServlet"> -->
			<img src="image/<%=cmList.get(i).getCicon() %>" alt="アイコン" class="icon">
			<!-- </a> -->
			<div class="comment-content">
				<p class="username"><%=cmList.get(i).getcName()%></p>
				<div class="btn-content">
					<p class="comment"><%=cmList.get(i).getCcontent()%>
					<a class="round_btn" id="openDialogButton<%=cmList.get(i).getToukouId() %>" onclick="dialog('<%=i%>')"></a>
						<%-- <a href="P1CommentDeliteServlet?commId=<%=cmList.get(i).getCommentId() %>"
						class="round_btn"></a> --%>
					</p>
					<dialog id="myDialog<%= i %>">
            				<p>この投稿を削除しますか？</p>
            			<div class="buttonContainer">
            			<a class="dialoglink" href="P1CommentDeliteServlet?commId=<%=cmList.get(i).getCommentId() %>&hensuu=<%=i%>">
                			<button type="button" class="dialogButton" id="yesButton<%= i%>">はい</button></a>
                			<button type="button" class="dialogButton" id="noButton<%= i %>">いいえ</button>
            			</div>
        				</dialog>
				</div>
			</div>
		</div>
		<% } %>
		<%-- <%} %> --%>
	</div>

	<!-- 入力ボックスをDM画面から持ってくる -->
	<!-- <form action="P2CommentSousinServlet" method="post" class="chat-form">
		<div class="chat-input">
			<input type="text" name="comment" id="comment" required
				placeholder="コメントを入力"> 
				<input type="submit" name="submit" id="submit" value="送信">
		</div>
	</form> -->
	
	<dialog id="confirmationDialog" class="confirmationDialog">
		<p>削除しました</p>
		<button type="button" class="dialogButton" id="closeConfirmationButton" onclick="confirmationDialog.close();">閉じる</button>
	</dialog>

</body>
</html>

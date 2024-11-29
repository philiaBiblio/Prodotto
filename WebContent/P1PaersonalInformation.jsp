<%@page import="apli.AdminUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>プロフィール編集画面</title>
<link rel="stylesheet" href="P1PaersonalInformation.css">
</head>

<%
// セッションの取得
HttpSession ses = request.getSession();
// ログイン情報の取得
User au = (AdminUser) ses.getAttribute("ADMINLOGIN");
%>
<body>
	<form action="PersonalInformationServlet" method="post">
		<div class="icon">
			<!--  srcのところを値に変更する？ -->
			<img id="iconImage" src="image/ききゅう.jpg" alt="icon" /> <label
				for="fileInput">写真を選択</label> <input type="file" name="icon"
				id="fileInput" accept="image/jpeg, image/png" />
		</div>
		<div class="nakami">
			<!-- ユーザー名 -->
			<div class="profile-item">
				<span id="username-display"><b>ユーザー名:</b><%=au.getName()%></span> <input
					type="text" class="textbox" id="username-input"
					value=<%=au.getName()%> name="name" /> <span class="dli-create"
					id="username-icon" onclick="enableEdit('username')"></span>
			</div>

			<!-- ユーザーID -->
			<div class="profile-item">
				<span id="userid-display" name="userid"><b>ユーザーID:</b><%=au.getUserid()%></span>
				<input type="text" class="textbox" id="userid-input"
					value=<%=u.getUserid()%> name="userid" /> <span class="dli-create"
					id="userid-icon" onclick="enableEdit('userid')"></span>
			</div>

			<!-- 性別 -->
			<!-- DBから持ってきて性別選択されてる状態にしておく -->
			<div class="profile-item">
				<span id="sex-display"><b>性別:</b> <%
 if (au.getSex().equals("0")) {
 %> 男 <%
 } else if (au.getSex().equals("1")) {
 %> 女 <%
 }
 %> </span>
				<div class="button" id="sex-input">
					<input type="radio" id="otoko" name="sexy" value="0"
						<%=au.getSex().equals("0") ? "checked" : ""%>> <label
						class="radio-label" for="otoko">男</label> <input type="radio"
						id="onna" name="sexy" value="1"
						<%=au.getSex().equals("1") ? "checked" : ""%>> <label
						class="radio-label" for="onna">女</label>
				</div>
				<span class="dli-create" id="sex-icon" onclick="enableEdit('sex')"></span>
			</div>

			<!-- 生年月日 -->
			<div class="profile-item">
				<span id="birth-display"><b>生年月日: </b><%=au.getBirth()%></span> <input
					type="date" class="textbox" id="birth-input"
					value=<%=au.getBirth()%> name="birth" /> <span class="dli-create"
					id="birth-icon" onclick="enableEdit('birth')"></span>
			</div>

			<!-- 保存ボタン（最初は非表示） -->
			<div class="button-container" id="button-container">
				<input type="submit" class="submit-button" name="hozon" id="hozon"
					value="保存" />
			</div>
		</div>
	</form>

<<<<<<< HEAD
	<jsp:include page="P2kensaku.jsp"></jsp:include>
=======
            <!-- 保存ボタン（最初は非表示） -->
            <div class="button-container" id="button-container">
                <input type="submit" class="submit-button" name="hozon" id="hozon" value="保存" />
            </div>
        </div>
    </form>
    
  		<jsp:include page="P1kensaku.jsp"></jsp:include>
	
>>>>>>> refs/remotes/origin/main

	<script>
		function enableEdit(field) {
			const displaySpan = document.getElementById(field + "-display");
			const displayicon = document.getElementById(field + "-icon");
			const inputField = document.getElementById(field + "-input");
			const buttonContainer = document.getElementById("button-container");

			// フィールドの編集を有効化
			displaySpan.style.display = "none";
			displayicon.style.display = "none";
			inputField.style.display = "flex";

			// 保存ボタンを表示
			buttonContainer.style.display = "block";
		}
	</script>
</body>
</html>

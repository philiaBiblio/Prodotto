<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新しいパスワード設定</title>
    <link rel="stylesheet" href="P2PreLoginPasswordChange3.css">
</head>
<%
	//セッションの取得
	HttpSession ses = request.getSession();
	// メールアドレスの取得
	String mail = (String)ses.getAttribute("INMAIL");
	String messPass = (String)ses.getAttribute("ERRORPASS");
	String messPass1 = (String)ses.getAttribute("ERRORPASS1");
 %>

<body>
    <div class="form-container">
        <h1>新規パスワード</h1>
        <p></p>
        
        <form action="P2PreLoginPasswordChange3Servlet">
            <!-- 新しいパスワード入力 -->
            <label for="new-password"></label>
            <input type="password" id="new-password" name="new-password" required placeholder="新しいパスワード">

            <!-- 再入力 -->
            <label for="confirm-password"></label>
            <input type="password" id="confirm-password" name="confirm-password" required placeholder="新しいパスワードを再入力">
            
             <%if(messPass != null){ %>
             	<div class="error-message">
        		<%= messPass %>
    			</div>
			<%} %>
			<%ses.removeAttribute("ERRORPASS"); %>
            
            <%if(messPass1 != null){ %>
           		<div class="error-message">
        		<%= messPass1 %>
    			</div>
			<%} %>
			<%ses.removeAttribute("ERRORPASS1"); %>
            
            <!-- 確定ボタン -->
            <div class="button-group">
                <button type="submit">確定</button>
            </div>
        </form>
    </div>
</body>
</html>

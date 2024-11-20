<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>パスワード変更</title>
    <link rel="stylesheet" href="P2PreLoginPasswordChange1.css">
</head>
<%
	//セッションの取得
	HttpSession ses = request.getSession();
	// エラーメッセージの取得
	String error = (String)ses.getAttribute("ERROR");
%>

<body>
    <div class="form-container">
        <h1>パスワード変更</h1>
        <p>メールアドレスに確認用メールを送信します。以下にアカウントを登録したメールアドレスを入力してください。</p>
        
        <form action="P2PreLoginPasswordChange1Servlet" method="post">
            <!-- メールアドレス -->
            <label for="email"></label>
            <input type="email" id="email" name="email" required  placeholder="メールアドレス">

            <!-- ボタン -->
            <div class="button-group">
                <button type="submit"><a href="P2PreLoginPasswordChange2.jsp">送信</a></button>
                <button type="reset"><a href="P2Login.jsp">キャンセル</a></button>
            </div>
        </form>
        <%if(error != null){ %>
				<p style="color:#ff0000"><%=error %></p>
			<%} %>
			<%ses.removeAttribute("ERROR"); %>
    </div>
</body>
</html>

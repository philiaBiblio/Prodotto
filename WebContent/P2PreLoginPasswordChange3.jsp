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
<body>
    <div class="form-container">
        <h1>新規パスワード</h1>
        <p></p>
        
        <form action="#" method="post" id="password-form">
            <!-- 新しいパスワード入力 -->
            <label for="new-password"></label>
            <input type="password" id="new-password" name="new-password" required placeholder="新しいパスワード">

            <!-- 再入力 -->
            <label for="confirm-password"></label>
            <input type="password" id="confirm-password" name="confirm-password" required placeholder="新しいパスワードを再入力">

            <!-- 確定ボタン -->
            <div class="button-group">
                <button type="submit"><a href="P2Login.jsp">確定</a></button>
            </div>
        </form>
    </div>
</body>
</html>

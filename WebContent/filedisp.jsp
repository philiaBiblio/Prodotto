
<!DOCTYPE html>
<html lang="ja">
	<head><meta charset="UTF-8"></head>
	<body>

	<%
	String filename = "dummy.jpg";//アップロードした画像のファイル名（DBから取得）
	%>
	画像<br>
	<img src="img\<%=filename%>">

	</body>
</html>


<%@ page contentType="text/html; charset=UTF-8"%>

<html>
<head>
</head>
<body>
<%
String x = "x999";
%>
<!-- 実際の画面遷移先はサーブレットになる為、注意 -->
■formを使った値渡し
<form action="ataiwatasi2.jsp">
	<input type="submit" value="次の画面へ">
	<input type="text" name="no" value="x001">
</form>
<br>
<br>
■aタグを使った値渡し<br>
<!-- aタグを使って値を渡しする場合の記述 -->
<!-- ↓のサンプルソースだと、jspファイル名の後に?で区切りをつけ、=の左側にnameの値を指定し、=の右側にvalueの値を指定する -->
<a href="ataiwatasi2.jsp?no=x001">飯田剛大</a><br>
<a href="ataiwatasi2.jsp?no=x002">田邊悦子</a>
<br>
<br>
<br>
<br>
■aタグとjavaを使った値渡し<br>
<%
//以下のデータをダミーで設定。本来はデータソースクラス(Seito.javaなど)を使う
String gaku_no1 ="x001";
String gaku_no2 ="x002";
String gaku_name1 ="飯田剛大";
String gaku_name2 ="田邊悦子";
%>
<a href="ataiwatasi2.jsp?no=<%=gaku_no1%>"><%=gaku_name1%></a><br>
<a href="ataiwatasi2.jsp?no=<%=gaku_no2%>"><%=gaku_name2%></a>
</body>


</html>






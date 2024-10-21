<%@ page contentType="text/html; charset=UTF-8"%>

<html>
<head>
</head>

<body>

<%
//formタグ、aタグ、どちらからでも値渡しは可能
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
%>
値：<%=no %>

</body>
</html>

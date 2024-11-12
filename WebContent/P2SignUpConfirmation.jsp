<%@page import="apli.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>新規登録確認画面</title>

    <link
      href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="P2SignUpConfirmation.css" />
  </head>
  <%
  request.setCharacterEncoding("UTF-8");
  //セッションの生成
  HttpSession ses = request.getSession();
  User u = (User)ses.getAttribute("NYURYOKU");
  %>
  <body>
    <div class="all">
      <header>
        <div class="mae">
        </div>
        <div class="icon">
          <img id="iconImage" src="image/ききゅう.jpg" alt="icon" />
          <label for="fileInput">写真を選択</label>
          <input
            type="file"
            name="icon"
            id="fileInput"
            accept="image/jpeg, image/png"
          />

          <p>以下の内容でよろしいですか？</p>
        </div>

        <script>
          document
            .getElementById("fileInput")
            .addEventListener("change", function (event) {
              const file = event.target.files[0];
              if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                  document.getElementById("iconImage").src = e.target.result;
                };
                reader.readAsDataURL(file);
              }
            });
        </script>
      </header>

      <div class="waku">
        <div>
          <p class="midasi">ユーザー名</p>
          <p class="uketori" name="name"><%=request.getParameter("name") %></p>
        </div>

        <div>
          <p class="midasi">ユーザーID</p>
          <p class="uketori" name="userid"><%=request.getParameter("userid") %></p>
        </div>

        <div>
          <p class="midasi">メールアドレス</p>
          <p class="uketori" name="mailadd"><%=request.getParameter("mailadd") %></p>
        </div>

        <div>
          <p class="midasi">パスワード</p>
        </div>
        <input type="checkbox" id="checkPassword" />

        <div class="togglePassword">
          <input
            type="password"
            class="hideText"
            name="uketori"
            id="uketori"
            value="<%=request.getParameter("pw") %>"
            disabled
          />
          <input type="text" class="showText" value="<%=request.getParameter("pw") %>" />
          <label for="checkPassword" class="fa fa-eye"></label>
          <label for="checkPassword" class="fa fa-eye-slash"></label>
        </div>

        <div>
          <p class="midasi">性別</p>
          <p class="uketori"><%=request.getParameter("sexy") %></p>
        </div>

        <div>
          <p class="midasi">生年月日</p>
          <p class="uketori"><%=request.getParameter("birth") %></p>
        </div>

        <div>
          <p class="midasi">演奏頻度</p>
          <%
          	String fq = request.getParameter("fq");
        		  if(fq.equals("none")){
          %>
          	<p class="uketori">演奏しない</p>
          <%}else if(fq.equals("everyday")){ %>
          	<p class="uketori">毎日</p>
          <%}else if(fq.equals("usually")){%>
          	<p class="uketori">週3、4回</p>
          <%}else if(fq.equals("sometimes")){ %>
          	<p class="uketori">月1</p>
          <%}else{ %>
          	<p class="uketori">その他</p>
          <%} %>
        </div>

        <div>
          <p class="midasi">楽器歴</p>
          <%
          	String his = request.getParameter("history");
        		  if(his.equals("first")){
          %>
          	<p class="uketori">はじめて</p>
          <%}else if(his.equals("3months")){ %>
          	<p class="uketori">～3カ月</p>
          <%}else if(his.equals("half")){ %>
          	<p class="uketori">～半年</p>
          <%}else if(his.equals("year")){ %>
          	<p class="uketori">～1年</p>
          <%}else if(his.equals("5years")){ %>
          	<p class="uketori">～5年</p>
          <%}else{ %>
          	<p class="uketori">5年～</p>
          <%} %>
        </div>
      </div>

      <footer>
        <!-- 戻る場合もう一度すべて入力しなおすのかわいそうだから、
        データそのまま戻して入力途中みたいにしてあげるといいかも -->
        <form action="P2SignUp.jsp" method="post">
          <input type="submit" name="modoru" id="modoru" value="戻る" />
        </form>

        <form action="P2SignUpConfirmationServlet" method="post">
          <input type="submit" name="touroku" id="touroku" value="登録" />
        </form>
      </footer>
    </div>
  </body>
</html>

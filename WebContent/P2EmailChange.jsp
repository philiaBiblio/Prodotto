<%@page import="apli.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>メールアドレス変更画面</title>
    <link rel="stylesheet" href="P2EmailChange.css" />
  </head>
  <%
	//セッションの取得
	HttpSession ses = request.getSession();
	// ログイン情報の取得
	User u = (User)ses.getAttribute("LOGIN");
	String errorMail = (String)ses.getAttribute("ERRORMAIL");
	String trueMail = (String)ses.getAttribute("TRUEMESS");
  %>
  
  <body>
    <div class="header" onclick="history.back()">
      <div class="back-button" >
        <div class="arrow01"></div>
        メールアドレス変更
      </div>
    </div>
    <div class="container">
      <h2>メールアドレスを変更</h2>

      <form action="EmailChangeServlet" onsubmit="showPopup(event)">
        <div class="menu">
          <ul>
            <div class="textarea">
              <input
                type="email"
                class="textbox"
                name="mailadd"
                id="mailadd"
                required
                placeholder="メールアドレスを入力"
              />
              <input
                type="email"
                class="textbox"
                name="mailadd2"
                id="mailadd2"
                required
                placeholder="メールアドレス再入力"
              />
            </div>
            <%if(errorMail != null){ %>
				<p style="color:#ff0000"><%=errorMail %></p>
			<%} %>
			<%ses.removeAttribute("ERRORMAIL"); %>

            <div class="button-container">
              <input
                type="submit"
                class="submit-button"
                name="addHenko"
                id="addHenko"
                value="メールアドレスを変更"
              />
            </div>
          </ul>
        </div>
        
        <%if(trueMail != null ){ %>
        <div class="log">
          <dialog>
            <p class="ok">メールアドレスを変更しました</p>
            <div class="dialog-button-container">
              <button type="button" class="dialog">閉じる</button>
            </div>
          </dialog>
        </div>
        <%} %>
			<%ses.removeAttribute("TRUEMESS"); %>
        
       <jsp:include page="P2kensaku.jsp"></jsp:include>

        <script>
        <%if(trueMail != null ){ %>
        	window.onload = function(){
        		const dialog = document.querySelector("dialog");
            	dialog.showModal();
            } 	
        <%} %>
          const openButton = document.querySelector(".submit-button");
          openButton.addEventListener("click", () => {
          /*   const dialog = document.querySelector("dialog");
            dialog.showModal(); */
          });

          const closeButton = document.querySelector(".dialog");
          closeButton.addEventListener("click", () => {
              const dialog = document.querySelector("dialog");
              dialog.close();
          });
        </script>
      </form>
    </div>
  </body>
</html>

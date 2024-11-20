<%@page import="apli.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>パスワード変更画面</title>
    <link rel="stylesheet" href="P2PasswordChange.css" />
    <link
      href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
      rel="stylesheet"
    />
  </head>
  <%
	//セッションの取得
	HttpSession ses = request.getSession();
	// ログイン情報の取得
	User u = (User)ses.getAttribute("LOGIN");
	String messPass = (String)ses.getAttribute("ERRORPASS");
	String messPass2 = (String)ses.getAttribute("ERRORPASS2");
	String messPass3 = (String)ses.getAttribute("ERRORPASS3");
	String truePass = (String)ses.getAttribute("TRUEMESS");
  %>
  <body>
    <div class="header" onclick="history.back()">
      <div class="back-button">
        <div class="arrow01"></div>
        パスワード変更
      </div>
    </div>
    <div class="container">
      <h2>パスワードを変更</h2>
      <p>英数字6文字以上で設定してください</p>

      <form action="P2PasswordChangeServlet">
        <div class="menu">
          <ul>
            <!-- 現在のパスワードと一致すればOK -->
            <div class="textarea">
              <input type="checkbox" id="checkPassword" />
              <div class="togglePassword">
                <input
                  type="password"
                  class="hideText"
                  name="pw"
                  id="pw"
                  required
                  placeholder="現在のパスワード"
                  Onchange="disp1()"
                />
                <input type="text" class="showText" id="pass1" name="pw" Onchange="disp2()"/>
                <script>
              	function disp1(){
              	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
              	//↓の例では、変数e1の中にpwテキストボックスが入る
              		var e1 = document.getElementById("pw");
              	//〇〇.value…指定した入力部品の属性に値を設定する
              	//入力部品を入れた変数名.value= '設定したい値'
              		document.getElementById("pass1").value = e1.value;
                }

              	function disp2(){
                  	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
                  	//↓の例では、変数e1の中にpwテキストボックスが入る
                  		var e1 = document.getElementById("pass1");
                  	//〇〇.value…指定した入力部品の属性に値を設定する
                  	//入力部品を入れた変数名.value= '設定したい値'
                  		document.getElementById("pw").value = e1.value;
                    }
              </script>

                <label for="checkPassword" class="fa fa-eye"></label>
                <label for="checkPassword" class="fa fa-eye-slash"></label>
              </div>
              
                <%if(messPass2 != null){ %>
				<p style="color:#ff0000"><%=messPass2 %></p>
			<%} %>
			<%ses.removeAttribute("ERRORPASS2"); %>

              <input type="checkbox" id="checkPassword2" />
              <div class="togglePassword">
                <!-- パスワードの条件守ってたらOK -->
                <input
                  type="password"
                  class="hideText2"
                  name="newPw"
                  id="newPw"
                  required
                  placeholder="新しいパスワード"
                  Onchange="disp3()"
                />
                
                <input type="text" class="showText2" id="pass2" name="newPw" Onchange="disp4()"/>
                <label for="checkPassword2" class="fa fa-eye"></label>
                <label for="checkPassword2" class="fa fa-eye-slash"></label>
              </div>
              
              <script>
              	function disp3(){
              	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
              	//↓の例では、変数e1の中にpwテキストボックスが入る
              		var e2 = document.getElementById("newPw");
              	//〇〇.value…指定した入力部品の属性に値を設定する
              	//入力部品を入れた変数名.value= '設定したい値'
              		document.getElementById("pass2").value = e2.value;
                }

              	function disp4(){
                  	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
                  	//↓の例では、変数e1の中にpwテキストボックスが入る
                  		var e2 = document.getElementById("pass2");
                  	//〇〇.value…指定した入力部品の属性に値を設定する
                  	//入力部品を入れた変数名.value= '設定したい値'
                  		document.getElementById("newPw").value = e2.value;
                }
              </script>

              <input type="checkbox" id="checkPassword3" />
              <div class="togglePassword">
                <!-- 上で入力したコードと一致してたらOK -->
                <input
                  type="password"
                  class="hideText3"
                  name="newPw2"
                  id="newPw2"
                  required
                  placeholder="新しいパスワードを再入力"
                  Onchange="disp5()"
                />
                <input type="text" class="showText3" id="pass3" name="newPw2" Onchange="disp6()"/>
                <label for="checkPassword3" class="fa fa-eye"></label>
                <label for="checkPassword3" class="fa fa-eye-slash"></label>
              </div>
            </div>
            
            <%if(messPass != null){ %>
				<p style="color:#ff0000"><%=messPass %></p>
			<%} %>
			<%ses.removeAttribute("ERRORPASS"); %>
			
			 <%if(messPass3 != null){ %>
				<p style="color:#ff0000"><%=messPass3 %></p>
			<%} %>
			<%ses.removeAttribute("ERRORPASS3"); %>
			
            <script>
              	function disp5(){
              	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
              	//↓の例では、変数e1の中にpwテキストボックスが入る
              		var e3 = document.getElementById("newPw2");
              	//〇〇.value…指定した入力部品の属性に値を設定する
              	//入力部品を入れた変数名.value= '設定したい値'
              		document.getElementById("pass3").value = e3.value;
                }

              	function disp6(){
                  	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
                  	//↓の例では、変数e1の中にpwテキストボックスが入る
                  		var e3 = document.getElementById("pass3");
                  	//〇〇.value…指定した入力部品の属性に値を設定する
                  	//入力部品を入れた変数名.value= '設定したい値'
                  		document.getElementById("newPw2").value = e3.value;
                }
              </script>

            <div class="button-container">
              <!-- すべて条件クリアしてたらDBの既存のパスワードを新しく上書き -->
              <!-- もし条件守ってなかったら何がダメだったか赤文字で表示 -->
              <!-- 変更出来たら「パスワードを変更」の文字部分を「変更しました」に切り替え -->
              <input
                type="submit"
                class="submit-button"
                name="pwHenkou"
                id="pwHenkou"
                value="パスワードを変更"
              />
              
              <%if(truePass != null){ %>
              <div class="log">
                <dialog>
                  <p>パスワードを変更しました</p>
                  <button type="button" class="dialog">閉じる</button>
                </dialog>
              </div>
              <%} %>
			<%ses.removeAttribute("TRUEMESS"); %>

              <script>
              <%if(truePass != null ){ %>
              window.onload = function(){
          		const dialog = document.querySelector("dialog");
              	dialog.showModal();
              	} 	
              	<%} %>
              	const openButton = document.querySelector(".submit-button");
              	openButton.addEventListener("click", () => {
         		/* const dialog = document.querySelector("dialog");
         		dialog.showModal(); */
         		});

              	const closeButton = document.querySelector(".dialog");
              	closeButton.addEventListener("click", () => {
                  	const dialog = document.querySelector("dialog");
                  	dialog.close();
                  	});
              </script>
            </div>
          </ul>
        </div>
      </form>
    </div>
    
     <jsp:include page="P2kensaku.jsp"></jsp:include>
     
  </body>
</html>

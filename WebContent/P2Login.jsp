<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ログイン画面</title>
    <link rel="stylesheet" href="P2Login.css" />
    <link
      href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="container">
      <h2>ログイン</h2>

		<% if (request.getAttribute("errorMessage") != null) { %>
    		<div class="error-message">
        	<%= request.getAttribute("errorMessage") %>
    		</div>
		<% } %>

      <form action="P2LoginServlet">
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

              <input type="checkbox" id="checkPassword" />
              <div class="togglePassword">
                <input
                  type="password"
                  class="hideText"
                  name="pw"
                  id="pw"
                  required
                  placeholder="パスワードを入力"
                  Onchange="disp1()"
                />
                <input type="text" class="showText" id="pass1" name="pw" Onchange="disp2()"/>
                <label for="checkPassword" class="fa fa-eye"></label>
                <label for="checkPassword" class="fa fa-eye-slash"></label>
              </div>
            </div>
            
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

            <div class="button-container">
              <input
                type="submit"
                class="submit-button"
                name="rogin"
                id="rogin"
                value="ログイン"
              />
            </div>
            
            <div class="nolog">
              <div class="new">
                <a href="P2SignUp.jsp">新規登録の方はこちら</a>
              </div>
              <div class="new">
                <a href="P2PreLoginPasswordChange1.jsp">パスワード忘れた方</a>
              </div>
            </div>
              
          </ul>
        </div>
      </form>
    </div>
  </body>
</html>

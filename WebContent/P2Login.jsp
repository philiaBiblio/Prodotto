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
                  value="qwert"
                  required
                  placeholder="パスワードを入力"
                />
                <input type="text" class="showText" value="qwert" />
                <label for="checkPassword" class="fa fa-eye"></label>
                <label for="checkPassword" class="fa fa-eye-slash"></label>
              </div>
            </div>

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
                <a href="P2SignUp.html">新規登録の方はこちら</a>
              </div>
              <div class="new">
                <a href="P2PreLoginPasswordChange1.html">パスワード忘れた方</a>
              </div>
            </div>
              
          </ul>
        </div>
      </form>
    </div>
  </body>
</html>

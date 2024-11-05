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
  <body>
    <div class="header" onclick="history.back()">
      <div class="back-button">
        <div class="arrow01"></div>
        パスワード変更
      </div>
    </div>
    <div class="container">
      <h2>パスワードを変更</h2>
      <p>英数字6文字以上だよん</p>

      <form action="" method="dialog">
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
                  value="qwert"
                  required
                  placeholder="現在のパスワード"
                />
                <input type="text" class="showText" value="qwert" />
                <label for="checkPassword" class="fa fa-eye"></label>
                <label for="checkPassword" class="fa fa-eye-slash"></label>
              </div>

              <input type="checkbox" id="checkPassword2" />
              <div class="togglePassword">
                <!-- パスワードの条件守ってたらOK -->
                <input
                  type="password"
                  class="hideText2"
                  name="newPw"
                  id="newPw"
                  value="qwert"
                  required
                  placeholder="新しいパスワード"
                />
                <input type="text" class="showText2" value="qwert" />
                <label for="checkPassword2" class="fa fa-eye"></label>
                <label for="checkPassword2" class="fa fa-eye-slash"></label>
              </div>

              <input type="checkbox" id="checkPassword3" />
              <div class="togglePassword">
                <!-- 上で入力したコードと一致してたらOK -->
                <input
                  type="password"
                  class="hideText3"
                  name="newPw2"
                  id="newPw2"
                  value="qwert"
                  required
                  placeholder="新しいパスワードを再入力"
                />
                <input type="text" class="showText3" value="qwert" />
                <label for="checkPassword3" class="fa fa-eye"></label>
                <label for="checkPassword3" class="fa fa-eye-slash"></label>
              </div>
            </div>

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
              <div class="log">
                <dialog>
                  <p>パスワードを変更しました</p>
                  <button type="button" class="dialog">閉じる</button>
                </dialog>
              </div>

              <script>
                const openButton = document.querySelector(".submit-button");
                openButton.addEventListener("click", () => {
                  const dialog = document.querySelector("dialog");
                  dialog.showModal();
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
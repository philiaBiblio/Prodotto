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
          <p class="uketori">さんまのはらわた</p>
        </div>

        <div>
          <p class="midasi">ユーザーID</p>
          <p class="uketori">sanma26</p>
        </div>

        <div>
          <p class="midasi">メールアドレス</p>
          <p class="uketori">chikurin@gmail.com</p>
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
            value="qwert"
            disabled
          />
          <input type="text" class="showText" value="qwert" />
          <label for="checkPassword" class="fa fa-eye"></label>
          <label for="checkPassword" class="fa fa-eye-slash"></label>
        </div>

        <div>
          <p class="midasi">性別</p>
          <p class="uketori">男</p>
        </div>

        <div>
          <p class="midasi">生年月日</p>
          <p class="uketori">1999年2月11日</p>
        </div>

        <div>
          <p class="midasi">演奏頻度</p>
          <p class="uketori">毎日</p>
        </div>

        <div>
          <p class="midasi">楽器歴</p>
          <p class="uketori">～三ヵ月</p>
        </div>
      </div>

      <footer>
        <!-- 戻る場合もう一度すべて入力しなおすのかわいそうだから、
        データそのまま戻して入力途中みたいにしてあげるといいかも -->
        <form action="P2SignUp.jsp" method="post">
          <input type="submit" name="modoru" id="modoru" value="戻る" />
        </form>

        <form action="P2Timeline.jsp" method="post">
          <input type="submit" name="touroku" id="touroku" value="登録" />
        </form>
      </footer>
    </div>
  </body>
</html>
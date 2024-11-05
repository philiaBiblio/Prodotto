<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>管理者管理画面</title>
    <link rel="stylesheet" href="P1AdminManegement.css" />
    <link
      href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <h1>管理者管理画面</h1>

    <header>
      <table class="kanri">
        <tr>
          <th id="idleft">ID =</th>
          <th id="idright">
            <input type="checkbox" id="checkPassword" />
            <div class="togglePassword">
              <input
                type="password"
                class="hideText"
                name="id"
                id="id"
                value="qwert"
                disabled
              />
              <input type="text" class="showText" value="qwert" id="idtext"/>
              <label for="checkPassword" class="fa fa-eye"></label>
              <label for="checkPassword" class="fa fa-eye-slash"></label>
            </div>
          </th>

        </tr>
        <tr>
          <th id="passleft">PASS =</th>
          <th id="passright"><input type="checkbox" id="checkPassword2" />
            <div class="togglePassword">
              <input
                type="password"
                class="hideText2"
                name="id2"
                id="id2"
                value="qwert"
                disabled
              />
              <input type="text" class="showText2" value="qwert" id="passtext">
              <label for="checkPassword2" class="fa fa-eye"></label>
              <label for="checkPassword2" class="fa fa-eye-slash"></label>
            </div>
          </th>
        </tr>
      </table>
    </header>

    <form action="" method="post">
      <div class="nakami">
        <div>
          <label class="soroe">氏名</label><br />
          <label
            ><input
              type="text"
              class="textbox"
              name="name"
              id="name"
              required /></label
          ><br />
        </div>

        <label class="soroe">性別</label><br />
        <div class="button">
          <label class="left"
            ><input
              type="button"
              class="sexM nomargin"
              name="sex"
              id="otoko"
              value="男"
          /></label>
          <label class="right"
            ><input
              type="button"
              class="sexW nomargin"
              name="sex"
              id="onna"
              value="女" /></label
          ><br />
        </div>

        <script>
          document.addEventListener("DOMContentLoaded", function () {
            const sexM = document.querySelector(".sexM");
            const sexW = document.querySelector(".sexW");

            sexM.addEventListener("mouseover", function () {
              sexM.classList.add("hovered");
              sexW.classList.remove("hovered");
            });

            sexM.addEventListener("mouseout", function () {
              sexM.classList.remove("hovered");
            });

            sexW.addEventListener("mouseover", function () {
              sexW.classList.add("hovered");
              sexM.classList.remove("hovered");
            });

            sexW.addEventListener("mouseout", function () {
              sexW.classList.remove("hovered");
            });

            sexM.addEventListener("click", function () {
              sexM.classList.add("clicked");
              sexW.classList.remove("clicked");
            });

            sexW.addEventListener("click", function () {
              sexW.classList.add("clicked");
              sexM.classList.remove("clicked");
            });
          });
        </script>

        <div>
          <label class="soroe">生年月日</label><br />
          <input
            type="date"
            class="textbox birth"
            name="birth"
            id="birth"
          /><br />
        </div>

        <div>
          <label class="soroe">メールアドレス</label><br />
          <label
            ><input
              type="email"
              class="textbox"
              name="mailadd"
              id="mailadd"
              required></label
          ><br>
        </div>

        <div class="kakutei">
          <input type="submit" name="kakutei" id="kakutei" value="確定" />
        </div>
      </div>
    </form>

    <footer>
      <div class="search-container">
        <input type="text" class="search-box" placeholder="ユーザー名" />
        <button class="search-button">検索</button>
      </div>

      <table class="kensaku">
        <tr>
          <th>ユーザー名</th>
          <th>ユーザーID</th>
          <th>削除ボタン</th>
        </tr>
        <tr>
          <td>さんまのはらわた</td>
          <td>sanma226</td>
          <td><button id="delete-button-sanma">アカウント削除</button></td>
        </tr>
        <tr>
          <td>ゆうせい</td>
          <td>yusei215</td>
          <td><button id="delete-button-yusei">アカウント削除</button></td>
        </tr>
      </table>
      
      <jsp:include page="P1kensaku.jsp"></jsp:include>
       
      <script>
        document
          .getElementById("delete-button-sanma")
          .addEventListener("click", function () {
            if (confirm("本当に変更しますか？")) {
              // アカウント削除の処理をここに追加
              alert("アカウントが削除されました");
            }
          });

        document
          .getElementById("delete-button-yusei")
          .addEventListener("click", function () {
            if (confirm("本当に変更しますか？")) {
              // アカウント削除の処理をここに追加
              alert("アカウントが削除されました");
            }
          });
      </script>
    </footer>
  </body>
</html>

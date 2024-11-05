<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ユーザー管理画面</title>
    <link rel="stylesheet" href="P1UserManegement.css">
  </head>
  <body>
    <h1>ユーザー管理画面</h1>
    <div class="search-container">
      <input type="text" class="search-box" placeholder="検索..." />
      <button class="search-button">一括</button>
    </div>

    <table>
      <tr>
        <th>ユーザー名</th>
        <th>ユーザーID</th>
        <th>削除ボタン</th>
      </tr>
      <tr>
        <td>さんまのはらわた</td>
        <td>sanma226</td>
        <td class="delete-button"><button>アカウント削除</button></td>
      </tr>
      
      <tr>
        <td>ゆうせい</td>
        <td>yusei215</td>
        <td class="delete-button"><button>アカウント削除</button></td>
      </tr>

      <tr>
        <td>金森a.k.a MAFF</td>
        <td>maffaka</td>
        <td class="delete-button"><button>アカウント削除</button></td>
      </tr>

    </table>
    
     <jsp:include page="P1kensaku.jsp"></jsp:include>

    <script>
      const searchBox = document.querySelector('.search-box');
      const searchButton = document.querySelector('.search-button');
    
      searchBox.addEventListener('input', function () {
        if (searchBox.value.trim() !== '') {
          searchButton.textContent = '検索';
        } else {
          searchButton.textContent = '一括';
        }
      });
    
      document
        .getElementById("delete-button-sanma")
        .addEventListener("click", function () {
          if (confirm("本当に変更しますか？")) {
            alert("アカウントが削除されました");
          }
        });
    
      document
        .getElementById("delete-button-yusei")
        .addEventListener("click", function () {
          if (confirm("本当に変更しますか？")) {
            alert("アカウントが削除されました");
          }
        });
    </script>
    
  </body>
</html>
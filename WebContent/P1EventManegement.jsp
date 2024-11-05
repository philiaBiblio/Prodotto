<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>イベント管理画面</title>
    <link rel="stylesheet" href="P1EventManegement.css" />
  </head>
  <body>
    <!-- イベント更新 -->
    <h1>イベント管理</h1>
    <form action="" method="post">
      <div id="kousin">
        <select name="" id="nen">
          <option value="none" selected>選択してください</option>
          <option value="2024">2024</option>
          <option value="2025">2025</option>
          <option value="2026">2026</option>
        </select>
        <label for="nen">年</label>

        <select name="tuki" id="tuki">
          <option value="none" selected>選択してください</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
        </select>
        <label for="tuki">月</label><br />
      </div>

      <!-- お題入力 -->
      <input type="text" name="odai" id="odai" /><br />

      <!-- 送信ボタン -->
      <div class="sousin">
        <input type="submit" name="sousin" id="sousin" value="送信" />
      </div>

      <!-- 過去イベント -->
      <h2>過去のイベントお題</h2>
      <div id="kako">
          <select name="" id="nen1">
            <option value="none" selected>選択してください</option>
            <option value="2024">2024</option>
            <option value="2025">2025</option>
            <option value="2026">2026</option>
          </select>
          <label for="nen">年</label>



        <select name="kako-tuki" id="kako-tuki">
          <option value="none" selected>選択してください</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
        </select>
        <label for="kako-tuki">月</label><br />

        <!-- 過去のお題入力 -->
        <div id="test">
          <input type="text" name="kako-odai" id="kako-odai" />
        </div>
      </div>
    </form>
    
    <jsp:include page="P1kensaku.jsp"></jsp:include>
    
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>通知画面</title>
    <link rel="stylesheet" href="P2Notifications.css" />
  </head>
  <body>
    
        <!-- 通知リスト -->
        <div class="notifications">
          <div class="notification">
            <div class="icon"></div>
            <p>さしみがあなたの投稿にイイネをしました。</p>
          </div>
          <div class="notification">
            <div class="icon"></div>
            <p>さしみがあなたをフォローしました。</p>
            <button class="follow-button">フォローバックする</button>
          </div>
          <div class="notification">
            <div class="icon"></div>
            <p>おばあモモモチくんがあなたをフォローしました。</p>
            <button class="follow-button">フォローバックする</button>
          </div>
          <div class="notification">
            <div class="icon"></div>
            <p>
              おばあモモモチくんがあなたの投稿にコメントしました。「これはすごいね。フォローしますね。」
            </p>
          </div>
        </div>
        
         <jsp:include page="P2kensaku.jsp"></jsp:include>
        
    <script>
      // 全てのフォローボタンを取得
      const followButtons = document.querySelectorAll(".follow-button");

      // ボタンがクリックされた時の処理
      followButtons.forEach((button) => {
        button.addEventListener("click", function () {
          if (this.textContent === "フォローバックする") {
            this.textContent = "フォローしました"; // ボタンテキストを変更
          } else {
            this.textContent = "フォローバックする"; // 元に戻す
          }
        });
      });
    </script>
    <!-- トグル機能の実装:
    if-else文を使い、クリックされたボタンのテキストが「フォローバックする」か「フォローしました」かを確認し、テキストを切り替えてる。
    テキストが「フォローバックする」なら「フォローしました」に変更し、そうでなければ「フォローバックする」に戻るようにしてるからね。
    上記スクリプトにより、ユーザーがボタンを押すたびにテキストが交互に変わる動作が実現。 -->
  </body>
</html>

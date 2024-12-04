<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>コメント画面</title>
  <link rel="stylesheet" href="P2popup.css">
</head>
<body>

  <div class="comment-section">
    
    <div class="comment-item">
      <a href="P2ProfileStranger.jsp"><img src="image/ききゅう.jpg" alt="アイコン" class="icon"></a>
      <div class="comment-content">
        <p class="username">KAITO</p>
        <p class="comment">ええやんええやん</p>
      </div>tou
    </div>

    <div class="comment-item">
      <a href="P2ProfileStranger.jsp"><img src="image/ききゅう.jpg" alt="アイコン" class="icon"></a>
      <div class="comment-content">
        <p class="username">DAIDAI</p>
        <p class="comment">シュシュってるね！</p>
      </div>
    </div>

    <div class="comment-item">
        <a href="P2ProfileStranger.jsp"><img src="image/ききゅう.jpg" alt="アイコン" class="icon"></a>
        <div class="comment-content">
          <p class="username">TSUBASA</p>
          <p class="comment">シュシュってるね！</p>
        </div>
      </div>

    <div class="comment-item">
        <a href="P2ProfileStranger.jsp"><img src="image/ききゅう.jpg" alt="アイコン" class="icon"></a>
        <div class="comment-content">
          <p class="username">BOB</p>
          <p class="comment">シュシュってるね！</p>
        </div>
      </div>

    <div class="comment-item">
        <a href="P2ProfileStranger.jsp"><img src="image/ききゅう.jpg" alt="アイコン" class="icon"></a>
        <div class="comment-content">
          <p class="username">KIYOTA</p>
          <p class="comment">シュシュってるね！</p>
        </div>
      </div>

    <div class="comment-item">
        <a href="P2ProfileStranger.jsp"><img src="image/ききゅう.jpg" alt="アイコン" class="icon"></a>
        <div class="comment-content">
          <p class="username">ASAKA</p>
          <p class="comment">シュシュってるね！</p>
        </div>
      </div>
   
    <div class="comment-item">
        <a href="P2ProfileStranger.jsp"><img src="image/ききゅう.jpg" alt="アイコン" class="icon"></a>
        <div class="comment-content">
          <p class="username">UZAWA</p>
          <p class="comment">シュシュってるね！</p>
        </div>
      </div>

    <div class="comment-item">
        <a href="P2ProfileStranger.jsp"><img src="image/ききゅう.jpg" alt="アイコン" class="icon"></a>
        <div class="comment-content">
          <p class="username">KOBAYASHI</p>
          <p class="comment">シュシュってるね！</p>
        </div>
      </div>
  </div>

  

  <!-- 入力ボックスをDM画面から持ってくる -->
  <form action="" method="post" class="chat-form">
    <div class="chat-input">
      <input type="text" name="comment" id="comment" required placeholder="コメントを入力">
      <input type="submit" name="submit" id="submit" value="送信">
    </div>
  </form>

</body>
</html>

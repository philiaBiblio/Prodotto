<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>投稿確定画面</title>
    <link rel="stylesheet" href="P2PostConfirmation.css" />
  </head>
  <header>
    <div class="header">
      <div class="back-button" onclick="history.back()">
        <div class="arrow01"></div>
      </div>
    </div>
  </header>

  <body>
    <div class="container">
      <div class="sidebar">
        <ul>
          <li>
            <label><input type="text" placeholder="タグを追加" /></label>
          </li>
          <li>
            <label>
              <input
                type="checkbox"
                name="publicCom"
                id="publicCom"
                value="publicCom"
                checked
              />
              コメント ON</label
            >
          </li>
        </ul>
      </div>
      <div class="icon">
        <img id="iconImage" src="image/ききゅう.jpg" alt="icon" />
        <label for="fileInput">サムネイル画像を選択</label>
        <input
          type="file"
          name="icon"
          id="fileInput"
          accept="image/jpeg, image/png"
        />

        <div class="controls">
          <button class="prev">&lt;</button>
          <button class="play">▶</button>
        </div>

        <div class="upload-button">
          <a href="P2Timeline.jsp" class="link-button"
            >　タイムラインに投稿する！　</a
          >
        </div>
      </div>
    </div>

    <audio id="audio-player" controls style="display: none"></audio>

    <script>
      document.getElementById("fileInput").addEventListener("change", function (event) {
        const file = event.target.files[0];
        if (file) {
          const reader = new FileReader();
          reader.onload = function (e) {
            document.getElementById("iconImage").src = e.target.result;
          };
          reader.readAsDataURL(file);
        }
      });

      const playButton = document.querySelector(".play");
      const audioPlayer = document.getElementById("audio-player");

      playButton.addEventListener("click", function () {
        if (audioPlayer.paused) {
          audioPlayer.play();
          playButton.textContent = "⏸";
        } else {
          audioPlayer.pause();
          playButton.textContent = "▶";
        }
      });
    </script>
  </body>
</html>

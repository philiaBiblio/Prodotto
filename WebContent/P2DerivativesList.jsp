<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
      integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=settings"
    />
    <link rel="stylesheet" href="P2DerivativesList.css" />
    <title>派生一覧画面</title>
  </head>
  <body>
    <!-- グリッドコンテナ -->
    <section class="video-grid">
      <div class="video-card">
        <div class="thumbnail-placeholder">
          <img
            src="image/"
            alt="Video Thumbnail"
            class="thumbnail"
          />
          <button class="play-button">▶️</button>
          <!-- 音声再生ボタン -->
          <audio class="audio-player" src="ジャマイカテスト.mp3"></audio>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
            <img
              src="image/"
              alt="profile icon"
              class="profile-icon"
            />
          </a>
          <div class="like-comment">
            <button class="comment" onclick="openPopup()">
              <img
                src="image/"
                alt="comment icon"
                style="width: 20px; height: 20px"
              />
              <span>5</span>
            </button>

            <button class="heart" onclick="changeImage('heartImage2')">
              <img
                id="heartImage2"
                src="image/Heart-512x512 test.png"
                alt="like icon"
                style="width: 20px; height: 20px"
              />
              <span>10</span>
            </button>

            <button>
                <span>
                  <a href="P2Recording.jsp">
                    <div class="nav_icon">
                      <i class="gg-duplicate"></i>
                    </div>
                  </a>
                </span>
              </button>
          </div>
        </div>
      </div>
    </section>

    <!-- 音楽プレイヤー -->
    <div class="music-player" style="display: none">
      <!-- 初期表示を非表示に -->
      <div class="song-bar">
        <div class="song-infos">
          <div class="image-container">
            <img src="." alt="" />
          </div>
          <div class="song-description">
            <p class="title">
              Watashitachi wa Sou Yatte Ikite Iku Jinshu na no
            </p>
            <p class="artist">Masaru Yokoyama</p>
          </div>
        </div>
        <div class="icons">
          <i class="far fa-heart"></i>
          <i class="fas fa-compress"></i>
        </div>
      </div>
      <div class="progress-controller">
        <div class="control-buttons">
          <i class="fas fa-random"></i>
          <i class="fas fa-step-backward"></i>
          <i class="play-pause fas fa-play"></i>
          <i class="fas fa-step-forward"></i>
          <i class="fas fa-undo-alt"></i>
        </div>
        <div class="progress-container">
          <span class="current-time">0:00</span>
          <!-- 現在の再生時間 -->
          <div class="progress-bar">
            <div class="progress"></div>
          </div>
          <span class="duration">3:15</span>
          <!-- 全体の音楽の時間 -->
        </div>
      </div>
      <div class="other-features">
        <i class="fas fa-list-ul"></i>
        <i class="fas fa-desktop"></i>

        <!-- 音量コントロール -->
        <div class="volume-bar">
          <i class="fas fa-volume-down"></i>
          <div class="progress-bar">
            <div class="progress"></div>
          </div>
        </div>
      </div>
    </div>
    
    <jsp:include page="P2kensaku.jsp"></jsp:include>
    <script src="audioPlayer.js"></script>
    <script src="https://unpkg.com/wavesurfer.js"></script>
  </body>
</html>

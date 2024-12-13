<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="images/png" rel="icon" href="images/icons8-youtube.png" />
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
      <jsp:include page="P2kensaku.jsp"></jsp:include>
    <link rel="stylesheet" href="P2Ranking.css" />
    <title>ProDotto</title>
  </head>

  <body>
    

    <!-- ************************１***************************** -->
    <div class="section-header">
        <h3 class="section-title">急上昇ランキング</h3>
        
      </div>
      <div class="scroll-container">
        <button class="scroll-left" id="scroll-left-1">◀</button>
        <div class="video-grid" id="video-grid-1">


          <!-- 動画カードがここに配置される -->
          
          
        </div>
        <button class="scroll-right" id="scroll-right-1">▶</button>
      </div>
  
  
  
  
      <!-- ************************２***************************** -->
      <div class="section-header">
        <h3 class="section-title">イイね数ランキング</h3>
        
      </div>
      <div class="scroll-container">
        <button class="scroll-left" id="scroll-left-2">◀</button>
        <div class="video-grid" id="video-grid-2">
          

          <!-- 動画カードがここに配置される -->
          
          
        </div>
        <button class="scroll-right" id="scroll-right-2">▶</button>
      </div>




      <!-- ************************３***************************** -->
      <div class="section-header">
        <h3 class="section-title">殿堂</h3>
        
      </div>
      <div class="scroll-container">
        <button class="scroll-left" id="scroll-left-3">◀</button>
        <div class="video-grid" id="video-grid-3">
          

          <!-- 動画カードがここに配置される -->
          
          
        </div>
        <button class="scroll-right" id="scroll-right-3">▶</button>
      </div>


      <main>
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
    </main>
    

     
    <script>
        const scrollLeftButton1 = document.getElementById("scroll-left-1");
      const scrollRightButton1 = document.getElementById("scroll-right-1");
      const videoGrid1 = document.getElementById("video-grid-1");

      scrollLeftButton1.addEventListener("click", () => {
        videoGrid1.scrollBy({
          left: -150, // スクロールする距離（左）
          behavior: "smooth", // スムーズスクロール
        });
      });

      scrollRightButton1.addEventListener("click", () => {
        videoGrid1.scrollBy({
          left: 150, // スクロールする距離（右）
          behavior: "smooth", // スムーズスクロール
        });
      });

      // 2行目のボタンのイベントハンドラー
      const scrollLeftButton2 = document.getElementById("scroll-left-2");
      const scrollRightButton2 = document.getElementById("scroll-right-2");
      const videoGrid2 = document.getElementById("video-grid-2");

      scrollLeftButton2.addEventListener("click", () => {
        videoGrid2.scrollBy({
          left: -150, // スクロールする距離（左）
          behavior: "smooth", // スムーズスクロール
        });
      });

      scrollRightButton2.addEventListener("click", () => {
        videoGrid2.scrollBy({
          left: 150, // スクロールする距離（右）
          behavior: "smooth", // スムーズスクロール
        });
      });


      // 3行目のボタンのイベントハンドラー
	  const scrollLeftButton3 = document.getElementById("scroll-left-3");
	  const scrollRightButton3 = document.getElementById("scroll-right-3");
	  const videoGrid3 = document.getElementById("video-grid-3");

	  scrollLeftButton3.addEventListener("click", () => {
		  videoGrid3.scrollBy({
			  left: -150, // スクロールする距離（左）
			  behavior: "smooth", // スムーズスクロール
			  });
		  });

	  scrollRightButton3.addEventListener("click", () => {
		  videoGrid3.scrollBy({
			  left: 150, // スクロールする距離（右）
			  behavior: "smooth", // スムーズスクロール
			  });
		  });

    </script>
    <script src="https://unpkg.com/wavesurfer.js"></script>
    
   
    
  </body>
</html>

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
    <link rel="stylesheet" href="P2kensaku.css" />
    <title>ProDotto</title>
  </head>

  <body>
    <header class="header">
      <div class="header_container">
        <div class="none"></div>
        <div class="search">
          <!-- フィルターボタン -->
          <select
            id="filter"
            class="filter-button"
            onChange="location.href=value;"
          >
            <option value="title">動画タイトル</option>
            <option value="P2UserSearch.jsp">アカウント名</option>
          </select>

          <!-- 検索バー -->
          <input type="text" id="search" placeholder="Search" />
          <i class="fa-solid fa-magnifying-glass"></i>
        </div>
        <!-- <div class="user">
          <div class="icon">
            <i class="fa-solid fa-video"></i>
            <i class="fa-solid fa-grip"></i>
            <i class="fa-solid fa-bell"></i>
          </div>
          <div class="img">
            <img src="images/logo.png" alt="" />
          </div>
        </div> -->
      </div>
    </header>

    <section class="nav" id="navbar">
      <nav class="nav_container">
        <div>
          <a href="#" class="nav_link nav_logo">
            <i class="fa-solid fa-bars nav_icon"></i>
            <span class="logo_name">
              <!-- ここにProDottoアイコンを入れる -->
              <i class="fab fa-"></i>
              ProDotto
            </span>
          </a>

          <div class="nav_list">
            <div class="nav_items navtop">
              <a href="P2Timeline.jsp" class="nav_link navtop active">
                <i class="fa fa-house nav_icon"></i>
                <span class="nav_name">タイムライン</span>
              </a>

              <a href="P2DM.jsp" class="nav_link navtop nav_soroe">
                <!-- <i class="fa fa-compass nav_icon"></i> -->
                <div class="nav_icon nav_soroe">
                  <i class="gg-mail"></i>
                </div>
                <span class="nav_name">DM</span>
              </a>

              <a href="P2Ranking.jsp" class="nav_link navtop nav_soroe">
                <!-- <i class="fa-brands fa-tiktok nav_icon"></i> -->
                <div class="nav_icon nav_soroe">
                  <i class="gg-crown"></i>
                </div>
                <span class="nav_name">ランキング</span>
              </a>

              <a
                href="P2PostAndRecording.jsp"
                class="nav_link navtop nav_soroe"
              >
                <!-- <i class="fa-solid fa-users nav_icon"></i> -->
                <div class="nav_icon">
                  <i class="gg-add-r"></i>
                </div>
                <span class="nav_name">投稿</span>
              </a>

              <a href="P2ProfileMine.jsp" class="nav_link navtop nav_soroe">
                <!-- <i class="fa-solid fa-users nav_icon"></i> -->
                <div class="nav_icon nav_soroe">
                  <i class="gg-boy"></i>
                </div>
                <span class="nav_name">プロフィール</span>
              </a>

              <a href="P2Settings.jsp" class="nav_link navtop">
                <!-- <i class="fa-solid fa-video nav_icon"></i> -->
                <div class="nav_icon nav_soroe">
                  <span class="material-symbols-outlined"> settings </span>
                </div>
                <span class="nav_name">設定</span>
              </a>

              <!-- <a href="#" class="nav_link navtop">
                <i class="fa-solid fa-clock-rotate-left nav_icon"></i>
                <span class="nav_name">履歴</span>
              </a>
              <a href="#" class="nav_link navtop">
                <i class="fa-solid fa-thumbs-up nav_icon"></i>
                <span class="nav_name">いいねした動画</span>
              </a> -->
            </div>
          </div>
        </div>
      </nav>
    </section>

    <script src="audioPlayer.js"></script>
    <script src="https://unpkg.com/wavesurfer.js"></script>
  </body>
</html>

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
    <link rel="stylesheet" href="P1TLManagement.css" />
    <title>ProDotto</title>
  </head>

  <body>
    <header class="header">
      <div class="header_container">
        <div class="none"></div>
        <div class="search">
          <!-- フィルターボタン -->
          <select id="filter" class="filter-button">
            <option value="title">動画タイトル</option>
            <option value="account">アカウント名</option>
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
              <a href="P1UserManegement.jsp" class="nav_link navtop">
                <!-- <i class="fa fa-house nav_icon"></i> -->
                <div class="nav_icon">
                  <i class="gg-profile"></i>
                </div>
                <span class="nav_name">ユーザー管理</span>
              </a>

              <a href="P1EventManegement.jsp" class="nav_link navtop">
                <!-- <i class="fa fa-house nav_icon"></i> -->
                <div class="nav_icon nav_soroe">
                  <i class="gg-flag-alt"></i>
                </div>
                <span class="nav_name">イベント管理</span>
              </a>

              <a href="P1AdminSetting.jsp" class="nav_link navtop">
                <!-- <i class="fa-solid fa-video nav_icon"></i> -->
                <div class="nav_icon">
                  <span class="material-symbols-outlined"> settings </span>
                </div>
                <span class="nav_name">設定</span>
              </a>

              <a href="P1TLManagement.jsp" class="nav_link navtop active">
                <i class="fa fa-house nav_icon"></i>
                <span class="nav_name">管理者タイムライン</span>
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

    <!-- 追加するコード -->
    <main>
      <!-- グリッドコンテナ -->
      <section class="video-grid">
        <div class="video-card">
          <div class="thumbnail-placeholder">
            <img
              src="image/サムネジャマイカ.jpg"
              alt="Video Thumbnail"
              class="thumbnail"
            />
            <button class="play-button">▶️</button>
            <!-- 音声再生ボタン -->
            <audio class="audio-player" src="ジャマイカテスト.mp3"></audio>
          </div>

          <div class="video-info">
            <a href="プロフィール画面.jsp" class="profile-info">
              <img
                src="image/ききゅう.jpg"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
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

              <button id="openDialogButton" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                  <button type="button" class="dialogButton" id="yesButton">
                    はい
                  </button>
                  <button type="button" class="dialogButton" id="noButton">
                    いいえ
                  </button>
                </div>
              </dialog>

              <dialog id="confirmationDialog">
                <p>削除しました</p>
                <button
                  type="button"
                  class="dialogButton"
                  id="closeConfirmationButton"
                >
                  閉じる
                </button>
              </dialog>
            </div>
          </div>
        </div>

        <!-- 他の動画カードもここに追加 -->
        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="プロフィール.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>7</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage')">
                <img
                  id="heartImage"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>10</span>
              </button>

              <button id="openDialogButton1" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog1">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton1">はい</button>
                    <button type="button" class="dialogButton" id="noButton1">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog1">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton1">閉じる</button>
            </dialog>
            </div>
          </div>
        </div>

        <!-- 他の動画カードもここに追加 -->
        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>55</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage1')">
                <img
                  id="heartImage1"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>100</span>
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

              <button id="openDialogButton2" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog2">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton2">はい</button>
                    <button type="button" class="dialogButton" id="noButton2">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog2">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton2">閉じる</button>
            </dialog>
            </div>
          </div>
        </div>

        <!-- 他の動画カードもここに追加 -->
        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>0</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage3')">
                <img
                  id="heartImage3"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>0</span>
              </button>

              <button id="openDialogButton3" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog3">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton3">はい</button>
                    <button type="button" class="dialogButton" id="noButton3">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog3">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton3">閉じる</button>
            </dialog>
              
            </div>
          </div>
        </div>

        <!-- 他の動画カードもここに追加 -->
        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>100</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage4')">
                <img
                  id="heartImage4"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>1022</span>
              </button>

              <button id="openDialogButton20" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog20">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton20">はい</button>
                    <button type="button" class="dialogButton" id="noButton20">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog20">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton20">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <!-- 他の動画カードもここに追加 -->
        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>230</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage5')">
                <img
                  id="heartImage5"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>957</span>
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

              <button id="openDialogButton200" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog200">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton200">はい</button>
                    <button type="button" class="dialogButton" id="noButton200">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog200">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton200">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <!-- 他の動画カードもここに追加 -->
        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>0</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage6')">
                <img
                  id="heartImage6"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>0</span>
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

              <button id="openDialogButton2000" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog2000">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton2000">はい</button>
                    <button type="button" class="dialogButton" id="noButton2000">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog2000">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton2000">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <!-- 他の動画カードもここに追加 -->
        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>1</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage7')">
                <img
                  id="heartImage7"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>11</span>
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

              <button id="openDialogButton20000" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog20000">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton20000">はい</button>
                    <button type="button" class="dialogButton" id="noButton20000">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog20000">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton20000">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <!-- 他の動画カードもここに追加 -->
        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>43</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage8')">
                <img
                  id="heartImage8"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>78</span>
              </button>

              <button id="openDialogButton22" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog22">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton22">はい</button>
                    <button type="button" class="dialogButton" id="noButton22">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog22">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton22">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <!-- 他の動画カードもここに追加 -->
        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>0</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage9')">
                <img
                  id="heartImage9"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>10</span>
              </button>

              <button id="openDialogButton222" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog222">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton222">はい</button>
                    <button type="button" class="dialogButton" id="noButton222">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog222">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton222">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <!-- 他の動画カードもここに追加 -->
        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>300</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage10')">
                <img
                  id="heartImage10"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>56</span>
              </button>

              <button id="openDialogButton21" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog21">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton21">はい</button>
                    <button type="button" class="dialogButton" id="noButton21">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog21">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton21">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <!-- 他の動画カードもここに追加 -->
        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>60</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage11')">
                <img
                  id="heartImage11"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>4</span>
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

              <button id="openDialogButton211" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog211">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton211">はい</button>
                    <button type="button" class="dialogButton" id="noButton211">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog211">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton211">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>98</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage12')">
                <img
                  id="heartImage12"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>233</span>
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

              <button id="openDialogButton23" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog23">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton23">はい</button>
                    <button type="button" class="dialogButton" id="noButton23">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog23">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton23">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>32</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage13')">
                <img
                  id="heartImage13"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>90</span>
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

              <button id="openDialogButton24" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog24">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton24">はい</button>
                    <button type="button" class="dialogButton" id="noButton24">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog24">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton24">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>7</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage14')">
                <img
                  id="heartImage14"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>30</span>
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

              <button id="openDialogButton25" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog25">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton25">はい</button>
                    <button type="button" class="dialogButton" id="noButton25">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog25">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton25">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>59</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage15')">
                <img
                  id="heartImage15"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>101</span>
              </button>

              <button id="openDialogButton26" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog26">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton26">はい</button>
                    <button type="button" class="dialogButton" id="noButton26">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog26">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton26">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>1056</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage16')">
                <img
                  id="heartImage16"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>956</span>
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

              <button id="openDialogButton27" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog27">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton27">はい</button>
                    <button type="button" class="dialogButton" id="noButton27">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog27">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton27">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>745</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage17')">
                <img
                  id="heartImage17"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>1089</span>
              </button>

              <button id="openDialogButton28" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog28">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton28">はい</button>
                    <button type="button" class="dialogButton" id="noButton28">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog28">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton28">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>73</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage18')">
                <img
                  id="heartImage18"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>15</span>
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

              <button id="openDialogButton29" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog29">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton29">はい</button>
                    <button type="button" class="dialogButton" id="noButton29">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog29">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton29">閉じる</button>
            </dialog>

            </div>
          </div>
        </div>

        <div class="video-card">
          <div class="thumbnail-placeholder">
            <button class="play-button">▶️</button>
          </div>

          <div class="video-info">
            <a href="P2ProfileStranger.jsp" class="profile-info">
              <img
                src="image/アイコン卵.png"
                alt="profile icon"
                class="profile-icon"
              />
            </a>
            <div class="like-comment">
              <button class="comment" onclick="openPopup()">
                <img
                  src="image/こめんと1.png"
                  alt="comment icon"
                  style="width: 20px; height: 20px"
                />
                <span>5</span>
              </button>

              <button class="heart" onclick="changeImage('heartImage19')">
                <img
                  id="heartImage19"
                  src="image/Heart-512x512 test.png"
                  alt="like icon"
                  style="width: 20px; height: 20px"
                />
                <span>13</span>
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

              <button id="openDialogButton233" onclick="test('trash')">
                <span>
                  <div class="trash">
                    <i class="gg-trash"></i>
                  </div>
                </span>
              </button>

              <dialog id="myDialog233">
                <p>この投稿を削除しますか？</p>
                <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton233">はい</button>
                    <button type="button" class="dialogButton" id="noButton233">いいえ</button>
                </div>
            </dialog>
        
            <dialog id="confirmationDialog233">
                <p>削除しました</p>
                <button type="button" class="dialogButton" id="closeConfirmationButton233">閉じる</button>
            </dialog>

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
    </main>

    <script src="audioPlayer.js"></script>
    <script src="https://unpkg.com/wavesurfer.js"></script>
  </body>
</html>

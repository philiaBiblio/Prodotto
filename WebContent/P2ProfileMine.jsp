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
    <link rel="stylesheet" href="P2ProfileMine.css" />
    <title>ProDotto</title>
  </head>

  <body>
    <header class="profile-header">
        
      <div class="leftheader">
        <img
          src="image/ききゅう.jpg"
          alt="Profile Icon"
          class="profile-header-icon"
        />

        <div class="user-details">
            <h2 class="username">ユーザーネーム</h2>
            <p class="user-id">@ユーザーID</p>
            <div class="follower-info">
              <span class="follower-count">フォロワー: 100</span>
              <span class="following-count">フォロー中: 50</span>
            </div>
        </div>

      </div>
      
      <div class="rightheader">
        <div class="button-group2">
          <a href="P2Notifications.jsp">
            <button class="notification-button toggle-notification" id="notificationButton">
              <i class="fas fa-bell  changeb"></i>
            </button>
          </a>
          <a href="P2ProfileEdit.jsp" class="edit-profile-button">
            <i class="fas fa-pen changeb"></i>
          </a>
        </div>
      </div>
       

    </header>

        <!-- 1行目のタイトルと左右ボタン -->
    <div class="section-header">
        <h3 class="section-title">セッション</h3>
        <button class="show-all-button">すべて表示</button>
      </div>
      <div class="scroll-container">
        <button class="scroll-left" id="scroll-left-1">◀</button>
        <div class="video-grid" id="video-grid-1">

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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
                    <div class="nav_icon trash">
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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage3')">
                  <img
                    id="heartImage3"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
  
                <button id="openDialogButton1" onclick="test('trash')">
                  <span>
                    <div class="nav_icon trash">
                      <i class="gg-trash"></i>
                    </div>
                  </span>
                </button>
  
                <dialog id="myDialog1">
                  <p>この投稿を削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton1">
                      はい
                    </button>
                    <button type="button" class="dialogButton" id="noButton1">
                      いいえ
                    </button>
                  </div>
                </dialog>
  
                <dialog id="confirmationDialog1">
                  <p>削除しました</p>
                  <button
                    type="button"
                    class="dialogButton"
                    id="closeConfirmationButton1"
                  >
                    閉じる
                  </button>
                </dialog>
              </div>
            </div>
          </div>

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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage4')">
                  <img
                    id="heartImage4"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
  
                <button id="openDialogButton2" onclick="test('trash')">
                  <span>
                    <div class="nav_icon trash">
                      <i class="gg-trash"></i>
                    </div>
                  </span>
                </button>
  
                <dialog id="myDialog2">
                  <p>この投稿を削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton2">
                      はい
                    </button>
                    <button type="button" class="dialogButton" id="noButton2">
                      いいえ
                    </button>
                  </div>
                </dialog>
  
                <dialog id="confirmationDialog2">
                  <p>削除しました</p>
                  <button
                    type="button"
                    class="dialogButton"
                    id="closeConfirmationButton2"
                  >
                    閉じる
                  </button>
                </dialog>
              </div>
            </div>
          </div>

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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage5')">
                  <img
                    id="heartImage5"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
  
                <button id="openDialogButton3" onclick="test('trash')">
                  <span>
                    <div class="nav_icon trash">
                      <i class="gg-trash"></i>
                    </div>
                  </span>
                </button>
  
                <dialog id="myDialog3">
                  <p>この投稿を削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton3">
                      はい
                    </button>
                    <button type="button" class="dialogButton" id="noButton3">
                      いいえ
                    </button>
                  </div>
                </dialog>
  
                <dialog id="confirmationDialog3">
                  <p>削除しました</p>
                  <button
                    type="button"
                    class="dialogButton"
                    id="closeConfirmationButton3"
                  >
                    閉じる
                  </button>
                </dialog>
              </div>
            </div>
          </div>

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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage6')">
                  <img
                    id="heartImage6"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
  
                <button id="openDialogButton4" onclick="test('trash')">
                  <span>
                    <div class="nav_icon trash">
                      <i class="gg-trash"></i>
                    </div>
                  </span>
                </button>
  
                <dialog id="myDialog4">
                  <p>この投稿を削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton4">
                      はい
                    </button>
                    <button type="button" class="dialogButton" id="noButton4">
                      いいえ
                    </button>
                  </div>
                </dialog>
  
                <dialog id="confirmationDialog4">
                  <p>削除しました</p>
                  <button
                    type="button"
                    class="dialogButton"
                    id="closeConfirmationButton4"
                  >
                    閉じる
                  </button>
                </dialog>
              </div>
            </div>
          </div>

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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage7')">
                  <img
                    id="heartImage7"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
  
                <button id="openDialogButton5" onclick="test('trash')">
                  <span>
                    <div class="nav_icon trash">
                      <i class="gg-trash"></i>
                    </div>
                  </span>
                </button>
  
                <dialog id="myDialog5">
                  <p>この投稿を削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton5">
                      はい
                    </button>
                    <button type="button" class="dialogButton" id="noButton5">
                      いいえ
                    </button>
                  </div>
                </dialog>
  
                <dialog id="confirmationDialog5">
                  <p>削除しました</p>
                  <button
                    type="button"
                    class="dialogButton"
                    id="closeConfirmationButton5"
                  >
                    閉じる
                  </button>
                </dialog>
              </div>
            </div>
          </div>

          

          <!-- 動画カードがここに配置される -->
        </div>
        <button class="scroll-right" id="scroll-right-1">▶</button>
      </div>
  
      <!-- 2行目のタイトルと左右ボタン -->
      <div class="section-header">
        <h3 class="section-title">自由投稿</h3>
        <button class="show-all-button">すべて表示</button>
      </div>
      <div class="scroll-container">
        <button class="scroll-left" id="scroll-left-2">◀</button>
        <div class="video-grid" id="video-grid-2">

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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage8')">
                  <img
                    id="heartImage8"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
  
                <button id="openDialogButton12" onclick="test('trash')">
                  <span>
                    <div class="nav_icon trash">
                      <i class="gg-trash"></i>
                    </div>
                  </span>
                </button>
  
                <dialog id="myDialog12">
                  <p>この投稿を削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton12">
                      はい
                    </button>
                    <button type="button" class="dialogButton" id="noButton12">
                      いいえ
                    </button>
                  </div>
                </dialog>
  
                <dialog id="confirmationDialog12">
                  <p>削除しました</p>
                  <button
                    type="button"
                    class="dialogButton"
                    id="closeConfirmationButton12"
                  >
                    閉じる
                  </button>
                </dialog>
              </div>
            </div>
          </div>

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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage9')">
                  <img
                    id="heartImage9"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
  
                <button id="openDialogButton8" onclick="test('trash')">
                  <span>
                    <div class="nav_icon trash">
                      <i class="gg-trash"></i>
                    </div>
                  </span>
                </button>
  
                <dialog id="myDialog8">
                  <p>この投稿を削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton8">
                      はい
                    </button>
                    <button type="button" class="dialogButton" id="noButton8">
                      いいえ
                    </button>
                  </div>
                </dialog>
  
                <dialog id="confirmationDialog8">
                  <p>削除しました</p>
                  <button
                    type="button"
                    class="dialogButton"
                    id="closeConfirmationButton6"
                  >
                    閉じる
                  </button>
                </dialog>
              </div>
            </div>
          </div>

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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage10')">
                  <img
                    id="heartImage10"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
  
                <button id="openDialogButton9" onclick="test('trash')">
                  <span>
                    <div class="nav_icon trash">
                      <i class="gg-trash"></i>
                    </div>
                  </span>
                </button>
  
                <dialog id="myDialog9">
                  <p>この投稿を削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton9">
                      はい
                    </button>
                    <button type="button" class="dialogButton" id="noButton9">
                      いいえ
                    </button>
                  </div>
                </dialog>
  
                <dialog id="confirmationDialog9">
                  <p>削除しました</p>
                  <button
                    type="button"
                    class="dialogButton"
                    id="closeConfirmationButton9"
                  >
                    閉じる
                  </button>
                </dialog>
              </div>
            </div>
          </div>

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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage11')">
                  <img
                    id="heartImage11"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
  
                <button id="openDialogButton0" onclick="test('trash')">
                  <span>
                    <div class="nav_icon trash">
                      <i class="gg-trash"></i>
                    </div>
                  </span>
                </button>
  
                <dialog id="myDialog0">
                  <p>この投稿を削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton0">
                      はい
                    </button>
                    <button type="button" class="dialogButton" id="noButton0">
                      いいえ
                    </button>
                  </div>
                </dialog>
  
                <dialog id="confirmationDialog0">
                  <p>削除しました</p>
                  <button
                    type="button"
                    class="dialogButton"
                    id="closeConfirmationButton0"
                  >
                    閉じる
                  </button>
                </dialog>
              </div>
            </div>
          </div>

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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage12')">
                  <img
                    id="heartImage12"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
  
                <button id="openDialogButton00" onclick="test('trash')">
                  <span>
                    <div class="nav_icon trash">
                      <i class="gg-trash"></i>
                    </div>
                  </span>
                </button>
  
                <dialog id="myDialog00">
                  <p>この投稿を削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton00">
                      はい
                    </button>
                    <button type="button" class="dialogButton" id="noButton00">
                      いいえ
                    </button>
                  </div>
                </dialog>
  
                <dialog id="confirmationDialog00">
                  <p>削除しました</p>
                  <button
                    type="button"
                    class="dialogButton"
                    id="closeConfirmationButton00"
                  >
                    閉じる
                  </button>
                </dialog>
              </div>
            </div>
          </div>

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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage13')">
                  <img
                    id="heartImage13"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
  
                <button id="openDialogButton000" onclick="test('trash')">
                  <span>
                    <div class="nav_icon trash">
                      <i class="gg-trash"></i>
                    </div>
                  </span>
                </button>
  
                <dialog id="myDialog000">
                  <p>この投稿を削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton000">
                      はい
                    </button>
                    <button type="button" class="dialogButton" id="noButton000">
                      いいえ
                    </button>
                  </div>
                </dialog>
  
                <dialog id="confirmationDialog000">
                  <p>削除しました</p>
                  <button
                    type="button"
                    class="dialogButton"
                    id="closeConfirmationButton000"
                  >
                    閉じる
                  </button>
                </dialog>
              </div>
            </div>
          </div>

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
              <a href="P1AdminProfile.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage14')">
                  <img
                    id="heartImage14"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
  
                <button id="openDialogButton0000" onclick="test('trash')">
                  <span>
                    <div class="nav_icon trash">
                      <i class="gg-trash"></i>
                    </div>
                  </span>
                </button>
  
                <dialog id="myDialog00000">
                  <p>この投稿を削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="button" class="dialogButton" id="yesButton0000">
                      はい
                    </button>
                    <button type="button" class="dialogButton" id="noButton0000">
                      いいえ
                    </button>
                  </div>
                </dialog>
  
                <dialog id="confirmationDialog0000">
                  <p>削除しました</p>
                  <button
                    type="button"
                    class="dialogButton"
                    id="closeConfirmationButton0000"
                  >
                    閉じる
                  </button>
                </dialog>
              </div>
            </div>
          </div>

          <!-- 動画カードがここに配置される -->
        </div>
        <button class="scroll-right" id="scroll-right-2">▶</button>
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
    
  <jsp:include page="P2kensaku.jsp"></jsp:include>


    <script src="audioPlayer.js"></script>
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

    </script>
    <script src="https://unpkg.com/wavesurfer.js"></script>
  </body>
</html>

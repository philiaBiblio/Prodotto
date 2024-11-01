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
    <link rel="stylesheet" href="P2Ranking.css" />
    <title>ProDotto</title>
  </head>

  <body>
    


        <!-- 1行目のタイトルと左右ボタン -->
    <div class="section-header">
        <h3 class="section-title">急上昇ランキング</h3>
        
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              </div>
            </div>
          </div>


          <div class="video-card">
            <div class="thumbnail-placeholder">
              <img
                src="image/heartfield.jpg"
                alt="Video Thumbnail"
                class="thumbnail"
              />
              <button class="play-button">▶️</button>
              <!-- 音声再生ボタン -->
              <audio class="audio-player" src="KICK OUT (1).mp3"></audio>
            </div>
  
            <div class="video-info">
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              </div>
            </div>
          </div>

          <!-- 動画カードがここに配置される -->
        </div>
        <button class="scroll-right" id="scroll-right-1">▶</button>
      </div>
  
      <!-- 2行目のタイトルと左右ボタン -->
      <div class="section-header">
        <h3 class="section-title">イイね数ランキング</h3>
        
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage15')">
                  <img
                    id="heartImage15"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage16')">
                  <img
                    id="heartImage16"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage17')">
                  <img
                    id="heartImage17"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage18')">
                  <img
                    id="heartImage18"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage19')">
                  <img
                    id="heartImage19"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage20')">
                  <img
                    id="heartImage20"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage21')">
                  <img
                    id="heartImage21"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage22')">
                  <img
                    id="heartImage22"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage23')">
                  <img
                    id="heartImage23"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
              </div>
            </div>
          </div>

          <!-- 動画カードがここに配置される -->
        </div>
        <button class="scroll-right" id="scroll-right-2">▶</button>
      </div>

      <!-- 3行目のタイトルと左右ボタン -->
      <div class="section-header">
        <h3 class="section-title">殿堂</h3>
        
      </div>
      <div class="scroll-container">
        <button class="scroll-left" id="scroll-left-3">◀</button>
        <div class="video-grid" id="video-grid-3">

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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage24')">
                  <img
                    id="heartImage24"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage25')">
                  <img
                    id="heartImage25"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage26')">
                  <img
                    id="heartImage26"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage27')">
                  <img
                    id="heartImage27"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage28')">
                  <img
                    id="heartImage28"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage29')">
                  <img
                    id="heartImage29"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage30')">
                  <img
                    id="heartImage30"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage31')">
                  <img
                    id="heartImage31"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage32')">
                  <img
                    id="heartImage32"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage33')">
                  <img
                    id="heartImage33"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
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
              <a href="P2ProfileStranger.jsp" class="profile-info">
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
  
                <button class="heart" onclick="changeImage('heartImage34')">
                  <img
                    id="heartImage34"
                    src="image/Heart-512x512 test.png"
                    alt="like icon"
                    style="width: 20px; height: 20px"
                  />
                  <span>10</span>
                </button>
              </div>
            </div>
          </div>

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
    
 <%--  <jsp:include page="P2kensaku.jsp"></jsp:include>  --%>
     
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

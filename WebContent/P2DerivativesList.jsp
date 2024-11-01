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
            src="image/サムネジャマイカ.jpg"
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

      <!-- 他の動画カードもここに追加 -->
      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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

      <!-- 他の動画カードもここに追加 -->
      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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
          </div>
        </div>
      </div>

      <!-- 他の動画カードもここに追加 -->
      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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

      <!-- 他の動画カードもここに追加 -->
      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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

      <!-- 他の動画カードもここに追加 -->
      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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
          </div>
        </div>
      </div>

      <!-- 他の動画カードもここに追加 -->
      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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
          </div>
        </div>
      </div>

      <!-- 他の動画カードもここに追加 -->
      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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
          </div>
        </div>
      </div>

      <!-- 他の動画カードもここに追加 -->
      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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

      <!-- 他の動画カードもここに追加 -->
      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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

      <!-- 他の動画カードもここに追加 -->
      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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

      <!-- 他の動画カードもここに追加 -->
      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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
          </div>
        </div>
      </div>

      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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
          </div>
        </div>
      </div>

      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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
          </div>
        </div>
      </div>

      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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
          </div>
        </div>
      </div>

      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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

      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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
              <span>10356</span>
            </button>

            <button class="heart" onclick="changeImage('heartImage16')">
              <img
                id="heartImage16"
                src="image/Heart-512x512 test.png"
                alt="like icon"
                style="width: 20px; height: 20px"
              />
              <span>95060</span>
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

      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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
              <span>74567</span>
            </button>

            <button class="heart" onclick="changeImage('heartImage17')">
              <img
                id="heartImage17"
                src="image/Heart-512x512 test.png"
                alt="like icon"
                style="width: 20px; height: 20px"
              />
              <span>108999</span>
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

      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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
          </div>
        </div>
      </div>

      <div class="video-card">
        <div class="thumbnail-placeholder">
          <button class="play-button">▶️</button>
        </div>

        <div class="video-info">
          <a href="P2ProfileMine.jsp" class="profile-info">
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

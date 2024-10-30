<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      property="og:image"
      content="https://raw.githubusercontent.com/naomiaro/waveform-playlist/master/img/effects.png"
    />
    <meta property="og:image:height" content="401" />
    <meta property="og:image:width" content="1039" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="main.css" />
    <link rel="stylesheet" href="P2Recording.css" />
    <link
      rel="canonical"
      href="https://naomiaro.github.io/waveform-playlist/record.jsp"
    />
    <link
      rel="alternate"
      type="application/rss+xml"
      title="Waveform Playlist"
      href="https://naomiaro.github.io/waveform-playlist/feed.xml"
    />
    <script
      src="https://kit.fontawesome.com/032b012e04.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <script>
      (function (i, s, o, g, r, a, m) {
        i["GoogleAnalyticsObject"] = r;
        (i[r] =
          i[r] ||
          function () {
            (i[r].q = i[r].q || []).push(arguments);
          }),
          (i[r].l = 1 * new Date());
        (a = s.createElement(o)), (m = s.getElementsByTagName(o)[0]);
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m);
      })(
        window,
        document,
        "script",
        "//www.google-analytics.com/analytics.js",
        "ga"
      );

      ga("create", "UA-62186746-1", "auto");
      ga("send", "pageview");
    </script>
    <main class="container" title="demo">
      <div class="wrapper">
        <article class="post">
          <div class="post-content">
            <div id="top-bar" class="playlist-top-bar">
              <div
                style="position: relative; left: 0; right: 0; margin-left: 0px"
                class="playlist-time-scale"
              ></div>
              <div class="playlist-toolbar">
                <div class="btn-group">
                  <button
                    type="button"
                    class="btn-pause btn btn-outline-warning"
                    title="一時停止"
                  >
                    <i class="fas fa-pause"></i>
                  </button>
                  <button
                    type="button"
                    class="btn-play btn btn-outline-success"
                    title="再生"
                  >
                    <i class="fas fa-play"></i>
                  </button>
                  <button
                    type="button"
                    class="btn-stop btn btn-outline-danger"
                    title="停止"
                  >
                    <i class="fas fa-stop"></i>
                  </button>
                  <button
                    type="button"
                    class="btn-rewind btn btn-outline-success"
                    title="巻き戻し"
                  >
                    <i class="fas fa-fast-backward"></i>
                  </button>
                  <button
                    type="button"
                    class="btn-fast-forward btn btn-outline-success"
                    title="早送り"
                  >
                    <i class="fas fa-fast-forward"></i>
                  </button>
                  <button
                    type="button"
                    class="btn-record btn btn-outline-primary disabled"
                    title="録音"
                  >
                    <i class="fas fa-microphone"></i>
                  </button>
                </div>

                <div class="btn-group">
                  <button
                    type="button"
                    title="拡大"
                    class="btn-zoom-in btn btn-outline-dark"
                  >
                    <i class="fas fa-search-plus"></i>
                  </button>
                  <button
                    type="button"
                    title="縮小"
                    class="btn-zoom-out btn btn-outline-dark"
                  >
                    <i class="fas fa-search-minus"></i>
                  </button>
                </div>

                <div class="btn-group btn-playlist-state-group">
                  <button
                    type="button"
                    class="btn-cursor btn btn-outline-dark active"
                    title="再生位置を選択"
                  >
                    <i class="fas fa-headphones"></i>
                  </button>
                  <button
                    type="button"
                    class="btn-select btn btn-outline-dark"
                    title="再生範囲を選択"
                  >
                    <i class="fas fa-italic"></i>
                  </button>
                  <button
                    type="button"
                    class="btn-shift btn btn-outline-dark"
                    title="オーディオデータ移動"
                  >
                    <i class="fas fa-arrows-alt-h"></i>
                  </button>
                </div>

                <div class="btn-group btn-select-state-group">
                  <button
                    type="button"
                    class="btn-loop btn btn-outline-success disabled"
                    title="Loop a selected segment of audio"
                  >
                    <i class="fas fa-redo-alt" aria-hidden="true"> </i>
                  </button>
                </div>
                <div class="btn-group">
                  <button
                    type="button"
                    title="Download the current work as Wavfile"
                    class="btn btn-download btn-outline-primary"
                  >
                    <i class="fas fa-download" aria-hidden="true"></i>
                  </button>
                </div>
              </div>
            </div>
            <div id="playlist"></div>
            <div class="playlist-bottom-bar">
              <form class="form-inline">
                <label class="sr-only" for="audio_start"
                  >Start of audio selection</label
                >

                <label class="sr-only" for="audio_end"
                  >End of audio selection</label
                >
                <div class="track-drop">::before</div>
                <div class="form-check form-check-inline">
                  <input
                    class="form-check-input automatic-scroll"
                    type="checkbox"
                    id="automatic_scroll"
                  />
                  <label class="form-check-label" for="automatic_scroll">
                    Automatic Scroll
                  </label>
                </div>
              </form>
            </div>
          </div>
        </article>
      </div>
    </main>

    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript" src="js/waveform-playlist.js"></script>
    <script type="text/javascript" src="js/record.js"></script>
    <script type="text/javascript" src="js/emitter.js"></script>
  </body>
</html>

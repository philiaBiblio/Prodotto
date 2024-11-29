<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>録音確定画面</title>
  <!-- CSSファイルを読み込み -->
  <link rel="stylesheet" href="録音確定画面.css">
</head>
<body>
  <% 
    HttpSession ses = request.getSession();
    // サーブレットから渡された音声ファイルのパスを取得
    String filename = (String) ses.getAttribute("audioPath");
    System.out.println("15 " + filename);
  %>

  <div class="container">
    <!-- 左側ブロック -->
    <div class="left-block">
      <div>
        <span>公開範囲:</span>
        <a href="#">公開</a>
      </div>
      <div>
        <span>タグ:</span>
        <a href="#">未設定</a>
      </div>
      <div>
        <span>コメント:</span>
        <a href="#">ON</a>
      </div>
    </div>

    <!-- 右側ブロック -->
    <div class="right-block">
      <div class="upload">
        <span>サムネイル画像をアップロード (0MBまで)</span>
        <input type="file" accept="image/*">
      </div>
      <div class="waveform" id="waveform-container">
        <div id="waveform"></div>
      </div>
      <div class="controls">
        <!-- 巻き戻しボタン -->
        <button
          type="button"
          class="btn-rewind btn btn-outline-success"
          title="巻き戻し"
        >◀</button>
        
        <!-- 再生ボタン -->
        <form action="P2TLuploadServlet" method="post">
        <button
          type="button"
          class="btn-play btn btn-outline-success"
          title="再生"
        >▶</button>
      </div>
      <div class="submit">
        <button>投稿</button>
        </form>
      </div>
    </div>
  </div>

  <!-- JavaScriptを追加 -->
  <script src="https://unpkg.com/wavesurfer.js"></script>
  <script>
    // JSPから音声ファイルのパスをJavaScript変数に渡す
    const audioPath = "<%= filename %>";

    if (audioPath && audioPath.trim() !== "") {
      // WaveSurferのインスタンスを作成
      const wavesurfer = WaveSurfer.create({
        container: '#waveform',
        waveColor: '#11dadd',
        progressColor: 'purple',
        barWidth: 2,
        height: 100,
        responsive: true,
        cursorColor: 'white',
      });

      // 音声ファイルをロード
      wavesurfer.load(audioPath);

      // 再生ボタンの設定
      const playButton = document.querySelector('.btn-play');
      playButton.addEventListener('click', () => {
        wavesurfer.playPause();
      });

      // 巻き戻しボタンの設定
      const rewindButton = document.querySelector('.btn-rewind');
      rewindButton.addEventListener('click', () => {
        wavesurfer.skip(-5); // 5秒巻き戻し
      });
    } else {
      console.error('音声ファイルのパスが取得できませんでした');
    }
  </script>
</body>
</html>

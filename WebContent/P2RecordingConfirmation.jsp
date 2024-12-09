<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>録音確定画面</title>
  <!-- CSSファイルを読み込み -->
  <link rel="stylesheet" href="P2RecordingConfirmation.css">
</head>

<body>
<form action="P2TLuploadServlet" method="post" enctype="multipart/form-data">
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
        <input type="file" name = "samune" accept="image/*">
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
        <button
          type="button"
          class="btn-play btn btn-outline-success"
          title="再生"
        >▶</button>
      </div>
      <div class="submit">
        <button>投稿して次へ →</button>
      </div>
    </div>
  </div>

  <!-- JavaScriptを追加 -->
  <script src="https://unpkg.com/wavesurfer.js"></script>
  <script>
    // サーバーから渡された音声ファイルのパスを取得
    const audioPath = "<%= filename %>";
// WaveSurferのインスタンスを作成
const wavesurfer = WaveSurfer.create({
  container: '#waveform', // 一つ目のコードのwaveformコンテナを利用
  waveColor: '#11dadd',
  progressColor: '#ff5c5c;',
  barWidth: 2,
  height: 100,
  responsive: false,
  cursorColor: 'white',
  minPxPerSec: 50, // 初期ズームレベルを指定（200は適当な値）
});

// 音声ファイルをロード
wavesurfer.load(audioPath); // 必要に応じて動的パスを指定

// 再生ボタンの設定
const playButton = document.querySelector('.btn-play');
playButton.addEventListener('click', () => {
  wavesurfer.playPause();
  playButton.textContent = wavesurfer.isPlaying() ? '⏸' : '▶';
});

// 巻き戻しボタンの設定
const rewindButton = document.querySelector('.btn-rewind');
rewindButton.addEventListener('click', () => {
  wavesurfer.skip(-5); // 5秒巻き戻し
});

  </script>
  </form>
</body>
</html>

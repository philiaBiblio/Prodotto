var userMediaStream; // ユーザのメディアストリームを格納する変数
var playlist; // プレイリストのインスタンスを格納する変数
var constraints = { audio: true }; // オーディオの制約を定義（オーディオを取得する）

// getUserMedia メソッドの互換性を確保するための処理
navigator.getUserMedia =
  navigator.getUserMedia ||
  navigator.webkitGetUserMedia ||
  navigator.mozGetUserMedia ||
  navigator.msGetUserMedia;

// ストリームを取得したときに呼ばれる関数
function gotStream(stream) {
  userMediaStream = stream; // 取得したストリームを変数に格納
  playlist.initRecorder(userMediaStream); // プレイリストでレコーダーを初期化
  $(".btn-record").removeClass("disabled"); // 録音ボタンの無効状態を解除
}

// エラーが発生した場合に呼ばれる関数
function logError(err) {
  console.error(err); // エラーメッセージをコンソールに出力
}

// プレイリストの初期化
playlist = WaveformPlaylist.init({
  samplesPerPixel: 5000, // ピクセルあたりのサンプル数
  zoomLevels: [1000, 5000, 9000], // ズームレベルの配列
  waveHeight: 100, // 波形の高さ
  container: document.getElementById("playlist"), // プレイリストを表示するコンテナ要素
  state: "cursor", // 初期状態をカーソルに設定
  colors: {
    waveOutlineColor: "#005BBB", // 波形のアウトラインの色
    timeColor: "grey", // 時間表示の色
    fadeColor: "black", // フェード効果の色
  },
  controls: {
    show: true, // トラックコントロールを表示するかどうか
    width: 200, // コントロールの幅（ピクセル）
  },
});



//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★
// record.js
window.loadAudioFile = function(filePath) {
    playlist.load([{
        "src": filePath,  // 動的に設定された音声ファイルのパス
        "name": "username"  // ユーザー名やIDを必要に応じて設定
    }]).then(function() {
        playlist.initExporter();  // 初期化
    }).catch(function(err) {
        console.error("音声のロードに失敗！:", err);
    });
}

//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★//★



// メディアデバイスが利用可能な場合
if (navigator.mediaDevices) {
  navigator.mediaDevices.getUserMedia(constraints)
    .then(gotStream)
    .catch(logError);
} else {
  console.error("使ってるブラウザがgetUserMediaに対応してないよ！！！！！");
}
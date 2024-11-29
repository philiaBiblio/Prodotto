var userMediaStream; // ユーザのメディアストリームを格納する変数
var playlist; // プレイリストのインスタンスを格納する変数
var constraints = { audio: true }; // オーディオの制約を定義（オーディオを取得する）
var $container = $("body"); // body 要素を jQuery で取得

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

// WAV エクスポータの初期化
playlist.initExporter();

// メディアデバイスが利用可能な場合
if (navigator.mediaDevices) {
  navigator.mediaDevices
    .getUserMedia(constraints) // ユーザのメディアを取得
    .then(gotStream) // 成功した場合に gotStream を呼び出す
    .catch(logError); // エラーが発生した場合は logError を呼び出す
} else if (navigator.getUserMedia && "MediaRecorder" in window) {
  // getUserMedia が使用可能で、MediaRecorder がウィンドウに存在する場合
  navigator.getUserMedia(
    constraints, // 制約を渡す
    gotStream, // 成功した場合に gotStream を呼び出す
    logError // エラーが発生した場合は logError を呼び出す
  );
}

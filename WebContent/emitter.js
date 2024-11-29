/*
 * This script is provided to give an example how the playlist can be controlled using the event emitter.
 * This enables projects to create/control the useability of the project.
 */
var ee = playlist.getEventEmitter(); // プレイリストのイベントエミッターを取得
var $container = $("body"); // ボディ要素をjQueryオブジェクトとして取得
var $timeFormat = $container.find(".time-format"); // 時間フォーマット要素を取得
var $audioStart = $container.find(".audio-start"); // 音声開始要素を取得
var $audioEnd = $container.find(".audio-end"); // 音声終了要素を取得
var $time = $container.find(".audio-pos"); // 現在の音声位置要素を取得

var format = "hh:mm:ss.uuu"; // 時間フォーマットの初期値
var startTime = 0; // 音声の開始時間
var endTime = 0; // 音声の終了時間
var audioPos = 0; // 現在の音声位置
var downloadUrl = undefined; // ダウンロードURL
var isLooping = false; // ループフラグ
var playoutPromises; // 再生の約束（Promise）
var data;

// アクティブ状態を切り替える関数
function toggleActive(node) {
  var active = node.parentNode.querySelectorAll(".active"); // 現在アクティブな要素を取得
  var i = 0,
    len = active.length;

  for (; i < len; i++) {
    active[i].classList.remove("active"); // アクティブなクラスを削除
  }

  node.classList.toggle("active"); // クリックされたノードのアクティブクラスを切り替え
}

// フォーマッターをキューする関数
function cueFormatters(format) {
  // 時計のフォーマット関数
  function clockFormat(seconds, decimals) {
    var hours, minutes, secs, result;

    hours = parseInt(seconds / 3600, 10) % 24; // 時間を計算
    minutes = parseInt(seconds / 60, 10) % 60; // 分を計算
    secs = seconds % 60; // 秒を計算
    secs = secs.toFixed(decimals); // 小数点以下をフォーマット

    result =
      (hours < 10 ? "0" + hours : hours) +
      ":" +
      (minutes < 10 ? "0" + minutes : minutes) +
      ":" +
      (secs < 10 ? "0" + secs : secs); // 結果を整形

    return result; // フォーマットされた結果を返す
  }

  var formats = {
    seconds: function (seconds) {
      return seconds.toFixed(0); // 整数秒を返す
    },
    thousandths: function (seconds) {
      return seconds.toFixed(3); // 小数点以下3桁を返す
    },
    "hh:mm:ss": function (seconds) {
      return clockFormat(seconds, 0); // hh:mm:ssフォーマットを返す
    },
    "hh:mm:ss.u": function (seconds) {
      return clockFormat(seconds, 1); // 小数点以下1桁のhh:mm:ssフォーマットを返す
    },
    "hh:mm:ss.uu": function (seconds) {
      return clockFormat(seconds, 2); // 小数点以下2桁のhh:mm:ssフォーマットを返す
    },
    "hh:mm:ss.uuu": function (seconds) {
      return clockFormat(seconds, 3); // 小数点以下3桁のhh:mm:ssフォーマットを返す
    },
  };

  return formats[format]; // 指定されたフォーマットの関数を返す
}

// 選択範囲を更新する関数
function updateSelect(start, end) {
  if (start < end) {
    $(".btn-trim-audio").removeClass("disabled"); // トリムボタンを有効にする
    $(".btn-loop").removeClass("disabled"); // ループボタンを有効にする
  } else {
    $(".btn-trim-audio").addClass("disabled"); // トリムボタンを無効にする
    $(".btn-loop").addClass("disabled"); // ループボタンを無効にする
  }

  $audioStart.val(cueFormatters(format)(start)); // 開始時間を表示
  $audioEnd.val(cueFormatters(format)(end)); // 終了時間を表示

  startTime = start; // 開始時間を更新
  endTime = end; // 終了時間を更新
}

// 時間を更新する関数
function updateTime(time) {
  $time.html(cueFormatters(format)(time)); // 現在の時間を表示

  audioPos = time; // 現在の音声位置を更新
}

// 初期値で選択範囲と時間を更新
updateSelect(startTime, endTime);
updateTime(audioPos);

/*
 * Code below sets up events to send messages to the playlist.
 */
// $container.on("click", ".btn-playlist-state-group", function() {
//   //reset these for now.
//   $('.btn-fade-state-group').addClass('hidden');
//   $('.btn-select-state-group').addClass('hidden');

//   if ($('.btn-select').hasClass('active')) {
//     $('.btn-select-state-group').removeClass('hidden');
//   }

//   if ($('.btn-fadein').hasClass('active') || $('.btn-fadeout').hasClass('active')) {
//     $('.btn-fade-state-group').removeClass('hidden');
//   }
// });

// 以下のイベントリスナーはさまざまなUIインタラクションを処理し、それに応じたアクションをトリガーします
$container.on("click", ".btn-annotations-download", function () {
  ee.emit("annotationsrequest"); // 注釈リクエストを発行
});

$container.on("click", ".btn-loop", function () {
  isLooping = true; // ループを有効にする
  playoutPromises = playlist.play(startTime, endTime); // 選択範囲内で再生を開始
});

$container.on("click", ".btn-play", function () {
  ee.emit("play"); // 再生イベントを発行
});

$container.on("click", ".btn-pause", function () {
  isLooping = false; // ループを無効にする
  ee.emit("pause"); // 一時停止イベントを発行
});

$container.on("click", ".btn-stop", function () {
  isLooping = false; // ループを無効にする
  ee.emit("stop"); // 停止イベントを発行
});

$container.on("click", ".btn-rewind", function () {
  isLooping = false; // ループを無効にする
  ee.emit("rewind"); // 早戻しイベントを発行
});

$container.on("click", ".btn-fast-forward", function () {
  isLooping = false; // ループを無効にする
  ee.emit("fastforward"); // 早送りイベントを発行
});

$container.on("click", ".btn-clear", function () {
  isLooping = false; // ループを無効にする
  ee.emit("clear"); // クリアイベントを発行
});

$container.on("click", ".btn-record", function () {
  ee.emit("record"); // 録音イベントを発行
});

// インタラクション状態を追跡
$container.on("click", ".btn-cursor", function () {
  ee.emit("statechange", "cursor"); // カーソルの状態変更を発行
  toggleActive(this); // クリックされたボタンのアクティブ状態を切り替える
});

$container.on("click", ".btn-select", function () {
  ee.emit("statechange", "select"); // 選択の状態変更を発行
  toggleActive(this); // クリックされたボタンのアクティブ状態を切り替える
});

$container.on("click", ".btn-shift", function () {
  ee.emit("statechange", "shift"); // シフトの状態変更を発行
  toggleActive(this); // クリックされたボタンのアクティブ状態を切り替える
});

$container.on("click", ".btn-fadein", function () {
  ee.emit("statechange", "fadein"); // フェードインの状態変更を発行
  toggleActive(this); // クリックされたボタンのアクティブ状態を切り替える
});

$container.on("click", ".btn-fadeout", function () {
  ee.emit("statechange", "fadeout"); // フェードアウトの状態変更を発行
  toggleActive(this); // クリックされたボタンのアクティブ状態を切り替える
});

// ズームインボタン
$container.on("click", ".btn-zoom-in", function () {
  ee.emit("zoomin"); // ズームインイベントを発行
});

// ズームアウトボタン
$container.on("click", ".btn-zoom-out", function () {
  ee.emit("zoomout"); // ズームアウトイベントを発行
});

// オーディオトリムボタン
$container.on("click", ".btn-trim-audio", function () {
  ee.emit("trim"); // オーディオトリムイベントを発行
});

// プレイリスト情報をコンソールに出力
$container.on("click", ".btn.print", function () {
  console.log(playlist.getInfo()); // プレイリストの情報をコンソールに表示
});

// ダウンロードボタン
$container.on("click", ".btn-download", function () {
  ee.emit("startaudiorendering", "wav"); // WAV形式でオーディオレンダリングを開始
});

// 指定時間にシークするボタン
$container.on("click", ".btn-seektotime", function () {
  var time = parseInt(document.getElementById("seektime").value, 10); // シーク時間を取得
  ee.emit("select", time, time); // 指定時間を選択
});

// シークスタイルの選択が変更されたとき
$container.on("change", ".select-seek-style", function (node) {
  playlist.setSeekStyle(node.target.value); // プレイリストのシークスタイルを設定
});

// トラックドロップエリアへのドラッグイベント
$container.on("dragenter", ".track-drop", function (e) {
  e.preventDefault(); // デフォルトの挙動をキャンセル
  e.target.classList.add("drag-enter"); // ドロップエリアにドラッグインしたときのスタイルを追加
});

$container.on("dragover", ".track-drop", function (e) {
  e.preventDefault(); // デフォルトの挙動をキャンセル
});

$container.on("dragleave", ".track-drop", function (e) {
  e.preventDefault(); // デフォルトの挙動をキャンセル
  e.target.classList.remove("drag-enter"); // ドロップエリアからドラッグアウトしたときのスタイルを削除
});

// トラックをドロップしたとき
$container.on("drop", ".track-drop", function (e) {
  e.preventDefault(); // デフォルトの挙動をキャンセル
  e.target.classList.remove("drag-enter"); // ドロップエリアのスタイルを削除

  var dropEvent = e.originalEvent; // 元のイベントを取得

  // ドロップしたファイルの数だけループ
  for (var i = 0; i < dropEvent.dataTransfer.files.length; i++) {
    ee.emit("newtrack", dropEvent.dataTransfer.files[i]); // 新しいトラックを追加
  }
});

// タイムフォーマットの変更イベント
$container.on("change", ".time-format", function (e) {
  format = $timeFormat.val(); // フォーマットを取得
  ee.emit("durationformat", format); // タイムフォーマットを発行

  updateSelect(startTime, endTime); // 選択を更新
  updateTime(audioPos); // 時間を更新
});

// マスターゲインの変更イベント
$container.on("input change", ".master-gain", function (e) {
  ee.emit("mastervolumechange", e.target.value); // マスターボリュームを変更
});

// 連続再生の変更イベント
$container.on("change", ".continuous-play", function (e) {
  ee.emit("continuousplay", $(e.target).is(":checked")); // 連続再生設定を発行
});

// エンドポイントのリンク設定変更イベント
$container.on("change", ".link-endpoints", function (e) {
  ee.emit("linkendpoints", $(e.target).is(":checked")); // エンドポイントリンク設定を発行
});

// 自動スクロール設定変更イベント
$container.on("change", ".automatic-scroll", function (e) {
  ee.emit("automaticscroll", $(e.target).is(":checked")); // 自動スクロール設定を発行
});

// サウンドステータスを表示
function displaySoundStatus(status) {
  $(".sound-status").html(status); // ステータスを表示
}

// ダウンロードリンクを表示
function displayDownloadLink(link) {
  var dateString = new Date().toISOString(); // 現在の日時をISO形式で取得
  var $link = $("<a/>", {
    href: link, // ダウンロードリンク
    download: "waveformplaylist" + dateString + ".wav", // ダウンロード時のファイル名
    text: "Download mix " + dateString, // リンクのテキスト
    class: "btn btn-small btn-download-link", // リンクのクラス
  });

  $(".btn-download-link").remove(); // 以前のダウンロードリンクを削除
  $(".btn-download").after($link); // 新しいダウンロードリンクを追加
}

/*
 * Code below receives updates from the playlist.
 */
ee.on("select", updateSelect); // 選択イベントを更新

ee.on("timeupdate", updateTime); // 時間更新イベントを更新

ee.on("mute", function (track) {
  displaySoundStatus("Mute button pressed for " + track.name); // ミュートボタンが押されたトラック名を表示
});

ee.on("solo", function (track) {
  displaySoundStatus("Solo button pressed for " + track.name); // ソロボタンが押されたトラック名を表示
});

ee.on("volumechange", function (volume, track) {
  displaySoundStatus(track.name + " now has volume " + volume + "."); // ボリューム変更イベントを表示
});

ee.on("mastervolumechange", function (volume) {
  displaySoundStatus("Master volume now has volume " + volume + "."); // マスターボリューム変更イベントを表示
});

var audioStates = ["uninitialized", "loading", "decoding", "finished"]; // オーディオステータスの配列

// 音声レンダリングが完了したときのイベントリスナー
ee.on("audiorenderingfinished", function (type, data) {
	 // console.log("音声データがここに格納されています:", data);
  if (type == "wav") {
    // WAVタイプのデータか確認
    if (downloadUrl) {
      // 既存のダウンロードURLを解放
      window.URL.revokeObjectURL(downloadUrl);
    }

    // 新しいダウンロードURLを作成
    downloadUrl = window.URL.createObjectURL(data);
    // ダウンロードリンクを表示
    displayDownloadLink(downloadUrl);
  }
});

// 処理が完了したときのイベントリスナー
ee.on("finished", function () {
  console.log("The cursor has reached the end of the selection !"); // 選択の終わりに到達したことを表示

  if (isLooping) {
    // ループ再生が有効な場合
    playoutPromises.then(function () {
      // プレイリストを再生する
      playoutPromises = playlist.play(startTime, endTime);
    });
  }
});

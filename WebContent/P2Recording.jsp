<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8" />
<!-- 文字エンコーディングをUTF-8に設定 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- IE互換モードをEdgeに設定 -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- デバイスの幅に基づいて表示サイズを調整 -->

<!-- Bootstrapスタイルシートのリンク。ボタンやレイアウトのスタイル -->
<link rel="stylesheet" href="bootstrap.min.css" />

<!-- カスタムスタイルシートのリンク -->
<link rel="stylesheet" href="main.css" />
<link rel="stylesheet" href="P2Recording.css" />

<!-- Font Awesomeのリンク。ボタンのアイコンを使用するために必要 -->
<script src="https://kit.fontawesome.com/032b012e04.js"
	crossorigin="anonymous"></script>

<title>録音画面</title>
<!-- タイトルを「録音画面」に設定 -->
</head>
<body>
	<!-- メインコンテンツ部分 -->
	<main class="container" title="demo">
		<div class="wrapper">
			<article class="post">
				<!-- トップバーの設定。再生/停止などのコントロールを配置 -->
				<div id="top-bar" class="playlist-top-bar">
					<div class="playlist-toolbar">
						<!-- ボタン群のグループ -->
						<div class="btn-group">
							<!-- 一時停止ボタン -->
							<button type="button" class="btn-pause btn btn-outline-warning"
								title="一時停止">
								<i class="fas fa-pause"></i>
							</button>
							<!-- 再生ボタン -->
							<button type="button" class="btn-play btn btn-outline-success"
								title="再生">
								<i class="fas fa-play"></i>
							</button>
							<!-- 停止ボタン -->
							<button type="button" class="btn-stop btn btn-outline-danger"
								title="停止">
								<i class="fas fa-stop"></i>
							</button>
							<!-- 巻き戻しボタン -->
							<button type="button" class="btn-rewind btn btn-outline-success"
								title="巻き戻し">
								<i class="fas fa-fast-backward"></i>
							</button>
							<!-- 早送りボタン -->
							<button type="button"
								class="btn-fast-forward btn btn-outline-success" title="早送り">
								<i class="fas fa-fast-forward"></i>
							</button>
							<!-- 録音ボタン -->
							<button type="button"
								class="btn-record btn btn-outline-primary disabled" title="録音">
								<i class="fas fa-microphone"></i>
							</button>
						</div>

						<!-- 拡大縮小のコントロールボタン -->
						<div class="btn-group">
							<!-- 拡大ボタン -->
							<button type="button" title="拡大"
								class="btn-zoom-in btn btn-outline-dark">
								<i class="fas fa-search-plus"></i>
							</button>
							<!-- 縮小ボタン -->
							<button type="button" title="縮小"
								class="btn-zoom-out btn btn-outline-dark">
								<i class="fas fa-search-minus"></i>
							</button>
						</div>

						<!-- プレイリスト操作用ボタン -->
						<div class="btn-group btn-playlist-state-group">
							<!-- 再生位置を選択するボタン -->
							<button type="button"
								class="btn-cursor btn btn-outline-dark active" title="再生位置を選択">
								<i class="fas fa-headphones"></i>
							</button>
							<!-- 再生範囲を選択するボタン -->
							<button type="button" class="btn-select btn btn-outline-dark"
								title="再生範囲を選択">
								<i class="fas fa-italic"></i>
							</button>
							<!-- オーディオデータ移動ボタン -->
							<button type="button" class="btn-shift btn btn-outline-dark"
								title="オーディオデータ移動">
								<i class="fas fa-arrows-alt-h"></i>
							</button>
						</div>

						<!-- 選択した再生範囲をループするボタン -->
						<div class="btn-group btn-select-state-group">
							<button type="button"
								class="btn-loop btn btn-outline-success disabled"
								title="再生範囲をループ">
								<i class="fas fa-redo-alt" aria-hidden="true"> </i>
							</button>
						</div>

						<!-- ダウンロードボタン -->
						<div class="btn-group">
							<button type="button"
								class="btn btn-download btn-outline-primary"
								title="現在の音声をwavファイルでダウンロード">
								<i class="fas fa-download" aria-hidden="true"></i>
							</button>
						</div>
						<!-- メッセージ表示エリア -->
						<div id="message-area"></div>
					</div>
				</div>

				<!-- 再生リスト表示エリア -->
				<div id="playlist"></div>

				<!-- プレイリストの下部バー -->
				<div class="playlist-bottom-bar">
					<!-- オーディオ選択範囲の開始/終了時間入力フォーム -->
					<form class="form-inline">
						<div class="track-drop">::before</div>
						<!-- 自動スクロール設定のチェックボックス -->
						<div class="form-check form-check-inline">
							<input class="form-check-input automatic-scroll" type="checkbox"
								id="automatic_scroll" /> <label class="form-check-label"
								for="automatic_scroll"> 自動スクロール </label>
						</div>
					</form>
				</div>
				<div class="btn-group">
					<button type="submit" class="btn btn-download btn-outline-primary"
						title="録音確定" id="confirmRecordingBtn"
						onclick="redirectAfterDelay()">
						録音を確定 <i class="fas fa-download" aria-hidden="true"></i>
					</button>
				</div>

				<!-- 幅を持つ要素例 -->
				<div class="channel channel-0" style="width: 200px;"></div>

				<script>
					function redirectAfterDelay() {
						// `channel-0` 要素を取得
						const channelElement = document
								.querySelector('.channel.channel-0');

						// 要素の幅を取得 (px を除去して数値として取得)
						const widthValue = parseInt(window
								.getComputedStyle(channelElement).width, 10);

						// 遅延値 (幅をそのまま使う、または変換する)
						const l = widthValue * 6; // ミリ秒単位
						console.log(l);
						console.log(`Redirecting after ${l}ms based on channel width`);

						// 遷移の遅延処理
						setTimeout(function() {
							location.href = 'P2RecordingServlet';
						}, l);
					}
				</script>

				<script src="https://code.jquery.com/jquery-3.6.0.min.js"
					integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
					crossorigin="anonymous"></script>
				<!-- 外部JavaScriptファイルのリンク -->
				<script type="text/javascript" src="waveform-playlist.js"></script>
				<script type="text/javascript" src="record.js"></script>
				<script type="text/javascript" src="emitter.js"></script>
</body>
</html>
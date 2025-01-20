<%@ page import="java.util.*"%>
<%
String audioFile = (String) request.getAttribute("audioFile"); // サーブレットから音声ファイル名を取得
%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- IE互換モードをEdgeに設定 -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- デバイスの幅に基づいて表示サイズを調整 -->

<!-- Bootstrapスタイルシートのリンク。ボタンやレイアウトのスタイル -->
<link rel="stylesheet" href="bootstrap.min.css" />
<link rel="stylesheet" href="P2Recording2.css" />
<link rel="stylesheet" href="P2Recording.css" />

<!-- Font Awesomeのリンク。ボタンのアイコンを使用するために必要 -->
<script src="https://kit.fontawesome.com/032b012e04.js"
	crossorigin="anonymous"></script>
<script src="
https://cdn.jsdelivr.net/npm/soundfont-player@0.12.0/dist/soundfont-player.min.js
"></script>
<title>録音画面</title>
</head>

<%
//セッションの取得
HttpSession ses = request.getSession();
%>

<%
if ("1".equals(request.getParameter("hitoride"))) {
%>
<%
ses.setAttribute("ODAITEXST", null);
%>
<%
ses.setAttribute("ID", null);
%>
<%
}
%>

<%
if ("0".equals(request.getParameter("hitoride"))) {
%>
<%
ses.setAttribute("ID", null);
%>
<%
ses.setAttribute("ODAITEXST", ses.getAttribute("ODAI"));
%>
<%
}
%>

<body>
	<!-- メインコンテンツ部分 -->
	<main class="container">
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
						<%
						if (ses.getAttribute("ODAITEXST") != null) {
						%>
						<div id="message-area" class="odaitext">
							<%=ses.getAttribute("ODAITEXST")%>
						</div>
						<%
						}
						%>

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

				<!-- 戻るボタン -->
				<div class="btn-group">
					<button type="button" class="btn btn-download btn-outline-primary"
						onclick="location.href='P2PostAndRecording.jsp'">キャンセル</button>
				</div>

				<!-- 録音確定ボタン -->
				<div class="btn-group">
					<button type="submit" class="btn btn-download btn-outline-primary"
						title="録音確定" id="confirmRecordingBtn"
						onclick="redirectAfterDelay()">
						録音を確定 <i class="fas fa-download" aria-hidden="true"></i>
					</button>
				</div>

				<!-- ロード画面 -->
				<div id="loadingModal" class="loading-modal" style="display: none;">
					<div class="loading-content">
						<div class="spinner-border text-primary" role="status">
							<span class="sr-only">Loading...</span>
						</div>
						<p>録音データを処理しています...</p>
					</div>
				</div>
				
<div class="piano">
    <!-- 白鍵 -->
    <div class="key white" data-note="C4"></div>
    <div class="key black" data-note="C#4"></div>
    <div class="key white" data-note="D4"></div>
    <div class="key black" data-note="D#4"></div>
    <div class="key white" data-note="E4"></div>
    <div class="key white" data-note="F4"></div>
    <div class="key black" data-note="F#4"></div>
    <div class="key white" data-note="G4"></div>
    <div class="key black" data-note="G#4"></div>
    <div class="key white" data-note="A4"></div>
    <div class="key black" data-note="A#4"></div>
    <div class="key white" data-note="B4"></div>
    <div class="key white" data-note="C5"></div>
    <div class="key black" data-note="C#5"></div>
    <div class="key white" data-note="D5"></div>
    <div class="key black" data-note="D#5"></div>
    <div class="key white" data-note="E5"></div>
    <div class="key white" data-note="F5"></div>
    <div class="key black" data-note="F#5"></div>
    <div class="key white" data-note="G5"></div>
    <div class="key black" data-note="G#5"></div>
    <div class="key white" data-note="A5"></div>
    <div class="key black" data-note="A#5"></div>
    <div class="key white" data-note="B5"></div>
    <div class="key white" data-note="C6"></div>
    <div class="key black" data-note="C#6"></div>
    <div class="key white" data-note="D6"></div>
    <div class="key black" data-note="D#6"></div>
    <div class="key white" data-note="E6"></div>
    <div class="key white" data-note="F6"></div>
    <div class="key black" data-note="F#6"></div>
    <div class="key white" data-note="G6"></div>
    <div class="key black" data-note="G#6"></div>
    <div class="key white" data-note="A6"></div>
    <div class="key black" data-note="A#6"></div>
    <div class="key white" data-note="B6"></div>
    <div class="key white" data-note="C7"></div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const audioContext = new (window.AudioContext || window.webkitAudioContext)();
        
        // ピアノ音源のロード
        Soundfont.instrument(audioContext, 'acoustic_grand_piano').then(piano => {
            // 鍵盤を選択
            const keys = document.querySelectorAll('.key');

            // 各鍵盤にイベントリスナーを設定
            keys.forEach(key => {
                key.addEventListener('mousedown', () => {
                    piano.play(key.dataset.note);
                });
            });

            // キーボード入力の処理
            document.addEventListener('keydown', (e) => {
                let note = '';
                switch (e.key) {
                    case 'a': note = 'C4'; break;
                    case 'w': note = 'C#4'; break;
                    case 's': note = 'D4'; break;
                    case 'e': note = 'D#4'; break;
                    case 'd': note = 'E4'; break;
                    case 'f': note = 'F4'; break;
                    case 't': note = 'F#4'; break;
                    case 'g': note = 'G4'; break;
                    case 'y': note = 'G#4'; break;
                    case 'h': note = 'A4'; break;
                    case 'u': note = 'A#4'; break;
                    case 'j': note = 'B4'; break;
                    case 'k': note = 'C5'; break;
                    case 'o': note = 'C#5'; break;
                    case 'l': note = 'D5'; break;
                    case 'p': note = 'D#5'; break;
                    case ';': note = 'E5'; break;
                    case "'": note = 'F5'; break;
                    case '[': note = 'F#5'; break;
                    case ']': note = 'G5'; break;
                    case '\\': note = 'G#5'; break;
                    case 'z': note = 'A5'; break;
                    case 'x': note = 'A#5'; break;
                    case 'c': note = 'B5'; break;
                    case 'v': note = 'C6'; break;
                    case 'b': note = 'C#6'; break;
                    case 'n': note = 'D6'; break;
                    case 'm': note = 'D#6'; break;
                    case ',': note = 'E6'; break;
                    case '.': note = 'F6'; break;
                    case '/': note = 'F#6'; break;
                    case '1': note = 'G6'; break;
                    case '2': note = 'G#6'; break;
                    case '3': note = 'A6'; break;
                    case '4': note = 'A#6'; break;
                    case '5': note = 'B6'; break;
                    case '6': note = 'C7'; break;
                    default: return; // それ以外のキーは無視
                }

                if (note) {
                    piano.play(note);
                }
            });
        });
    });
</script>

				<!-- スクリプト -->
				<script>
					function redirectAfterDelay() {
						// ロード画面を表示
					    const loadingModal = document.getElementById('loadingModal');
					    loadingModal.style.display = 'flex';
						
						// `channel-0` 要素を取得
						const channelElement = document.querySelector('.channel.channel-0');
						const widthValue = parseInt(window.getComputedStyle(channelElement).width, 10);
						const delay = widthValue * 6; // ミリ秒単位
						
						console.log(`Redirecting after ${delay}ms based on channel width`);

						// 遷移の遅延処理
						setTimeout(function() {
							location.href = 'P2RecordingServlet';
						}, delay);
					}
				</script>
			</article>
		</div>
	</main>

	<!-- 外部JavaScriptファイルのリンク -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="waveform-playlist.js"></script>
	<script type="text/javascript" src="record.js"></script>
	<script type="text/javascript" src="emitter.js"></script>

	<!-- 音声ファイルのパスをrecord.jsに渡す -->
	<script type="text/javascript">
        const audioFilePath = "audio/<%=audioFile%>
		"; // サーブレットから渡された音声ファイルのパス
		loadAudioFile(audioFilePath); // record.js内で音声をロード
	</script>
</body>
</html>
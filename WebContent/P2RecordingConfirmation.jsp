<%@page import="apli.User" %>
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
	<form action="P2TLuploadServlet" method="post"
		enctype="multipart/form-data">
		<%
		HttpSession ses = request.getSession();
		User u = (User)ses.getAttribute("LOGIN");
		// サーブレットから渡された音声ファイルのパスを取得
		String filename = (String) ses.getAttribute("audioPath");
		System.out.println("15 " + filename);

		%>

		<div class="container">
			<!-- 左側ブロック -->
			<div class="left-block">
				<div>
					<span>公開範囲:</span> <a href="#">公開</a>
				</div>
				<div>
					<span>タグ:</span> <a href="#">未設定</a>
				</div>
				<div>
					<span>コメント:</span> <a href="#">ON</a>
				</div>
			</div>

			<!-- 右側ブロック -->
			<div class="right-block">
				<div class="upload">
					<span>サムネイル画像をアップロード (0MBまで)</span> <input type="file"
						id="thumbnail-input" name="samune" accept="image/*">
					<div class="thumbnail-preview">
					</div>
				</div>

				<!-- タイムライン動画カード -->
				<div class="video-card">
					<div class="thumbnail-placeholder">
						<img id="timeline-thumbnail" src="image/<%= u.getIconImage() %>" alt="Video Thumbnail" class="thumbnail">
						<button class="play-button">▶️</button>
						<!-- 音声再生ボタン -->
						<audio class="audio-player" src=""></audio>
					</div>

					<div class="video-info">
						<!-- 他人なら他人プロフ。自分ならマイページへ -->
						<form action="" method="get">
							<input type="hidden" name="userID" value="tokunaga">
							<button type="submit" class="profile-info" style="all: unset; cursor: pointer;">
								<a>
									<img src="image/<%= u.getIconImage() %>" alt="profile icon" class="profile-icon">
								</a>
							</button>
						</form>

						<div class="like-comment">
							<form action="">
								<input type="hidden" name="toukouId" value="13">
								<button class="submit comment" onclick="">
									<img src="image/こめんと1.png" alt="comment icon" style="width: 20px; height: 20px"> <span>0</span>
								</button>
							</form>

							<button class="heart" onclick="">
								<img id="heartImageapli.Post@3eca0099" src="image/Heart-512x512 test.png" alt="like icon" style="width: 20px; height: 20px"> <span>0</span>
							</button>
						</div>
					</div>
				</div>

				<script>
				// サムネイル画像の選択処理
				const thumbnailInput = document.getElementById('thumbnail-input');
				const timelineThumbnail = document.getElementById('timeline-thumbnail');

				// ファイル選択時のイベントリスナーを設定
				thumbnailInput.addEventListener('change', (event) => {
				  const file = event.target.files[0]; // 選択されたファイル
				  if (file) {
					// FileReaderを使用して画像を読み込み、プレビュー表示
					const reader = new FileReader();
					reader.onload = function(e) {
					  timelineThumbnail.src = e.target.result; // タイムラインサムネイル用画像を設定
					};
					reader.readAsDataURL(file);
				  } else {
					// ファイルが選択されなかった場合、デフォルト画像を設定
					timelineThumbnail.src = 'image/';
				  }
				});
				</script>

				<div class="waveform" id="waveform-container">
					<div id="waveform"></div>
				</div>
				<div class="controls">
					<!-- 巻き戻しボタン -->
					<button type="button" class="btn-rewind btn btn-outline-success"
						title="巻き戻し">◀</button>

					<!-- 再生ボタン -->
					<button type="button" class="btn-play btn btn-outline-success"
						title="再生">▶</button>
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
    const audioPath = "<%=filename%>";
// WaveSurferのインスタンスを作成
const wavesurfer = WaveSurfer.create({
  container: '#waveform', // 一つ目のコードのwaveformコンテナを利用
  waveColor: '#11dadd',
  progressColor: '#ff5c5c',
  barWidth: 2,
  height: 100,
  responsive: false,
  scrollParent: false, // スクロールを無効にする
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

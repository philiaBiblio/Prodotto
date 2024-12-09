console.log("aaa");

document.addEventListener("DOMContentLoaded", function() {
	const playButtons = document.querySelectorAll(".play-button");
	const musicPlayer = document.querySelector(".music-player");
	const musicPlayerImage = musicPlayer.querySelector(".image-container img");
	const progressContainer = musicPlayer.querySelector(".progress-container .progress-bar");
	const progress = progressContainer.querySelector(".progress");
	const audio = document.querySelector(".audio-player");
	const volumeBarContainer = document.querySelector(".volume-bar .progress-bar");
	const volumeBar = volumeBarContainer.querySelector(".progress");
	const volumeIcon = document.querySelector(".volume-bar i");
	const playerPlayButton = musicPlayer.querySelector(".play-pause");
	const backButton = musicPlayer.querySelector(".fa-step-backward");
	const nextButton = musicPlayer.querySelector(".fa-step-forward");

	let currentTrackIndex = 0;
	let isDragging = false;
	let currentThumbnailButton = null;
	let isVolumeDragging = false;

	// 初期状態で音量を設定
	audio.volume = 0.5;
	updateVolumeBar(audio.volume);

	// 音量バーをクリックしたときの処理
	volumeBarContainer.addEventListener("click", (e) => {
		const volumePercent = Math.min(Math.max((e.clientX - volumeBarContainer.getBoundingClientRect().left) / volumeBarContainer.clientWidth, 0), 1);
		audio.volume = volumePercent;
		updateVolumeBar(audio.volume);
	});

	// 音量バーをドラッグ操作するための処理
	volumeBarContainer.addEventListener("mousedown", () => { isVolumeDragging = true; });
	document.addEventListener("mousemove", (e) => {
		if (!isVolumeDragging) return;
		const volumePercent = Math.min(Math.max((e.clientX - volumeBarContainer.getBoundingClientRect().left) / volumeBarContainer.clientWidth, 0), 1);
		audio.volume = volumePercent;
		updateVolumeBar(audio.volume);
	});

	document.addEventListener("mouseup", () => { isVolumeDragging = false; });

	// 音量バーを更新する関数
	function updateVolumeBar(volume) {
		volumeBar.style.width = `${volume * 100}%`;
		updateVolumeIcon(volume);
	}

	// 音量アイコンを音量に応じて更新する関数
	function updateVolumeIcon(volume) {
		volumeIcon.classList.remove("fa-volume-mute", "fa-volume-down", "fa-volume-up");
		if (volume === 0) {
			volumeIcon.classList.add("fa-volume-mute");
		} else if (volume <= 0.5) {
			volumeIcon.classList.add("fa-volume-down");
		} else {
			volumeIcon.classList.add("fa-volume-up");
		}
	}

	// サムネイル再生ボタン
	playButtons.forEach((button) => {
		button.addEventListener("click", function() {
			const audioPlayer = this.nextElementSibling;
			const thumbnailImage = this.parentElement.querySelector(".thumbnail");

			if (!audioPlayer || audioPlayer.tagName !== "AUDIO") {
				console.error("Audio要素が正しく取得されませんでした");
				return;
			}

			musicPlayerImage.src = thumbnailImage.src;
			currentThumbnailButton = this;

			// 他の再生中の音声を停止
			document.querySelectorAll("audio").forEach((audio) => {
				if (!audio.paused) {
					audio.pause();
					audio.currentTime = 0;
				}
			});

			// 音声の再生/停止処理
			handlePlayback(audioPlayer);
			syncPlayerPlayButton(audioPlayer);

			// 再生終了後の処理
			audioPlayer.addEventListener("ended", () => {
				this.textContent = "▶️";
				playerPlayButton.classList.replace("fa-pause", "fa-play");
			}, { once: true });
		});
	});

	// 音楽プレイヤー内の再生ボタンに対する処理
	playerPlayButton.addEventListener("click", function() {
		const audioPlayer = document.querySelector(".audio-player");

		if (!audioPlayer) {
			console.error("音楽プレイヤー内のAudio要素が見つかりません");
			return;
		}

		handlePlayback(audioPlayer);
	});

	// 音声の再生/停止処理
	function handlePlayback(audioPlayer) {
		if (audioPlayer.paused) {
			audioPlayer.play().then(() => {
				musicPlayer.style.display = "flex"; // 音楽プレイヤーを表示
				playerPlayButton.classList.replace("fa-play", "fa-pause");
				if (currentThumbnailButton) currentThumbnailButton.textContent = "⏸";
				updateProgress(audioPlayer);
			}).catch((error) => {
				console.error("再生中にエラー発生:", error);
			});
		} else {
			audioPlayer.pause();
			playerPlayButton.classList.replace("fa-pause", "fa-play");
			if (currentThumbnailButton) currentThumbnailButton.textContent = "▶️";
		}
	}

	// サムネイルとプレイヤーの再生ボタンを同期
	function syncPlayerPlayButton(audioPlayer) {
		if (audioPlayer.paused) {
			playerPlayButton.classList.replace("fa-pause", "fa-play");
		} else {
			playerPlayButton.classList.replace("fa-play", "fa-pause");
		}
	}

	// 進行状況を更新する関数
	function updateProgress(audio) {
		const percent = (audio.currentTime / audio.duration) * 100;
		progress.style.width = `${percent}%`;
		musicPlayer.querySelector(".current-time").textContent = formatTime(audio.currentTime);
		musicPlayer.querySelector(".duration").textContent = formatTime(audio.duration);

		if (!audio.paused) {
			requestAnimationFrame(() => updateProgress(audio));
		}
	}

	// 時間を分:秒形式でフォーマットする関数
	function formatTime(time) {
		const minutes = Math.floor(time / 60);
		const seconds = Math.floor(time % 60);
		return `${minutes}:${seconds < 10 ? "0" : ""}${seconds}`;
	}

	// シークバーの操作
	progressContainer.addEventListener("mousedown", () => { isDragging = true; });
	document.addEventListener("mousemove", (e) => {
		if (!isDragging) return;
		const percent = Math.min(Math.max((e.clientX - progressContainer.getBoundingClientRect().left) / progressContainer.clientWidth, 0), 1);
		audio.currentTime = percent * audio.duration;
		updateProgress(audio);
	});

	document.addEventListener("mouseup", () => { isDragging = false; });
});

// コメント表示用
function openPopup() {
	window.open('P2popup.jsp', 'popupWindow', 'width=500,height=300,scrollbars=yes');
}

// いいねボタンクリック
function changeImage(id) {
	const img = document.getElementById(id);
	const isLiked = img.getAttribute('data-liked') === 'true';
	img.src = isLiked ? 'image/Heart-512x512%20test.png' : 'image/Heart-512x512%20test2.png';
	img.setAttribute('data-liked', !isLiked);

}


// ダイアログのスクリプト
function test(id) {
	const openDialogButton = document.getElementById('openDialogButton');
	const yesButton = document.getElementById('yesButton');
	const noButton = document.getElementById('noButton');
	const myDialog = document.getElementById('myDialog');
	const confirmationDialog = document.getElementById('confirmationDialog');
	const closeConfirmationButton = document.getElementById('closeConfirmationButton');

	openDialogButton.addEventListener('click', () => myDialog.showModal());
	yesButton.addEventListener('click', () => { myDialog.close(); confirmationDialog.showModal(); });
	noButton.addEventListener('click', () => myDialog.close());
	closeConfirmationButton.addEventListener('click', () => confirmationDialog.close());
}

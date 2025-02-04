document.addEventListener("DOMContentLoaded", () => {
	const container = document.body;
	let currentAudioPlayer = null;
	let currentPlayButton = null;

	// 再生プレイヤー関連の要素
	const musicPlayer = document.querySelector(".music-player");
	const playPauseButton = musicPlayer.querySelector(".play-pause");
	const progressBar = musicPlayer.querySelector(".progress-bar");
	const progress = progressBar.querySelector(".progress");
	const currentTimeDisplay = musicPlayer.querySelector(".current-time");
	const durationDisplay = musicPlayer.querySelector(".duration");
	const volumeBar = musicPlayer.querySelector(".volume-bar .progress-bar");
	const volumeProgress = volumeBar.querySelector(".progress");
	const hidePlayerButton = musicPlayer.querySelector(".hide-player-button");
	const repeatButton = musicPlayer.querySelector(".fa-undo-alt"); // リピートボタン
	const prevButton = document.querySelector(".fa-step-backward"); // 戻るボタン（例: プレイヤー内に配置）
	const nextButton = document.querySelector(".fa-step-forward");

	const style = document.createElement("style");
	style.textContent = `
    .video-card.playing {
        box-shadow: 0 0 15px 5px #11dadd; /* ライトブルーの発光 */
        border: 2px solid #11dadd; /* 枠線の強調 */
        transition: box-shadow 0.3s ease-in-out, border 0.3s ease-in-out;
    }
`;
	document.head.appendChild(style);

	let currentPlayingCard = null; // 現在再生中の動画カードを保存

	// 音声の再生・停止処理を関数化
	function playAudio(audioPlayer, playButton) {
		audioPlayer.play().catch(() => {
			alert("音声ファイルの再生に失敗しました。");
		});
		console.log("動くか");
		playButton.textContent = "⏸️";
		playPauseButton.classList.remove("fa-play");
		playPauseButton.classList.add("fa-pause");
		currentAudioPlayer = audioPlayer;
		currentPlayButton = playButton;

		// 現在の動画カードを取得
		let videoCard = playButton.closest(".video-card");

		// すでに再生中のカードがあれば発光を解除
		if (currentPlayingCard) {
			currentPlayingCard.classList.remove("playing");
		}

		// 新しいカードに発光エフェクトを追加
		videoCard.classList.add("playing");
		currentPlayingCard = videoCard; // 現在再生中のカードを更新
	}

	function stopAudio(audioPlayer, playButton) {
		audioPlayer.pause();
		playButton.textContent = "▶️";
		playPauseButton.classList.remove("fa-pause");
		playPauseButton.classList.add("fa-play");

		// 発光エフェクトを削除
		if (currentPlayingCard) {
			currentPlayingCard.classList.remove("playing");
			currentPlayingCard = null;
		}
	}

	// 戻るボタンの動作
	prevButton.addEventListener("click", () => {
		if (!currentAudioPlayer) {
			showErrorMessage("再生中の音声がありません。");
			return;
		}

		if (currentAudioPlayer.currentTime < 1) {
			const currentCard = currentAudioPlayer.closest(".video-card");
			let prevCard = currentCard.previousElementSibling;

			while (prevCard && !prevCard.classList.contains("video-card")) {
				prevCard = prevCard.previousElementSibling;
			}

			if (!prevCard) {
				alert("これ以上前の音声がありません。");
				return;
			}

			const prevAudioPlayer = prevCard.querySelector(".audio-player");
			const prevPlayButton = prevCard.querySelector(".play-button");

			if (!prevAudioPlayer || !prevAudioPlayer.src) {
				alert("前の音声ファイルが見つかりません。");
				return;
			}

			stopAudio(currentAudioPlayer, currentPlayButton);
			playAudio(prevAudioPlayer, prevPlayButton);

			// サムネイルとアーティスト名を更新
			updatePlayerInfo(prevCard);
		} else {
			currentAudioPlayer.currentTime = 0;
			playAudio(currentAudioPlayer, currentPlayButton);
		}
	});

	// 次へボタンの動作
	nextButton.addEventListener("click", () => {
		if (!currentAudioPlayer) {
			alert("再生中の音声がありません。");
			return;
		}

		const currentCard = currentAudioPlayer.closest(".video-card");
		const nextCard = currentCard.nextElementSibling;

		if (nextCard && nextCard.classList.contains("video-card")) {
			const nextAudioPlayer = nextCard.querySelector(".audio-player");
			const nextPlayButton = nextCard.querySelector(".play-button");

			if (!nextAudioPlayer || !nextAudioPlayer.src) {
				alert("次の音声ファイルが見つかりません。");
				return;
			}

			stopAudio(currentAudioPlayer, currentPlayButton);
			playAudio(nextAudioPlayer, nextPlayButton);

			// サムネイルとアーティスト名を更新
			updatePlayerInfo(nextCard);
		} else {
			alert("これ以上次の音声がありません。");
		}
	});

	// サムネイルとアーティスト名の更新
	function updatePlayerInfo(card) {
		const thumbnailImage = card.querySelector(".thumbnail").src;
		const playerImageContainer = musicPlayer.querySelector(".image-container img");
		playerImageContainer.src = thumbnailImage;

		const artistId = card.querySelector("input[type='hidden']").id;
		const artistName = document.getElementById(artistId).value;
		const artist = document.getElementById("artistName");
		artist.textContent = artistName;
	}

	// リピートモード管理フラグ
	let isRepeatMode = false;

	// 再生/停止の切り替え
	container.addEventListener("click", (event) => {
		if (event.target.classList.contains("play-button")) {
			const card = event.target.closest(".video-card");
			const audioPlayer = card.querySelector(".audio-player");

			if (!audioPlayer || !audioPlayer.src) {
				alert("音声ファイルがありません。");
				return;
			}

			if (currentAudioPlayer && currentAudioPlayer !== audioPlayer) {
				stopAudio(currentAudioPlayer, currentPlayButton);
			}

			if (audioPlayer.paused) {
				playAudio(audioPlayer, event.target);
			} else {
				stopAudio(audioPlayer, event.target);
			}

			musicPlayer.style.display = "block";
			updatePlayerInfo(card);

			audioPlayer.addEventListener("ended", () => {
				if (isRepeatMode) {
					audioPlayer.play();
				} else {
					resetPlayer();
				}
			});
		}
	});

	// リピートボタンの動作
	repeatButton.addEventListener("click", () => {
		isRepeatMode = !isRepeatMode;
		repeatButton.classList.toggle("active", isRepeatMode);
	});

	// プレイヤーをリセット
	function resetPlayer() {
		if (currentAudioPlayer) {
			currentAudioPlayer.pause();
			currentAudioPlayer.currentTime = 0;
		}
		if (currentPlayButton) {
			currentPlayButton.textContent = "▶️";
		}
		playPauseButton.classList.remove("fa-pause");
		playPauseButton.classList.add("fa-play");
	}

	// プログレスバーの更新
	function updateProgress() {
		if (!currentAudioPlayer) return;

		const currentTime = currentAudioPlayer.currentTime;
		const duration = currentAudioPlayer.duration;

		const progressPercent = (currentTime / duration) * 100;
		progress.style.width = `${progressPercent}%`;

		currentTimeDisplay.textContent = formatTime(currentTime);
		durationDisplay.textContent = isNaN(duration) ? "0:00" : formatTime(duration);
	}

	function formatTime(seconds) {
		const minutes = Math.floor(seconds / 60);
		const remainingSeconds = Math.floor(seconds % 60);
		return `${minutes}:${remainingSeconds.toString().padStart(2, "0")}`;
	}

	function calculateProgress(event, barElement) {
		const rect = barElement.getBoundingClientRect();
		const clickX = event.clientX - rect.left;
		return Math.min(Math.max(clickX / rect.width, 0), 1);
	}

	// バーのインタラクションを設定
	function setupBarInteraction(barElement, callback) {
		let isDragging = false;

		barElement.addEventListener("click", (event) => {
			const progress = calculateProgress(event, barElement);
			callback(progress);
		});

		barElement.addEventListener("mousedown", () => {
			isDragging = true;
		});

		document.addEventListener("mousemove", (event) => {
			if (isDragging) {
				const progress = calculateProgress(event, barElement);
				callback(progress);
			}
		});

		document.addEventListener("mouseup", () => {
			isDragging = false;
		});

		barElement.addEventListener("touchstart", () => {
			isDragging = true;
		});

		document.addEventListener("touchmove", (event) => {
			if (isDragging) {
				const touch = event.touches[0];
				const progress = calculateProgress(touch, barElement);
				callback(progress);
			}
		});

		document.addEventListener("touchend", () => {
			isDragging = false;
		});
	}

	setupBarInteraction(progressBar, (progress) => {
		if (!currentAudioPlayer) return;

		currentAudioPlayer.currentTime = progress * currentAudioPlayer.duration;
		updateProgress();
	});

	setupBarInteraction(volumeBar, (progress) => {
		if (!currentAudioPlayer) return;

		currentAudioPlayer.volume = progress;
		volumeProgress.style.width = `${progress * 100}%`;
	});

	// 再生/停止ボタンのクリックイベント
	playPauseButton.addEventListener("click", () => {
		if (!currentAudioPlayer) {
			alert("現在再生中の音声がありません。");
			return;
		}

		if (currentAudioPlayer.paused) {
			playAudio(currentAudioPlayer, currentPlayButton);
		} else {
			stopAudio(currentAudioPlayer, currentPlayButton);
		}
	});

	// プレイヤーを非表示
	hidePlayerButton.addEventListener("click", () => {
		musicPlayer.style.display = "none";
		resetPlayer();
	});

	setInterval(updateProgress, 500);
});

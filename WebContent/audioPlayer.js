document.addEventListener("DOMContentLoaded", () => {
	const container = document.body;
	let currentAudioPlayer = null;
	let currentPlayButton = null;

	container.addEventListener("click", (event) => {
		if (event.target.classList.contains("play-button")) {
			const card = event.target.closest(".video-card");
			const audioPlayer = card.querySelector(".audio-player");
			const musicPlayer = document.querySelector(".music-player");
			const playPauseButton = musicPlayer.querySelector(".play-pause"); // プレイヤー内の再生ボタン

			// 音声ファイルが設定されていない場合の処理
			if (!audioPlayer || !audioPlayer.src) {
				alert("音声ファイルがありません。");
				return;
			}

			// 他の音声を停止＆再生ボタンをリセット
			if (currentAudioPlayer && currentAudioPlayer !== audioPlayer) {
				currentAudioPlayer.pause();
				currentAudioPlayer.currentTime = 0;
				if (currentPlayButton) currentPlayButton.textContent = "▶️";
			}

			// 再生/停止の切り替え
			if (audioPlayer.paused) {
				audioPlayer.play().catch(() => {
					alert("音声ファイルの再生に失敗しました。");
				});
				event.target.textContent = "⏸️"; // 再生中は一時停止アイコンに変更
				playPauseButton.classList.remove("fa-play");
				playPauseButton.classList.add("fa-pause");
				currentAudioPlayer = audioPlayer; // 現在のaudioを記録
				currentPlayButton = event.target; // 現在のボタンを記録
			} else {
				audioPlayer.pause();
				event.target.textContent = "▶️"; // 停止中は再生アイコンに戻す
				playPauseButton.classList.remove("fa-pause");
				playPauseButton.classList.add("fa-play");
			}

			// 再生終了時の処理
			audioPlayer.addEventListener("ended", () => {
				event.target.textContent = "▶️";
				playPauseButton.classList.remove("fa-pause");
				playPauseButton.classList.add("fa-play");
				currentAudioPlayer = null;
				currentPlayButton = null;
			});

			// 音楽プレイヤーの表示
			musicPlayer.style.display = "block";

			// サムネイル画像を取得して再生プレイヤーに設定
			const thumbnailImage = card.querySelector(".thumbnail").src;
			const playerImageContainer = musicPlayer.querySelector(".image-container img");
			playerImageContainer.src = thumbnailImage;
		}
	});

	// 再生プレイヤー内の再生/停止ボタンの動作
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

	// 戻るボタンの動作
	prevButton.addEventListener("click", () => {
		if (!currentAudioPlayer) {
			alert("再生中の音声がありません。");
			return;
		}

		// 音声の再生時間が0:00の場合、前の音楽に戻る
		if (currentAudioPlayer.currentTime < 2) {
			const currentCard = currentAudioPlayer.closest(".video-card");
			let prevCard = currentCard.previousElementSibling;

			// 前のカードが見つかるまでループ
			while (prevCard && !prevCard.classList.contains("video-card")) {
				prevCard = prevCard.previousElementSibling; // 前のノードに移動
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

			// 現在の音声を停止
			currentAudioPlayer.pause();
			currentAudioPlayer.currentTime = 0;
			if (currentPlayButton) currentPlayButton.textContent = "▶️";

			// 前の音声を再生
			currentAudioPlayer = prevAudioPlayer;
			currentPlayButton = prevPlayButton;

			currentAudioPlayer.play().catch(() => {
				alert("前の音声ファイルの再生に失敗しました。");
			});
			currentPlayButton.textContent = "⏸️";

			// プレイヤーのUIを更新
			const prevThumbnailImage = prevCard.querySelector(".thumbnail").src;
			const playerImageContainer = musicPlayer.querySelector(".image-container img");
			playerImageContainer.src = prevThumbnailImage;

			const prevArtistName = prevCard.getAttribute("data-artist-name") || "Unknown Artist";
			const artist = document.getElementById("artistName");
			artist.innerText = prevArtistName;

		} else {
			// 再生時間が0:00でない場合、現在の音楽を最初から再生
			currentAudioPlayer.currentTime = 0;
			currentAudioPlayer.play().catch(() => {
				alert("音声ファイルの再生に失敗しました。");
			});
			if (currentPlayButton) currentPlayButton.textContent = "⏸️";
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

			// 現在の音声を停止
			currentAudioPlayer.pause();
			currentAudioPlayer.currentTime = 0;
			if (currentPlayButton) currentPlayButton.textContent = "▶️";

			// 次の音声を再生
			currentAudioPlayer = nextAudioPlayer;
			currentPlayButton = nextPlayButton;

			currentAudioPlayer.play().catch(() => {
				alert("次の音声ファイルの再生に失敗しました。");
			});
			currentPlayButton.textContent = "⏸️";

			// プレイヤーのUIを更新
			const nextThumbnailImage = nextCard.querySelector(".thumbnail").src;
			const playerImageContainer = musicPlayer.querySelector(".image-container img");
			playerImageContainer.src = nextThumbnailImage;

			const nextArtistName = nextCard.getAttribute("data-artist-name") || "Unknown Artist";
			const artist = document.getElementById("artistName");
			artist.innerText = nextArtistName;
		} else {
			alert("これ以上次の音声がありません。");
		}
	});

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
				currentAudioPlayer.pause();
				currentAudioPlayer.currentTime = 0;
				if (currentPlayButton) currentPlayButton.textContent = "▶️";
			}

			if (audioPlayer.paused) {
				audioPlayer.play().catch(() => {
					alert("音声ファイルの再生に失敗しました。");
				});
				event.target.textContent = "⏸️";
				playPauseButton.classList.remove("fa-play");
				playPauseButton.classList.add("fa-pause");
				currentAudioPlayer = audioPlayer;
				currentPlayButton = event.target;
			} else {
				audioPlayer.pause();
				event.target.textContent = "▶️";
				playPauseButton.classList.remove("fa-pause");
				playPauseButton.classList.add("fa-play");
			}

			musicPlayer.style.display = "block";

			const thumbnailImage = card.querySelector(".thumbnail").src;
			const playerImageContainer = musicPlayer.querySelector(".image-container img");
			playerImageContainer.src = thumbnailImage;

			const artistName = card.getAttribute("data-artist-name") || "Unknown Artist";
			const artist = document.getElementById("artistName");
			artist.innerText = artistName;

			// リピートモードの再生終了処理
			audioPlayer.addEventListener("ended", () => {
				if (isRepeatMode) {
					audioPlayer.currentTime = 0; // 再生位置を先頭に戻す
					audioPlayer.play(); // 再度再生
				} else {
					resetPlayer();
				}
			});
		}
	});

	// リピートボタンの動作
	repeatButton.addEventListener("click", () => {
		isRepeatMode = !isRepeatMode; // リピートモードのトグル
		repeatButton.classList.toggle("active", isRepeatMode); // 見た目を切り替える
	});

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
		currentAudioPlayer = null;
		currentPlayButton = null;
	}

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

	playPauseButton.addEventListener("click", () => {
		if (!currentAudioPlayer) {
			alert("現在再生中の音声がありません。");
			return;
		}

		if (currentAudioPlayer.paused) {
			currentAudioPlayer.play().catch(() => {
				alert("音声ファイルの再生に失敗しました。");
			});
			playPauseButton.classList.remove("fa-play");
			playPauseButton.classList.add("fa-pause");
			if (currentPlayButton) currentPlayButton.textContent = "⏸️";
		} else {
			currentAudioPlayer.pause();
			playPauseButton.classList.remove("fa-pause");
			playPauseButton.classList.add("fa-play");
			if (currentPlayButton) currentPlayButton.textContent = "▶️";
		}
	});

	hidePlayerButton.addEventListener("click", () => {
		musicPlayer.style.display = "none";
		resetPlayer();
	});

	setInterval(updateProgress, 500);
});

document.addEventListener("DOMContentLoaded", () => {
    const container = document.body;
    let currentAudioPlayer = null; // 現在再生中のaudioを追跡
    let currentPlayButton = null; // 現在再生中のvideo-cardの再生ボタンを追跡

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
    
    let isDragging = false;

	   // 再生中の音声に合わせてシークバーを更新
    function updateProgress() {
        if (!currentAudioPlayer) return;

        const currentTime = currentAudioPlayer.currentTime;
        const duration = currentAudioPlayer.duration;

        // 現在の再生位置と全体の長さをパーセンテージで計算
        const progressPercent = (currentTime / duration) * 100;
        progress.style.width = `${progressPercent}%`;

        // 時間表示を更新
        currentTimeDisplay.textContent = formatTime(currentTime);
        durationDisplay.textContent = isNaN(duration) ? "0:00" : formatTime(duration);
    }

    // 時間を mm:ss 形式にフォーマットする関数
    function formatTime(seconds) {
        const minutes = Math.floor(seconds / 60);
        const remainingSeconds = Math.floor(seconds % 60);
        return `${minutes}:${remainingSeconds.toString().padStart(2, "0")}`;
    }

    // シークバーのクリックで再生位置を変更
    progressBar.addEventListener("click", (event) => {
        if (!currentAudioPlayer) return;

        const rect = progressBar.getBoundingClientRect();
        const clickX = event.clientX - rect.left;
        const newTime = (clickX / rect.width) * currentAudioPlayer.duration;

        currentAudioPlayer.currentTime = newTime;
        
    });

    // 再生中の更新を監視
    setInterval(updateProgress, 500);

    // 再生終了時にシークバーをリセット
    if (currentAudioPlayer) {
        currentAudioPlayer.addEventListener("ended", () => {
            progress.style.width = "0%";
            currentTimeDisplay.textContent = "0:00";
        });
    }
    
       // シークバーをクリックまたはドラッグで再生位置を変更
    function setProgress(event) {
        if (!currentAudioPlayer) return;

        const rect = progressBar.getBoundingClientRect();
        const clickX = event.clientX - rect.left;
        const newTime = (clickX / rect.width) * currentAudioPlayer.duration;

        currentAudioPlayer.currentTime = newTime;
    }

    // ドラッグ開始時の処理
    progressBar.addEventListener("mousedown", (event) => {
        isDragging = true;
        setProgress(event); // クリック位置を即座に反映
    });

    // マウス移動時の処理 (ドラッグ中のみ)
    document.addEventListener("mousemove", (event) => {
        if (isDragging) {
            setProgress(event);
        }
    });

    // ドラッグ終了時の処理
    document.addEventListener("mouseup", () => {
        if (isDragging) {
            isDragging = false;
        }
    });

    // タッチ操作にも対応
    progressBar.addEventListener("touchstart", (event) => {
        isDragging = true;
        const touch = event.touches[0];
        setProgress(touch);
    });

    document.addEventListener("touchmove", (event) => {
        if (isDragging) {
            const touch = event.touches[0];
            setProgress(touch);
        }
    });

    document.addEventListener("touchend", () => {
        if (isDragging) {
            isDragging = false;
        }
    });

    playPauseButton.addEventListener("click", () => {
        if (!currentAudioPlayer) {
            alert("現在再生中の音声がありません。");
            return;
        }

        // 再生/停止の切り替え
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
});

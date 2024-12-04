console.log("aaa")
document.addEventListener("DOMContentLoaded", function () {
  const playButtons = document.querySelectorAll(".play-button");
  const musicPlayer = document.querySelector(".music-player"); // 音楽プレイヤーの要素を取得
  const musicPlayerImage = musicPlayer.querySelector(".image-container img"); // プレイヤー内の画像を取得
  const progressContainer = musicPlayer.querySelector(
    ".progress-container .progress-bar"
  ); // 音楽プレイヤー内のシークバーを取得
  const progress = progressContainer.querySelector(".progress");
  const audio = document.querySelector(".audio-player"); // 音楽プレイヤーを取得
  const volumeBarContainer = document.querySelector(
    ".volume-bar .progress-bar"
  ); // 音量バーのコンテナ
  const volumeBar = volumeBarContainer.querySelector(".progress"); // 実際の音量バー
  const volumeIcon = document.querySelector(".volume-bar i"); // 音量アイコン
  const playerPlayButton = musicPlayer.querySelector(".play-pause"); // 音楽プレイヤー内の再生ボタン
  const backButton = musicPlayer.querySelector(".fa-step-backward"); // 戻るボタン
  const nextButton = musicPlayer.querySelector(".fa-step-forward"); // 次へボタン
  let currentTrackIndex = 0; // 現在の再生曲のインデックス
  let isDragging = false; // ドラッグ中かどうかを判断するフラグ
  let currentThumbnailButton = null; // 現在再生中のサムネイルの再生ボタンを追跡する変数
  let isVolumeDragging = false;

  // 曲のリスト (仮に2曲)
  const tracks = [
    {
      audioElement: document.getElementById("track1"), // 曲1のaudio要素
      imageSrc: "path/to/track1.jpg", // 曲1のサムネイル画像
    },
    {
      audioElement: document.getElementById("track2"), // 曲2のaudio要素
      imageSrc: "path/to/track2.jpg", // 曲2のサムネイル画像
    },
  ];

  function loadTrack(index) {
    const track = tracks[index];
    audio.src = track.audioElement.src;
    musicPlayerImage.src = track.imageSrc;
    audio.play();
    playerPlayButton.classList.replace("fa-play", "fa-pause");
    updateProgress(audio);
  }

  // 初期状態で音量を設定
  audio.volume = 0.5; // デフォルトで50%の音量
  updateVolumeBar(audio.volume); // 音量バーを初期化

  // 音量バーをクリックしたときの処理
  volumeBarContainer.addEventListener("click", function (e) {
    const clickX = e.clientX - this.getBoundingClientRect().left; // クリックした位置
    const width = this.clientWidth; // 音量バーの全体の幅
    const volumePercent = Math.min(Math.max(clickX / width, 0), 1); // 0〜1の範囲にクランプ
    audio.volume = volumePercent; // 音量を更新
    updateVolumeBar(audio.volume); // 音量バーを更新
  });

  // 音量バーをドラッグ操作するための処理
  volumeBarContainer.addEventListener("mousedown", function () {
    isVolumeDragging = true; // ドラッグ中フラグを立てる
  });

  document.addEventListener("mousemove", function (e) {
    if (!isVolumeDragging) return; // ドラッグ中でなければ何もしない
    const mouseX = e.clientX - volumeBarContainer.getBoundingClientRect().left; // マウスのX座標
    const width = volumeBarContainer.clientWidth; // 音量バーの全体の幅
    const volumePercent = Math.min(Math.max(mouseX / width, 0), 1); // 0〜1の範囲にクランプ
    audio.volume = volumePercent; // 音量を更新
    updateVolumeBar(audio.volume); // 音量バーを更新
  });

  document.addEventListener("mouseup", function () {
    isVolumeDragging = false; // ドラッグ終了
  });

  // 音量バーを更新する関数
  function updateVolumeBar(volume) {
    volumeBar.style.width = `${volume * 100}%`; // 音量バーの幅を更新
    updateVolumeIcon(volume); // 音量アイコンを更新
  }

  // 音量アイコンを音量に応じて更新する関数
  function updateVolumeIcon(volume) {
    if (volume === 0) {
      volumeIcon.classList.remove("fa-volume-down", "fa-volume-up");
      volumeIcon.classList.add("fa-volume-mute"); // ミュートアイコンに変更
    } else if (volume > 0 && volume <= 0.5) {
      volumeIcon.classList.remove("fa-volume-mute", "fa-volume-up");
      volumeIcon.classList.add("fa-volume-down"); // 小音量アイコンに変更
    } else {
      volumeIcon.classList.remove("fa-volume-mute", "fa-volume-down");
      volumeIcon.classList.add("fa-volume-up"); // 大音量アイコンに変更
    }
  }

  // 戻るボタン
  backButton.addEventListener("click", function () {
    const currentTime = audio.currentTime;

    // 現在の再生位置が3秒以内の場合、前の曲へ移動
    if (currentTime <= 3) {
      if (currentTrackIndex > 0) {
        surrentTrackIndex--;
        loadTrack(currentTrackIndex);
      }
    } else {
      // 現在の曲の最初に戻る
      audio.currentTime = 0;
    }
  });

  // 次の曲ボタン
  nextButton.addEventListener("click", function () {
    if (currentTrackIndex < tracks.length - 1) {
      currentTrackIndex++;
      loadTrack(currentTrackIndex);
    }
  });

  // サムネイル再生のボタン
  playButtons.forEach((button) => {
    button.addEventListener("click", function () {
      // buttonの次の要素であるaudioタグを取得
      const audioPlayer = this.nextElementSibling;
      const thumbnailImage = this.parentElement.querySelector(".thumbnail"); // サムネイル画像を取得
      console.log(audioPlayer)
      
      // サムネイル画像URLを音楽プレイヤーに設定
      musicPlayerImage.src = thumbnailImage.src; // プレイヤーの画像を更新
      currentThumbnailButton = this; // 現在のサムネイルのボタンを設定

      if (audioPlayer.paused) {
        audioPlayer.play(); //音楽を再生
        this.textContent = "⏸"; // 再生中はボタンを一時停止アイコンに変更
        playerPlayButton.classList.replace("fa-play", "fa-pause"); // 音楽プレイヤー内のボタンも再生アイコンに戻す
        musicPlayer.style.display = "flex"; // 音楽プレイヤーを表示
        updateProgress(audioPlayer); // 進行状況を更新
      } else {
        audioPlayer.pause(); // 音楽を一時停止
        this.textContent = "▶"; // 停止中はボタンを再生アイコンに戻す
        playerPlayButton.classList.replace("fa-pause", "fa-play");
      }

      // 再生終了後にボタンを元に戻す
      audioPlayer.addEventListener("ended", function () {
        button.textContent = "▶️"; // 再生終了後にボタンを再生アイコンに戻す
        playerPlayButton.classList.replace("fa-pause", "fa-play");
      });

      syncPlayerPlayButton(audioPlayer); // サムネイル再生ボタンとプレイヤー再生ボタンを同期
    });
  });

  // 音楽プレイヤー内の再生ボタンに対する処理
  playerPlayButton.addEventListener("click", function () {
    const audioPlayer = document.querySelector(".audio-player"); // プレイヤー内のaudio要素を取得
    console.log("155")
    if (audioPlayer.paused) {
		 console.log(audioPlayer.play())
    /*  audioPlayer.play();*/
      playerPlayButton.classList.replace("fa-play", "fa-pause"); // ボタンを一時停止アイコンに変更
      if (currentThumbnailButton) {
        currentThumbnailButton.textContent = "⏸"; // サムネイルのボタンも更新
        updateProgress(audioPlayer); // 進行状況を更新
      }
    } else {
      audioPlayer.pause();
      playerPlayButton.classList.replace("fa-pause", "fa-play"); // 停止中はボタンを再生アイコンに戻す
      if (currentThumbnailButton) {
        currentThumbnailButton.textContent = "▶️"; // サムネイルのボタンも更新
      }
    }
  });

  // サムネイル再生ボタンとプレイヤー再生ボタンの同期
  function syncPlayerPlayButton(audioPlayer) {
    if (!audioPlayer.paused) {
      playerPlayButton.classList.replace("fa-play", "fa-pause");
    } else {
      playerPlayButton.classList.replace("fa-pause", "fa-play");
    }
  }

  document.addEventListener("mousemove", function (e) {
    if (!isVolumeDragging) return;
    const mouseX = e.clientX - volumeBarContainer.getBoundingClientRect().left;
    const width = volumeBarContainer.clientWidth;
    const volumePercent = Math.min(Math.max(mouseX / width, 0), 1);
    audio.volume = volumePercent;
    updateVolumeBar(audio);
  });

  document.addEventListener("mouseup", function () {
    isDragging = false; // ドラッグ中フラグを下げる
    isVolumeDragging = false; // ドラッグ中フラグを下げる
  });

  // 進行状況を更新する関数
  function updateProgress(audio) {
    const duration = audio.duration; // 音楽の全体の長さ
    const currentTime = audio.currentTime; // 現在の再生位置
    const percent = (currentTime / duration) * 100; // パーセンテージを計算
    progress.style.width = `${percent}%`; // シークバーの幅を更新

    // 現在の再生時間を表示
    const currentTimeElement = musicPlayer.querySelector(".current-time");
    currentTimeElement.textContent = formatTime(currentTime);

    // 全体の音楽の時間を表示
    const durationElement = musicPlayer.querySelector(".duration");
    durationElement.textContent = formatTime(duration);

    // 音楽が再生中の場合、進行状況を更新
    if (!audio.paused) {
      requestAnimationFrame(() => updateProgress(audio)); // 次のフレームで再度実行
    }
  }

  // 時間を分:秒形式でフォーマットする関数
  function formatTime(time) {
    const minutes = Math.floor(time / 60);
    const seconds = Math.floor(time % 60);
    return `${minutes}:${seconds < 10 ? "0" : ""}${seconds}`; // 01:05 の形式
  }

  // シークバーをクリックしたときの処理
  progressContainer.addEventListener("click", function (e) {
    const clickX = e.clientX - this.getBoundingClientRect().left; // クリックした位置
    const width = this.clientWidth; // シークバーの全体の幅
    const percent = clickX / width; // クリック位置の割合を計算
    audio.currentTime = percent * audio.duration; // 音楽の再生位置を更新
    updateProgress(audio); //
  });

  // シークバーをドラッグ操作するための処理
  progressContainer.addEventListener("mousedown", function () {
    isDragging = true; // ドラッグ中フラグを立てる
  });

  document.addEventListener("mousemove", function (e) {
    if (!isDragging) return; // ドラッグ中でなければ何もしない
    const mouseX = e.clientX - progressContainer.getBoundingClientRect().left; // マウスのX座標
    const width = progressContainer.clientWidth; // シークバーの全体の幅
    const percent = Math.min(Math.max(mouseX / width, 0), 1); // 0から1の範囲にクランプ
    audio.currentTime = percent * audio.duration; // 音楽の再生位置を更新
    updateProgress(audio); // シークバーを更新
  });

  // その他のコード（再生ボタンやシークバーの処理など）はそのまま維持
});

// コメント表示用
function openPopup() {
  window.open('P2popup.jsp', 'popupWindow', 'width=500,height=300,scrollbars=yes');
}

// いいねボタンクリック
function changeImage(id) {
	console.log("aaa")
  var img = document.getElementById(id);
  console.log(img);
  console.log(img.src);

  if(img.src == 'http://127.0.0.1:3000/image/Heart-512x512%20test.png'){
    console.log("a")
    img.src = 'http://127.0.0.1:3000/image/Heart-512x512%20test2.png'; // 変更後の画像パス
  }else{
    img.src = 'http://127.0.0.1:3000/image/Heart-512x512%20test.png'; // 元の画像パス
  }
}

// ダイアログのスクリプト
function test(id){
  const openDialogButton = document.getElementById('openDialogButton');
const yesButton = document.getElementById('yesButton');
const noButton = document.getElementById('noButton');
const myDialog = document.getElementById('myDialog');
const confirmationDialog = document.getElementById('confirmationDialog');
const closeConfirmationButton = document.getElementById('closeConfirmationButton');
myDialog.showModal();

openDialogButton.addEventListener('click', () => {
  myDialog.showModal();
});

yesButton.addEventListener('click', () => {
  myDialog.close();
  confirmationDialog.showModal();
});

noButton.addEventListener('click', () => {
  myDialog.close();
});

closeConfirmationButton.addEventListener('click', () => {
  confirmationDialog.close();
});
}
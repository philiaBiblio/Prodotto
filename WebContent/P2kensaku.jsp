<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="images/png" rel="icon" href="images/icons8-youtube.png" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
	integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=settings" />
<link rel="stylesheet" href="P2kensaku.css" />
<link rel="stylesheet" href="searchbar.css" />
<title>ProDotto</title>
</head>

<body>
<form action = "P2SearchServlet">
	<header class="header">
		<div class="header_container">
			<div class="none"></div>
			<div class="search">
				
					<!-- フィルターボタン -->
					<select id="filter" class="filter-button" name="url">
					          <option selected value="P2Search.jsp">タグ</option>
					          <option value="P2UserSearch.jsp">アカウント名</option> 
					</select>

                <!-- タグ検索フォーム -->
                <input type="text" name="search" id="tags" class="some_class_name" placeholder='タグを入力' data-placeholder="タグを入力">
                <button type="submit" class="icon-button">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
			</div>
		</div>
	</header>
	
	<!-- Tagifyの設定 -->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify@latest/dist/tagify.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const filterElement = document.getElementById('filter'); // 検索バーのドロップダウン
    const inputElm = document.getElementById('tags'); // 検索バーの入力欄
    const searchButton = document.querySelector('.icon-button'); // 検索ボタン
    let tagify; // Tagifyのインスタンス

    // 初期状態で検索ボタンを無効化
    searchButton.disabled = true;
    searchButton.style.opacity = "0.5"; // ボタンの透明度を下げる

    // 入力状態のチェック関数
    function checkInput() {
        if (filterElement.value === "P2UserSearch.jsp") {
            // アカウント名検索: 通常のテキスト入力をチェック
            searchButton.disabled = inputElm.value.trim() === "";
        } else {
            // タグ検索: Tagifyのタグがあるかチェック
            searchButton.disabled = tagify.value.length === 0;
        }
        searchButton.style.opacity = searchButton.disabled ? "0.5" : "1";
    }

    // 初期状態でTagifyを有効化
    initializeTagify(true);

    function initializeTagify(enable) {
        if (enable) {
            if (!tagify) { // Tagifyが未初期化の場合のみ初期化
                tagify = new Tagify(inputElm, {
                    enforceWhitelist: true,
                    whitelist: ["バンド", "自由投稿", "セッション", "ギター", "ベース", "ドラム", "キーボード", "ジャズ",
                        "ブルース","クラシック","ラテン","ミニマル","ファンクグルーヴ","スローバラード","スケールアルペジオ","ワルツ",
                        "ポップス","ロックリフ","民族","神秘","ミステリー","クール","ロック","メタル","合唱","打楽器","弦楽器",
                        "金管楽器","木管楽器","ファンク","クレイジー","カノン","雅楽","シリアス"],
                    maxTags: 5,
                    dropdown: {
                        enabled: 0,
                        maxItems: 10000000000,
                    },
                });

                // Tagifyの変更イベントを監視
                tagify.on('change', checkInput);
            }
        } else {
            if (tagify) { // Tagifyが既に存在する場合のみ削除
                tagify.destroy();
                tagify = null;
            }
        }
    }

    // フィルタ選択肢が変更されたときのイベントリスナー
    filterElement.addEventListener('change', function () {
        const selectedFilter = this.value;
        inputElm.value = ''; // 入力フィールドをリセット
        searchButton.disabled = true;
        searchButton.style.opacity = "0.5";

        if (selectedFilter === "P2UserSearch.jsp") { // アカウント名検索
            inputElm.placeholder = "アカウント名を入力";
            initializeTagify(false); // Tagifyを無効化
        } else { // タグ検索
            inputElm.placeholder = "タグを入力";
            initializeTagify(true); // Tagifyを有効化
        }
    });

    // 通常のテキスト入力（アカウント名検索）の場合も監視
    inputElm.addEventListener('input', checkInput);

    // ページロード時にURLのパラメータに基づいてフィルタの状態を設定
    const params = new URLSearchParams(window.location.search);
    const selectedUrl = params.get('url');

    if (selectedUrl) {
        filterElement.value = selectedUrl;

        if (selectedUrl === "P2UserSearch.jsp") { // アカウント名検索
            inputElm.placeholder = "アカウント名を入力"; // プレースホルダ変更
            initializeTagify(false); // Tagifyを無効化
        } else { // タグ検索
            inputElm.placeholder = "タグを入力"; // プレースホルダ変更
            initializeTagify(true); // Tagifyを有効化
        }
    }
});

</script>

	<section class="nav" id="navbar">
		<nav class="nav_container">
			<div>
				<a class="nav_logo">  
					<span class="logo_name">
						<!-- ここにProDottoアイコンを入れる --> 
						ProDotto
					</span>
				</a>

				<div class="nav_list">
					<div class="nav_items navtop">
						<a href="P2TimelineServlet" class="nav_link navtop nav_soroe "
							id="P2Timelineid"> <i class="fa fa-house nav_icon"></i> <span
							class="nav_name">タイムライン</span>
						</a> <a href="P2DM.jsp" class="nav_link navtop nav_soroe" id="P2DMid">
							<!-- <i class="fa fa-compass nav_icon"></i> -->
							<div class="nav_icon nav_soroe">
								<i class="gg-mail"></i>
							</div> <span class="nav_name">DM</span>
						</a> <a href="P2RankingServlet" class="nav_link navtop nav_soroe"
							id="P2Rankingid"> <!-- <i class="fa-brands fa-tiktok nav_icon"></i> -->
							<div class="nav_icon nav_soroe">
								<i class="gg-crown"></i>
							</div> <span class="nav_name">ランキング</span>
						</a> <a href="P2PostAndRecordingServlet"
							class="nav_link navtop nav_soroe" id="P2PostAndRecordingid">
							<!-- <i class="fa-solid fa-users nav_icon"></i> -->
							<div class="nav_icon nav_soroe">
								<i class="gg-add-r"></i>
							</div> <span class="nav_name">投稿</span>
						</a> <a href="P2ProfileServlet" class="nav_link navtop nav_soroe"
							id="P2ProfileMineid"> <!-- <i class="fa-solid fa-users nav_icon"></i> -->
							<div class="nav_icon nav_soroe">
								<i class="gg-boy"></i>
							</div> <span class="nav_name">プロフィール</span>
						</a> <a href="P2Settings.jsp" class="nav_link navtop" id="P2Settingsid">
							 <!-- <i class="fa-solid fa-video nav_icon"></i> -->
							<div class="nav_icon nav_soroe">
								<span class="material-symbols-outlined"> settings </span>
							</div> <span class="nav_name">設定</span>
						</a>

						<!-- <a href="#" class="nav_link navtop">
                <i class="fa-solid fa-clock-rotate-left nav_icon"></i>
                <span class="nav_name">履歴</span>
              </a>
              <a href="#" class="nav_link navtop">
                <i class="fa-solid fa-thumbs-up nav_icon"></i>
                <span class="nav_name">いいねした動画</span>
              </a> -->
					</div>
				</div>
			</div>
		</nav>
	</section>

	<script src="audioPlayer.js"></script>
	<script src="https://unpkg.com/wavesurfer.js"></script>
	<script>
		const currentFile = window.location.pathname.split("/").pop(); 
		
		const fileToIdMap = {
			    "P2Timeline.jsp":"P2Timelineid",

			    "P2DM.jsp":"P2DMid",

			    "P2Ranking.jsp":"P2Rankingid",
			    
			    "P2PostAndRecording.jsp":"P2PostAndRecordingid",
			    "P2DerivativesList.jsp":"P2PostAndRecordingid",

			    "P2ProfileMine.jsp":"P2ProfileMineid",
			    "P2ProfileEdit.jsp":"P2ProfileMineid",
			    "P2Notifications.jsp":"P2ProfileMineid",

			    "P2Settings.jsp":"P2Settingsid",
			    "P2PasswordChange.jsp":"P2Settingsid",
			    "P2EmailChange.jsp": "P2Settingsid",
			    "P2Logout.jsp": "P2Settingsid",
			    "P2AccountDeletion.jsp": "P2Settingsid"
			};

  		const targetId = fileToIdMap[currentFile];
  		
  		if (targetId) {
  	    	const element = document.getElementById(targetId);
  	    	if (element) {
  	        	element.classList.add("active");
  	    	}
  	    }

  	// 現在のURLからクエリパラメータを取得
  		const params = new URLSearchParams(window.location.search);
  		const selectedUrl = params.get('url');

  		// 選択状態を反映
  		if (selectedUrl) {
  		    const filterElement = document.getElementById('filter');
  		    filterElement.value = selectedUrl;
  		}

	</script>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="images/png" rel="icon" href="images/icons8-youtube.png" />
    <link　rel="stylesheet"
      href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
      integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS"
      crossorigin="anonymous"/>
    <link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=settings"/>
    <link rel="stylesheet" href="P1kensaku.css" />
    <link rel="stylesheet" href="searchbar1.css" />
    <title>ProDotto</title>
  </head>

  <body>
  <form action="P1SearchServlet">
    <header class="header">
      <div class="header_container">
        <div class="none"></div>
        <div class="search">

          <!-- フィルターボタン -->
          <!--  これによりフィルターボタン選択で飛ぶようになる-->
          <select id="filter" class="filter-button" name="url">
            <option selected value="P1Search.jsp">タグ</option>
            <option value="P1UserSearch.jsp">アカウント名</option>
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

        if (selectedFilter === "P1UserSearch.jsp") { // アカウント名検索
            inputElm.placeholder = "アカウント名を入力";
            initializeTagify(false); // Tagifyを無効化
        } else { // タグ検索
            inputElm.placeholder = "タグを入力";
            initializeTagify(true); // Tagifyを有効化
        }
    });

    // エンターキーの動作をカスタマイズ
    inputElm.addEventListener('keydown', function (event) {
        if (event.key === 'Enter') {
            // ドロップダウンの可視性を直接確認
            const dropdown = document.querySelector('.tagify__dropdown');
            const isDropdownVisible = dropdown && dropdown.offsetParent !== null;

            console.log('Enter key pressed');
            console.log('Dropdown visible:', isDropdownVisible);

            if (isDropdownVisible) {
                console.log('Tagify dropdown is visible. Default Tagify behavior will handle this.');
                return; // タグ選択に任せる
            } else {
                console.log('No dropdown visible. Triggering search.');
                event.preventDefault(); // デフォルト動作を防止
                searchButton.click(); // 検索ボタンをクリック
            }
        }
    });

    
    // ページロード時にURLのパラメータに基づいてフィルタの状態を設定
    const params = new URLSearchParams(window.location.search);
    const selectedUrl = params.get('url');

    if (selectedUrl) {
        const filterElement = document.getElementById('filter');
        filterElement.value = selectedUrl;

        if (selectedUrl === "P1UserSearch.jsp") { // アカウント名検索
            inputElm.placeholder = "アカウント名を入力"; // プレースホルダ変更
            initializeTagify(false); // Tagifyを無効化
        } else { // タグ検索
            inputElm.placeholder = "タグを入力"; // プレースホルダ変更
            initializeTagify(true); // Tagifyを有効化
        }}
});
</script>

    <section class="nav" id="navbar">
      <nav class="nav_container">
        <div>
          <a href="#" class="nav_link nav_logo">
            <i class="fa-solid fa-bars nav_icon"></i>
            <span class="logo_name">
              <!-- ここにProDottoアイコンを入れる -->
              <i class="fab fa-"></i>
              ProDotto
            </span>
          </a>

          <div class="nav_list">
            <div class="nav_items navtop">
              <a href="P1UserManegement.jsp" class="nav_link navtop" id="P1UserManegementid">
                <!-- <i class="fa fa-house nav_icon"></i> -->
                <div class="nav_icon">
                  <i class="gg-profile"></i>
                </div>
                <span class="nav_name">ユーザー管理</span>
              </a>

              <a href="P1EventManegement.jsp" class="nav_link navtop" id="P1EventManegementid">
                <!-- <i class="fa fa-house nav_icon"></i> -->
                <div class="nav_icon nav_soroe">
                  <i class="gg-flag-alt"></i>
                </div>
                <span class="nav_name">イベント管理</span>
              </a>

              <a href="P1AdminSetting.jsp" class="nav_link navtop" id="P1AdminSettingid">
                <!-- <i class="fa-solid fa-video nav_icon"></i> -->
                <div class="nav_icon">
                  <span class="material-symbols-outlined"> settings </span>
                </div>
                <span class="nav_name">設定</span>
              </a>

              <a href="TLManagementServlet" class="nav_link navtop" id="P1TLManagementid">
                <i class="fa fa-house nav_icon"></i>
                <span class="nav_name">管理者タイムライン</span>
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
  	const currentFile = window.location.pathname.split("/").pop() + window.location.search;

	const fileToIdMap = {
		"P1UserManegement.jsp": "P1UserManegementid",
	
		"P1EventManegement.jsp": "P1EventManegementid",
	
		"P1TLManagement.jsp": "P1TLManagementid",
		
		"P1PaersonalInformation.jsp":"P1AdminSettingid",
		"P1AdminSetting.jsp": "P1AdminSettingid",
		"P1PaersonalInformation.jsp": "P1AdminSettingid",
		"P1PasswordChange.jsp": "P1AdminSettingid",
		"P1EmailChange.jsp": "P1AdminSettingid",
		"P1Logout.jsp": "P1AdminSettingid",
	};

  	function getId(filename) {
  	  if (filename.includes("UserManagementServlet")) {
  	    return "P1UserManegementid";
  	  }
  	  return fileToIdMap[filename] || null;
  	}

  	const targetId = getId(currentFile);

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

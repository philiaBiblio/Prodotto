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
            <option selected value="">タグ</option>
            <option value="P1UserSearch.jsp">アカウント名</option>
          </select>

          <!-- 検索バー -->
          <input type="text" name="search" id="search" placeholder="Search" value=""/>
          <button type="submit" class="icon-button">
			<i class="fa-solid fa-magnifying-glass"></i>
		  </button>
        </div>
      </div>
    </header>

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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>プロフィール編集画面</title>
    <link rel="stylesheet" href="P1PaersonalInformation.css">
</head>

<body>
    <form action="" method="post">
        <!-- アイコン設定 -->
        <div class="icon">
            <img id="iconImage" src="image/ききゅう.jpg" alt="icon" />
            <label for="fileInput">写真を選択</label>
            <input type="file" name="icon" id="fileInput" accept="image/jpeg, image/png" />
        </div>

        <div class="nakami">
            <!-- ユーザー名 -->
            <div class="profile-item">
                <span id="username-display" name="name"><b>氏名:</b> さんまのはらわた</span>
                <input type="text" class="textbox" id="username-input" value="さんまのはらわた" name="name">
                <span class="dli-create" id="username-icon" onclick="enableEdit('username')"></span>
            </div>
            
            <!-- 性別 -->
            <!-- DBから持ってきて性別選択されてる状態にしておく -->
            <div class="profile-item">
                <span id="sex-display"><b>性別:</b> 男</span>
                <div class="button" id="sex-input">
                    <div>
                        <label class="left">
                            <input type="button" class="sexM nomargin" name="sex" id="otoko" value="男">
                        </label>
                    </div>
                    <div>
                        <label class="right">
                            <input type="button" class="sexW nomargin" name="sex" id="onna" value="女">
                        </label>
                    </div>
                </div>
                <span class="dli-create" id="sex-icon" onclick="enableEdit('sex')"></span>
            </div>

            <!-- 生年月日 -->
            <div class="profile-item">
                <span id="birth-display"><b>生年月日: </b>1990-01-01</span>
                <input type="date" class="textbox" id="birth-input" value="1990-01-01" name="birth">
                <span class="dli-create" id="birth-icon" onclick="enableEdit('birth')"></span>
            </div>

            <!-- メールアドレス -->
            <div class="profile-item">
                <span id="email-display"><b>メールアドレス: </b>pichipichi@gmail.com</span>
                <a href="P1EmailChange.jsp"><span class="dli-create"></span></a>
            </div>

            <!-- パスワード -->
            <div class="profile-item">
                <span id="pass-display"><b>パスワード: </b> ＊＊＊＊＊＊</span>
                <a href="P1PasswordChange.jsp"><span class="dli-create"></span></a>
            </div>

            <!-- 保存ボタン（最初は非表示） -->
            <div class="button-container" id="button-container">
                <input type="submit" class="submit-button" name="hozon" id="hozon" value="保存" />
            </div>
        </div>
    </form>
    
  		<jsp:include page="P1kensaku.jsp"></jsp:include>
	

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const sexM = document.querySelector(".sexM");
            const sexW = document.querySelector(".sexW");

            // 性別ボタンにホバーとクリックのイベントを追加
            sexM.addEventListener("mouseover", function () {
                sexM.classList.add("hovered");
                sexW.classList.remove("hovered");
            });

            sexM.addEventListener("mouseout", function () {
                sexM.classList.remove("hovered");
            });

            sexW.addEventListener("mouseover", function () {
                sexW.classList.add("hovered");
                sexM.classList.remove("hovered");
            });

            sexW.addEventListener("mouseout", function () {
                sexW.classList.remove("hovered");
            });

            sexM.addEventListener("click", function () {
                sexM.classList.add("clicked");
                sexW.classList.remove("clicked");
            });

            sexW.addEventListener("click", function () {
                sexW.classList.add("clicked");
                sexM.classList.remove("clicked");
            });
        });

        // フィールドの編集を有効にし、保存ボタンを表示する
        function enableEdit(field) {
            const displaySpan = document.getElementById(field + '-display');
            const displayIcon = document.getElementById(field + '-icon');
            const inputField = document.getElementById(field + '-input');
            const buttonContainer = document.getElementById('button-container');

            // 該当フィールドを編集可能に
            displaySpan.style.display = 'none';
            displayIcon.style.display = 'none';
            inputField.style.display = 'flex';

            // 保存ボタンを表示
            buttonContainer.style.display = 'block';
        }
    </script>
</body>
</html>

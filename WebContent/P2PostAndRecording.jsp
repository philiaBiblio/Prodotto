<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>投稿・録音画面</title>
    <link rel="stylesheet" href="P2PostAndRecording.css">
</head>
<body>
    <div class="container">
        <!-- セッションセクション -->
        <section class="section session">
            <h1>セッション</h1>
            <div class="session-content">きょうのおだい</div>
            <div class="button-group">
                <a href="P2Recording.jsp" class="link-button start">セッションをはじめる</a>
                <a href="P2DerivativesList.jsp" class="link-button party">セッションに参加</a>
            </div>
        </section>

        <!-- ひとりでセクション -->
        <section class="section free">
            <h1>ひとりで！</h1>
            <div class="button-group">
                <a href="P2Recording.jsp" class="link-button recording">今すぐ録音</a>
                <a class="link-button upload" id="file-select-link">ファイルをアップロード</a>
                <input type="file" id="file-input" accept="audio/*" style="display: none">
            </div>
        </section>
    </div>

    <script>
        document.getElementById("file-select-link").addEventListener("click", function(event) {
            event.preventDefault(); // デフォルトのリンク動作をキャンセル

            // ファイル選択ダイアログを表示
            document.getElementById("file-input").click();
        });

        document.getElementById("file-input").addEventListener("change", function() {
            // ファイルが選択された後の処理
            if (this.files.length > 0) {
                // 次のページに遷移
                window.location.href = "P2PostConfirmation.jsp"; // 遷移先のURL
            }
        });
    </script>
</body>
</html>

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

<%
	//セッションの取得
	HttpSession ses = request.getSession();
 %>

<body style="margin: 50px 0 0 -5px;">
    <div class="container">
        <!-- セッションセクション -->
        <section class="section session">
            <div class="session-content"><%=ses.getAttribute("ODAITEXST") %></div>
            <div class="button-group">
                <a href="P2Recording.jsp?hitoride=0" class="link-button start">セッションをはじめる</a>
                <a href="P2DerivativesListServlet" class="link-button party">セッションをさがす</a>
            </div>
        </section>

        <!-- ひとりでセクション -->
        <section class="section free">
            <div class="button-group">
                <a href="P2Recording.jsp?hitoride=1" class="link-button recording">ひとりでセッション</a>
                <a class="link-button upload" id="file-select-link">作品をシェア</a>
                <form id="file-upload-form" action="P2FileUploadServlet" method="post" enctype="multipart/form-data" style="display: none;">
  		  		<input type="file" id="file-input" name="file" accept="audio/*">
            	</form>
            </div>
        </section>
    </div>
    
     <jsp:include page="P2kensaku.jsp"></jsp:include>

    <script>
        document.getElementById("file-select-link").addEventListener("click", function(event) {
            event.preventDefault(); // デフォルトのリンク動作をキャンセル

            // ファイル選択ダイアログを表示
            document.getElementById("file-input").click();
        });

        document.getElementById("file-input").addEventListener("change", function() {
            // ファイルが選択された後の処理
            if (this.files.length > 0) {
                // フォームを送信
                document.getElementById("file-upload-form").submit();
            }
        });
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>確認番号入力</title>
    <link rel="stylesheet" href="P2PreLoginPasswordChange2.css">
</head>
<body>
    <div class="form-container">
        <h1>確認番号入力</h1>
        <p></p>
        
        <form action="#" method="post" id="otp-form">
            <!-- 番号入力（5桁分の入力フィールド） -->
            <div class="otp-inputs">
                <input type="text" class="otp-input" maxlength="1" pattern="[0-9]" required>
                <input type="text" class="otp-input" maxlength="1" pattern="[0-9]" required>
                <input type="text" class="otp-input" maxlength="1" pattern="[0-9]" required>
                <input type="text" class="otp-input" maxlength="1" pattern="[0-9]" required>
                <input type="text" class="otp-input" maxlength="1" pattern="[0-9]" required>
            </div>

            <!-- ボタン -->
            <div class="button-group">
                <button type="submit"><a href="P2PreLoginPasswordChange3.jsp">送信（確定）</a></button>
            </div>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('.otp-input');

            inputs.forEach((input, index) => {
                input.addEventListener('input', (event) => {
                    const value = event.target.value;
                    
                    // 1文字入力されたら次のフィールドにフォーカス移動
                    if (value.length === 1 && index < inputs.length - 1) {
                        inputs[index + 1].focus();
                    }

                    // 文字が消去された場合の処理
                    if (value.length === 0 && index > 0) {
                        inputs[index - 1].focus();
                    }
                });

                input.addEventListener('keydown', (event) => {
                    if (event.key === "Backspace" && input.value === '') {
                        // バックスペース時に前のフィールドにフォーカス
                        if (index > 0) {
                            inputs[index - 1].focus();
                        }
                    }
                });

                input.addEventListener('paste', (event) => {
                    // ペースト処理のために全体を処理
                    const pastedData = event.clipboardData.getData('text').slice(0, inputs.length);
                    inputs.forEach((input, i) => {
                        if (i < pastedData.length) {
                            input.value = pastedData[i];
                            if (i < inputs.length - 1) {
                                inputs[i + 1].focus();
                            }
                        }
                    });
                    event.preventDefault(); // デフォルトのペースト処理をキャンセル
                });
            });

            // フォーム送信時に全ての入力を一つにまとめる
            document.getElementById('otp-form').addEventListener('submit', function(event) {
                event.preventDefault();
                const otp = Array.from(inputs).map(input => input.value).join('');
                console.log('OTP:', otp); // ここでOTPをサーバに送信
            });
        });
    </script>
</body>
</html>
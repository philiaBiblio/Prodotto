<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>新規登録</title>

    <link
      href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="P2SignUp.css" />
  </head>

  <body>
    <div class="all">
      <form action="P2SignUpConfirmation.jsp" >
        <h1>新規会員登録</h1>
  
        <div class="nakami">
          <div>
            <label class="soroe">ユーザー名</label><br />
            <label
              ><input
                type="text"
                class="textbox"
                value="むう"
                name="name"
                id="name"
                required /></label
            ><br />
          </div>
  
          <div>
            <label class="soroe">ユーザーID</label><br />
            <label>
              <input
                type="text"
                class="textbox"
                name="userid"
                id="userid"
                placeholder="英数字4桁～14桁"
                required /></label
            ><br />
            <!-- まだ存在しないユーザIDならOK出しちゃう,存在してたらこのユーザIDは使えませんって出ちゃう -->
          </div>
          <div>
            <label class="soroe">メールアドレス</label><br />
            <label
              ><input
                type="email"
                class="textbox"
                name="mailadd"
                id="mailadd"
                required
                placeholder="メールアドレスを入力" /></label
            ><br />
            <!-- 上のメールアドレスとおんなじだったらオッケーが出る -->
            <!-- <label class="soroe">確認のためもう一度入力してください</label><br> -->
            <label
              ><input
                type="email"
                class="textbox"
                name="mailadd2"
                id="mailadd2"
                required
                placeholder="メールアドレスを再入力" /></label
            ><br />
          </div>
  
          <div>
            <label class="soroe">パスワード</label><br />
            <input type="checkbox" id="checkPassword" />
            <div class="togglePassword">
              <input
                type="password"
                class="hideText"
                name="pw"
                id="pw"
                value=""
                required
                placeholder="英数字６文字以上"
                Onchange="disp1()"
              />
              <script>
              	function disp1(){
              	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
              	//↓の例では、変数e1の中にpwテキストボックスが入る
              		var e1 = document.getElementById("pw");
              	//〇〇.value…指定した入力部品の属性に値を設定する
              	//入力部品を入れた変数名.value= '設定したい値'
              		document.getElementById("pass1").value = e1.value;
                }
              </script>
              <input type="text" class="showText" id="pass1" name="pw" Onchange="disp2()"/>
              <script>
              	function disp2(){
              	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
              	//↓の例では、変数e1の中にpwテキストボックスが入る
              		var e1 = document.getElementById("pass1");
              	//〇〇.value…指定した入力部品の属性に値を設定する
              	//入力部品を入れた変数名.value= '設定したい値'
              		document.getElementById("pw").value = e1.value;
                }
              </script>
              <label for="checkPassword" class="fa fa-eye"></label>
              <label for="checkPassword" class="fa fa-eye-slash"></label>
            </div>
            <!-- 上のパスワードとおんなじだったらオッケーが出る -->
            <!-- <label class="soroe">確認のためもう一度入力してください</label><br> -->
            <input type="checkbox" id="checkPassword2" />
            <div class="togglePassword2">
              <input
                type="password"
                class="hideText2"
                name="pw2"
                id="pw2"
                value=""
                required
                placeholder="パスワードを再入力"
                Onchange="disp3()"
              />
              <script>
              	function disp3(){
              	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
              	//↓の例では、変数e1の中にpwテキストボックスが入る
              		var e2 = document.getElementById("pw2");
              	//〇〇.value…指定した入力部品の属性に値を設定する
              	//入力部品を入れた変数名.value= '設定したい値'
              		document.getElementById("pass2").value = e2.value;
                }
              </script>
              <input type="text" class="showText2" id="pass2" name="pw2" Onchange="disp4()"/>
              <script>
              function disp4(){
              	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
              	//↓の例では、変数e1の中にpwテキストボックスが入る
              		var e2 = document.getElementById("pass2");
              	//〇〇.value…指定した入力部品の属性に値を設定する
              	//入力部品を入れた変数名.value= '設定したい値'
              		document.getElementById("pw2").value = e2.value;
                }
              </script>
              <label for="checkPassword2" class="fa fa-eye"></label>
              <label for="checkPassword2" class="fa fa-eye-slash"></label>
            </div>
            <br />
          </div>
  
          <label class="soroe">性別</label><br />
  
          <div class="button">
            <label class="left"
              ><input
                type="radio"
                class="sexM nomargin"
                name="sexy"
                id="otoko"
                value="男"
            /></label>
            <label class="right"
              ><input
                type="radio"
                class="sexW nomargin"
                name="sexy"
                id="onna"
                value="女" /></label
            ><br />
          </div>
  
          <script>
            document.addEventListener("DOMContentLoaded", function () {
              const sexM = document.querySelector(".sexM");
              const sexW = document.querySelector(".sexW");
  
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

            
          </script>
  
          <div>
            <label class="soroe">生年月日</label><br />
            <input
              type="date"
              class="textbox birth"
              name="birth"
              id="birth"
            /><br />
          </div>
  
          <div>
            <label class="soroe">演奏頻度</label><br />
            <select class="textbox" name="fq" id="fq">
              <option value="none">演奏しない</option>
              <option value="everyday">毎日</option>
              <option value="usually">週3、4回</option>
              <option value="sometimes">月1</option>
              <option value="never">その他</option>
              <option value="" selected>選択してください</option>
             </select>
              <br/>
          </div>
  
          <div>
            <label class="soroe">楽器歴</label><br />
            <select class="textbox" name="history" id="history">
              <option value="first">はじめて</option>
              <option value="3months">～3ヵ月</option>
              <option value="half">～半年</option>
              <option value="year">～1年</option>
              <option value="5years">～5年</option>
              <option value="moreYears">5年～</option>
              <option value="" selected>選択してください</option></select
            ><br />
          </div>
        </div>
        <footer>
<!--         <a href="P2Login.jsp"> -->
        <input type="submit" name="modoru" id="modoru" value="戻る">
<!--         </a> -->
<!--         <a href="P2SignUpConfirmation.jsp"> -->
        <input type="submit" name="touroku" id="touroku" value="確定">
<!--         </a> -->
              </footer>
      </form>
      

    </div>
  </body>
</html>

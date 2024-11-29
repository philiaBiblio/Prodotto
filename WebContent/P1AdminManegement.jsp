<%@page import="java.util.ArrayList"%>
<%@page import="apli.AdminUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>管理者管理画面</title>
    <link rel="stylesheet" href="P1AdminManegement.css" />
    <link
      href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
      rel="stylesheet"
    />
  </head>
 <%
 	//セッションの取得
	HttpSession ses = request.getSession();
	// ログイン情報の取得
	/* AdminUser au = (AdminUser)ses.getAttribute("ADMINLOGIN"); */
	ArrayList<AdminUser> auList = (ArrayList<AdminUser>) ses.getAttribute("ADMINLIST");
	// エラー情報の取得
	String errorID = (String)ses.getAttribute("ERRORID");
	String errorPass = (String)ses.getAttribute("ERRORPASS");
	String trueMess = (String)ses.getAttribute("TRUEMESS");
%>
  <body>
    <h1>管理者管理画面</h1>
 
    <header>
    <form action="AdminManagementServlet" method="post">
      <table class="kanri">
        <tr>
          <th id="idleft">ID =</th>
          <th id="idright">
            <input type="checkbox" id="checkPassword" />
            <div class="togglePassword">
              <input
                type="password"
                class="hideText"
                name="id"
                id="id"
                disabled
                placeholder="目のボタンをクリック後ID入力"
                Onchange="disp1()"
              />
              <input type="text" class="showText" name="idtext" id="idtext" Onchange="disp2()"/>
              <label for="checkPassword" class="fa fa-eye"></label>
              <label for="checkPassword" class="fa fa-eye-slash"></label>
            </div>
          </th>

        </tr>
        <tr>
          <th id="passleft">PASS =</th>
          <th id="passright"><input type="checkbox" id="checkPassword2" />
            <div class="togglePassword">
              <input
                type="password"
                class="hideText2"
                name="id2"
                id="id2"
                disabled
                placeholder="目のボタンをクリック後PW入力"
                Onchange="disp3()"
              />
              <input type="text" class="showText2" name="passtext" id="passtext" Onchange="disp4()">
              <label for="checkPassword2" class="fa fa-eye"></label>
              <label for="checkPassword2" class="fa fa-eye-slash"></label>
            </div>
          </th>
        </tr>
      </table>
      <%if(errorID != null){ %>
				<p style="color:#ff0000"><%=errorID %></p>
	  <%} %>
	  <%ses.removeAttribute("ERRORID"); %>
	  <%if(errorPass != null){ %>
				<p style="color:#ff0000"><%=errorPass %></p>
			<%} %>
			<%ses.removeAttribute("ERRORPASS"); %>
    </header>
    
      <script>
    <%if(trueMess != null ){ %>
    window.onload = function(){
		const dialog = document.querySelector("#confirmationDialog");
    	dialog.showModal();
    	} 	
    	<%} %>
    	<%ses.removeAttribute("TRUEMESS"); %>
    </script>
    
    <script>
    function disp1(){
      	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
      	//↓の例では、変数e1の中にpwテキストボックスが入る
      		var e1 = document.getElementById("id");
      	//〇〇.value…指定した入力部品の属性に値を設定する
      	//入力部品を入れた変数名.value= '設定したい値'
      		document.getElementById("idtext").value = e1.value;
        }
    function disp2(){
      	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
      	//↓の例では、変数e1の中にpwテキストボックスが入る
      		var e1 = document.getElementById("idtext");
      	//〇〇.value…指定した入力部品の属性に値を設定する
      	//入力部品を入れた変数名.value= '設定したい値'
      		document.getElementById("id").value = e1.value;
        }

    function disp3(){
      	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
      	//↓の例では、変数e1の中にpwテキストボックスが入る
      		var e2 = document.getElementById("id2");
      	//〇〇.value…指定した入力部品の属性に値を設定する
      	//入力部品を入れた変数名.value= '設定したい値'
      		document.getElementById("passtext").value = e2.value;
        }
    function disp4(){
      	//document.getElementById …()内で指定した名前を持つ入力部品を取得する
      	//↓の例では、変数e1の中にpwテキストボックスが入る
      		var e2 = document.getElementById("passtext");
      	//〇〇.value…指定した入力部品の属性に値を設定する
      	//入力部品を入れた変数名.value= '設定したい値'
      		document.getElementById("id2").value = e2.value;
        }

    // ダイアログのスクリプト
    function dialog(id){
        console.log("274")
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
    } 	
    </script>
    
    <div class="formcss">
      <div class="nakami">
        <div>
          <label class="soroe">氏名</label><br />
          <label
            ><input
              type="text"
              class="textbox"
              name="name"
              id="name"
              required /></label
          ><br />
        </div>

        <label class="soroe">性別</label><br />
        <div class="button">
        <input 
	        type="radio" 
	        id="otoko" 
	        name="sexy"
	        value="0">
	        <label 
	        class="radio-label" 
	        for="otoko">男</label>
	
	        <input 
	        type="radio" 
	        id="onna" 
	        name="sexy" 
	        value="1">
	        <label 
	        class="radio-label" 
	        for="onna">女</label><br/>
        </div>

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
          <label class="soroe">メールアドレス</label><br />
          <label
            ><input
              type="email"
              class="textbox"
              name="mailadd"
              id="mailadd"
              required></label
          ><br>
        </div>

        <div class="kakutei">
          <input type="submit" name="kakutei" id="kakutei" value="確定" />
        </div>
      </div>
    </div>
    </form>

<form action="P1AdminManagementKensakuServlet" method="post">
    <footer>
      <div class="search-container">
        <input type="text" class="search-box" name="kensaku" placeholder="ユーザー名" />
        <button type="submit" class="search-button">検索</button>
      </div>
</form>

      <table class="kensaku">
        <tr>
          <th>ユーザー名</th>
          <th>ユーザーID</th>
          <th>削除ボタン</th>
        </tr>
        
        <%if(auList != null){ %>
		<% for (int i = 0; i < auList.size(); i++) { %>
		<form action="P1AdminManagementDeliteServlet" method="post">
		<tr>
        <td><%= auList.get(i).getAdminName() %></td>
        <td><%= auList.get(i).getAdminUserid() %></td>
        <td class="delete-button">
        <input type="hidden" name="adminID" value="<%=i%>">
        <button type="button" id="openDialogButton" onclick="dialog('sakuzyo')">アカウント<br>削除</button>
        
                <dialog id="myDialog">
                  <p>このアカウントを削除しますか？</p>
                  <div class="buttonContainer">
                    <button type="submit" class="dialogButton" id="yesButton">はい</button>
                    <button type="button" class="dialogButton" id="noButton">いいえ</button>
                  </div>
                </dialog>        
        </td>
      	</tr>
      	</form>
		<% } %>			
	  <%} %>
      </table> 
              <dialog id="confirmationDialog">
                  <p>削除しました</p>
                  <button type="button" class="dialogButton" id="closeConfirmationButton" onclick="confirmationDialog.close();">閉じる</button>
                </dialog>
      
    </footer> 
  </body>
</html>

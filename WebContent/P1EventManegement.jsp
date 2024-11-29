<%@page import="apli.Event"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>イベント管理画面</title>
    <link rel="stylesheet" href="P1EventManegement.css" />
  </head>
<%
	//セッションの取得
	HttpSession ses = request.getSession();
	// ログイン情報の取得
	String mess = (String)ses.getAttribute("ERROR");
	Event e = (Event)ses.getAttribute("EVENT");
%>

  <body>
    <!-- イベント更新 -->
    <h1>イベント管理</h1>
    <div class="form-container">
    <form action="EventManagementServlet" method="post">
      <div id="kousin">
        <select name="nen" id="nen">
          <option value="none" selected>選択してください</option>
          <option value="2023">2023</option>
          <option value="2024">2024</option>
          <option value="2025">2025</option>
          <option value="2026">2026</option>
        </select>
        <label for="nen">年</label>

        <select name="tuki" id="tuki">
          <option value="none" selected>選択してください</option>
          <option value="01">1</option>
          <option value="02">2</option>
          <option value="03">3</option>
          <option value="04">4</option>
          <option value="05">5</option>
          <option value="06">6</option>
          <option value="07">7</option>
          <option value="08">8</option>
          <option value="09">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
        </select>
        <label for="tuki">月</label><br />
      </div>

      <!-- お題入力 -->
      <input type="text" name="odai" id="odai" /><br />

      <!-- 送信ボタン -->
      <div class="sousin">
        <input type="submit" name="sousin" id="sousin" value="送信" />
      </div>
      
       <%if(mess != null){ %>
				<p style="color:#ff0000"><%=mess %></p>
			<%} %>
			<%ses.removeAttribute("ERROR"); %>
    </form>

    <form action="P1EventManagementKensakuServlet">
      <!-- 過去イベント -->
      <h2>過去のイベントお題</h2>
      <div id="kako">
        <select name="kako-nen" id="nen1">
          <option value="none" selected>選択してください</option>
          <option value="2023">2023</option>
          <option value="2024">2024</option>
          <option value="2025">2025</option>
        </select>
        <label for="nen">年</label>

        <select name="kako-tuki" id="kako-tuki">
          <option value="none" selected>選択してください</option>
          <option value="01">1</option>
          <option value="02">2</option>
          <option value="03">3</option>
          <option value="04">4</option>
          <option value="05">5</option>
          <option value="06">6</option>
          <option value="07">7</option>
          <option value="08">8</option>
          <option value="09">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
        </select>
        <label for="kako-tuki">月</label><br />

        <!-- 過去のお題入力 -->
        <div id="test">
          <input type="text" name="kako-odai" id="kako-odai"
          value="<%=(e != null && !e.getOdai().equals("")) ? e.getOdai() : "" %>"/>
        </div>
        <%ses.removeAttribute("EVENT"); %>

         <!-- 送信ボタン -->
        <div class="sousin">
          <input type="submit" name="kensaku" value="検索" />
        </div>
        
          <jsp:include page="P1kensaku.jsp"></jsp:include>

      </div>
    </form>
    </div>
  </body>
</html>

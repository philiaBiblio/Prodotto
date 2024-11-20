<%@page import="apli.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DM画面</title>
    <link rel="stylesheet" href="P2DM.css" />
  </head>
<%
	//セッションの取得
	HttpSession ses = request.getSession();
	// ログイン情報の取得
	User u = (User)ses.getAttribute("LOGIN");
	// DM履歴のセッションの取得
	
%>

  <body style="margin: 70px 0 0 -5px;">
    <!-- メインコンテンツ -->
    <div class="main-content">
      <!-- メッセージリスト -->
      <!---->
      <!--class="message-item"選択するとユーザIDをサーバへ飛ばす。
      ほんでそいつとのトーク履歴持ってくる。それをclass="chat-messages"に持って行っちゃおう-->
        <div class="message-list">
          
          <div class="message-item" name="senderid">
            <img src="image/ききゅう.jpg" alt="アイコン" class="icon" />
            おもち
          </div>
          
          <div class="message-item" name="senderid">
            <img src="image/ききゅう.jpg" alt="アイコン" class="icon" />
            創造的薬局
            <!--未読アイコン-->
            <!--画面読み込み時、未読ある人はここに未読数表示-->
            <div class="notification-badge">1</div>
          </div>
          
          <div class="message-item" name="senderid">
            <img src="image/ききゅう.jpg" alt="アイコン" class="icon" />
            JUBEE
            <div class="notification-badge">4</div>
            <input type="hidden" name="user_id" value="坂本雄三" >
          </div>
          
          <div class="message-item" name="senderid">
            <img src="image/ききゅう.jpg" alt="アイコン" class="icon" />
            BIM
            <div class="notification-badge">2</div>
          </div>
          
          <div class="message-item" name="senderid">
            <img src="image/ききゅう.jpg" alt="アイコン" class="icon" />
            VaVa
          </div>
          
          <div class="message-item" name="senderid">
            <img src="image/ききゅう.jpg" alt="アイコン" class="icon" />
            in-d
            <div class="notification-badge">2</div>
          </div>
          
          <div class="message-item" name="senderid">
            <img src="image/ききゅう.jpg" alt="アイコン" class="icon" />
            doooo
          </div>
          
          <div class="message-item" name="senderid">
            <img src="image/ききゅう.jpg" alt="アイコン" class="icon" />
            heiyuu
          </div>
          
          <div class="message-item" name="senderid">
            <img src="image/ききゅう.jpg" alt="アイコン" class="icon" />
            坂本雄三
          </div>
          
          <div class="message-item" name="senderid">
            <img src="image/ききゅう.jpg" alt="アイコン" class="icon" />
            坂本雄三
          </div>
          
          <div class="message-item" name="senderid">
            <img src="image/ききゅう.jpg" alt="アイコン" class="icon" />
            坂本雄三
          </div>
          
          <div class="message-item" name="senderid">
            <img src="image/ききゅう.jpg" alt="アイコン" class="icon" />
            坂本雄三
          </div>
        </div>

      <!-- DMチャットエリア -->
      <%if( != null){ %>
      		<div class="chat-container">
        <!-- ヘッダーにはユーザネームを表示 -->
        <div class="chat-header">おもち</div>
        <!--もってきたトークを上から表示していく-->
        <div class="chat-messages">
          <div class="message received">
            <div class="bubble" name="letter">あなたのこの曲、いいよね！今まで聴いたカバーの中で一番好きだわ</div>
          </div>
          <div class="message sent">
            <div class="bubble">だよね！俺もこの曲好き</div>
          </div>
          <div class="message received">
            <div class="bubble" name="letter">でもよくこんなマイナーな曲知ってるね。私以外聴いてる人いないと思った。</div>
          </div>
          <div class="message sent">
            <div class="bubble">まぁね。当たり前じゃん</div>
          </div>
          <div class="message sent">
            <div class="bubble">君がいつもカラオケで歌う曲の歌手は調べるよ。</div>
          </div> 
          <div class="message received">
            <div class="bubble" name="letter">うぇいよぉ</div>
          </div>
          <div class="message sent">
            <div class="bubble">うぇいよぉ</div>
          </div>
        </div>

        <form action="P2DMServlet" method="post">
          <div class="chat-input">
            <input
              type="text"
              name="letter"
              id="letter"
              required
              placeholder="メッセージを入力"
            />
            <input type="submit" name="sousin" id="sousin" value="送信" />
          </div>
        </form>
      </div>
      <%} %>
      <%ses.removeAttribute("ERRORPASS2"); %>
    </div>
    
     <jsp:include page="P2kensaku.jsp"></jsp:include>
    
    <script>
      // 全てのmessage-itemを取得
      const messageItems = document.querySelectorAll('.message-item');
  
      // クリックイベントを各message-itemに追加
      messageItems.forEach(item => {
        item.addEventListener('click', () => {
          // まず、すべてのmessage-itemから選択状態を解除
          messageItems.forEach(i => i.classList.remove('selected'));
          
          // クリックされたmessage-itemにselectedクラスを追加
          item.classList.add('selected');
        });
      });
    </script>
  </body>

</html>

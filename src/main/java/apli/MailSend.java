package apli;


import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//メール送信用部品クラス
public class MailSend {

	//送信元アドレス（固定）
	final String from = "x23j086@mitsuhashi.ac.jp";
	//学校のメールサーバ名（固定）
	final String host = "web1.chiba-fjb.ac.jp";

	//メール送信メソッド
	//第1引数…送信アドレス
	//第2引数…件名
	//第3引数…本文
	public void send(String to,String title,String message) {
		//メールサーバの設定
		Properties props = System.getProperties();
		props.setProperty("mail.smtp.host", host);
		Session session = Session.getInstance(props, null);

		//メール送信情報
		System.out.println("【メール送信情報】");
		System.out.println("メール宛先:"+to);
		System.out.println("メール件名:"+title);
		System.out.println("メール本文:"+message);


		try {
			//メール作成
			Message msg = new MimeMessage(session);
			//送信元アドレス設定
			msg.setFrom(new InternetAddress(from));
			//送信先アドレス設定
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
			//メールタイトル設定
			msg.setSubject(title);
			//送信日設定
			msg.setSentDate(new Date());
			//メール本文設定
			msg.setText(message);
			//メール送信実行
			Transport.send(msg);
			System.out.println("メール送信成功");

		} catch (Exception e) {
			System.out.println("メール送信失敗");
			e.printStackTrace();
		}
	}
}
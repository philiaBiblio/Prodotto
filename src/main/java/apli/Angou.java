package apli;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Angou {

	//暗号生成メソッド
	public String getAngo(String password) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		//MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] enc = md.digest(password.getBytes());
		String strAngo = byteArraytoHexString(enc);
		return strAngo;
	}

	public String byteArraytoHexString(byte[] b_data) {
		String strHex = "";          //必ず空の文字列にする

		for (int i = 0; i < b_data.length; i++) {
			//byteを一つ取り絶対値に変換する(負数の場合がある)
			int n = b_data[i] & 0xff;

			/* --- DEBUG START ----
            System.out.print("byte:"+md5[i]);
            System.out.print(" int:"+n);
            System.out.println(" hex:"+Integer.toHexString(n).toUpperCase());
               --- DEBUG END ---- */

			//16未満の場合は頭に0をつける必要がある(00-0Fの範囲)
			if (n < 16){
				strHex += "0";
			}
			//1byteを絶対値にしたnを16進数に変換（大文字を使用）
			strHex+=Integer.toHexString(n).toUpperCase();
			/* --- DEBUG START ----
            System.out.println("md5:"+ strMd5);
               --- DEBUG END ---- */
		}
		return strHex;
	}
}

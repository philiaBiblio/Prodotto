package apli;

import java.util.Scanner;

//★Webアプリで暗号化を行う場合は、mainの中の処理をサーブレットに記述します
public class AngouRiyou {
	public static void main(String[] args) {

		try {
			//キーボード入力部品の生成※サーブレットの場合は処理が変わります
			Scanner s = new Scanner(System.in);

			//暗号化部品の生成
			Angou a = new Angou();

			System.out.println("暗号化したい文字を入力してください");
			//キーボード処理※サーブレットの場合は処理が変わります
			String moji = s.nextLine();
			//暗号化実行(半角64文字に変換)
			moji = a.getAngo(moji);
			System.out.println("暗号化後："+moji);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

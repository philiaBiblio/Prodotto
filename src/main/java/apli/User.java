package apli;

public class User {
	// フィールド
	private String userid;		//ユーザーID
	private String name;		// ユーザー名
	private String sex;			// 性別
	private String history;		// 楽器歴
	private String fq;			// 演奏頻度
	private String birth;		// 生年月日
	private String iconImage;	// アイコン
	private String mailadd;	// メールアドレス
	
	// ゲッターセッター
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	public String getFq() {
		return fq;
	}
	public void setFq(String fq) {
		this.fq = fq;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getIconImage() {
		return iconImage;
	}
	public void setIconImage(String iconImage) {
		this.iconImage = iconImage;
	}
	public String getMailadd() {
		return mailadd;
	}
	public void setMailadd(String mailadd) {
		this.mailadd = mailadd;
	}
}
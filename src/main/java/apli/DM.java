package apli;

public class DM {
	// フィールド
	private String dmId;		// DMID
	private String sousin;		// 送信元
	private String zyusin;		// 受信元
	private String naiyou;		// 内容
	private String kidoku;		// 既読、未読
	private String time;		// タイムスタンプ
	private String your;		// 相手のID
	private String yourName;	// 相手の名前
	private String yourIcon;	// 相手のアイコン
	
	// ゲッターセッター
	public String getDmId() {
		return dmId;
	}
	public void setDmId(String dmId) {
		this.dmId = dmId;
	}
	public String getSousin() {
		return sousin;
	}
	public void setSousin(String sousin) {
		this.sousin = sousin;
	}
	public String getZyusin() {
		return zyusin;
	}
	public void setZyusin(String zyusin) {
		this.zyusin = zyusin;
	}
	public String getNaiyou() {
		return naiyou;
	}
	public void setNaiyou(String naiyou) {
		this.naiyou = naiyou;
	}
	public String getKidoku() {
		return kidoku;
	}
	public void setKidoku(String kidoku) {
		this.kidoku = kidoku;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getYour() {
		return your;
	}
	public void setYour(String your) {
		this.your = your;
	}
	public String getYourName() {
		return yourName;
	}
	public void setYourName(String yourName) {
		this.yourName = yourName;
	}
	public String getYourIcon() {
		return yourIcon;
	}
	public void setYourIcon(String yourIcon) {
		this.yourIcon = yourIcon;
	}
}

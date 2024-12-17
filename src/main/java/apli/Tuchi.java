package apli;

public class Tuchi {
	// フィールド
	private String syurui;		// 通知先の区別
	private String toukouId;	// 投稿ID
	private String userId;		// 相手のユーザーID
	private String time;		// タイムスタンプ
	private String kidoku;		// 通知の既読
	private String naiyou;		// 内容
	private String yourName;	// 相手の名前
	private String yourIcon;	// 相手のアイコン
	
	// ゲッターセッター
	public String getSyurui() {
		return syurui;
	}
	public void setSyurui(String syurui) {
		this.syurui = syurui;
	}
	public String getToukouId() {
		return toukouId;
	}
	public void setToukouId(String toukouId) {
		this.toukouId = toukouId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getKidoku() {
		return kidoku;
	}
	public void setKidoku(String kidoku) {
		this.kidoku = kidoku;
	}
	public String getNaiyou() {
		return naiyou;
	}
	public void setNaiyou(String naiyou) {
		this.naiyou = naiyou;
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

package apli;

public class Toukou {
	// フィールド
	private String toukouid;		// 投稿ID
	private String userid;		// ユーザーID
	private String eventid;			// イベントID
	private String deriveid;		// 派生ID
	private String upday;			// アップロード日
	private String sound;		// 音声ファイルパス名
	private String thumbnail;	// サムネイル画像パス名
	
	
	
	public String getToukouid() {
		return toukouid;
	}
	public void setToukouid(String toukouid) {
		this.toukouid = toukouid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getEventid() {
		return eventid;
	}
	public void setEventid(String eventid) {
		this.eventid = eventid;
	}
	public String getDeriveid() {
		return deriveid;
	}
	public void setDeriveid(String deriveid) {
		this.deriveid = deriveid;
	}
	public String getUpday() {
		return upday;
	}
	public void setUpday(String upday) {
		this.upday = upday;
	}
	public String getSound() {
		return sound;
	}
	public void setSound(String sound) {
		this.sound = sound;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	
}
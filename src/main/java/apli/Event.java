package apli;

public class Event {
	// フィールド
	private String postId;//投稿ID
	private String postPath;//作品パス
	private String eventId;		// イベントID
	private String odai;// お題
	
	
	// ゲッターセッター
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getPostPath() {
		return postPath;
	}
	public void setPostPath(String postPath) {
		this.postPath = postPath;
	}
	public String getEventId() {
		return eventId;
	}
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}
	public String getOdai() {
		return odai;
	}
	public void setOdai(String odai) {
		this.odai = odai;
	}
}

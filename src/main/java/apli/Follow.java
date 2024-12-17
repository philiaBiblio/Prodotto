package apli;

public class Follow {
	private String follow;		// フォローした人
	private String follower;	// フォローされた人
	private String time;		// タイムスタンプ
	private String tuchi;		// 既読未読
	
	// ゲッターセッター
	public String getFollow() {
		return follow;
	}
	public void setFollow(String follow) {
		this.follow = follow;
	}
	public String getFollower() {
		return follower;
	}
	public void setFollower(String follower) {
		this.follower = follower;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTuchi() {
		return tuchi;
	}
	public void setTuchi(String tuchi) {
		this.tuchi = tuchi;
	}
}

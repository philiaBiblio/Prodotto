package apli;

public class Heart {
	// フィールド
	private String postId;	// 投稿ID
	private String userId;	// ユーザーID
	private String action;	// リアクション日
	
	// ゲッターセッター
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
}
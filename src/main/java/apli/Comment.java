package apli;

public class Comment {
	
	// フィールド
	private String commentId;
	private String toukouId;
	private String csender;
	private String creciver;
	private String ccontent;
	private String timestamp;
	private String cicon;
	private String cName;
	
	//Getter&Setter
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getToukouId() {
		return toukouId;
	}
	public void setToukouId(String toukouId) {
		this.toukouId = toukouId;
	}
	public String getCsender() {
		return csender;
	}
	public void setCsender(String csender) {
		this.csender = csender;
	}
	public String getCreciver() {
		return creciver;
	}
	public void setCreciver(String creciver) {
		this.creciver = creciver;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public String getCicon() {
		return cicon;
	}
	public void setCicon(String cicon) {
		this.cicon = cicon;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
}

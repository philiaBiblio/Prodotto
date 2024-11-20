package apli;

public class AdminUser {
	// フィールド
	private String AdminUserid;		//管理者ID
	private String AdminName;		// 管理者ユーザー名
	private String AdminSex;			// 管理者性別
	private String AdminBirth;			// 管理者生年月日
//	private String AdminIconImage;	// 管理者アイコン
	private String AdminMailadd;		// メールアドレス
	private String AdminLevel;		// 管理者レベル
	private String password;	// パスワード
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	// ゲッターセッター
	public String getAdminUserid() {
		return AdminUserid;
	}
	public void setAdminUserid(String adminUserid) {
		AdminUserid = adminUserid;
	}
	public String getAdminName() {
		return AdminName;
	}
	public void setAdminName(String adminName) {
		AdminName = adminName;
	}
	public String getAdminSex() {
		return AdminSex;
	}
	public void setAdminSex(String adminSex) {
		AdminSex = adminSex;
	}
	public String getAdminBirth() {
		return AdminBirth;
	}
	public void setAdminBirth(String adminBirth) {
		AdminBirth = adminBirth;
	}
//	public String getAdminIconImage() {
//		return AdminIconImage;
//	}
//	public void setAdminIconImage(String adminIconImage) {
//		AdminIconImage = adminIconImage;
//	}
	public String getAdminMailadd() {
		return AdminMailadd;
	}
	public void setAdminMailadd(String adminMailadd) {
		AdminMailadd = adminMailadd;
	}
	public String getAdminLevel() {
		return AdminLevel;
	}
	public void setAdminLevel(String adminLevel) {
		AdminLevel = adminLevel;
	}
}

package apli;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import oracle.jdbc.driver.OracleDriver;

//DBアクセスクラス
public class DBAcs {
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	//★オラクルで利用するidとパスワードを設定してください
	private String  id = "x23j1E";
	private String  pw = "fjbj1E";

	//コンストラクタ
	public DBAcs(){
		System.out.println("ログイン処理実行");
		try {
			String url = "jdbc:oracle:thin:@ux2.chiba-fjb.ac.jp:1521:orcl";
			OracleDriver driver = new OracleDriver();
			// DBに接続
			con = DriverManager.getConnection(url,id,pw);
		    stmt = con.createStatement();
			System.out.println("ログイン成功");

		} catch (Exception e) {
			System.out.println("ログイン失敗");
			e.printStackTrace();
			// TODO: handle exception
		}
	}

	//select文実行メソッド
	public ResultSet selectExe(String sql){
		System.out.println("SELECT文実行");
		System.out.println("SQL文："+sql);
		try{
			rs = stmt.executeQuery(sql);
			System.out.println("SELECT文成功");
		}catch(Exception ex){
			System.out.println("SELECT文失敗");
			this.closeDB();
			ex.printStackTrace();
		}
		return rs;
	}

	//insert、update文実行メソッド
	public int UpdateExe(String sql){
		System.out.println("INSERT、又はUPDATE文実行");
		System.out.println("SQL文"+sql);
		int cnt =0;
		try {
			cnt = stmt.executeUpdate(sql);
			System.out.println("INSERT、又はUPDATE文成功");
		} catch (Exception ex) {
			System.out.println("INSERT、又はUPDATE文失敗");
			this.closeDB();
			ex.printStackTrace();
		}
		return cnt;
	}

	//DB切断メソッド
	public void closeDB(){
		try{
			System.out.println("DB切断処理");
			if(rs!=null){
				rs.close();
			}
			if(stmt!=null){
				stmt.close();
			}
			if(con!=null){
				con.close();
			}
			System.out.println("DB切断成功");
		}catch(Exception ex){
			System.out.println("DB切断失敗");
			ex.printStackTrace();
		}
	}

}

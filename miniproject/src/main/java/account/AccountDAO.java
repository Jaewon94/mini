package account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AccountDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static AccountDAO instance = new AccountDAO();
	
	private AccountDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static AccountDAO getInstance() {
		return instance;
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {

		}
	}

	public String test() {
		String banner = "";
		String sql = "select banner from v$version";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				banner = rs.getString("banner");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return banner;
	}
	
	public AccountDTO mapping(ResultSet rs) throws SQLException {
		AccountDTO row = new AccountDTO();
		row.setIdx(rs.getInt("idx"));
		row.setEmail(rs.getString("email"));
		row.setIpaddr(rs.getString("ipaddr"));
		row.setpNum(rs.getString("pnum"));
		row.setUserId(rs.getString("userId"));
		row.setUserName(rs.getString("userName"));
		row.setUserPw(rs.getString("userPw"));
		
		return row;
	}
	
	public AccountDTO login(AccountDTO input) {
		AccountDTO row = null;
		String sql = "select * from account where userId = ? and userPw = ?";
		
		try {
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, input.getUserId());
			pstmt.setString(2, input.getUserPw());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				row = mapping(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return row;
	}
	
	public int insert(AccountDTO input) {
		int result = 0;
		String sql = "insert into account (userid, userpw, username, email, pnum,ipaddr) values (?,?,?,?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, input.getUserId());
			pstmt.setString(2, input.getUserPw());
			pstmt.setString(3, input.getUserName());
			pstmt.setString(4, input.getEmail());
			pstmt.setString(5, input.getpNum());
			pstmt.setString(6, input.getIpaddr());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return result;
	}
}

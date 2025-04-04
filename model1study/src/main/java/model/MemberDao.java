package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDao {
	public boolean insert(Member mem) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into member (id,pass,name,gender,tel,email,picture)"
				+ " values (?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getId());//joinForm.jsp에서 아이디로 입력된 값
			pstmt.setString(2, mem.getPass());//joinForm.jsp에서 비밀번호로 입력된 값
			pstmt.setString(3, mem.getName());
			pstmt.setInt(4, mem.getGender());
			pstmt.setString(5, mem.getTel());
			pstmt.setString(6, mem.getEmail());
			pstmt.setString(7, mem.getPicture());
			if(pstmt.executeUpdate() > 0) return true;
			else return false;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn,pstmt,null);
		}
		return false;
	}
}

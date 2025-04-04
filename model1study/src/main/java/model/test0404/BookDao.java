package model.test0404;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.DBConnection;

public class BookDao {
	public boolean insert(Book book) {
		//DB와 연결해줄 connection 객체 conn 생성
		Connection conn = DBConnection.getConnection();
		// PreparedStatement 객체 pstmt 생성 및 초기화
		PreparedStatement pstmt = null;
		//db 형식에 맞춰 추가할 sql 구문을 sql 변수에 저장
		String sql = "insert into info (writer, title, content)"
				+ " values (?,?,?)";
		// 예외처리 시작
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,book.getWriter());
			pstmt.setString(2,book.getTitle());
			pstmt.setString(3,book.getContent());
			if(pstmt.executeUpdate() >0) return true;
			else return false;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}

}

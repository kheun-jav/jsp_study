package model.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.MybatisConnection;
import model.mapper.BoardMapper;
import model.mapper.BookMapper;

public class BookDao {
	private Class<BookMapper> cls = BookMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public boolean insert(Book book) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(book);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}		
		return false;
	}
	
}

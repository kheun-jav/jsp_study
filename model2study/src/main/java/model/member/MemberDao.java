package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import model.MybatisConnection;
import model.mapper.MemberMapper;

public class MemberDao {
	 private Class<MemberMapper> cls = MemberMapper.class;
	 private Map<String, Object> map = new HashMap<>();
	 public boolean insert(Member mem) {
		 SqlSession conn = MybatisConnection.getConnection();
		 try {
			 //executeUpdate() : 실행 후 변경된 레코드의 갯수 리턴 
			 if(conn.getMapper(cls).insert(mem) > 0) return true;
			 else return false;
		 } catch(Exception e) {
			 e.printStackTrace();
		 } finally {
			 MybatisConnection.close(conn);
		 }
		 return false;
	 }
	 
	 public Member selectOne(String id) {
		 SqlSession session = MybatisConnection.getConnection();
		 try {
			 return session.getMapper(cls).selectOne(id);
		 } catch (Exception e) {
			 e.printStackTrace();
		 } finally {
			 MybatisConnection.close(session);
		 }
		 return null;		 
	 }
	 
	 public List<Member> list() {
		 SqlSession session = MybatisConnection.getConnection();
		 try {
			 return session.getMapper(cls).selectList();
		 } catch (Exception e) {
			 e.printStackTrace();
		 } finally {
			 MybatisConnection.close(session);
		 }
		 return null;
	 }
	 
	 public boolean update(Member mem) {
			SqlSession session = MybatisConnection.getConnection();
			try {
				return session.getMapper(cls).update(mem) > 0;
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(session);
			}
			return false;
	}
		
	 public boolean delete(String id) {
			SqlSession session = MybatisConnection.getConnection();
			try {
				return session.getMapper(cls).delete(id) > 0;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(session);
			}
			return false;
			
	}
	 
	public String idSearch(String email, String tel) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).idSearch(email, tel);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null; // 레코드 찾기 실패 또는 오류발생
		
	}
	
	public String pwSearch(String id, String email, String tel) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).pwSearch(id, email, tel);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}
	
	public boolean updatePass(String id, String pass) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).updatePass(id, pass) > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
		
	}

	// 메일 
	public List<Member> emailList(String[] ids) {
		SqlSession session = MybatisConnection.getConnection();		
		try {
			map.clear();
			map.put("ids", ids);
			return session.getMapper(cls).emailList(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}
}
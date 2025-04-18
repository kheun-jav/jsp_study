package model.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.MybatisConnection;
import model.mapper.BoardMapper;

public class BoardDao {
	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
		
	
	public int maxnum() {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}



	public boolean insert(Board board) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(board) > 0;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}



	public int boardCount(String boardid) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).count(boardid);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}



	public List<Board> list(String boardid, int pageNum, int limit) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			map.clear();
			map.put("boardid", boardid);
			map.put("start",(pageNum-1) * limit); //boardNum
			/*
			 * 	pageNum		start
			 * 	  1			  0
			 * 	  2			  10
			 */
			map.put("limit", limit);
			return session.getMapper(cls).list(map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}

	//selectOne (num에 해당하는 출력 정보를 db에서 조회)
	public Board selectOne(int num) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectOne(num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}



	//readcntAdd(num에 해당하는 게시물의 조회수)
	public int readcntAdd(int num) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).readcntAdd(num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}



	public void grpStepAdd(int grp, int grpstep) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			session.getMapper(cls).getStepAdd(grp, grpstep);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
	}



	public boolean update(Board board) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).update(board) > 0;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}



	public boolean delete(int num) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(num) > 0;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}



	public int countgrp(int grp) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).countgrp(grp);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}




}

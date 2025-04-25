package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.board.Board;

public interface BoardMapper {

	@Select("select ifnull(max(num), 0) from board")
	int maxnum();

	String sql = "insert into board (num, writer, pass, title, content, file1, regdate, "
			+ "readcnt, grp, grplevel, grpstep, boardid)"
			+ "values (#{num}, #{writer}, #{pass}, #{title}, #{content}, #{file1}, now(), "
			+ "0, #{grp}, #{grplevel}, #{grpstep}, #{boardid})";
	@Insert(sql)
	int insert(Board board);
	
	String sqlcol ="<if test='column != null'>"
			+ "<if test='col1 != null'> and (${col1} like '%${find}%'</if>"
			+ "<if test='col2 == null'> ) </if>"
			+ "<if test='col2 != null'> or ${col2} like '%${find}%'</if>"
			+ "<if test='col2 != null and col3 == null'>) </if>"
			+ "<if test='col3 != null'> or ${col3} like '%${find}%')</if></if>";
	
	@Select({"<script>",
			"select count(*) from board where boardid=#{boardid}"
			+sqlcol, "</script>"})
	int count(Map<String, Object> map);
	/*
	 * limit #{start},#{limit} => limit 0 , 10 => 0번에서 10개 조회
	 * 	num(grp) 컬럼의 역순
	 * 	11	=> 0
	 *  10
	 *  9
	 *  8
	 *  7
	 *  6
	 * 	5	
	 * 	4	
	 * 	3
	 * 	2
	 *  1	=> 10
	 */
	@Select({"<script>","select * from board where boardid=#{boardid}"
			+sqlcol
			+" order by grp desc, grpstep asc limit #{start},#{limit}"
			,"</script>"})
	List<Board> list(Map<String, Object> map);

	@Select("select * from board where num=#{num}")
	Board selectOne(int num);

	@Update("update board set readcnt = readcnt+1  where num=#{value}")
	int readcntAdd(int num);

	@Update("update board set grpstep = grpstep + 1 "
			+ "	where grp = #{grp} and grpstep > #{grpstep}")
	Object getStepAdd(@Param("grp")int grp, @Param("grpstep")int grpstep);

	@Update("update board"
			+ " set writer = #{writer}, title=#{title}, content=#{content},"
			+ " file1=#{file1} where num = #{num}")
	int update(Board board);

	
	@Delete("delete from board where num=#{value}")
	int delete(int num);

	@Select("select count(*) from board where grp=#{grp} group by grp")
	int countgrp(int grp);
	
	@Select("select writer, count(*) cnt from board"
			+ " group by writer order by cnt desc limit 0,5")
	List<Map<String, Object>> graph1();
	/*
	 * Map<컬럼명, 컬럼값> 형태로 db에서 읽어서 전달
	 * {"writer","홍길동", "cnt" : "9"}
	 * {"writer","홍길순", "cnt" : "3"}
	 */
	
	@Select("select date_format(regdate, '%Y-%m-%d') date, count(*) cnt from board"
			+ "	group by date_format(regdate, '%Y-%m-%d')"
			+ "	order by 1 desc"
			+ "	limit 0,7")
	List<Map<String, Object>> graph2();


}

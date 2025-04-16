package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import main.Student;

public interface StudentMapper2 {
	String sql = "select * from student";
	// 동적 쿼리 인터페이스
	@Select({"<script>",
		sql,
		"<where>",
		"<if test='grade != null'>grade = #{grade}</if>",
		"<if test='height != null'>height >= #{height}</if>",
		"<if test='weight != null'>weight &lt;= #{weight}</if>",
		"</where>",
		"</script>"})
	List<Student> select(Map<String, Object> map);

	//trim 태그를 이용하여 sql and 구문 소화
	@Select({"<script>",
		sql,
		"<trim prefix='where' prefixOverrides='AND || OR'>",
		"<if test='grade != null'>and grade = #{grade}</if>",
		"<if test='height != null'>and height >= #{height}</if>",
		"</trim>",
		"</script>"})
	List<Student> select2(Map<String, Object> map);

}

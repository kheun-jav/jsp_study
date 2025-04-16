package test0415;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 * ProfessorMapper.xml 파일을 이용하기
 * Professor.java 파일 이용하기
1. 교수테이블에 등록된 레코드의 건수를 출력하기.
2. 교수테이블에 등록된 모든 정보를 출력하기
3. 교수중 101번 학과의 교수 정보를 출력하기
4. 교수중 성이 김씨인 시간강사 정보를 출력하기 
Mybatis-config 수정해야함
*/
public class Test2 {
	private final static SqlSessionFactory sqlMap;
	static {
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
		} catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		Professor pf = new Professor();
		System.out.println("1: 교수테이블에 등록된 레코드의 건수를 출력하기");
		int cnt = session.selectOne("professor.count");
		System.out.println("총 발견된 레코드 건수: "+cnt);
		System.out.println("==========================================================================================");
		System.out.println("2: 교수테이블에 등록된 모든 정보를 출력하기");
		List<Professor> list = session.selectList("professor.selectall");
		for(Professor p : list) System.out.println(p);
		System.out.println("==========================================================================================");
		System.out.println("3: 교수중 101번 학과의 교수 정보를 출력하기");
		list = session.selectList("professor.deptnolist", 101);
		for(Professor p : list) System.out.println(p);	
		System.out.println("==========================================================================================");
		System.out.println("4: 교수중 성이 김씨인 시간강사 정보를 출력하기");
		/*
		 * selectList 안에 2개의 조건을 넣을 수 없으므로,
		 * Map 객체에 칼럼명을 key값으로, 조건값을 value로 설정한다.
		 */
		Map<String,Object> map = new HashMap<>();
		map.put("name","김");
		map.put("position", "시간강사");
		list = session.selectList("professor.nplist", map);
		for(Professor p : list) System.out.println(p);
	}
}
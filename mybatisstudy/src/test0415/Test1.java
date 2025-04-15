package test0415;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import main.Member;
import main.Student;

/*
 * StudentMapper1.xml 파일을 이용하기
 * 1. 학생테이블의 등록된 레코드의 건수를 출력하기
 * 2. 학생테이블의 등록된 레코드의 정보를 출력하기
 * 3. 학생테이블의 등록된 레코드의 1학년 학생의 정보를 출력하기
 * 4. 학생테이블의 등록된 레코드의 성이 김씨인 학생의 정보를 출력하기
 * 5. 학생테이블의 등록된 레코드의 3학년 학생 중 주민번호 기준 여학생 정보를 출력하기
 */

public class Test1 {
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
		Student st = new Student();
		System.out.println("1: 학생테이블의 등록된 레코드의 건수 출력하기");
		int cnt = session.selectOne("student.count");
		System.out.println("총 "+cnt+"건");
		System.out.println("======================================================================================================");
		System.out.println("2: 학생테이블의 등록된 레코드의 정보 출력하기");
		List<Student> list = session.selectList("student.list");
		for(Student s : list) System.out.println(s); 
		System.out.println("======================================================================================================");
		System.out.println("3: 학셍테이블의 등록된 레코드의 1학년 학생의 정보를 출력하기");
		st.setGrade(1);
		list = session.selectList("student.gradelist", st.getGrade());
		for(Student s : list) System.out.println(s);
		System.out.println("======================================================================================================");
		System.out.println("4: 학생테이블의 등록된 레코드의 성이 김씨인 학생의 정보를 출력하기");
		list = session.selectList("student.namelist", "김");
		for(Student s : list) System.out.println(s);
		System.out.println("======================================================================================================");
		System.out.println("5: 학생테이블의 등록된 레코드의 3학년 학생 중 주민번호 기준 여학생 정보를 출력하기");
		st.setGrade(3);
		list = session.selectList("student.womenlist", st.getGrade());
		for(Student s : list) System.out.println(s);
	}

}
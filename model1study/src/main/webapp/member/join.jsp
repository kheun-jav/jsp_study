<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/member/join.jsp
	-> joinForm.jsp페이지에서 입력된 값을 database member 테이블이 등록
	1. 파라미터 값들을 Member 클래스 객체에 저장
	2. Member 객체를 db에 insert 하기
	3. 회원가입 성공 : loginForm.jsp 페이지로 이동
	   회원가입 실패 : joinForm.jsp 페이지로 이동
 --%>
<%
	//1
	request.setCharacterEncoding("UTF-8");
	//Member 객체 : 파라미터의 개수와 같은 프로퍼티를 가진 Bean 클래스
	// DTO : 데이터를 DB에 전달하기 위한 객체
	Member mem = new Member();
	//request.getParameter("id") : <input name="id">인 태그의 입력값
	mem.setId(request.getParameter("id"));
	mem.setPass(request.getParameter("pass"));
	mem.setName(request.getParameter("name"));
	mem.setGender(Integer.parseInt(request.getParameter("gender")));
	mem.setTel(request.getParameter("tel"));
	mem.setEmail(request.getParameter("email"));
	mem.setPicture(request.getParameter("picture"));
	// => mem 객체는 joinForm.jsp 페이지에서 입력한 값을 저장하고 있는 객체
	
	//2. Member 객체를 db에 insert 하기
	MemberDao dao = new MemberDao();
	String msg = "회원가입 실패";
	String url = "joinForm.jsp";
	// boolean insert(Member)
	if(dao.insert(mem)){ //true : db에 등록완료
		msg = "회원가입성공";
		url = "loginForm.jsp"; //다음 페이지를 설정
	}
%>
<%-- 3 --%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
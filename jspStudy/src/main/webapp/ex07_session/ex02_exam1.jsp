<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex07_session/ex02_exam1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>현재 날짜를 session 객체에 등록하기<br>
<% 
	Date date = new Date();
	session.setAttribute("today", date);
%>
등록된날짜 : <%=date %><br></h3>
<a href="ex02_exam2.jsp">등록날짜 조회하기</a>
</body>
</html>
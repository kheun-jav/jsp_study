<%@page import="model.test0404.Book"%>
<%@page import="model.test0404.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  /webapp/test0404/test1.jsp
    1. book table 생성
    2. testForm.jsp 페이지에서 전달한 파라미터를 Book Bean 클래스를 이용하여 DB에 저장하기
       BookDao.java클래스를 생성하여 db에 등록하기
    3. 등록된 내용을 db에서 읽어 화면에 출력하기     
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<%
    request.setCharacterEncoding("UTF-8");
	//DTO 객체
    Book book = new Book();
	//입력값들 파라미터로 받기
    book.setWriter(request.getParameter("writer"));
    book.setTitle(request.getParameter("title"));
    book.setContent(request.getParameter("content"));
    
    // Book 객체를 db에 insert하기
    BookDao dao = new BookDao();
    String msg = null;
    if(dao.insert(book)) {
%>    	
</head>
<body><table border="1">
     <tr><td>이름</td><td><%=book.getWriter() %></td></tr>
     <tr><td>제목</td><td><%=book.getTitle() %></td></tr>
     <tr><td>내용</td><td><%=book.getContent() %></td></tr></table>
</body></html>
<%  }%>

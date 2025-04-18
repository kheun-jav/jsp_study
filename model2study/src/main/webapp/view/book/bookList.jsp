<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%-- /webapp/view/book/bookList.jsp : 방명록 목록 조회하기
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 목록</title>
</head>
<body>
<h2>회원목록</h2>
<table class="table">
<tr>
	<th>작성자</th><th>제목</th><th>내용</th>
	<c:if test="${sessionScope.login == 'admin'}">
		<th>삭제</th>
	</c:if>
</tr>
<c:forEach var="b" items="${list}">
<tr><td>${b.writer}</td>
<td>${b.title}</td>
<td>${b.content}</td>
<c:if test="${sessionScope.login == 'admin'}">
		<td><a href="deleteForm" class = "btn btn-danger">삭제</a></td>
</c:if>
</tr>
</c:forEach>
<tr>
<c:if test="${sessionScope.login == 'admin'}">
		<td colspan="4">
</c:if>
<c:if test="${sessionScope.login != 'admin'}">
		<td colspan="3">
</c:if>
		<p align="right"><a href="bookForm" class="btn btn-primary" >방명록 작성</a></p>
		</td>
	</tr>
</table>
</body>
</html>
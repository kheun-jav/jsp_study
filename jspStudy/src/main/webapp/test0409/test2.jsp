<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- /jspstudy2/src/main/webapp/test/test2.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력된 수까지의 합 구하기</title>
</head>
<body>
<form method="post">
  숫자:<input type="text" name="num" value="${param.num}">
   <input type="submit" value="숫자까지의 합 구하기">  
</form>
<c:forEach var="i" begin="1" end="${param.num}">
	<c:set var="sum" value="${sum+i}" />
</c:forEach>
<p>${param.num}까지의 합 : ${sum}</p>
<h3>if 태그를 이용하여 짝수/홀수 구하기</h3>
<c:if test="${sum%2==0}">
	<p> ${sum}은 짝수입니다.</p>
</c:if>
<c:if test="${sum%2==1}">
	<p> ${sum}은 홀수입니다.</p>
</c:if>

<h3>choose 태그를 이용하여 짝수/홀수 구하기</h3>
<c:choose>
	<c:when test="${sum%2==0}">
		<p> ${sum}은 짝수입니다.</p>
	</c:when>
	<c:otherwise>
		<p> ${sum}은 홀수입니다.</p>
	</c:otherwise>
</c:choose>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jspstudy2/src/main/webapp/test/test1.jsp --%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두개의 파라미터값을 계산하기</title>
</head>
<body>
<form method="post" >
  x:<input type="text" name="x" value="${param.x}"><br>
  y:<input type="text" name="y" value="${param.y}">
   <input type="submit" value="더하기">  
</form>
<h3>if 태그를 이용하여 출력하기</h3>
<c:if test="${(param.x + param.y)>0}">
	<p>${param.x + param.y}은(는) 양수입니다</p>
</c:if>
<c:if test="${(param.x + param.y)<0}">
	<p>${param.x + param.y}은(는) 음수입니다</p>
</c:if>
<c:if test="${(param.x + param.y) == 0}">
	<p>${param.x + param.y}은(는) 0입니다</p>
</c:if>
<h3>choose 태그를 이용하여 출력하기</h3>
<c:choose>
	<c:when test="${(param.x + param.y)>0}">
		<p>${param.x + param.y}은(는) 양수입니다</p>
	</c:when>
	<c:when test="${(param.x + param.y) == 0}">
		<p>${param.x + param.y}은(는) 0입니다</p>
	</c:when>
	<c:otherwise>
		<p>${param.x + param.y}은(는) 음수입니다</p>
	</c:otherwise>
</c:choose>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<title>jstl을 이용한 간단한 연산</title>
</head>
<body>
<form method="post" name="f">
  x:<input type="text" name="x" value="${param.x}" size="5">
  <select name="op">
     <option <c:if test="${param.op == '+'}">selected</c:if> value='+'>+</option>
     <option <c:if test="${param.op == '-'}">selected</c:if> value='-'>-</option>
     <option <c:if test="${param.op == '*'}">selected</c:if> value='*'>*</option>
     <option <c:if test="${param.op == '/'}">selected</c:if> value='/'>/</option>
  </select>
  <%-- 연산자의 파라미터 값으로 출력하기 --%>
<%--<script>
  	var op ="${param.op}"
  	if(op == "") op = "+";
  	document.f.op.value = op;
  </script>
--%>
  y:<input type="text" name="y" value="${param.y}" size="5">
  <input type="submit" value="=">
</form>
<h3>if 태그를 이용하여 사칙연산 결과 구하기</h3>
<c:if test="${param.op == '+' }">
	<p>${param.x}${param.op}${param.y} = ${param.x + param.y }</p>
</c:if>
<c:if test="${param.op == '-' }">
	<p>${param.x}${param.op}${param.y} = ${param.x - param.y }</p>
</c:if>
<c:if test="${param.op == '*' }">
	<p>${param.x}${param.op}${param.y} = ${param.x * param.y }</p>
</c:if>
<c:if test="${param.op == '/' }">
	<p>${param.x}${param.op}${param.y} = ${param.x / param.y }</p>
</c:if>
<hr>
<h3>choose 태그를 이용하여 사칙연산 결과 구하기</h3>
<c:choose>
	<c:when test="${param.op == '+' }">
		<p>${param.x}${param.op}${param.y} = ${param.x + param.y }</p>
	</c:when>
	<c:when test="${param.op == '-' }">
		<p>${param.x}${param.op}${param.y} = ${param.x - param.y }</p>
	</c:when>
	<c:when test="${param.op == '*' }">
		<p>${param.x}${param.op}${param.y} = ${param.x * param.y }</p>
	</c:when>
	<c:otherwise>
		<p>${param.x}${param.op}${param.y} = ${param.x / param.y }	</p>	
	</c:otherwise>
</c:choose>
  </body></html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex13_EL/ex03_elFunction.jsp --%>
<%@ taglib prefix="test" uri="/ELFunctions" %>
<%--
	 prefix="test" : 접두어가 test인 태그(함수)인 경우
	 uri = "/ELFunctions" : uri가 /ELFunctions인 파일을 참조
	 						/WEB-INF/의 하위폴더에서 <uri>/ELFunctions</uri> 형태로 
	 						설정된 파일 검색 => /tlds/el_function.tld 파일 선택
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL에서 자바 함수 이용하기</title>
</head>
<body>
<form method="post"> <%-- action 속성이 없는 경우 현재 페이지 다시 호출 --%>
	x : <input type="text" name="x" value="${param.x}"><br>
	y : <input type="text" name="y" value="${param.y}"><br>
	<input type="submit" value="더하기">
</form>
<p>
합계 : ${test:add(param.x, param.y)}<br>
</body>
</html>
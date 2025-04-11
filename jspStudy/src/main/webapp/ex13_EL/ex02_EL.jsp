<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex13_EL/ex02_EL.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3><caption>EL의 연산(줄 안의 내용은 같은 내용)</caption><br>
	<hr>
	\${5+7}=${5+7}<br>
	\${8-3}=${8-3}<br>
	\${8/3}=${8/3}<br>
	\${8 div 3}=${8 div 3}<br>
	\${8 % 3}=${8 % 3}<br>
	\${8 mod 3}=${8 mod 3}<br>
	<hr>
	\${10 == 9}=${10 == 9}<br>
	\${10 eq 9}=${10 eq 9}<br>
	<hr>
	\${10 != 9}=${10 != 9}<br>
	\${10 ne 9}=${10 ne 9}<br>
	<hr>
	\${10 >= 9}=${10 >= 9}<br>
	\${10 ge 9}=${10 ge 9}<br>
	<hr>
	\${10 > 9}=${10 > 9}<br>
	\${10 gt 9}=${10 gt 9}<br>
	<hr>
	\${10 <= 9}=${10 <= 9}<br>
	\${10 le 9}=${10 le 9}<br>
	<hr>
	\${10 < 9}=${10 < 9}<br>
	\${10 lt 9}=${10 lt 9}<br>
	<hr>
	\${5+4==8?8:10}=${5+4==8?8:10}<br>
	
	\${10} = ${10} <br>
	\${'test'} = ${'test'} <br>
	\${'EL의 상수표현'} = ${'EL의 상수표현'} <br>
</h3>
</body>
</html>
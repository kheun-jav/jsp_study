<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex05_response/ex01_response2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response 예제</title>
</head>
<body>
<h2>ex02_response2.jsp</h2>
ex01_response1.jsp 페이지에서 요청하면 이 페이지가 호출됩니다. <br>
브라우저의 url 부분도 이 페이지의 url로 변경되어 있습니다. <br>
이런 현상을 redirect라 부릅니다. 이후의 forward와 비교하여 정확한 의미를 이해하고 계셔야 합니다.
<h2><%= request.getParameter("id") %></h2>
</body>
</html>
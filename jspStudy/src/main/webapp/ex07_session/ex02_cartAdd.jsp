<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- /webapp/ex07_session/ex02_cartAdd.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 추가</title>
</head>
<body>
<% 
	/*한글 안깨지게 인코딩 방식 변경*/
	request.setCharacterEncoding("UTF-8");
	String product = request.getParameter("product");
	List<String> cart=(List<String>)session.getAttribute("cart");
	if(cart==null) {
		cart = new ArrayList<String>();
		session.setAttribute("cart", cart);
	}
	cart.add(product);
%>
<script type="text/javascript">
	alert('<%=product %>이(가) 장바구니에 추가되었습니다.');
	history.go(-1);
</script>
</body>
</html>
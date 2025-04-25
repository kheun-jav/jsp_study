<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/test0421/test2.jsp --%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int a = Integer.parseInt(request.getParameter("a"));
	int sum = 0;
	for(int i=1; i<=num; i++){
		switch(a){
		case 0 : sum += i;
				break;
		case 1 : if(i%2 == 0) sum+= i;
				break;
		case 2 : if(i%2 == 1) sum+= i;
				break;
		}
	}
%>
<h3><%=sum %></h3>
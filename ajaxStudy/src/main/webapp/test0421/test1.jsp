<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--/webapp/test0421/test1.jsp --%>
<%  String arr = "";
	for(int i=0; i < 10; i++){
	 arr += (int)(Math.random() * 100);
	 if (i != 9) {
	        arr += ",";
	    }
	}
%>
<h3><%=arr%></h3>

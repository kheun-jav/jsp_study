<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3306/gdjdb"
	user="gduser" password="1234"/>
	
<sql:query var="rs" dataSource="${conn}">
	select * from member where id=?
	<sql:param>${param.id}</sql:param>
</sql:query>

<c:if test="${!empty rs.rows}"> <%-- 존재하는 아이디 --%>
	<h1><font id="result" class = "find" color="red">${param.id } : 존재하는 아이디 입니다.</font></h1>
</c:if>

<c:if test="${empty rs.rows}">  <%-- 존재하지 않는 아이디(사용 가능한 아이디) --%>
	<h1 id="result" class="notfound">회원가입이 가능한 아이디입니다.</h1>
</c:if>
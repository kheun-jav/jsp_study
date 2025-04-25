<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /webapp/eagles.jsp 
	키움히어로즈 선수 이미지를 테이블에 출력하기
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>키움히어로즈 내야수 정보</title>
<style type="text/css">
	ul { border-collapse : collapse;}
	ul, li a {border : 2px solid grey}
</style>
</head>
<body>
<%
	String url = "https://heroesbaseball.co.kr/players/infielder/list.do";
	String line = "";
	Document doc = null;
	try {
		doc = Jsoup.connect(url).get(); //url을 접속하여 문서를 지정
		Elements imgs = doc.select("img.nail"); //img 태그들
		Elements names = doc.select("strong.name"); //선수이름들
		for(int i=0; i<imgs.size(); i++){
			Element img = imgs.get(i); //img : <img class="nail" ... > 한개
			Element name = names.get(i); //name : <strong class="name">이름</strong> 
			if(!img.toString().trim().equals("")){ 
				line += img.toString().replace
						("src=\"/files", "src=\"https://heroesbaseball.co.kr/files");
				line += "<span>" + name.toString() + "</span><br>";
			}
		}
	} catch(IOException e) {
		e.printStackTrace();
	}
	pageContext.setAttribute("line", line);
%>
<%=line %>
</body>
</html>
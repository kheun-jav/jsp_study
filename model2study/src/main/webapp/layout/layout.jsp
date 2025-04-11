<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/layout/layout.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title><sitemesh:write property="title"/></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
  <sitemesh:write property="head"/>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>Model2 Homepage</h1>
  <p>Using Bootstrap</p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">Main</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">회원관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">공지사항</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">자유게시판</a>
      </li>
      <c:if test="${sessionScope.login != null}">
      <li class"text-end">
      	<a class="nav-link" href="#">${sessionScope.login}님 반갑습니다.</a>
      </li>
      <li class"text-end">
      	<a class="nav-link"href="logout">로그아웃</a>
      </li>
      </c:if>    
    </ul>
  </div>  
</nav>

<div class="container" style="margin-top:30px">
 <sitemesh:write property="body" />
</div>
<style>
	/* Footer 관련 스타일 */
        .footer{
            display:flex;
            flex-direction:column;
        }
        .footer_link{height:15%; display:flex; align-items:center;}
        .footer_link a{text-decoration:none; color:black; font-weight:bold; margin:15px;}
        .footer_company{height:70%;}
        .footer_company>ul{list-style:"- "; padding-left:15px;}
        .footer_copyright{height:15%; text-align:center}
        .footer>div{border-top:1px solid gray}
</style>
<footer class="footer">
    <div class="footer_link">
        <a href="">이용약관</a> |
        <a href="">개인정보취급방침</a> |
        <a href="">인재채용</a> |
        <a href="">고객센터</a>
    </div>
        <div class="footer_company">
           <ul>
              <li>상호명 : GooDee Academy</li>
              <li>대표자 : 이승엽</li>
              <li>전화 : 02-818-7950</li>
              <li>개인정보책임자 : 주승재 / jsj@goodee.co.kr</li>
              <li>(08505) 서울특별시 금천구 가산디지털2로 95
                        (가산동, km타워) 2층, 3층</li>
           </ul>
        </div>
        <div class="footer_copyright">
            Copyright ⓒ GooDee Academy. All rights reserved.
        </div>
</footer>
</body>
</html>

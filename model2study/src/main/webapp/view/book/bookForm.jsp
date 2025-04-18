<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/webapp/view/book/bookForm.jsp
	모델2로 http://localhost:8080/model2study/book/bookForm 요청시
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 글쓰기 화면</title>
<script type="text/javascript">
   function inputcheck() {
	   f = document.f;
       if(f.writer.value == '') {
		   alert("방문자를 입력하세요");
		   f.writer.focus();
		   return;
       }
       if(f.title.value == '') {
		   alert("제목 입력하세요");
		   f.title.focus();
		   return;
       }
       if(f.content.value == '') {
		   alert("내용 입력하세요");
		   f.content.focus();
		   return;
       }
       f.submit();
   }
</script>
</head>
<body>
<form action="bookwrite" method="post" 
      onsubmit="return inputcheck(this)" name="f">
<h2>방명록쓰기</h2>
<table class="table">
<tr><td>방문자</td>
	<td><input type="text" name="writer" class="form-control"></td></tr>
<tr><td>제목</td>
	<td><input type="text" name="title" class="form-control"></td></tr>
<tr><td>내용</td>
    <td><textarea rows="10" cols="60" name="content" class="form-control"></textarea></td></tr>
<tr><td colspan="2" align="center">
     <a href="javascript:inputcheck()" class="btn btn-primary">글쓰기</a></td></tr>
</table></form></body></html>
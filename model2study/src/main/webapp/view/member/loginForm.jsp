<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/member/loginForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<form action = "login" method="post" name="f" onsubmit="return input_check(this)">
	<table class="table">
		<tr><th>아이디</th><td><input type="text" name="id"  class="form-control"></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass"  class="form-control"></td></tr>
		<tr><td colspan="2"><button class="btn btn-secondary" >로그인</button>
		<button type="button" class="btn btn-secondary" onclick="location.href = .joinForm.jsp'">회원가입</button>
		<button type="button" class="btn btn-secondary" onclick="win_open('idForm')">아이디찾기</button>
		<button type="button" class="btn btn-secondary" onclick="win_open('pwForm')">비밀번호찾기</button>
		</td></tr>
	</table></form>
	<%--
		문제
		1. input_check 함수
		   - id, pass 파라미터값을 반드시 입력 받도록 코딩
		2. win_open 함수
		   idForm 파라미터 : 새로운 창에 idForm.jsp 페이지 열기
		   pwFrom 파라미터 : 새로운 창에 pwForm.jsp 페이지 열기 --%>	
<script type="text/javascript">
	function input_check(f) {
		if(f.id.value.trim() == "") {
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		if(f.pass.value.trim() == "") {
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return false;
		}
		return true;
	}
	
	function win_open(pm) {
		//파라미터 값을 받아 파라미터.jsp 파일 오픈
		open(pm,"","width=500, height=350, left=50, top=150");
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="../css/main.css">
	</head>
	<body>
		<%--
		onsubmit : form 내부의 submit 버튼 클릭 되면, form 태그에 이벤트 발생
		return input_check(this) : input_check() 함수 호출. 매개변수 this(form 객체를 의미)
		--%>
<form action="join" name="f" method="post"
		onsubmit="return input_check(this)">
		<input type="hidden" name="picture" value="">
		<table class="table">
			<tr>
				<td rowspan="4" valign="bottom"><img src="" width="100"
					height="120" id="pic">
					 <%-- href ="URL 정보"
						 
					 --%> <br> <font size="1"><a
						href="javascript:win_upload()">사진등록</a></font></td>
				<th>아이디</th>
				<td><input type="text" name="id" class="form-control">
					<button type="button" class="btn btn-dark" onclick="idchk()">중복검색</button></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" class="form-control"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" class="form-control"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><label for="gender1">남</label> <input type="radio"
					id="gender1" name="gender" value="1"> <label for="gender2">여</label>
					<input type="radio" id="gender2" name="gender" value="2"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="2"><input type="text" name="tel" class="form-control"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="2"><input type="text" name="email" class="form-control"></td>
			</tr>
			<%-- button 태그의 기본 type은 submit임. --%>
			<tr>
				<td colspan="3"><button class="btn btn-dark">회원가입</button>
			</tr>
		</table>
	</form>
		
		<script type="text/javascript">
			/* 입력값 검증을 위한 자바스크립트 */
			function input_check(f){
				// f : <form ...> 태그
				// f.id : <input name="id"...>.name 속성의 값이 id인 태그
				if(f.id.value.trim() == ""){
					alert("아이디를 입력하세요");
					f.id.focus();
					return false; // 기존 이벤트 취소
				}
				
				if(f.pass.value.trim() == ""){
					alert("비밀번호를 입력하세요");
					f.pass.focus();
					return false; // 기존 이벤트 취소
				}
				
				if(f.name.value.trim() == ""){
					alert("이름을 입력하세요");
					f.name.focus();
					return false; // 기존 이벤트 취소
				}
				return true;
			}
			
			function win_upload(){
				let op = "width=500, height=500, left=50, top=150";
				open("pictureForm","",op);
			}
			
			function idchk() {
				if(document.f.id.value == ''){
					alert("아이디를 입력하세요")
					document.f.id.focus()
				} else {
					let op = "width=500, height=500, left=50, top=150"
					open("idchk?id=" + document.f.id.value,"",op)
				}
			}
		</script>
	</body>
</html>
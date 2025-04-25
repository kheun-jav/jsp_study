<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%-- /webapp/exam1.jsp
	최근 7일간 등록된 게시물 건수를 막대, 선그래프로 출력하기
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
 url="jdbc:mariadb://localhost:3306/gdjdb"
 user="gduser" password="1234"/>
<sql:query var="rs" dataSource="${conn}">
	select date_format(regdate, '%Y-%m-%d') date, count(*) cnt from board
	group by date_format(regdate, '%Y-%m-%d')
	order by 1 desc
	limit 0,7
</sql:query>
<div style="width:75%"><canvas id="canvas"></canvas></div>
<script type="text/javascript"
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script type="text/javascript">
	let randomColorFactor = function(){
		return Math.round(Math.random() * 255)
	}
	let randColor = function(opacity){
		return "rgba(" + randomColorFactor() + "," 
				+ randomColorFactor() + "," 
				+ randomColorFactor() + ","
				+ (opacity || ".3") + ")"
	}
	
	let charData = {
			labels : //x축 표시
			[<c:forEach items="${rs.rows}" var="m">"${m.date}",</c:forEach>],
				datasets: [
					{
						type : 'line',
						borderWidth : 2,
						borderColor : 
							[<c:forEach items="${rs.rows}" var="m">randColor(1),</c:forEach>],
						label : '건수',
						fill : false,
						data : 
							[<c:forEach items="${rs.rows}" var="m">"${m.cnt}",</c:forEach>],
					},
					{
						type : 'bar',
						label : "건수",
						backgroundColor : 
							[<c:forEach items="${rs.rows}" var="m">randColor(1),</c:forEach>],
						data :
							[<c:forEach items="${rs.rows}" var="m">"${m.cnt}",</c:forEach>],
						borderWidth : 2
					}]
	}
	
	window.onload = function() {
		let ctx = document.querySelector("#canvas");
		new Chart(ctx, {
			type : "bar",
			data : charData,
			options : {
				responsive : true,
				title : {display : true, text : "일별 게시물 건수"},
				legend : {display : false},
				scales : {
					xAxes : [
						{display : true,
						 scaleLabel : {
							display : true,
							labelString : "게시물 등록일"},
						}],
					yAxes : [{
						 ticks: {
						     beginAtZero: true, // y축 0부터 시작
						     display: true
						 },
						display : true,
						scaleLabel : {
							display : true, labelString : "게시물 작성 건수"
						}
					}]
				
				}
			}
		})
	}
</script>
</body>
</html>
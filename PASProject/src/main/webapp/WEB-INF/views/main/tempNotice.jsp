<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>몰아붙입시다</title>
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
	<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<style>
   #dday {margin-left: 50px; font-weight:bold; font-size:70px; color:#f94f4c; letter-spacing:0px; font-family:arial;}
</style>
</head>
<body>
	<script>
   var now = new Date();
   var then = new Date('March 2,2017');
   var gap = now.getTime() - then.getTime();
   gap = Math.floor(gap / (1000 * 60 * 60 * 24)) * -1;
   document.write('<div id="dday">D-<span style=color: "#f94f4c; font-size:70px;">' + gap + '</span></div>');
</script>  
<div class="container">
	<h3>CRUD 기능은 없습니다. 변동사항 생길시 <b>main/tempNotice.jsp</b> 에서 수작업 하시길</h3>
	<table class="table">
		<tr>
			<th>누가?</th>
			<th>무엇을?</th>
			<th>누구랑?</th>
			<th>언제까지?</th>
			<th>얼마나 함?</th>
		</tr>
		<tr>
			<td>이경희</td>
			<td>주간체크리스트, 댓글검색, 내가쓴글 (+내가쓴 댓글까지), 검색타겟 형광펜</td>
			<td>김형기</td>
			<Td>2/24</Td>
			<td>?</td>
		</tr>
		<tr>
			<td>여준영</td>
			<td>overview, admin dash보드 만들기</td>
			<td>혼자</td>
			<Td>2/24</Td>
			<td>0%</td>
		</tr>
		<tr>
			<td>허석원</td>
			<td>음성채팅, 걍채팅(△)</td>
			<td>혼자</td>
			<Td></Td>
			<td>0%</td>
		</tr>
		<tr>
			<td>김형기</td>
			<td>캘린더, 쪽지함, 문서</td>
			<td></td>
			<Td></Td>
			<td>캘린더는 거의 끝나감</td>
		</tr>
		<tr>
			<td>박동석</td>
			<td>게시판 TAG기능, 회원정보 수정기능, validation</td>
			<td>김형기(validation)</td>
			<Td>아스팔트 ㄴㄴ해</Td>
			<td>회원정보 수정기능</td>
		</tr>
	</table>
	</div>
</body>
</html>
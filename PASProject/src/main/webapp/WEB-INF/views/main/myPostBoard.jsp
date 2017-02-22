<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<br>
	<br>
	<form action="myPostBoard" method="post">
	<div class="container">

		<h2>${sessionMem_Name} 님의 게시글 목록</h2>

		<br>
		<br>
	
		<table class="table">
			<thead>
				<tr>
					<th>게시물이름</th>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
					
					<th>답변여부</th>
					
				</tr>
			</thead>
			<tbody>
		<c:forEach items="${myPostBoardList}" var="MyPostBoardVo">
			<tr id="boardContents">
				<td><c:choose> 
 						<c:when test='${MyPostBoardVo.yn eq "0" }'>QnA게시판</c:when>
 						<c:when test='${MyPostBoardVo.yn eq "1" }'>QnA게시판</c:when>
						<c:when test='${MyPostBoardVo.bd_check eq "free" }'>커뮤니티</c:when>
						<c:when test='${MyPostBoardVo.bd_check eq "skill" }'>기술공유</c:when>
					
					</c:choose>
				</td>
				<!--qna?num=${MyPostBoardVo.num } -->
				<td>${MyPostBoardVo.num }</td>
				<td>
				<c:choose>  
					<c:when test='${MyPostBoardVo.yn eq "0" }'>
					<a href="<%=request.getContextPath()%>/main/myPostDetail_qna?num=${MyPostBoardVo.num}">${MyPostBoardVo.title}</a>
					</c:when>
					<c:when test='${MyPostBoardVo.yn eq "1" }'>
					<a href="<%=request.getContextPath()%>/main/myPostDetail_qna?num=${MyPostBoardVo.num}">${MyPostBoardVo.title}</a>
					</c:when>
					<c:when test='${MyPostBoardVo.bd_check eq "free" }'>
					<a href="<%=request.getContextPath()%>/main/myPostDetail_frb?num=${MyPostBoardVo.num}">${MyPostBoardVo.title}</a>
					</c:when>
					<c:when test='${MyPostBoardVo.bd_check eq "skill" }'>
					<a href="<%=request.getContextPath()%>/main/myPostDetail_skill?num=${MyPostBoardVo.num}">${MyPostBoardVo.title}</a>
					</c:when>
					
				</c:choose>
				</td>
				<td>${MyPostBoardVo.dt }</td>
				<td>${MyPostBoardVo.cnt}</td>
				
				<td>
						<c:choose> 
 						<c:when test='${MyPostBoardVo.yn eq "0" }'>답변미처리</c:when>
 						<c:when test='${MyPostBoardVo.yn eq "1" }'>답변완료</c:when>
						</c:choose>
				</td>
					
		</c:forEach>
				</tbody>

			</table>
		</div>

	</form>

</body>
</html>
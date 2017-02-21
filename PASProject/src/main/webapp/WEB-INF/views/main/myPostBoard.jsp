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
		<H3>기술공유 게시판</H3>
		<table class="table">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천수</th>
					<th>게시물이름</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach items="${myPostSkillList}" var="SkillSharingBoardVo">
			<tr id="boardContents">
			
				<td>${SkillSharingBoardVo.ssb_Article_Num }</td>
				<td><a
					href="<%=request.getContextPath()%>/SkillSharing/SkillSharingDetail?ssb_Article_Num=${SkillSharingBoardVo.ssb_Article_Num }">${SkillSharingBoardVo.ssb_Title}</a></td>
				<td>${SkillSharingBoardVo.ssb_wt_date }</td>
				<td>${SkillSharingBoardVo.ssb_Inq_Count }</td>
				<td>${SkillSharingBoardVo.ssb_Like_Count }</td>
				<td>기술공유게시판</td>
				
			</tr>
		</c:forEach>
				</tbody>
					<c:forEach items="${myPostFrbList}" var="freeBoardVo">
						<tr id="boardContents">
							<td>${freeBoardVo.frb_Article_Num }</td>
							<td><a
								href="<%=request.getContextPath()%>/freeBoard/freeBoardDetail?frb_Article_Num=${freeBoardVo.frb_Article_Num }">${freeBoardVo.frb_Title}</a></td>
							<td>${freeBoardVo.frb_Wt_Date}</td>
							<td>${freeBoardVo.frb_Inq_Count }</td>
							<td>${freeBoardVo.frb_Like_Count }</td>
							<td>커뮤니티</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<Br>
		
		
		
		<H3>QnA게시판</H3>
		<table class="table">
			<thead>
				<tr>
					<th>답변여부</th>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			
					<c:forEach items="${myPostQnaList}" var="qnaBoardVo">
						<tr id="boardContents">
							<td><c:choose>
									<c:when test='${qnaBoardVo.qb_yn=="0" }'>답변미처리</c:when>
									<c:otherwise>답변완료</c:otherwise>
								</c:choose></td>
							<td style="text-align: center">${qnaBoardVo.qb_Article_Num}</td>
							<td><a
								href="<%=request.getContextPath()%>/qna/QnADetail?qb_Article_Num=${qnaBoardVo.qb_Article_Num }">
									${qnaBoardVo.qb_Title}</a></td>
							<td>${qnaBoardVo.mem_Name }</td>
							<td style="text-align: center"><fmt:formatDate
									value="${qnaBoardVo.qb_Wt_Date}" pattern="yyyy-MM-dd" /></td>
							<td style="text-align: center">${qnaBoardVo.qb_Inq_Count }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</form>

</body>
</html>
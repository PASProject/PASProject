<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
	<h1>FreeBoard</h1>
	<table>
		<tr>
			<td>번호</td>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<td>추천수</td>
		</tr>
		<c:forEach items="${freeBoardList }" var="freeBoardVo"
			begin="${paging.beginNo}" end="${paging.endNo}">
			<tr>
				<td>${freeBoardVo.frb_Article_Num }</td>
				<td><a
					href="<%=request.getContextPath()%>/freeBoard/freeBoardDetail?frb_Article_Num=${freeBoardVo.frb_Article_Num }">${freeBoardVo.frb_Title}</a></td>
				<td>${freeBoardVo.frb_Content }</td>
				<td>${freeBoardVo.mem_Email }</td>
				<td>${freeBoardVo.frb_Wt_Date}</td>
				<td style="text-align: center">${freeBoardVo.frb_Inq_Count }</td>
				<td>${freeBoardVo.frb_Like }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" align="right"><c:if test="${paging.finalPageNo>0}">
					<c:set value="${paging.prevPageNo}" var="prevPageNo" />
					<c:set value="${paging.finalPageNo}" var="finalPageNo"/>
					<c:set value="${paging.nextPageNo}" var="nextPageNo" />

					<c:if test="${paging.pageNo>prevPageNo}">
						<a href="freeBoardList?page=${prevPageNo}">[이전]</a>
					</c:if>
					<c:forEach begin="1" end="${paging.finalPageNo}" var="i" varStatus="status">
						<a href="freeBoardList?page=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${paging.pageNo<finalPageNo}">
						<a href="freeBoardList?page=${nextPageNo}">[다음]</a>
					</c:if>
				</c:if></td>
		</tr>
	</table>

	<input type="button" value="글쓰기" onclick="wrtie_form()">
	<script>
		function wrtie_form() {
			location.href = "freeBoardWrite";
		}
	</script>
</body>

</html>
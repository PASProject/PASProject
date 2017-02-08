<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
</style>
</head>
<body>
	<h1>SkillSharingBoard</h1>
	<form>
		제목 : <input type="text" name="ssb_Title" />&nbsp; <input type="button"
			onclick="searchTitle(this.form);" value="검색">
	</form>
	<table style="width: 83%">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이메일</th>
			<th>작성일</th>
			<th>내용</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>
		<c:forEach items="${skillSharingBoardList }" var="SkillSharingBoardVo"
			begin="${paging.beginNo}" end="${paging.endNo}">
			<tr>
				<td>${SkillSharingBoardVo.ssb_Article_Num }</td>
				<td><a
					href="<%=request.getContextPath()%>/SkillSharing/SkillSharingDetail?ssb_Article_Num=${SkillSharingBoardVo.ssb_Article_Num }">${SkillSharingBoardVo.ssb_Title}</a></td>
				<td>${SkillSharingBoardVo.mem_Name} ( ${SkillSharingBoardVo.mem_Email } )</td>
				<td>${SkillSharingBoardVo.ssb_wt_date }</td>
				<td>${SkillSharingBoardVo.ssb_Content }</td>
				<td>${SkillSharingBoardVo.ssb_Inq_Count }</td>
				<td>${SkillSharingBoardVo.ssb_Like_Count }</td>
				
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" align="right"><c:if
					test="${paging.finalPageNo>0}">
					<c:set value="${paging.prevPageNo}" var="prevPageNo" />
					<c:set value="${paging.finalPageNo}" var="finalPageNo" />

					<c:if test="${paging.pageNo>prevPageNo}">
						<a href="SkillSharingList?page=${prevPageNo}">[이전]</a>
					</c:if>
					<c:forEach begin="1" end="${paging.finalPageNo}" var="i"
						varStatus="status">
						<a href="SkillSharingList?page=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${paging.pageNo<finalPageNo}">
						<a href="SkillSharingList?page=${finalPageNo}">[다음]</a>
					</c:if>
				</c:if></td>
		</tr>
	</table>
	<input type="button" value="글쓰기" onclick="wrtie_form()">
	<script>
		function wrtie_form() {
			location.href = "SkillSharingWrite";
		}
		function searchTitle(form) {
			form.action="searchTitle";
			form.method="get";
			form.target="_self";
			form.submit();
		};
	</script>
</body>

</html>
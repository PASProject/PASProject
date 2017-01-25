<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
<h1> skillSharingBoard</h1>
<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>이메일</th>
		<th>작성일</th>
		<td>내용</td>
		<th>추천수</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${skillSharingBoardList }" var="SkillSharingBoardVo">
		<tr>
			<td>${SkillSharingBoardVo.ssb_Article_Num }</td>
			<td><a href="<%=request.getContextPath()%>/SkillSharing/SkillSharingDetail?ssb_Article_Num=${SkillSharingBoardVo.ssb_Article_Num }">${SkillSharingBoardVo.ssb_Title}</a></td>
			<td>${SkillSharingBoardVo.mem_Email }</td>
			<td>${SkillSharingBoardVo.ssb_wt_date }</td>
			<td>${SkillSharingBoardVo.ssb_Content }</td>
			<td>${SkillSharingBoardVo.ssb_Like }</td>
			<td>${SkillSharingBoardVo.ssb_Inq_Count }</td>
			
		</tr>
	</c:forEach>
</table>
<input type="button" value="글쓰기" onclick="wrtie_form()">
<script>
	function wrtie_form(){
		location.href="SkillSharingWrite";
	}
</script>
</body>

</html>
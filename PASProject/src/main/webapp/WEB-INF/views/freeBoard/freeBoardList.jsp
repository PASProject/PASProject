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
<h1> FreeBoard</h1>
<table>
	<tr>
		<td>번호</td>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	<c:forEach items="${freeBoardList }" var="freeBoardVo">
		<tr>
			<td>${freeBoardVo.frb_Article_Num }</td>
			<td><a href="<%=request.getContextPath()%>/freeBoard/freeBoardDetail?frb_Article_Num=${freeBoardVo.frb_Article_Num }">${freeBoardVo.frb_Title}</a></td>
			<td>${freeBoardVo.frb_Content }</td>
			<td>${freeBoardVo.mem_Email }</td>
			<td>${freeBoardVo.frb_Wt_Date}</td>
		</tr>
	</c:forEach>
</table>
<input type="button" value="글쓰기" onclick="wrtie_form()">
<script>
	function wrtie_form(){
		location.href="freeBoardWrite";
	}
</script>
</body>

</html>
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
<div style="margin:auto; width:1300px" ><h1>QnaList</h1><br><br>
<table >
	<tr>
		<th>번호&nbsp;&nbsp;&nbsp;</th>
		<th>제목&nbsp;&nbsp;&nbsp;</th>
		<th>내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<th>작성일&nbsp;&nbsp;&nbsp;</th>
	</tr>
	
	<c:forEach items="${qnaboardList}" var="QnaBoardVo">
	<tr>
		<td>${QnaBoardVo.qb_Article_Num}</td>
		<td><a href="<%=request.getContextPath()%>/qna/QnADetail?qb_Article_Num=${QnaBoardVo.qb_Article_Num }">${QnaBoardVo.qb_Title}</a></td>
		<td>${QnaBoardVo.qb_Title}</td>
		<td>${QnaBoardVo.qb_Content}</td>
		<td>${QnaBoardVo.qb_Wt_Date}</td>
	</tr>
		</c:forEach>
</table>
	<br><br>	
	<input type="button" value="글쓰기" onClick = "QnaWrite()">
	<script>
	
	function QnaWrite(){
		location.href="qnaWrite";
		
	}
	
	</script>
	</div>
</body>
</html>
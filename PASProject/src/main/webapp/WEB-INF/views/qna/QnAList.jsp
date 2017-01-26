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
		<th>번호&nbsp;&nbsp;</th>
		<th>&nbsp;&nbsp;&nbsp;제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		
	    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일</th>
	</tr>
	
	<c:forEach items="${qnaList}" var="QnaBoardVo" 
	begin="${paging.beginNo}" end="${paging.endNo}">
	<tr>
		<td>${QnaBoardVo.qb_Article_Num}</td>
		<td><a 
		href="<%=request.getContextPath()%>/qna/QnADetail?qb_Article_Num=${QnaBoardVo.qb_Article_Num }">
		${QnaBoardVo.qb_Title}</a></td>

	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${QnaBoardVo.qb_Wt_Date}</td>
	</tr>
		</c:forEach>

	<tr>
		<td colspan ="5" align="right"><c:if test="${paging.finalPageNo>0 }">
		<c:set value="${paging.prevPageNo}" var="prevPageNo"/>
		<c:set value="${paging.finalPageNo}" var="finalPageNo" />
		
	<c:if test="${paging.pageNo>prevPageNo}">
		<a href="qnaList?page=${prevPageNo}">[이전]</a>	
	</c:if>
	<c:forEach begin="1" end="${paging.finalPageNo}" var ="i"
		varStatus="status">
		<a href="qnaList?page=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${paging.pageNo<finalPageNo}">
		<a href="qnaList?page=${finalPageNo}">[다음]</a>
	</c:if>
	</c:if></td>
	</tr>
</table>

	<input type="button" value="글쓰기" onClick = "QnaWrite()">
	<script>
	
	function QnaWrite(){
		location.href="qnaWrite";
		
	}
	
	</script>
	</div>
</body>
</html>

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
	<div style="margin: auto; width: 1300px">
		<h1>TotalNoticeBoard</h1>
		<table>
			<tr>
				<th>번호&nbsp;&nbsp;</th>
				<th>&nbsp;&nbsp;&nbsp;
					제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;작성일</th>
			</tr>

			<c:forEach items="${totalNoticeList}" var="TotalNoticeVo">
				<tr>
					<td>${TotalNoticeVo.ttnotice_Num}</td>
					<td><a href="<%= request.getContextPath()%>
					     /totalNotice/totalNoticeDetail?ttnotice_Num=${TotalNoticeVo.ttnotice_Num }">
					      ${TotalNoticeVo.ttnotice_Title}</a></td>
					<td>${TotalNoticeVo.ttnotice_Title}</td>

				</tr>
			</c:forEach>
		</table>
		<br> <br> <input type="button" value="글쓰기"
			onClick="totalNoticeWrite()">
		<script>
			function totalNoticeWrite() {
				location.href = "totalNoticeWrite";
			}
		</script>

	</div>
</body>
</html>
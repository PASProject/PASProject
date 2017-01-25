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
<h1>노티스게시판입니다 pm아니면 작성 ㄲㅈ</h1>
<table border="1">
<tr>
<td>글 번호</td>
<td>글 제목</td>
<td>날짜</td>
<td>조회수</td>
</tr>
<c:forEach var="NoticeList" items="${NoticeList }">
<tr>
<td>${NoticeList.notice_Num }</td>

<td>${NoticeList.notice_Title }</td>

<td>${NoticeList.notice_Date }</td>


<td>${NoticeList.notice_Inq_Count }</td>
</tr>






</c:forEach>
</table>

<input type="button" value="글쓰기" onclick="writeBtn()"/>
<script>
function writeBtn(){
	location.href="/noticeWriteForm"
}
</script>
</body>


</html>
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
<h3>노티스게시판입니다 pm아니면 작성 ㄲㅈ</h3>
<table border="1">
<tr>
<td>글 번호</td>
<td>글 제목</td>
<td>날짜</td>
<td>조회수</td>

</tr>
<c:forEach var="NoticeList" items="${NoticeList }" begin="${paging.beginNo}" end="${paging.endNo}">
<tr>
<td>${NoticeList.notice_Num }</td>

<td><a href="<%=request.getContextPath() %>/project/pmNoticeDetail?proj_Num=${NoticeList.proj_Num}&notice_Num=${NoticeList.notice_Num}">${NoticeList.notice_Title }</a></td>

<td>${NoticeList.notice_Date }</td>


<td>${NoticeList.notice_Inq_Count }</td>
</tr>

</c:forEach>
<tr>
			<td colspan="5" align="center"><c:if test="${paging.finalPageNo>0}">
					<c:set value="${paging.prevPageNo}" var="prevPageNo" />
					<c:set value="${paging.finalPageNo}" var="finalPageNo" />

					<c:if test="${paging.pageNo>prevPageNo}">
						<a href="noticeList?page=${prevPageNo}">[이전]</a>
					</c:if>
					<c:forEach begin="1" end="${paging.finalPageNo}" var="i"
						varStatus="status">
						<a href="noticeList?page=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${paging.pageNo<finalPageNo}">
						<a href="noticeList?page=${finalPageNo}">[다음]</a>
					</c:if>
				</c:if></td>
		</tr>
</table>
<c:if test="${memPositionView.position_Name eq 'PL' }">

<input type="button" value="글쓰기" onclick="writeBtn()"/>
</c:if>
<script>
function writeBtn(){
	location.href="<%=request.getContextPath()%>/project/pmNoticeWrite";
}
</script>
</body>


</html>
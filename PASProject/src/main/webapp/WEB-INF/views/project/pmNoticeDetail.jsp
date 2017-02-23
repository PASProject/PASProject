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
<form>
세부정보 
<table border="1">
<tr>
<td>프로젝트번호</td>
<td>게시물번호</td>
<td>작성일</td>
<td>제목</td>
<td>내용</td>
<td>조회수</td>
<tr>


<tr>
<td><input type="text" name="proj_Num" value="${NoticeVo.proj_Num }"></td>
<td><input type="text" name="notice_Num" value="${NoticeVo.notice_Num }"></td>
<td><input type="text" name="notice_Date" value="${NoticeVo.notice_Date }"></td>
<td><input type="text" name="notice_Title" value="${NoticeVo.notice_Title }"></td>
<td><input type="text" name="notice_Content" value="${NoticeVo.notice_Content }"></td>
<td><input type="text" name="notice_Inq_Count" value="${NoticeVo.notice_Inq_Count }"></td>
<tr>




</table>
<c:if test="${memPositionView.position_Name eq 'PL' }">
<input type="button" value="수정" onclick="location.href='<%=request.getContextPath()%>/project/pmNoticeUpdate?proj_Num=${NoticeVo.proj_Num}&notice_Num=${NoticeVo.notice_Num}'"/>
<input type="button" value="삭제" onclick="deleteBtn(this.form)">
</c:if>
</form>

<script>
function deleteBtn(form){
	 form.action="<%=request.getContextPath()%>/project/pmNoticeDelete";
	 form.method="post";
	 form.submit();
	
}

</script>


</body>
</html>
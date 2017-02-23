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
<form>
<input type="text" name="proj_Num" value="${NoticeVo.proj_Num }" readonly>
<input type="text" name="notice_Num" value="${NoticeVo.notice_Num }" readonly>
제목:<input type="text" name="notice_Title" value="${NoticeVo.notice_Title }">
내용:<input type="text" name="notice_Content" value="${NoticeVo.notice_Content }"><br>
<input type="button" value="수정하기" onclick="updateBtn(this.form)">
</form>
<script>
function updateBtn(form){
	form.action="<%=request.getContextPath()%>/project/pmNoticeUpdate";
	form.method="post";
	form.submit();
}

</script>

</body>
</html>
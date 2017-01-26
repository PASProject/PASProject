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
제목:
<input type="text" name="notice_Title"/><br>
내용:
<input type="text" name="notice_Content"/><br>
<input type="button" value="글쓰기" onClick="noticeBtn(this.form)"/>
</form>
<script>
 function noticeBtn(form){
	 form.action="<%=request.getContextPath()%>/notice/noticeWrite";
	 form.method="post";
	 form.submit();
	 
	 
 }



</script>


</body>
</html>
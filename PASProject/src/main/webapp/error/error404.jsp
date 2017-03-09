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
404 에러입니다
<input type="button" value ="메인으로 가기" onclick="go_index()">
<script>
	function go_index() {
		 location.href = "<%=request.getContextPath()%>/index";
		
		}
</script>

</body>
</html>
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
회원가입 완료!!! 이메일 인증을 해주세요

<input type="button" onclick="indexBtn(form)" value="초기화면">
</form>
<script>
function indexBtn(this.form){
	
	location.href="/index";
	
}

</script>

</body>
</html>
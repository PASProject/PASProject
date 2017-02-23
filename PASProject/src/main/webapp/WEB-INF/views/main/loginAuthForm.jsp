<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap Core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/resources/css/stylish-portfolio.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">


<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>


<!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<title></title>
</head>
<body>
<form>
<div>
<div id="out" style="background-color:#ddd; padding:20px;"><h3 style="text-align: center; margin-right: 46px;">
			<img style="width: 80px"
				src="<%=request.getContextPath()%>/resources/img/logo.png"><br><br>
		이메일 인증이 완료되셨습니다.<br></h3>
		<button type="button" class="btn btn-default" onclick="location.href='<%=request.getContextPath() %>/main/loginForm'";>초기화면</button></div>
  

</div>
</form>


</body>
</html>
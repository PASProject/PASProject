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
<script type="text/javascript">
$(document).ready(function() {
	var memberVo=<%=request.getAttribute("memberVo")%>;
	
     $.ajax({
    	type:'POST',
    	url:'/pas/main/memberAuth',
    	dataType:'json',
    	data:{"mem_Email":memberVo},
    	success:function(result){
    		alert("계정인증이 성공하였습니다.");
    		location.href="<%=request.getContextPath()%>/main/loginForm"
			}
		});

	})
</script>
</head>
<body>승인중


</body>
</html>
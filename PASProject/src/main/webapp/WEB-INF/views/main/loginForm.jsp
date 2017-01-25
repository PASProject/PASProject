<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>

<!-- Bootstrap Core CSS -->
<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=request.getContextPath() %>/resources/css/stylish-portfolio.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=request.getContextPath() %>/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">


<!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>




<style>

/* table tr td { 
border: 1px solid black;
} */
body {
	background-color: rgb(249, 249, 249);
}

.container {
	max-width: 350px;
	outline: 1px solid rgb(216, 222, 226);
	background-color: white;
	margin-top: 30px;
	padding: 30px;
}
.dividercontainer{
	max-width:350px;
	margin:auto;
}
@font-face {
	font-family: 'NanumGothic';
	src: url(resources/fonts/NANUMBARUNGOTHIC.TTF) format('truetype');
}

body {
	font-family: NanumGothic
}

.divider {
	position: relative;
	width: 100%;
	height: 1px;
	background: #ddd;
	margin: 30px auto;
}

.divider:after {
	content: 'OR';
	width: 30px;
	height: 30px;
	line-height: 30px;
	border-radius: 15px;
	font-size: 12px;
	color: #666;
	background: #fff;
	border: 1px solid #f0f0f0;
	display: block;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -15px;
	margin-left: -15px;
	text-align: center;
}
</style>


<meta charset="UTF-8">
<title></title>
</head>
<body>

	<div class="container2">

		<h3 style="text-align: center;">
			<img style="width: 80px" src="<%=request.getContextPath() %>/resources/img/logo.png">
		</h3>
		<h2 style="text-align: center">로그인</h2>
		<div class="container">
			<form>
				<div class="form-group">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="email" placeholder="Enter email">
				</div>
				<div class="form-group">
					<label for="pwd">Password:</label> <input type="password"
						class="form-control" id="pwd" placeholder="Enter password">
				</div>
				<div class="checkbox">
					<label><input type="checkbox"> Remember me</label>
				</div>
				<button type="submit" class="btn btn-default btn-block">들어가기</button>
			</form>
		</div>
		<div class="dividercontainer">
			<div class="divider"></div>
		</div>
		<div class="container" style="padding: 20px;">
			<span style="text-align: center">PAS에 처음 방문하셨다면 <a
				href="joinForm.jsp">새 계정을 만드세요.</a></span> <br> <br> <a
				href="javscript:void(0);"><span style="text-align: center"
				id="forget">그게 아니라 비빌번호를 잊으신거?</span></a>
		</div>
		<div class="container" id="hiddenDiv" style="display: none">
			<form>
				<div class="form-group">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="email" placeholder="Enter email">
				</div>
				<button type="submit" class="btn btn-default btn-block">임시
					비밀번호 발급</button>
			</form>
		</div>
	</div>

</body>
<script>
	$(document).ready(function() {
		$('#forget').click(function() {
			$("#hiddenDiv").show();
		})

	});
</script>

</html>
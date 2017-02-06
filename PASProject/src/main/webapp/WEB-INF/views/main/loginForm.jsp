<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>

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
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>



<style>

/* table tr td { 
border: 1px solid black;
} */
body {
	background-color: rgb(249, 249, 249);
}

.title {
	max-width: 350px;
	margin: auto;
}

.container {
	max-width: 350px;
	outline: 1px solid rgb(216, 222, 226);
	background-color: white;
	margin-top: 30px;
	padding: 30px;
}

.dividercontainer {
	max-width: 350px;
	margin: auto;
}

 @font-face {
	font-family: 'NanumGothic';
	src: url(resources/fonts/NANUMBARUNGOTHIC.TTF) format('truetype');
}

body {
	font-family: NanumGothic;
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
<body style="height: 90%">

<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			var email = $('#email').val();
			var pwd = $('#pwd').val();
			
			$.ajax({
				type : 'POST',
				url : '/pas/main/login',
				dataType : 'json',
				data : {
					'email' : email,
					'pwd' : pwd
				},
				success : function(result) {
					if (result == 1) {
                        location.href="<%=request.getContextPath()%>/main/myProject"
											} else if (result == 0) {
												alert("아이디가 틀렸습니다");
												alert(result);
											} else if (result == 2) {
												alert("비밀번호 오류입니다");
												alert(result);
											} else if (result == 3) {
												alert("인증되지않은계정입니다");
											}

										}

									});
                        		});
						});

		$('#login').keypress(function(e) {
			var key = e.which;
			if (key == 13) // the enter key code
			{
				$('input[name = login1]').click();
				return false;
			}
		});

		$(function() {
			$("#searchPwd").click(function() {
				var sendEmail = $('#sendEmail').val();

				$.ajax({
					type : 'POST',
					url : 'simpleMessage',
					dataType : 'json',
					data : {
						'sendEmail' : sendEmail
					},
					success : function(result) {
						if (result == "1") {
							alert("해당 이메일로 임시 비밀번호를 발송하였습니다.");

						} else {
							alert("존재하지않는 이메일입니다.");
						}
					}
                 
				});
			});
			});
			
	
	
	
	$(function() {
			$("#searchEmail").click(function() {
				var sendName = $('#sendName').val();
				var sendPhone = $('#sendPhone').val();
				
				var dataList = {'sendName':sendName , 'sendPhone':sendPhone}
				$.ajax({
					type : 'POST',
					url : 'searchEmail',
					dataType : 'json',
					contentType:'application/json',
					data : JSON.stringify(dataList),
					success : function(data) {
						if (data.id != null) {
							if(data.id==""){
								alert("회원정보가 맞지않습니다.");
							}else{
							alert("해당 아이디는 "+data.id+"입니다.");
							}
						}
					}

				});
			});
			});


</script>






	<div class="container2">

		<h3 style="text-align: right; margin-right: 46px;">
			<img style="width: 80px"
				src="<%=request.getContextPath()%>/resources/img/logo.png">
		</h3>
		<div class="title">


			<h2>로그인</h2>
			<hr style="color: rgb(216, 222, 226); margin-top: 5px;">
		</div>

		<div class="container">
			<form>
				<div class="form-group">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="email" name="email"
						placeholder="Enter email">
				</div>
				<div class="form-group">
					<label for="pwd">Password:</label> <input type="password"
						class="form-control" id="pwd" name="pwd"
						placeholder="Enter password">
				</div>
				<div class="checkbox">
					<label><input type="checkbox"> Remember me</label>
				</div>
				<input type="button" id="login" class="btn btn-default btn-block"
					value="들어가기" name="login1">

			</form>
		</div>
		<div class="dividercontainer">
			<div class="divider"></div>
		</div>
		<div class="container" style="padding: 20px;">
			<span style="text-align: center">PAS에 처음 방문하셨다면 <a
				href="<%=request.getContextPath()%>/index#about">새 계정을 만드세요.</a></span> <br>
			<br> 
			 <a href="javscript:void(0);"><span
				style="text-align: center" id="forget1">이메일 계정을 찾을려면 눌러 빨럼아</span></a><br><br>
			<a href="javscript:void(0);"><span
				style="text-align: center" id="forget">그게 아니라 비빌번호를 잊으신거?</span></a>
		</div>
		<div class="container" id="hiddenDiv" style="display: none">
			<form>
				<div class="form-group">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="sendEmail" name="sendEmail"
						placeholder="Enter email">
				</div>
				<input type="button" id="searchPwd"
					class="btn btn-default btn-block" value="임시비밀번호발급">
			</form>
		</div>
		
		<div class="container" id="hiddenEmail" style="display: none">
			<form>
				<div class="form-group">
					<label for="Name">Name:</label> <input type="text"
						class="form-control" id="sendName" name="sendName"
						placeholder="Enter Name">
				</div>
				<div class="form-group">
					<label for="Phone">Phone:</label> <input type="text"
						class="form-control" id="sendPhone" name="sendPhone"
						placeholder="010-xxxx-xxxx">
				</div>
				
				<input type="button" id="searchEmail"
					class="btn btn-default btn-block" value="이메일 찾기">
			</form>
		</div>
		
	</div>
</body>
<script>
	$(document).ready(function() {
		$('#forget').click(function() {
			$("#hiddenEmail").hide();
			$("#hiddenDiv").show();
			
		})
		
		$('#forget1').click(function() {
			
			$("#hiddenDiv").hide();
			$("#hiddenEmail").show();
			
		})

	});
	
</script>

</html>

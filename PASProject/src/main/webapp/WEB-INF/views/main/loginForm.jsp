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
<body style="height: 90%">

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
	src: url(resources/fonts/NANUMGOTHIC.TTF) format('truetype');
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



<!-- Bootstrap Core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">


<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<%--  --%>




<!-- Bootstrap Core JavaScript -->
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>

<style>
#mloader{
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 99999;
  background-color: #000;
  opacity: 0.7;
  display:none;
}

#mloader .masterkey_blink {
	font-size:20px;
	font-weight:bold;
	margin: 10% 45%;
    -webkit-animation: masterkey_blink 3s linear infinite;
} 
@-webkit-keyframes masterkey_blink {
    15% { color: white; }
    40% { color: black; }
    75% { color: white; }
}

</style>

<div id="mloader"><div class="masterkey_blink">LOADING...</div></div>



	<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			var email = $("#login_mem_Email").val();
			
			var pwd = $('#login_mem_Pass').val();
		
		
			$.ajax({
				
				type : 'POST',
				url : '/pas/main/login',
				beforeSend:function(){
					$('#mloader').show();
				},
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
												
											} else if (result == 2) {
												alert("비밀번호 오류입니다");
												
											} else if (result == 3) {
												alert("인증되지않은계정입니다");
											}

										}

									});
                        		});
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



	<div class="container2" style="margin-bottom:5%;">

		<h3 style="text-align: right; margin-right: 46px;">
			<img style="width: 80px"
				src="<%=request.getContextPath()%>/resources/img/logo.png">
		</h3>
		<div class="title">


			<h2 style="margin-top:-15px;">로그인</h2>
			<hr style="color: rgb(216, 222, 226); margin-top: 5px;">
		</div>

		<div class="container">

			<div id="1" >
				<%@ include file="CAPTCHA.jsp"%>
				<%-- <jsp:include page="CAPTCHA.jsp" /> --%>
				<%-- 	<c:import url="CAPTCHA.jsp"/> --%>
			</div>
			<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
			<div id="2" style="display:none;" >
				<form>
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							class="form-control" id="login_mem_Email" name="login_mem_Email"
							placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" id="login_mem_Pass" name="login_mem_Pass"
							placeholder="Enter password">
					</div>
					<div class="checkbox">
						<label><input type="checkbox"> Remember me</label>
					</div>
					<input type="button" id="login" class="btn btn-default btn-block"
						value="들어가기" name="login1"> <input type="button" style="display:none;"
						class="btn btn-default btn-block" id="adminBtn" value="ADMIN"
						onclick="admin_go()">
				</form>

			</div>
		</div>
		<div class="dividercontainer">
			<div class="divider"></div>
		</div>
		<div class="container" style="padding: 20px;">
			<span style="text-align: center">PAS에 처음 방문하셨다면 <a
				href="<%=request.getContextPath()%>/index#about">새 계정을 만드세요.</a></span> <br>
			<br> <a href="javscript:void(0);"><span
				style="text-align: center" id="forget1">이메일 계정을 잊으셨습니까?</span></a><br>
			<br> <a href="javscript:void(0);"><span
				style="text-align: center" id="forget"> 비밀번호를 찾고 싶습니다.</span></a>
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

	function admin_go(){
		
		location.href="<%=request.getContextPath()%>/admin/adminLogin";

	}

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

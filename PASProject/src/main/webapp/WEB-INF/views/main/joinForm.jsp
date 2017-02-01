<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

/* table tr td { 
border: 1px solid black;
} */
#body {
	background-color: rgb(249, 249, 249);
}

.container {
	max-width: 800px;
	outline: 1px solid rgb(216, 222, 226);
	background-color: white;
	margin-top: 30px;
	padding: 30px;
}



@font-face {
	font-family: 'NanumGothic';
	src: url(resources/fonts/NANUMBARUNGOTHIC.TTF) format('truetype');
}

body {
	font-family: NanumGothic;
}
</style>
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
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js"></script>
<body id="body">
<div class="container2">
	<!-- 로고는 일단 지저분하니까 빼자
	<h3 style="text-align: center;">
		<img style="width: 80px" src="resources/img/logo.png">
	</h3> -->
	<!-- <h2 style="text-align: center">회원가입</h2> -->

	<div class="container container-fluid">


		<form class="form-horizontal" action=" " method="post" id="reg_form">


				<!-- Form Name -->
				<legend> 회원가입 </legend>

				<!-- Email -->
				<div class="form-group">
					<label class="col-md-4 control-label">이메일 주소</label>
					<div class="col-md-6  inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-envelope"></i></span> 
							<input name="mem_Email" placeholder="E-Mail Address" class="form-control" type="text">
						</div>
					</div>
				</div>

				<!-- Password -->
				<div class="form-group has-feedback">
					<label for="password" class="col-md-4 control-label"> 비밀번호
					</label>
					<div class="col-md-6  inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input
								class="form-control" id="userPw" type="password"
								placeholder="password" name="mem_Pass" data-minLength="5"
								data-error="some error" required /> <span
								class="glyphicon form-control-feedback"></span> <span
								class="help-block with-errors"></span>
						</div>
					</div>
				</div>

				<!-- password confirm -->
				<div class="form-group has-feedback">
					<label for="confirmPassword" class="col-md-4 control-label">
						비밀번호 확인 </label>
					<div class="col-md-6  inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-repeat"></i></span> <input
								class="form-control {$borderColor}" id="userPw2" type="password"
								placeholder="Confirm password" name="mem_Pass_CK"
								data-match="#confirmPassword" data-minLength="5"
								data-match-error="some error 2" required /> <span
								class="glyphicon form-control-feedback"></span> <span
								class="help-block with-errors"></span>
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">이름</label>
					<div class="col-md-6  inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input name="mem_Name"
								placeholder="이름" class="form-control" type="text">
						</div>
					</div>
				</div>


				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">전화번호</label>
					<div class="col-md-6  inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-earphone"></i></span> <input name="mem_Phone"
								placeholder="010-0000-0000" class="form-control" type="text">
						</div>
					</div>
				</div>

				<!-- Button -->
				<div class="form-group" style="text-align:right;">
					<label class="col-md-6 control-label"></label>
					<div class="col-md-4">
						<button type="button" class="btn btn-warning" onclick="aa(this.form)" >
							확인 <span class="glyphicon glyphicon-send"></span>
						</button>
					</div>
				</div>
			<script type="text/javascript">
			function aa(form){
				form.action = "main/join"
				form.method = "POST"
				form.submit();
			}
			</script>
		</form>

	</div>



</div>
</body>


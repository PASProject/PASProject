<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

/* table tr td { 
border: 1px solid black;
} */
body {
	background-color: rgb(249, 249, 249);
}

.container {
	max-width: 800px;
	outline: 1px solid rgb(216, 222, 226);
	background-color: white;
	margin-top: 30px;
	padding: 30px;
}

.dividercontainer {
	max-width: 800px;
	margin: auto;
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

<div class="container2">
	<!-- 로고는 일단 지저분하니까 빼자
	<h3 style="text-align: center;">
		<img style="width: 80px" src="resources/img/logo.png">
	</h3> -->
	<h2 style="text-align: center">회원가입</h2>

	<div class="container container-fluid">
		<div class="row">
			<form>
				<div class="col-sm-6 col-md-6 col-xs-6 text1">

					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							class="form-control" id="email" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" id="pwd" placeholder="Enter password">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" id="pwd" placeholder="Enter password">
					</div>
					<div class="checkbox">
						<label><input type="checkbox"> Remember me</label>
					</div>
					
				</div>

				<div class="col-sm-6 col-md-6 col-xs-6 image">

					<div class="form-group">
						<label for="email">&nbsp</label> <input type="text" class="form-control" >
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" id="pwd" placeholder="Enter password">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" id="pwd" placeholder="Enter password">
					</div>
					<div class="checkbox">
						<label><input type="checkbox"> Remember me</label>
					</div>


				</div>
				<button type="submit" class="btn btn-default btn-block">들어가기</button>
			</form>
		</div>
	</div>








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



<script>
	$(document).ready(function() {
		$('#forget').click(function() {
			$("#hiddenDiv").show();
		})

	});
</script>

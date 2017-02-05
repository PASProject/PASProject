<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
#bubble {
	background-color: #F2F2F2;
	border-radius: 5px;
	box-shadow: 0px 0px 3px #B2B2B2;
	margin: 15px;
	padding: 10px;
}

#projBtn {
	margin-top: 15px;
	margin-right: 15px;
}

.inputGroupContainer {
	margin-bottom: 15px;
}
</style>
</head>


<body>

	<!-- Page Header -->
	<div class="row">
		<div class="col-md-12">
			<h2 class="page-header"
				style="border: 0px; padding-bottom: 0px; margin-top: 0px; margin-left: 10px;">
				<img class="img-thumbnail"
					src="<%=request.getContextPath() %>/resources/upload/${loginUser.mem_Img}"
					data-toggle="modal" data-target="#imgUploadModal"
					data-keyboard="false" data-backdrop="static" id="profileImg"
					style="width: 80px; height: 80px" /> ${loginUser.mem_Name}<small>님,
					환영합니다.
					<button class="btn btn-default btn-lg pull-right" id="projBtn">프로젝트
						정보</button>
				</small>

			</h2>
			<div id="bubble" style="height: 300px; padding-left: 30px;">
				<div id="1">

					<div class="form-group">
						<label class="col-md-4 control-label">이메일 주소</label>
						<div class="col-md-6  inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-envelope"></i></span> <input
									name="mem_Email" value="${loginUser.mem_Email}"
									class="form-control" type="text" readonly>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label">이름</label>
						<div class="col-md-6  inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input name="mem_Name"
									value="${loginUser.mem_Name }" class="form-control" type="text">
							</div>
						</div>
					</div>


					<div class="form-group has-feedback">
						<label for="password" class="col-md-4 control-label"> 비밀번호
							<span id="newPwd" style="display: none;"
							class="alert alert-success"> <strong>비밀번호 일치!</strong>

						</span> <span id="errPwd" style="display: none;"
							class="alert alert-danger"> <strong>땡!!!!!!</strong>

						</span>
						</label>
						<div class="col-md-6  inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input
									class="form-control" id="mem_Pass" type="password"
									placeholder="비밀번호" name="mem_Pass" data-minLength="5"
									data-error="some error" required /> <span
									class="glyphicon form-control-feedback"></span> <span
									class="help-block with-errors"></span>
							</div>
						</div>
					</div>
					<span id="pwd" style="display: none;"></span>
					<script>
						var $text = $('#pwd');
						var $mem_Pass = $('#mem_Pass');
						$mem_Pass.on('keydown', function() {
							setTimeout(function() {
								$text.html($mem_Pass.val());
								var pwd = $('#pwd').text();
								if (pwd == '${loginUser.mem_Pass}') {
									$('#newPwd').show();
									$('#newPwd2').show();
									$('#errPwd').hide();
									$('#btnupload1').show();
								} else if (pwd != '${loginUser.mem_Pass}') {
									$('#newPwd').hide();
									$('#errPwd').show();
									$('#newPwd2').hide();
									$('#btnupload1').hide();
								}
							}, 0); // On next loop

						});
					</script>


					<%-- 새 비밀번호 입력창  --%>
					<div id="newPwd2" style="display: none;">

						<div class="form-group has-feedback">

							<label for="password" class="col-md-4 control-label"> 새
								비밀번호 </label>

							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input
										class="form-control" id="userPw" type="password"
										placeholder="password" name="mem_Pass" data-minLength="5"
										data-error="some error" required /><span
										class="glyphicon form-control-feedback"></span> <span
										class="help-block with-errors"></span> </span>
								</div>
							</div>
						</div>
						<!-- password confirm -->
						<div class="form-group has-feedback">
							<label for="confirmPassword" class="col-md-4 control-label">
								새 비밀번호 확인 </label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-repeat"></i></span> <input
										class="form-control {$borderColor}" id="userPw2"
										type="password" placeholder="Confirm password"
										name="mem_Pass_CK" data-match="#confirmPassword"
										data-minLength="5" data-match-error="some error 2" required />
									<span class="glyphicon form-control-feedback"></span> <span
										class="help-block with-errors"></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label">전화번호</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-earphone"></i></span> <input
										name="mem_Phone" placeholder="010-0000-0000"
										class="form-control" type="text">
								</div>
							</div>
						</div>








					</div>



				</div>
				<div id="2" style="display: none">
					<div class="form-group">
						참가프로젝트 개수<Br> 참가 프로젝트 이름<br> 참가 프로젝트에서의 위치<br> <br>
						<Br> <br> <br> <br> <br>
					</div>
				</div>
			</div>
			<script>
				$('#projBtn').on('click', function() {
					if ($('#1').css('display') != 'none') {
						$('#2').show().siblings('div').hide();
						$('#projBtn').text('개인정보 보기');
					} else if ($('#2').css('display') != 'none') {
						$('#1').show().siblings('div').hide();
						$('#projBtn').text('프로젝트 정보 보기');
					}
				});
			</script>
		</div>

	</div>
	<div class="row">


		<div id="bubble2"></div>
	</div>

</body>
</html>
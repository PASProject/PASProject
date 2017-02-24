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
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js"></script>
</head>


<body>

	<!-- Page Header -->
	<div class="row">
		<div class="col-md-12">
			<h2 class="page-header"
				style="border: 0px; padding-bottom: 0px; margin-top: 0px; margin-left: 10px;">
				<img class="img-thumbnail"
					src="<%=request.getContextPath() %>/resources/upload/${loginUser.mem_Img}"
					id="profileImg" style="width: 80px; height: 80px" onerror = "this.src='<%=request.getContextPath()%>/resources/upload/no.png'"/>
<small>님, 환영합니다.
					<button class="btn btn-default btn-lg pull-right" id="projBtn">프로젝트
						정보</button>
				</small>

			</h2>
			<div id="bubble" style="height: auto; padding-left: 30px;">
				<div class="row">
					<div id="1">
						<form class="form-horizontal" id="update_form" >
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

							<div class="form-group" >
								<label class="col-md-4 control-label">이름</label>
								<div class="col-md-6  inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <input name="mem_Name"
											value="${loginUser.mem_Name }" class="form-control"
											type="text" readonly>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">전화번호</label>
								<div class="col-md-6  inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-earphone"></i></span> <input
											name="mem_Phone" value="${loginUser.mem_Phone }"
											id="mem_Phone" class="form-control" type="text">
									</div>
								</div>
							</div>


							<div class="form-group has-feedback">
								<label for="password" class="col-md-4 control-label">
									비밀번호 <span id="null"
									style="font-size: 12px; font-weight: normal; padding-left: 15px;">
										올바른 비밀번호를 입력하세요 </span> <span id="newPwd" style="display: none;"
									class="alert alert-success"> <strong>새 비밀번호를 작성해주세요.</strong>

								</span> <span id="errPwd" style="display: none;"
									class="alert alert-danger"> <strong>잘못된 비밀번호입니다.</strong>

								</span>



								</label>
								<div class="col-md-6  inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-lock"></i></span> <input
											class="form-control" id="mem_Pass2" type="password"
											name="mem_Pass2" data-minLength="5" data-error="some error"
											required /> <span class="glyphicon form-control-feedback"></span>
										<span class="help-block with-errors"></span>
									</div>
								</div>
							</div>
							<span id="pwd" style="display: none;"></span>
							<script>
	var $text = $('#pwd');
	var $mem_Pass = $('#mem_Pass2');
	$mem_Pass.on('keydown', function() {
		setTimeout(function() {
			$text.html($mem_Pass.val());
			var pwd = $('#pwd').text();
			if (pwd == '${loginUser.mem_Pass}') {
				$('#null').hide();
				$('#newPwd').show();
				$('#newPwd2').show();
				$('#errPwd').hide();

			} else if (pwd == '') {
				$('#null').show();
				$('#newPwd').hide();
				$('#errPwd').hide();

			} else /* if (pwd != '${loginUser.mem_Pass}')  */{
				$('#null').hide();
				$('#newPwd').hide();
				$('#errPwd').show();
				$('#newPwd2').hide();

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
												placeholder="새 비밀번호 입력" name="mem_Pass"
												data-minLength="5" data-error="some error" required /><span
												class="glyphicon form-control-feedback"></span> <span
												class="help-block with-errors"></span>
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
												type="password" placeholder="새 비밀번호 확인" name="mem_Pass_CK"
												data-match="#confirmPassword" data-minLength="5"
												data-match-error="some error 2" required /> <span
												class="glyphicon form-control-feedback"></span> <span
												class="help-block with-errors"></span>
										</div>
									</div>
								</div>

							</div>
						</form>
						<script>
	$(document)
			.ready(
					function() {
						$('#update_form')
								.bootstrapValidator(
										{
											// To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
											feedbackIcons : {
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {

												mem_Phone : {
													validators : {
														regexp : {
															regexp : /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/,
															message : '형식에 맞는 휴대폰 번호를 입력해 주세요.'
														},

														/* 	stringLength : {
																min : 12,
																max : 13,
																message :  '하이픈 붙혀서 전화번호 똑바로 좀 '
															}, */
														notEmpty : {
															message : '휴대폰 번호를 입력해 주세요.'
														}

													}
												},

												mem_Pass : {
													validators : {
														regexp : {
															regexp : /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/,
															message : '비밀번호는 영문, 숫자, 특수문자가 꼭 들어가야 합니다.'
														},
														stringLength : {
															min : 8,
															max : 20,
															message : '비밀번호는 10~20자 사이의 영문+숫자 조합으로 해주세요 '
														},
														notEmpty : {
															message : '공란입니다.'
														},
														identical : {

															message : 'Confirm your password below - type same password please'
														}

													}
												},
												mem_Pass_CK : {
													validators : {
														identical : {
															field : 'mem_Pass',
															message : '위와 동일한 비밀번호를 입력해 주시기 바랍니다.'
														}
													}
												},

											}
										})

								.on($('#submit').click(function(){
									
									
									
									var Pass_result = true;
									var Pass_CK = true;
									var Phone_CK = true;
									
									 //전화번호 정규식	
								    var Phone_Pt = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
									var mem_Phone= $('#mem_Phone').val();
								    	if(!Phone_Pt.test(mem_Phone)){
								    		Phone_CK = false;
										}else{
											Phone_CK = true;
										}
									
									//비밀번호 정규식
								    var Pass_Pt = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
								    var Pass = 	$('#userPw').val();
								    	if(!Pass_Pt.test(Pass)){
											Pass_result = false;
										}else{
											Pass_result = true;
										}
								    	
								    //비밀번호 확인 정규식
								   	var Pass = $('#userPw').val();
								    var Pass_Check= $('#userPw2').val();
								    	if(Pass != Pass_Check){
								    		Pass_CK = false;
										}else{
											Pass_CK = true;
										}
								    	
								    	if(Pass_result == true && Pass_CK == true){
								    		
											var mem_Pass = $('#userPw').val();
											var dataList = {'mem_Pass':mem_Pass};
											$.ajax({
												url: '<%=request.getContextPath()%>/main/updateMember',
												type:'post',
												dataType:'json',
												contentType:'application/json',
												data:JSON.stringify(dataList),
												success : function(data){
													var i = data.T;
													if(i=='1'){
														location.reload();										
													}else{
														alert("실패");
													}
												},
												failure: function(data){
													alert('update Failed');
												}
											})
											}else if(Phone_CK == true){
												
												var mem_Phone = $('#mem_Phone').val();
												var dataList = {'mem_Phone':mem_Phone};
												$.ajax({
													url: '<%=request.getContextPath()%>/main/updateMember',
													type:'post',
													dataType:'json',
													contentType:'application/json',
													data:JSON.stringify(dataList),
													success : function(data){
														var i = data.T;
														if(i=='1'){
															location.reload();										
														}else{
															alert("실패");
														}
													},
													failure: function(data){
														alert('update Failed');
													}
												})
												}
								    
								    
								    
								    
								})
								)
					});
</script>
					</div>

					<div id="2" style="display: none">
						<div class="form-group">
							참가프로젝트 개수 : <Br> 참가 프로젝트 이름 : <br> 참가 프로젝트에서의 위치 : <br> <br>
							<Br> <br> <br> <br> <br>
						</div>
					</div>
				</div>
			</div>
			<script>
				$('#projBtn').on('click', function() {
					if ($('#1').css('display') != 'none') {
						$('#2').show().siblings('div').hide();
						$('#projBtn').text('개인정보 보기');
						$.ajax({})
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
<script>
	
</script>
</html>

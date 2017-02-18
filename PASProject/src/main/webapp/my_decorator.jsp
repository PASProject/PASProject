<%@page import="com.app.pas.dto.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>

<!DOCTYPE html>

<html>


<head>


<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>3 Col Portfolio - Start Bootstrap Template</title>

<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap Core CSS -->


<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">


<!-- JS -->

<%-- 
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/socket.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/sockjs-0.3.min.js"></script>
<<<<<<< HEAD

=======
	 --%>






<!-- Bootstrap Core JavaScript -->
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>

<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/resources/css/3-col-portfolio.css"
	rel="stylesheet">

<!-- bootstrap Validator -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->









<%--여준영 모험 --%>
<!-- <link
	href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css"
	rel="stylesheet" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
 -->

<%-- 스크롤바 없애는거 --%>
<!-- <script>
$(function(){
$('html, body').css({'overflow': 'hidden', 'height': '100%'});
})

</script> -->
<!-- <script>
$(function(){
	$('#myProjectBody').on('scroll touchmove mousewheel', function(e) {
		   e.preventDefault();
		   e.stopPropagation(); 
		   return false;
	})
})
</script> -->






<!--  For modal -->












<!--  -->
<style>
@font-face {
	font-family: 'NanumGothic';
	src: url(<%=request.getContextPath()%>/resources/fonts/NANUMGOTHIC.TTF)
		format('truetype');
}
</style>
<style>
body {
	font-family: 'NanumGothic';
	background-color: white;
}

.navbar-default {
	font-size: 13px;
	margin-top: -10px;
	/* min-height: 28px; */
	/* height: 11px; */
	height: 42px;
	background-color: #6093cc;
}

.navbar-default  .navbar-header>a {
	color: white !important;
}

.navbar-default  .navbar-nav>li>a {
	color: white !important;
}

.navbar-inverse {
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-top: 30px;
	background-color: #6093cc;
	border-bottom-color: #6093cc;
	border-top: 1px solid rgba(0, 0, 0, 0.3);
}

.navbar-inverse  .navbar-header>a {
	color: white;
}

.navbar-inverse  .navbar-nav>li>a {
	color: white;
}

.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:focus,
	.navbar-inverse .navbar-nav>.open>a:hover {
	background-color: #6093cc;
	color: white;
}

.col-md-3 {
	width: 100%;
}

#profileImg {
	border-radius: 50%;
	width: 100px;
	height: 100px;
}

#thumbnail {
	border-radius: 50%;
	width: 40px;
	height: 40px;
}
</style>

<style>
.createProject {
	color: #fff;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.15);
	background-color: #6cc644;
	background-image: -webkit-linear-gradient(#91dd70, #55ae2e);
	background-image: linear-gradient(#91dd70, #55ae2e);
	border: 1px solid #5aad35;
}

.createProject:hover {
	background-color: #55a532;
	background-image: -webkit-linear-gradient(#85d063, #4f992f);
	background-image: linear-gradient(#85d063, #4f992f);
	border-color: #519d30;
}

#content {
	background-color: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-top: 25px;
	min-height: 800px;
	margin-bottom: 5%;
}

.page-header {
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>
<script>
$(function(){
	$('#navbar').css({
		'filter':'brightness(80%)'	
		});
		$('#myProjectList').css({
		'filter':'brightness(125%)'
	});
		$('#otherProjectList').css({
			'filter':'brightness(125%)'
		})
	})
</script>





</head>
<title>최종!</title>
<body>
	<header>

		<!-- Navigation -->
		<div class="background-color" style="height: auto;">

			<nav class="navbar navbar-default navbar-fixed-top container "
				role="navigation" id="navbar"
				style="background-color:<c:out value='${sessionScope.joinProjectVo.proj_Color}'/>">


				<!-- 	<a class="navbar-brand" href="#" style="color:white;"><b>프로젝트 자동화 시스템</b></a> -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right" id="a">

						<li><a id="myProjectList"
							style="background-color:<c:out value='${sessionScope.joinProjectVo.proj_Color}'/>"
							href="<%=request.getContextPath()%>/main/myProject"><p>참여
									프로젝트 보기</p></a></li>
						<li><a id="otherProjectList"
							style="background-color:<c:out value='${sessionScope.joinProjectVo.proj_Color}'/>"
							href="<%=request.getContextPath()%>/main/otherProject">외부
								프로젝트 보기</a></li>

					</ul>
					<ul class="nav navbar-nav navbar-right">

					</ul>

					<div id="jkjk"></div>

				</div>
			</nav>

		</div>
		<nav class="navbar navbar-inverse navbar-fixed-top container"
			role="navigation" id="navbar2"
			style="background-color:<c:out value='${sessionScope.joinProjectVo.proj_Color}'/>">

			<div class="">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header ">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<c:choose>
						<c:when test="${empty sessionScope.joinProj }">


						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
					<a class="navbar-brand" href="#" style="font-size: 20px;"><b>프로젝트
							자동화 시스템</b></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li>

							<div class="col-md-12 col-md-3">

								<form class="navbar-form" role="search">
									<div class="input-group">

										<input type="text" class="form-control" placeholder="프로젝트 검색"
											name="q">
										<div class="input-group-btn">
											<button class="btn btn-default" type="submit">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</div>
									</div>
								</form>
							</div>




						</li>
						<li class="dropdown"><a id="droptoggle" href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-expanded="false"
							style="padding-top: 5px; padding-bottom: 5px;"> <img
								src="<%=request.getContextPath() %>/resources/upload/${loginUser.mem_Img}"
								onerror="this.src='<%=request.getContextPath()%>/resources/upload/no.png'"
								id="thumbnail" alt="my image" /> <span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu" style="min-width: 144px;">
								<li><a href="#" onclick="imgUploadModal();"> <img
										class="img-thumbnail"
										src="<%=request.getContextPath() %>/resources/upload/${loginUser.mem_Img}"
										data-toggle="modal" data-target="#imgUploadModal"
										data-keyboard="false" data-backdrop="static" id="profileImg"
										onerror="this.src='<%=request.getContextPath()%>/resources/upload/no.png'" />
								</a></li>
								<li class="divider"></li>
								<li><a href="#" data-toggle="modal"
									data-target="#myPageModal" data-keyboard="false"
									data-backdrop="static">내 정보 수정</a></li>
								<li><a href="#">내 업무</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0);" onclick="logOut();">로그아웃</a></li>

							</ul></li>

						<li><a href="#" id="alarmMenu"
							class="glyphicon glyphicon-bell" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"
							style="font-size: 25px;"> </a> <span id="alarmCount"
							style="color: red; display: none;"></span> <span id="alarmZone"></span>

							<ul class="dropdown-menu" role="menu" id="dropMenu">

							</ul></li>

					</ul>
					<ul class="nav navbar-nav navbar-right">

					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container -->
		</nav>
	</header>

	<!-- imgUpModal -->
	<div class="modal fade" id="imgUploadModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header"
					style="background: linear-gradient(#FEFEFD, #F9F9F9 3%, #E5E5E5);">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">사진을 등록하렴</h3>
				</div>
				<div class="modal-body">
					<%-- <jsp:include page="WEB-INF/views/main/c8.jsp" /> --%>
					<%@ include file="WEB-INF/views/main/c8.jsp"%>
				</div>
				<div class="modal-footer" style="text-align: left">
					<button id="closeModal" type="button" class="btn btn-default"
						data-dismiss="modal">Close</button>
					<script>
						$(document).ready(function() {
							$('#closeModal').click(function() {
								location.reload();
							});
						})
					</script>
					<button class="btn btn-default pull-right" id="btn-upload1">사진
						등록하기</button>
					<script>
		$('#btn-upload1').on('click', function() {
			console.log('btn-upload');
			var form = new FormData(document.getElementById('uploadForm'));
		
			$.ajax({
				url : "<%=request.getContextPath()%>/main/c8",
				data : form,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : 
					function(response) {
					console.log('success');
					console.log(response);
					 alert('사진이 등록되었습니다.'); 
					
					location.reload();
					$('#profileImg').attr('src','<%=request.getContextPath()%>/resources/upload/${param.memberVo.mem_Img}');

														},
														error : function(jqXHR) {

															console
																	.log('error');
														}
													});

										});
					</script>


				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="myPageModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header"
					style="background: linear-gradient(#FEFEFD, #F9F9F9 3%, #E5E5E5);">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">마이 페이지</h3>
				</div>
				<div class="modal-body">
					<%-- <jsp:include page="WEB-INF/views/main/c8.jsp" /> --%>
					<%@ include file="WEB-INF/views/main/myPage.jsp"%>
				</div>
				<div class="modal-footer" style="text-align: left">

					<button class="btn btn-default pull-right" type="submit"
						id="submit" style="margin-left: 5px;">정보 수정하기</button>
					<script>
							$('#submit').click(function(){
								var mem_Phone = $('#mem_Phone').val();
								var mem_Pass = $('#userPw').val();
								var dataList = {'mem_Phone':mem_Phone,'mem_Pass':mem_Pass};
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
							})
							
							
							</script>


					<button id="closeModal" type="button"
						class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
					<button id="delete" type="button" class="btn btn-danger">탈퇴하기</button>
					<script>
						$(document).ready(function() {
							$('#closeModal').click(function() {
								location.reload();
							})
						});
						</script>

				</div>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${empty sessionScope.joinProj }">
			<decorator:body />

		</c:when>
		<c:otherwise>
			<div class="container">
				<div class="row">
					<div class="col-md-2" id="submenu"
						style="margin-top: 25px; padding-left: 0px;">
						<%@ include file="sub.jsp"%>
						<script>
		$('#btn-upload2').on('click', function() {
			var form = new FormData(document.getElementById('projImg'));
		
			$.ajax({
				
				url : "<%=request.getContextPath()%>/project/c9",
				data : form,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : 
					function(response) {
					console.log('success');
					console.log(response);
					 alert('사진이 등록되었습니다.'); 
					
					location.reload();
					$('#proj_Img').attr('src','<%=request.getContextPath()%>/resources/upload2/${projectVo.proj_Img}');
														},
														error : function(jqXHR) {

															console
																	.log('error');
														}
													});

										});
					</script>

					</div>
					<decorator:body />
				</div>
			</div>

		</c:otherwise>
	</c:choose>
	<c:set var="loginUserEmail" value="${loginUser.mem_Email}"></c:set>

</body>
<script>
	$(document).ready(
			function() {
				/* connect(); */
				
				$.ajax({
					url :'<%=request.getContextPath()%>/main/alarmCount',
					dataType : 'json',
					type:'get',
					success:function(data){
							$('#alarmCount').text("");
							$('#alarmCount').text(data);
						}
					});
				
				/* $(".dropdown").hover(
						function() {
							$('.dropdown-menu', this).not('.in .dropdown-menu')
									.stop(true, true).slideDown("400");
							$(this).toggleClass('open');
						},
						function() {
							$('.dropdown-menu', this).not('.in .dropdown-menu')
									.stop(true, true).slideUp("400");
							$(this).toggleClass('open');
						}); */
						
				$('#alarmMenu').on('click',function(){
					$.ajax({
						url:'alramView',
						contentType:'application/json',
						dataType:'json',
						type:'post',
						success:function(data) {
							var dataListApply="";
							var dataListInvite="";
							var memApplyViewList="";
							var projInviteViewList = "";
							memApplyViewList = data.memApplyViewList;
							projInviteViewList = data.projInviteViewList;
							
							$.each(memApplyViewList,function(i){
								var date = new Date(memApplyViewList[i].apply_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataListApply += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+memApplyViewList[i].proj_Num+'] '+ memApplyViewList[i].proj_Name+
								' 보낸사람 : '+memApplyViewList[i].mem_Email+' 분류 : [ '+memApplyViewList[i].alarm_Clsfct_Name+"] <input type='button' id="+memApplyViewList[i].apply_Num+" class='go_agreeApply btn btn-default' value='수락'>"
								+" / <input type='button' id="+memApplyViewList[i].apply_Num+" class='go_rejectApply btn btn-default' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							
							$.each(projInviteViewList,function(i){
								var date = new Date(projInviteViewList[i].invite_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataListInvite += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+projInviteViewList[i].proj_Num+'] '+ projInviteViewList[i].proj_Name+
								' 보낸사람 : '+projInviteViewList[i].mem_Email+' 분류 : [ '+projInviteViewList[i].alarm_Clsfct_Name+" ]<input type='button' id="+projInviteViewList[i].invite_Num+" class='go_agreeInvite btn btn-default' value='수락'>"
								+" / <input type='button' id="+projInviteViewList[i].invite_Num+" class='go_rejectInvite btn btn-default' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							
							var fullDataList = dataListApply + "<hr color='red'/>"+ dataListInvite
							$('#dropMenu').empty();
							$('#dropMenu').append(fullDataList);
							
						},
						complete:function(){
							$.ajax({
								url :'<%=request.getContextPath()%>/main/alarmCount',
								dataType : 'json',
								type:'get',
								success:function(data){
										$('#alarmCount').text("");
										$('#alarmCount').text(data);
									}
								})
						}
					})
				});
				
						
						
						
				$(document).on('click','.go_rejectApply',function(){
					var apply_Num =$(this).attr('id');
					dataList = {'apply_Num' : apply_Num};
					
					$.ajax({
						url:'rejectApply',
						dataType:'json',
						contentType:'application/json',
						data: JSON.stringify(dataList),
						type:'post',
						success:function(data){
							alert('가입신청 거절');
							var dataListApply="";
							var dataListInvite="";
							var memApplyViewList="";
							var projInviteViewList = "";
							memApplyViewList = data.memApplyViewList;
							projInviteViewList = data.projInviteViewList;
							
							$.each(memApplyViewList,function(i){
								var date = new Date(memApplyViewList[i].apply_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataListApply += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+memApplyViewList[i].proj_Num+'] '+ memApplyViewList[i].proj_Name+
								' 보낸사람 : '+memApplyViewList[i].mem_Email+' 분류 : [ '+memApplyViewList[i].alarm_Clsfct_Name+"] <input type='button' id="+memApplyViewList[i].apply_Num+" class='go_agreeApply btn btn-default' value='수락'>"
								+" / <input type='button' id="+memApplyViewList[i].apply_Num+" class='go_rejectApply btn btn-default' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							
							$.each(projInviteViewList,function(i){
								var date = new Date(projInviteViewList[i].invite_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataListInvite += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+projInviteViewList[i].proj_Num+'] '+ projInviteViewList[i].proj_Name+
								' 보낸사람 : '+projInviteViewList[i].mem_Email+' 분류 : [ '+projInviteViewList[i].alarm_Clsfct_Name+" ]<input type='button' id="+projInviteViewList[i].invite_Num+" class='go_agreeInvite btn btn-default' value='수락'>"
								+" / <input type='button' id="+projInviteViewList[i].invite_Num+" class='go_rejectInvite btn btn-default' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							
							var fullDataList = dataListApply + "<hr color='red'/>"+ dataListInvite
							$('#dropMenu').empty();
							$('#dropMenu').append(fullDataList);
							
						},
						complete:function(){
							$.ajax({
								url :'<%=request.getContextPath()%>/main/alarmCount',
								dataType : 'json',
								type:'get',
								success:function(data){
										$('#alarmCount').text("");
										$('#alarmCount').text(data);
									}
								})
						}
				});
			});
				
				
				
				$(document).on('click','.go_agreeApply',function(){
					var apply_Num =$(this).attr('id');
					dataList = {'apply_Num' : apply_Num};
					$.ajax({
						url:'agreeApply',
						dataType:'json',
						contentType:'application/json',
						data: JSON.stringify(dataList),
						type:'post',
						success:function(data){
							alert('가입신청 승인');
							var dataListApply="";
							var dataListInvite="";
							var memApplyViewList="";
							var projInviteViewList = "";
							memApplyViewList = data.memApplyViewList;
							projInviteViewList = data.projInviteViewList;
							
							$.each(memApplyViewList,function(i){
								var date = new Date(memApplyViewList[i].apply_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataListApply += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+memApplyViewList[i].proj_Num+'] '+ memApplyViewList[i].proj_Name+
								' 보낸사람 : '+memApplyViewList[i].mem_Email+' 분류 : [ '+memApplyViewList[i].alarm_Clsfct_Name+"] <input type='button' id="+memApplyViewList[i].apply_Num+" class='go_agreeApply btn btn-default' value='수락'>"
								+" / <input type='button' id="+memApplyViewList[i].apply_Num+" class='go_rejectApply btn btn-default' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							
							$.each(projInviteViewList,function(i){
								var date = new Date(projInviteViewList[i].invite_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataListInvite += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+projInviteViewList[i].proj_Num+'] '+ projInviteViewList[i].proj_Name+
								' 보낸사람 : '+projInviteViewList[i].mem_Email+' 분류 : [ '+projInviteViewList[i].alarm_Clsfct_Name+" ]<input type='button' id="+projInviteViewList[i].invite_Num+" class='go_agreeInvite btn btn-default' value='수락'>"
								+" / <input type='button' id="+projInviteViewList[i].invite_Num+" class='go_rejectInvite btn btn-default' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							
							var fullDataList = dataListApply + "<hr color='red'/>"+ dataListInvite
							$('#dropMenu').empty();
							$('#dropMenu').append(fullDataList);
							
						},
						complete:function(){
							$.ajax({
								url :'<%=request.getContextPath()%>/main/alarmCount',
								dataType : 'json',
								type:'get',
								success:function(data){
										$('#alarmCount').text("");
										$('#alarmCount').text(data);
									}
							})
					}
					});
				});
				
				
				
				$(document).on('click','.go_agreeInvite',function(){
					var invite_Num =$(this).attr('id');
					dataList = {'invite_Num' : invite_Num};
					$.ajax({
						url:'agreeInvite',
						dataType:'json',
						contentType:'application/json',
						data: JSON.stringify(dataList),
						type:'post',
						success:function(data){
							alert('초대수락');
							var dataListApply="";
							var dataListInvite="";
							var memApplyViewList="";
							var projInviteViewList = "";
							memApplyViewList = data.memApplyViewList;
							projInviteViewList = data.projInviteViewList;
							
							$.each(memApplyViewList,function(i){
								var date = new Date(memApplyViewList[i].apply_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataListApply += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+memApplyViewList[i].proj_Num+'] '+ memApplyViewList[i].proj_Name+
								' 보낸사람 : '+memApplyViewList[i].mem_Email+' 분류 : [ '+memApplyViewList[i].alarm_Clsfct_Name+"] <input type='button' id="+memApplyViewList[i].apply_Num+" class='go_agreeApply btn btn-default' value='수락'>"
								+" / <input type='button' id="+memApplyViewList[i].apply_Num+" class='go_rejectApply btn btn-default' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							
							$.each(projInviteViewList,function(i){
								var date = new Date(projInviteViewList[i].invite_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataListInvite += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+projInviteViewList[i].proj_Num+'] '+ projInviteViewList[i].proj_Name+
								' 보낸사람 : '+projInviteViewList[i].mem_Email+' 분류 : [ '+projInviteViewList[i].alarm_Clsfct_Name+" ]<input type='button' id="+projInviteViewList[i].invite_Num+" class='go_agreeInvite btn btn-default' value='수락'>"
								+" / <input type='button' id="+projInviteViewList[i].invite_Num+" class='go_rejectInvite btn btn-default' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							
							var fullDataList = dataListApply + "<hr color='red'/>"+ dataListInvite
							$('#dropMenu').empty();
							$('#dropMenu').append(fullDataList);
							
						},
						complete:function(){
							$.ajax({
								url :'<%=request.getContextPath()%>/main/alarmCount',
								dataType : 'json',
								type:'get',
								success:function(data){
										$('#alarmCount').text("");
										$('#alarmCount').text(data);
									}
							})
					}
					});
				});
				
				
				
				$(document).on('click','.go_rejectInvite',function(){
					var invite_Num =$(this).attr('id');
					dataList = {'invite_Num' : invite_Num};
					$.ajax({
						url:'agreeInvite',
						dataType:'json',
						contentType:'application/json',
						data: JSON.stringify(dataList),
						type:'post',
						success:function(data){
							alert('초대 거절');
							var dataListApply="";
							var dataListInvite="";
							var memApplyViewList="";
							var projInviteViewList = "";
							memApplyViewList = data.memApplyViewList;
							projInviteViewList = data.projInviteViewList;
							
							$.each(memApplyViewList,function(i){
								var date = new Date(memApplyViewList[i].apply_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataListApply += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+memApplyViewList[i].proj_Num+'] '+ memApplyViewList[i].proj_Name+
								' 보낸사람 : '+memApplyViewList[i].mem_Email+' 분류 : [ '+memApplyViewList[i].alarm_Clsfct_Name+"] <input type='button' id="+memApplyViewList[i].apply_Num+" class='go_agreeApply btn btn-default' value='수락'>"
								+" / <input type='button' id="+memApplyViewList[i].apply_Num+" class='go_rejectApply btn btn-default' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							
							$.each(projInviteViewList,function(i){
								var date = new Date(projInviteViewList[i].invite_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataListInvite += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+projInviteViewList[i].proj_Num+'] '+ projInviteViewList[i].proj_Name+
								' 보낸사람 : '+projInviteViewList[i].mem_Email+' 분류 : [ '+projInviteViewList[i].alarm_Clsfct_Name+" ]<input type='button' id="+projInviteViewList[i].invite_Num+" class='go_agreeInvite btn btn-default' value='수락'>"
								+" / <input type='button' id="+projInviteViewList[i].invite_Num+" class='go_rejectInvite btn btn-default' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							
							var fullDataList = dataListApply + "<hr color='red'/>"+ dataListInvite
							$('#dropMenu').empty();
							$('#dropMenu').append(fullDataList);
							
						},
						complete:function(){
							$.ajax({
								url :'<%=request.getContextPath()%>/main/alarmCount',
								dataType : 'json',
								type:'get',
								success:function(data){
										$('#alarmCount').text("");
										$('#alarmCount').text(data);
									}
							})
					}
					});
				});
				
				
				
			});


</script>
<script>
$(function(){
	var a = location.href;
	if(a.indexOf("otherProject")==-1){
		$('#myProjectList').css('background-color','#6093cc');
	}else if(a.indexOf("otherProject")!=-1){
		$('#otherProjectList').css('background-color','#6093cc');
	} 
})

</script>

<script>
	function logOut() {
		location.href = "<%=request.getContextPath()%>/main/logOut";
	}
</script>
</html>


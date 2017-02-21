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

<html style="overflow:scroll;">


<head>


<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>PAS - Project Automation System</title>

<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">


<!-- kendo spreadSheet -->
<link href="<%=request.getContextPath()%>/resources/kendo/examples-offline.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/kendo/kendo.common.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/kendo/kendo.rtl.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/kendo/kendo.default.min.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/resources/kendo/jszip.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/kendo//kendo.all.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/kendo/console.js"></script>
    <link href="<%=request.getContextPath()%>/resources/kendo/kendo.default.mobile.min.css" rel="stylesheet">
    
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
<script src='<%=request.getContextPath()%>/resources/lib/moment.min.js'></script>

<script
	src='<%=request.getContextPath()%>/resources/lib/fullcalendar.js'></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/lib/gcal.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.2.0/locale/ko.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>

<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/resources/css/3-col-portfolio.css"
	rel="stylesheet">

<link
	href='<%=request.getContextPath()%>/resources/css/fullcalendar.min.css'
	rel='stylesheet' />

<link
	href='<%=request.getContextPath()%>/resources/css/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />

<link rel="stylesheet"
	href="https://unpkg.com/flatpickr/dist/flatpickr.min.css">
<script src="https://unpkg.com/flatpickr"></script>
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
#submenu{
 -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
}
#content{
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
}  
  
body.modal-open{
  margin-left:18px;
  }
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
	background-color: #3c5574;
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
	background-color: #3c5574;
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
	background-color: #3c5574;

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
/* flatpickr 인덱스 위치 */
div.flatpickr-calendar {
	z-index: 99999;
}
</style>
<script>
$(function(){
	$('#navbar').css({
		'filter':'brightness(80%)'	
		});
		$('#myProjectList').css({
		'filter':'brightness(125%)',
/* 		'background-color': '#3c5574' */
	});
	var a = location.href;
	if(a.indexOf("myProject")!=-1){
		$('#myProjectList').css({
			'background-color': '#3c5574' 
		})
	}
	if(a.indexOf("otherProject")!=-1){
		$('#otherProjectList').css({
			'filter':'brightness(125%)',
			'background-color': '#3c5574'
	});
		$('#myProjectList').css({
			'filter':'brightness(100%)'
		})
		
	}
	})
	
</script>
<script>

</script>




</head>
<title>최종!</title>
<body >
	<header>
		<!-- Navigation -->
		<div class="background-color" style="height: auto;">

			<nav class="navbar navbar-default navbar-fixed-top container "
				role="navigation" id="navbar"
				style="background-color:<c:out value='${sessionScope.joinProjectVo.proj_Color}'/>">


				<!-- 	<a class="navbar-brand" href="#" style="color:white;"><b>프로젝트 자동화 시스템</b></a> -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">


						<li><a id="myProjectList"
							style="background-color:<c:out value='${sessionScope.joinProjectVo.proj_Color}'/>"
							href="<%=request.getContextPath()%>/main/myProject"><p>참여
									프로젝트 보기</p></a></li>
						<li><a id="otherProjectList"
							style="background-color:<c:out value='${sessionScope.joinProjectVo.proj_Color}'/>"
							href="<%=request.getContextPath()%>/main/otherProject">외부
								프로젝트 보기</a></li>
					</ul>
					


				</div>
			</nav>

		</div>
		<nav class="navbar navbar-inverse navbar-fixed-top container"
			role="navigation" id="navbar2"
			style="border:0px solid white; background-color:<c:out value='${sessionScope.joinProjectVo.proj_Color}'/>">

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
					<a id="teamName" class="navbar-brand" href="#"
						style="font-size: 20px;"> <b> <c:choose>
								<c:when test="${empty sessionScope.joinProjectVo.proj_Name }">
					프로젝트 자동화 시스템
					</c:when>

					<c:otherwise>
					<p id="tn" >${sessionScope.joinProjectVo.proj_Name}&nbsp;<span class="caret" style="display:none;"></span></p>
					</c:otherwise>
					</c:choose>
					<script>
					$(function(){
						$('#tn').mouseover(function(){
							$('.caret').show();
						})
					/* 	$('#tn').click */
						
					})
					</script>

					</b></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">

						<li>
						<a data-toggle="modal" style="font-size : 28px; margin-top : -4px; cursor:pointer" data-target="#create" data-keyboard="false" data-backdrop="static"><span class="glyphicon glyphicon-plus"></span></a>
						
						</li>

						<li class="dropdown"><a id="droptoggle" href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-expanded="false"
							style="padding-top: 5px; padding-bottom: 5px;background-color:<c:out value='${sessionScope.joinProjectVo.proj_Color}'/>"> 
							<img
								src="<%=request.getContextPath() %>/resources/upload/${loginUser.mem_Img}"
								onerror="this.src='<%=request.getContextPath()%>/resources/upload/no.png'"
								id="thumbnail" alt="my image" /> <span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu" style="min-width: 144px;" >
								<li><a href="#" style="text-align:center;"onclick="imgUploadModal();"> <img
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
								<li><a href="#">쪽지함 보기</a></li>
								<li><a href="#">내 업무</a></li>
								<li><a href="#">내가 작성한 게시물</a></li>
								<li><a href="#">내가 작성한 댓글</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0);" onclick="logOut();">로그아웃</a></li>

							</ul></li>

						<li><a href="#" id="alarmMenu"
							class="glyphicon glyphicon-bell" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"
							style="font-size: 25px; padding-bottom: 14px; background-color:<c:out value='${sessionScope.joinProjectVo.proj_Color}'/>;"> </a> <span id="alarmCount"
							style="color: red;  display: none;"></span> <span id="alarmZone"></span>

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

			<!-- 프로젝트 생성 모달   -->
		<div class="modal fade" id="create" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
						프로젝트 생성
					</div>
					<div class="modal-body" id="createBody">
						생성자 : <input type="text" id="mem_Email"
							value="${sessionScope.loginUser.mem_Email}" readonly="readonly"><br>
						<br> <input type="hidden" id="mem_Img"
							value="${sessionScope.loginUser.mem_Img }"> 
							프로젝트 이름 : <input type="text" id="proj_Name" name="proj_Name"><br> <br>
							프로젝트 팀명 : <input type="text" id="proj_Team" name ="proj_Team"><br><br>
						프로젝트 내용 : <textarea rows="15" cols="30" name="proj_Content" id="proj_Content"></textarea>
						<br>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" id="createBtn"
							value="생성" />

						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	
	
		
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
								url :'/pas/main/alarmCount',
																		dataType : 'json',
																		type : 'get',
																		success : function(
																				data) {
																			$(
																					'#alarmCount')
																					.text(
																							"");
																			$(
																					'#alarmCount')
																					.text(
																							data);
																		}
																	})
														}
													});
										});

					});
</script>
<script>


$(document).ready(function(){
	$('#createBtn').on('click',function(){
		var mem_Email = $('#mem_Email').val();
		var proj_Name = $('#proj_Name').val();
		var proj_Content = $('#proj_Content').val();
		var proj_Team = $('#proj_Team').val();
		var mem_Img = $('#mem_Img').val();
		var dataList = {'mem_Email':mem_Email,'proj_Name':proj_Name,'proj_Content':proj_Content,'mem_Img':mem_Img,
				'proj_Team':proj_Team};
		$.ajax({
			url:'/pas/main/createProject',
			contentType:'application/json',
			data: JSON.stringify(dataList),
			type:'post',
			success:function(proj_Num){
				location.href="../project/pmOverView?proj_Num="+proj_Num;
			},
			error : function(){
				alert("프로젝트 생성 실패");
			}
		})
	})
})


</script>

<script>
	function logOut() {
		location.href = "/pas/main/logOut";
	}
</script>
</html>


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
	background-color: rgb(249, 249, 249);
}

.navbar-default {
	font-size: 13px;
	margin-top: -10px;
	/* min-height: 28px; */
	/* height: 11px; */
	height: 42px;
	background-color: #4D76A3;
}

.navbar-default  .navbar-header>a {
	color: white;
}

.navbar-default  .navbar-nav>li>a {
	color: white;
}

.navbar-inverse {
	margin-top: 30px;
	background-color: #6093cc;
	border-color: #6093cc;
}

.navbar-inverse  .navbar-header>a {
	color: white;
}

.navbar-inverse  .navbar-nav>li>a {
	color: white;
}

.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:focus,
	.navbar-inverse .navbar-nav>.open>a:hover {
	background-color: #6093cc
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

#a li a:hover {
	background-color: #6093cc;
	color: white;
	font-weight: bold;
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
</style>






</head>
<title>최종!</title>
<body>
	<header>

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			id="navbar">
			<div class="container">

				<!-- 	<a class="navbar-brand" href="#" style="color:white;"><b>프로젝트 자동화 시스템</b></a> -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right" id="a">

						<li><a id="myProjectList" href="<%=request.getContextPath()%>/main/myProject">참여
								프로젝트 보기</a></li>
						<li><a id="otherProjectList" href="<%=request.getContextPath()%>/main/otherProject">외부
								프로젝트 보기</a></li>

					</ul>
					<ul class="nav navbar-nav navbar-right">

					</ul>
				</div>
				<div id="jkjk"></div>

			</div>
		</nav>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
			id="navbar">

			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#" style="font-size: 25px;"><b>프로젝트
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
								id="thumbnail" alt="my image" /> <span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu" style="min-width: 144px;">
								<li><a href="#" onclick="imgUploadModal();"> <img
										class="img-thumbnail"
										src="<%=request.getContextPath() %>/resources/upload/${loginUser.mem_Img}"
										data-toggle="modal" data-target="#imgUploadModal"
										data-keyboard="false" data-backdrop="static" id="profileImg" />
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
					<div class="col-md-2" id="submenu" style="margin-top: 40px;">
						<jsp:include page="sub.jsp" />
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
				connect();
				
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
							var dataList="";
							$.each(data,function(i){
								var date = new Date(data[i].apply_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataList += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+data[i].proj_Num+'] '+ data[i].proj_Name+
								' 보낸사람 : '+data[i].mem_Email+' 분류 : '+data[i].alarm_Clsfct_Name+"<input type='button' id="+data[i].apply_Num+" class='go_agree' value='수락'>"
								+" / <input type='button' id="+data[i].apply_Num+" class='go_reject' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							$('#dropMenu').empty();
							$('#dropMenu').append(dataList);
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
				
				$(document).on('click','.go_reject',function(){
					var apply_Num =$(this).attr('id');
					dataList = {'apply_Num' : apply_Num};
					$.ajax({
						url:'reject',
						dataType:'json',
						contentType:'application/json',
						data: JSON.stringify(dataList),
						type:'post',
						success:function(data){
							alert('가입신청 거절');
							var dataList="";
							$.each(data,function(i){
								var date = new Date(data[i].apply_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataList += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+data[i].proj_Num+'] '+ data[i].proj_Name+
								' 보낸사람 : '+data[i].mem_Email+' 분류 : '+data[i].alarm_Clsfct_Name+"<input type='button' id="+data[i].apply_Num+" class='go_agree' value='수락'>"
								+" / <input type='button' id="+data[i].apply_Num+" class='go_reject' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							$('#dropMenu').empty();
							$('#dropMenu').append(dataList);
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
				
				
				$(document).on('click','.go_agree',function(){
					var apply_Num =$(this).attr('id');
					dataList = {'apply_Num' : apply_Num};
					$.ajax({
						url:'agree',
						dataType:'json',
						contentType:'application/json',
						data: JSON.stringify(dataList),
						type:'post',
						success:function(data){
							alert('가입신청 승인');
							var dataList="";
							$.each(data,function(i){
								var date = new Date(data[i].apply_Time);
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0'
										+ month;
								var day = date.getDate();
								day = day >= 10 ? day : '0' + day;
								var fullD = year + '년' + month
										+ '월' + day + '일';
								dataList += '<li><a href="#">알림시각 : '+fullD+' 프로젝트이름 : ['+data[i].proj_Num+'] '+ data[i].proj_Name+
								' 보낸사람 : '+data[i].mem_Email+' 분류 : '+data[i].alarm_Clsfct_Name+"<input type='button' id="+data[i].apply_Num+" class='go_agree' value='수락'>"
								+" / <input type='button' id="+data[i].apply_Num+" class='go_reject' value='거절'></a></li><br>";
								if(i==2){
									return false;
								}
							});
							$('#dropMenu').empty();
							$('#dropMenu').append(dataList);
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


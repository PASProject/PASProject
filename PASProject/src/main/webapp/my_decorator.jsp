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






<!-- CSS -->
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


<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/socket.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/sockjs-0.3.min.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<!-- Bootstrap Core JavaScript -->
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>

<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/resources/css/3-col-portfolio.css"
	rel="stylesheet">


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
	src: url(resources/fonts/NANUMBARUNGOTHIC.TTF) format('truetype');
}
</style>
<style>
body {
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

#droptoggle:hover {
	background-color: #4D76A3;
}

.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:focus,
	.navbar-inverse .navbar-nav>.open>a:hover {
	background-color: #4D76A3;
}

.col-md-3 {
	width: 100%;
}



#profileImg{
border-radius: 50%;
width: 100px;
height: 100px;
}
#thumbnail{
border-radius:50%;
width:40px;
height:40px;
}
</style>
</head>
<title>최종! 2E6099</title>
<body>
	<header>

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			id="navbar">
			<div class="container">

				<!-- 	<a class="navbar-brand" href="#" style="color:white;"><b>프로젝트 자동화 시스템</b></a> -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="<%=request.getContextPath()%>/main/myProject">내
								프로젝트 보기</a></li>
						<li><a href="<%=request.getContextPath()%>/main/otherProject">다른
								프로젝트 보기</a></li>

					</ul>
					<ul class="nav navbar-nav navbar-right">

					</ul>
				</div>


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
					<a class="navbar-brand" href="#"><b>프로젝트 자동화 시스템</b></a>
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
							aria-expanded="false" style="padding-top:5px; padding-bottom:5px;">

<img 
				src="<%=request.getContextPath() %>/resources/upload/${loginUser.mem_Img}"
				id="thumbnail" alt="your image" />



 <span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu" style="min-width:144px;">
								<li><a  href="#" onclick="imgUploadModal();">
										<!-- 		String upload = new HttpServletRequestWrapper(request).getRealPath("/resources/upload"); -->

										<%-- <% 
								String upload = new HttpServletRequestWrapper(request).getRealPath("/resources/upload");
								MemberVo member = new MemberVo();								
								member = (MemberVo)session.getAttribute("loginUser");
								String img = member.getMem_Img();
								upload = upload+"\\"+img;
									
								%> --%> <%-- <img src="<%=upload%>" --%> <img 
								class="img-thumbnail"
										src="<%=request.getContextPath() %>/resources/upload/${loginUser.mem_Img}"
									 data-toggle="modal"
										data-target="#imgUploadModal" data-keyboard="false"
										data-backdrop="static" id="profileImg" />
								</a></li>
								<li class="divider"></li>
								<li><a href="#">내 정보 수정</a></li>
								<li><a href="#">내 업무</a></li>
								<li class="divider"></li>
								<li><a href="#">로그아웃</a></li>
							</ul></li>
						<li><a href="#" class="glyphicon glyphicon-bell"
							style="font-size: 25px;"></a></li>

					</ul>
					<ul class="nav navbar-nav navbar-right">

					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container -->
		</nav>
	</header>

	<!-- Modal -->
	<div class="modal fade" id="imgUploadModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">사진을 등록하렴</h3>
				</div>
				<div class="modal-body">
					<%-- <jsp:include page="WEB-INF/views/main/c8.jsp" /> --%>
					<%@ include file="WEB-INF/views/main/c8.jsp"%>
				</div>
				<div class="modal-footer" style="text-align:left">
				<button id="closeModal" type="button" class="btn btn-default"
						data-dismiss="modal" >Close</button>
					<script>
						$(document).ready(function() {
							$('#closeModal').click(function() {
								location.reload();
							});
						});
					</script>
					<button  class="btn btn-success" id="btn-upload1" style="margin-left:399px">사진 등록하기</button>
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
					$("#btn-upload1").attr("data-dismiss","modal");
					location.reload();
					$('#profileImg').attr('src','<%=request.getContextPath()%>/resources/upload/${param.memberVo.mem_Img}');
					
				
														},
					error : function(jqXHR) {
					
					console.log('error');
														}
													});
			
			
										});
					</script>
					

				</div>
			</div>
		</div>
	</div>

	<decorator:body />

	<c:set var="loginUserEmail" value="${loginUser.mem_Email}"></c:set>
</body>
<script>
	$(document).ready(
			function() {
				connect('init:' + '${sessionScope.loginUser.mem_Email}');
				$(".dropdown").hover(
						function() {
							$('.dropdown-menu', this).not('.in .dropdown-menu')
									.stop(true, true).slideDown("400");
							$(this).toggleClass('open');
						},
						function() {
							$('.dropdown-menu', this).not('.in .dropdown-menu')
									.stop(true, true).slideUp("400");
							$(this).toggleClass('open');
						});

			});
</script>


<script>
	/* for modal */
</script>




</html>


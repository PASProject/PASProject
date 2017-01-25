<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>

<head>



<!-- CSS -->
<!-- Bootstrap Core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/resources/css/stylish-portfolio.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- JS -->
<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<!-- Bootstrap Core JavaScript -->
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<!-- bootstrap Validator -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>

<!-- FONT -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<style>
body.modal-open .background-container {
	-webkit-filter: blur(4px);
	-moz-filter: blur(4px);
	-o-filter: blur(4px);
	-ms-filter: blur(4px);
	filter: blur(4px);
	filter: url("https://gist.githubusercontent.com/amitabhaghosh197/b7865b409e835b5a43b5/raw/1a255b551091924971e7dee8935fd38a7fdf7311/blur"
		.svg #blur);
	filter: progid:DXImageTransform.Microsoft.Blur(PixelRadius='4');
}
</style>
<body>

	<!-- Navigation -->
	<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i
		class="fa fa-bars"></i></a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<a id="menu-close" href="#"
				class="btn btn-light btn-lg pull-right toggle"><i
				class="fa fa-times"></i></a>
			<li class="sidebar-brand"><a href="#top" onclick=$("#menu-close").click();>PAS</a>
			</li>
			<li><a href="#top" onclick=$("#menu-close").click();>Home</a></li>
			<li><a href="#join" onclick=$("#menu-close").click();>회원가입</a></li>
			<li><a href="#services" onclick=$("#menu-close").click();>Services</a>
			</li>
			<li><a href="#portfolio" onclick=$("#menu-close").click();>Portfolio</a>
			</li>
			<li><a href="#contact" onclick=$("#menu-close").click();>Contact</a>
			</li>
		</ul>
	</nav>

	<!-- Header -->
	<header id="top" class="header">
		<div class="text-vertical-center">
			<h1>Project Automation System</h1>
			<h3>Begin with us</h3>
			<br> <a href="main/loginForm" class="btn btn-dark btn-lg">들어가기</a>
		</div>

	</header>



	<!-- joinForm -->
	<section class="join" id="join">

		<div class="include" style="margin-top: 50px; margin-bottom: 50px;">
			<jsp:include page="WEB-INF/views/main/joinForm.jsp" />
		
		<div class="container2">
	<!-- 로고는 일단 지저분하니까 빼자
	<h3 style="text-align: center;">
		<img style="width: 80px" src="resources/img/logo.png">
	</h3> -->
	<!-- <h2 style="text-align: center">회원가입</h2> -->

	<div class="container container-fluid">


		<form class="form-horizontal" action=" " method="post" id="reg_form">
			<fieldset>

				<!-- Form Name -->
				<legend> 회원가입 </legend>

				<!-- Email -->
				<div class="form-group">
					<label class="col-md-4 control-label">이메일 주소</label>
					<div class="col-md-6  inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i></span> <input name="email"
								placeholder="E-Mail Address" class="form-control" type="text">
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
								placeholder="password" name="password" data-minLength="5"
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
								placeholder="Confirm password" name="confirmPassword"
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
								class="glyphicon glyphicon-user"></i></span> <input name="name"
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
								class="glyphicon glyphicon-earphone"></i></span> <input name="phone"
								placeholder="010-0000-0000" class="form-control" type="text">
						</div>
					</div>
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<button type="submit" class="btn btn-warning">
							확인 <span class="glyphicon glyphicon-send"></span>
						</button>
					</div>
				</div>
			</fieldset>
		</form>

	</div>



</div>
		
		
		</div>







	</section>

	<!-- Services -->
	<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
	<section id="services" class="services bg-primary">
		<div class="container">
			<div class="row text-center">
				<div class="col-lg-10 col-lg-offset-1">
					<h2>Our Services</h2>
					<hr class="small">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<div class="service-item">
								<span class="fa-stack fa-4x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-cloud fa-stack-1x text-primary"></i>
								</span>
								<h4>
									<strong>Service Name</strong>
								</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
								<a href="#" class="btn btn-light">Learn More</a>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="service-item">
								<span class="fa-stack fa-4x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-compass fa-stack-1x text-primary"></i>
								</span>
								<h4>
									<strong>Service Name</strong>
								</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
								<a href="#" class="btn btn-light">Learn More</a>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="service-item">
								<span class="fa-stack fa-4x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-flask fa-stack-1x text-primary"></i>
								</span>
								<h4>
									<strong>Service Name</strong>
								</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
								<a href="#" class="btn btn-light">Learn More</a>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="service-item">
								<span class="fa-stack fa-4x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-shield fa-stack-1x text-primary"></i>
								</span>
								<h4>
									<strong>Service Name</strong>
								</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
								<a href="#" class="btn btn-light">Learn More</a>
							</div>
						</div>
					</div>
					<!-- /.row (nested) -->
				</div>
				<!-- /.col-lg-10 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>

	<!-- Callout -->
	<aside class="callout">
		<div class="text-vertical-center">
			<h1>Vertically Centered Text</h1>
		</div>
	</aside>

	<!-- Portfolio -->
	<section id="portfolio" class="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1 text-center">
					<h2>Our Work</h2>
					<hr class="small">
					<div class="row">
						<div class="col-md-6">
							<div class="portfolio-item">
								<a href="#"> <img class="img-portfolio img-responsive"
									src="resources/img/portfolio-1.jpg">
								</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="portfolio-item">
								<a href="#"> <img class="img-portfolio img-responsive"
									src="resources/img/portfolio-2.jpg">
								</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="portfolio-item">
								<a href="#"> <img class="img-portfolio img-responsive"
									src="resources/img/portfolio-3.jpg">
								</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="portfolio-item">
								<a href="#"> <img class="img-portfolio img-responsive"
									src="resources/img/portfolio-4.jpg">
								</a>
							</div>
						</div>
					</div>
					<!-- /.row (nested) -->
					<a href="#" class="btn btn-dark">View More Items</a>
				</div>
				<!-- /.col-lg-10 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>

	<!-- Call to Action -->
	<aside class="call-to-action bg-primary">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h3>The buttons below are impossible to resist.</h3>
					<a href="#" class="btn btn-lg btn-light">Click Me!</a> <a href="#"
						class="btn btn-lg btn-dark">Look at Me!</a>
				</div>
			</div>
		</div>
	</aside>

	<!-- Map -->
	<section id="contact" class="map">
		<iframe width="100%" height="100%" frameborder="0" scrolling="no"
			marginheight="0" marginwidth="0"
			src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
		<br /> <small> <a
			href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
		</small>
	</section>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1 text-center">
					<h4>
						<strong>Start Bootstrap</strong>
					</h4>
					<p>
						3481 Melrose Place <br>Beverly Hills, CA 90210
					</p>
					<ul class="list-unstyled">
						<li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
						<li><i class="fa fa-envelope-o fa-fw"></i> <a
							href="mailto:name@example.com">name@example.com</a></li>
					</ul>
					<br>
					<ul class="list-inline">
						<li><a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
						</li>
					</ul>
					<hr class="small">
					<p class="text-muted">Copyright &copy; Your Website 2014</p>
				</div>
			</div>
		</div>
		<a id="to-top" href="#top" class="btn btn-dark btn-lg"><i
			class="fa fa-chevron-up fa-fw fa-1x"></i></a>
	</footer>

	<!-- jQuery -->
	<script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script>
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#],[data-toggle],[data-target],[data-slide])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    //#to-top button appears after scrolling
    var fixed = false;
    $(document).scroll(function() {
        if ($(this).scrollTop() > 250) {
            if (!fixed) {
                fixed = true;
                // $('#to-top').css({position:'fixed', display:'block'});
                $('#to-top').show("slow", function() {
                    $('#to-top').css({
                        position: 'fixed',
                        display: 'block'
                    });
                });
            }
        } else {
            if (fixed) {
                fixed = false;
                $('#to-top').hide("slow", function() {
                    $('#to-top').css({
                        display: 'none'
                    });
                });
            }
        }
    });
    // Disable Google Maps scrolling
    // See http://stackoverflow.com/a/25904582/1607849
    // Disable scroll zooming and bind back the click event
    var onMapMouseleaveHandler = function(event) {
        var that = $(this);
        that.on('click', onMapClickHandler);
        that.off('mouseleave', onMapMouseleaveHandler);
        that.find('iframe').css("pointer-events", "none");
    }
    var onMapClickHandler = function(event) {
            var that = $(this);
            // Disable the click handler until the user leaves the map area
            that.off('click', onMapClickHandler);
            // Enable scrolling zoom
            that.find('iframe').css("pointer-events", "auto");
            // Handle the mouse leave event
            that.on('mouseleave', onMapMouseleaveHandler);
        }
        // Enable map zooming with mouse scroll when the user clicks the map
    $('.map').on('click', onMapClickHandler);
        
   
    </script>

	<script>
    function login_go() {
		/* $('.ui modal').modal({
			blurring : true
		}).modal('show'); */
		$('#loginModal').modal({
			blurring : true
		}).modal('show');
	};
    </script>
	<script>
$(document)
.ready(
		function() {
			$('#reg_form')
					.bootstrapValidator(
							{
								// To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
								feedbackIcons : {
									valid : 'glyphicon glyphicon-ok',
									invalid : 'glyphicon glyphicon-remove',
									validating : 'glyphicon glyphicon-refresh'
								},
								fields : {
									name : {
										validators : {
											stringLength : {
												min : 2,
											},
											notEmpty : {
												message : '이름을 기입해 주세요'
											}
										}
									},

									phone : {
										validators : {
											notEmpty : {
												message : 'Please supply your phone number'
											},
											phone : {
												country : 'US',
												message : 'Please supply a vaild phone number with area code'
											}
										}
									},
									address : {
										validators : {
											stringLength : {
												min : 8,
											},
											notEmpty : {
												message : 'Please supply your street address'
											}
										}
									},
									city : {
										validators : {
											stringLength : {
												min : 4,
											},
											notEmpty : {
												message : 'Please supply your city'
											}
										}
									},
									state : {
										validators : {
											notEmpty : {
												message : 'Please select your state'
											}
										}
									},
									zip : {
										validators : {
											notEmpty : {
												message : 'Please supply your zip code'
											},
											zipCode : {
												country : 'US',
												message : 'Please supply a vaild zip code'
											}
										}
									},
									comment : {
										validators : {
											stringLength : {
												min : 10,
												max : 200,
												message : 'Please enter at least 10 characters and no more than 200'
											},
											notEmpty : {
												message : 'Please supply a description about yourself'
											}
										}
									},
									email : {
										validators : {
											notEmpty : {
												message : 'Please supply your email address'
											},
											emailAddress : {
												message : 'Please supply a valid email address'
											}
										}
									},

									password : {
										validators : {
											identical : {
												field : 'confirmPassword',
												message : 'Confirm your password below - type same password please'
											}
										}
									},
									confirmPassword : {
										validators : {
											identical : {
												field : 'password',
												message : 'The password and its confirm are not the same'
											}
										}
									},

								}
							})

					.on(
							'success.form.bv',
							function(e) {
								$('#success_message').slideDown({
									opacity : "show"
								}, "slow") // Do something ...
								$('#reg_form').data(
										'bootstrapValidator')
										.resetForm();

								// Prevent form submission
								e.preventDefault();

								// Get the form instance
								var $form = $(e.target);

								// Get the BootstrapValidator instance
								var bv = $form
										.data('bootstrapValidator');

								// Use Ajax to submit form data
								$.post($form.attr('action'), $form
										.serialize(), function(
										result) {
									console.log(result);
								}, 'json');
							});
		});
</script>
</body>

</html>

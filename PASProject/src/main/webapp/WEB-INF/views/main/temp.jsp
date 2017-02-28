<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<style>
#square {
	box-shadow:0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	font-size:16px;
	text-align:center;
	line-height	:50px;
	color: white;
	background-color: #51a351;
	border: 1px solid #51a351;
	border-radius:5px;
	position: absolute;
	left: 72%;
	top: 85%;
	display: none;
	width: 300px;
	height: 50px;
}
</style>
	<div class="container Message" id="content">
		<h3 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			연습 <small></small>
		</h3>
		<button class="btn btn-info" id="trigger">이거누르면</button>
		<div id="square" ><span style="padding-right:10px;"class="glyphicon glyphicon-ok "></span>새로운 알림이 도착하였습니다</div>
		<script>
		$('#trigger').on('click',function(){
			pushMessage();
		})
				function pushMessage(){
					$('#square').fadeIn('slow').delay(3000).fadeOut('slow');
					
				}
		</script>  


	</div>
</body>
</html>

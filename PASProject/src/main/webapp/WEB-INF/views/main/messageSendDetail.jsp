<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<script>
		$(function() {
			var input = document.getElementsByName('joinProj');
			var joinProj = input[0].value;

			if (joinProj != '') {
				$('.Message').removeClass('container').addClass('col-md-10');
			}
		})
	</script>
	<input type="hidden" name="joinProj" value="${sessionScope.joinProj }" />

	<div class="container Message" id="content">
<<<<<<< HEAD
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			쪽지 읽기<small></small>
		</h2>
=======
		<h3 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			쪽지 읽기<small></small>
		</h3>
>>>>>>> branch 'master' of https://github.com/PASProject/PASProject.git
		${messageVo.msg_Title}
	</div>
</body>
</html>

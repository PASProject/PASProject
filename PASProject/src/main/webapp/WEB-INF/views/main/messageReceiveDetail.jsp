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
		<h3 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			쪽지 읽기<small></small>
		</h3>
		<table class="table table-hover">
			<tr>
				<td><b>${messageVo.msg_Title}</b></td>
			</tr>
			<tr>
				<td><a href="#">${messageVo.msg_sm_Email }</a>&nbsp;&nbsp;${messageVo.msg_Wt_Date }</td>
			</tr>
			<tr>
				<td style="border-bottom: 1px solid #ddd;">${messageVo.msg_Content }</td>
			</tr>
		</table>
		<button type="button" class="btn btn-default">삭제</button>
		<div class="btn-group pull-right">
			<button type="button" class="btn btn-default">답장</button>
			<button type="button" class="btn btn-default">목록</button>
		</div>

	</div>
</body>
</html>
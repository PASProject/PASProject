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


	<h3>MultipartFile 사용</h3>
	<form action="yourProject" method="POST" enctype="multipart/form-data">
		제목 : <input type="text" name="title"><br /> 파일 : <input
			type="file" name="f"><br /> <input type="submit" value="전송" />
	</form>


	<form id="ajaxform" action="/saveFileTest.do" method="post"
		enctype="multipart/form-data">
		<input type="text" name="test2" /><br />
		<textarea rows="10" cols="10" name="test3"></textarea>
		<br /> <input type="file" name="test4" /> <input type="button"
			id="btn" value="전송" />
	</form>







</body>
<script>
	$(function() {
		$("#btn").click(function() {
			var formData = new FormData();
			formData.append("test2", $("input[name=test2]").val());
			formData.append("test3", $("textarea[name=test3]").text());
			formData.append("test4", $("input[name=test4]")[0].files[0]);
			$.ajax({
				url : '/saveFileTest.do',
				data : formData,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					alert("EE");
				}
			});
		});
	});
</script>
</html>
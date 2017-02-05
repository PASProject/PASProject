<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<title></title>
</head>


<body>

		<table>
			<tr>
				<td><img
					src="<%=request.getContextPath() %>/resources/upload/${loginUser.mem_Img}"
					id="blah" alt="your image" width="120px" height="160px" /></td>
				<td style="padding:20px;">
					<form id="uploadForm" enctype="multipart/form-data">
						<input type="file" id="fileId" name="f"
							onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
					</form>
					<button id="btn-upload">등록</button>
				</td>
			</tr>
		</table>

	<script>
		$('#btn-upload').on('click', function() {
			console.log('btn-upload');
			var form = new FormData(document.getElementById('uploadForm'));
			alert(form);
			$.ajax({
				url : "c8",
				data : form,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(response) {
					console.log('success');
					console.log(response);
					alert('사진이 등록되었습니다.');
				},
				error : function(jqXHR) {
					console.log('error');
				}
			});
		});
	</script>




</body>
<script>
	
</script>
</html>
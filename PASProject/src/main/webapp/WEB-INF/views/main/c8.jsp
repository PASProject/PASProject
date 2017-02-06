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
<style>
#blah {
	border-radius: 50%;
	width: 160px;
	height: 160px;
}
#fileId{
font-size:12px;
}
</style>
</head>


<body>

	<table>
		<tr>
			<td style="padding-left:20px;"><img class="img-thumbnail"
				src="<%=request.getContextPath() %>/resources/upload/${loginUser.mem_Img}"
				id="blah" alt="your image" /></td>
			<td style="padding-left: 75px;">
			프로필 사진을 업로드 해주세요.<br>사진 크기는 1mb이하만 가능합니다.<br><br><br>
				<form id="uploadForm" enctype="multipart/form-data">
					<input class="" type="file" id="fileId" name="f"
						onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
				</form>
				 <!-- <button class="btn btn-default" id="btn-upload">등록</button> -->
				<!-- <button id="asdf">gg</button> 
				<div  id="ajax-content"></div>
				<script>
				$(document).ready(function(){ $('#asdf').click(function(){ $('#ajax-content').load('profileImg #profile'); return false; }); });

				</script> -->
			</td>
		</tr>
	</table>

	<script>
		<%-- $('#btn-upload').on('click', function() {
			console.log('btn-upload');
			var form = new FormData(document.getElementById('uploadForm'));
		
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
					$('#profileImg').attr('src','<%=request.getContextPath() %>/resources/upload/${param.memberVo.mem_Img}')
				},
				error : function(jqXHR) {
					console.log('error');
				}
			});
		}); --%>
	</script>


	<%-- <button id="save">Load User</button>
	<div id="loading"></div>

	<script>
		$('#save').click(function() {
							$('#loading').html('<img src="<%=request.getContextPath()%>/resources/upload/${loginUser.mem_Img}"> loading...');

							// run ajax request
							$.ajax({
								type : "GET",
								dataType : "json",
								url : "c8",
								success : function(d) {
									// replace div's content with returned data
									$('#loading').html(d);
								}
							});
						});
	</script>
	<button class="btn btn-primary" id="btn1">연습이당</button>
	<div id="imgView"></div>
	<script>
		$(function() {
			$('#btn1').on('click', function(e) {
				/*  e.preventDefault(); */
				$("#img1").attr("src", $("#image_url").val());
			});
		});
	</script>

 --%>

</body>
<script>
	
</script>
</html>
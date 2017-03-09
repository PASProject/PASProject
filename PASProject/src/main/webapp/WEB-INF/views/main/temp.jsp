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

										console.log('error');
									}
								});

					});
</script>
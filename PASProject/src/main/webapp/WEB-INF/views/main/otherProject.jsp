<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.7/semantic.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.7/semantic.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.7/semantic.css">

</head>

<body>
	<!-- Page Content -->
	<div class="container">

		<!-- Page Header -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">
				다른 프로젝트 목록
					<!-- <small>Secondary Text</small> -->
				</h2>
			</div>
		</div>
		<!-- /.row -->

		<!-- Projects Row -->
				<c:forEach items="${otherProjectList}" var="projectVo">
					<div class="col-md-4 portfolio-item">
						<a href="#" onclick="goModal(${projectVo.proj_Num});"> <img
							class="img-responsive" src="http://placehold.it/700x400"
							data-toggle="modal" data-target="#${projectVo.proj_Num }" data-keyboard="false" data-backdrop="static">
						</a>
						<h3>
							<a href="#">${projectVo.proj_Name }</a>
						</h3>
						<p>${projectVo.proj_Content}</p>
						<c:if test="${status.count%3==0}">
							<br>
						</c:if>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="${projectVo.proj_Num }" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title"></h4>
									${projectVo.proj_Name }
								</div>
								<div class="modal-body" id = "${projectVo.proj_Num}body">
								팀원
								</div>
								<div class="modal-footer">
								
								<div id = "${projectVo.proj_Num}btnZone">
									<input type="button" class="btn btn-default" value="신청하기" id="applyBtn" onclick="javascript:goApply(${projectVo.proj_Num})"/>
								</div>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" >Close</button>
								</div>
							</div>

						</div>
					</div>
				</c:forEach>
		<!-- /.row -->

		<hr>

		<!-- Pagination -->
		<div class="row text-center">
			<div class="col-lg-12">
				<ul class="pagination">
					<li><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
		<!-- /.row -->

		<hr>
		<footer>
			<!-- Footer -->

			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Your Website 2014</p>
				</div>
			</div>
			<!-- /.row -->
		</footer>

	</div>
	
<script>
	function goModal(proj_Num){
		var data = {'proj_Num':proj_Num};
		$.ajax({
			url:'mdlOtherValue',
			data:JSON.stringify(data),
			contentType:'application/json',
			dataType:'json',
			type:'post',
			success:function(data){
				var tt="";
				$.each(data,function(i){
					tt += '<div> 아이디 : '+data[i].mem_Email+'<br> 이름 : '+data[i].mem_Name+'<br> 직책 :'+data[i].position_Name+'<hr color=\'red\'></div>'
				})
				$('#'+proj_Num+'body').empty();
				$('#'+proj_Num+'body').append(tt);
			},
			complete:function(){
				$.ajax({
					url : 'checkApply',
					contentType:'application/json',
					dataType:'json',
					type:'post',
					data:JSON.stringify(data),
					success:function(data){
						if(data!=0){
						$('#'+proj_Num+'btnZone #applyBtn').val('대기중');
						$('#'+proj_Num+'btnZone #applyBtn').css('color','red');
						$('#'+proj_Num+'btnZone #applyBtn').removeAttr('onclick');
						}
					}
				});
			}
		});
	}
	
	function goApply(proj_Num){
		var data = {'proj_Num':proj_Num};
		$.ajax({
			url:'apply',
			data:JSON.stringify(data),
			contentType:'application/json',
			dataType:'json',
			type:'post',
			success:function(data){
				$('#'+proj_Num+'btnZone #applyBtn').val('대기중');
				$('#'+proj_Num+'btnZone #applyBtn').css('color','red');
				$('#'+proj_Num+'btnZone #applyBtn').removeAttr('onclick');
				 send('push:'+data.p_Mem_Email); 
			},error:function(data){
				alert("에러");
			}
		});
	}
</script>

</body>

</html>

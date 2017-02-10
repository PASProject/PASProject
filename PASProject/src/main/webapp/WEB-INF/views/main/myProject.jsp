<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>


</head>

<body>


	<!-- Page Content -->
	<div class="container">

		<!-- Page Header -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">
					내 프로젝트 목록
					<!-- <small>Secondary Text</small> -->
					<input type="button" style="margin-left:5px;" class="btn btn-default pull-right" 
					id="createProject" value="생성하기" data-toggle="modal" data-target="#create"
							data-keyboard="false" data-backdrop="static">
				</h2>

			</div>
		</div>
		<!-- /.row -->

		<c:choose>
			<c:when test="${empty myProjectList}">
				<h1>프로젝트를 생성해주세요</h1>
			</c:when>
			<c:otherwise>


				<!-- Projects Row -->
				<c:forEach items="${myProjectList}" var="projectVo" varStatus="status">
					<div class="col-md-4 portfolio-item">
						<a href="#" onclick="goModal(${projectVo.proj_Num});"> <img
							class="img-responsive" src="http://placehold.it/700x400"
							data-toggle="modal" data-target="#${status.index }"
							data-keyboard="false" data-backdrop="static">
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
					<div class="modal fade" id="${status.index }" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title"></h4>
									${projectVo.proj_Name }

								</div>
								<div class="modal-body" id="${projectVo.proj_Num}body">팀원
								</div>
								<div class="modal-footer">
									<input type="button" class="btn btn-default" value="입장하기"
										onclick="javascript:gogo(${projectVo.proj_Num})" />
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
				<!-- 프로젝트 생성 모달   -->
					<div class="modal fade" id="create" role="dialog">
						<div class="modal-dialog modal-lg">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title"></h4>
									프로젝트 생성
								</div>
								<div class="modal-body" id="createBody">
									생성자 : <input type="text" id = "mem_Email" value="${sessionScope.loginUser.mem_Email}" readonly="readonly"><br><br>
									       <input type="hidden" id="mem_Img" value="${sessionScope.loginUser.mem_Img }">
									프로젝트 이름 : <input type="text" id="proj_Name" name = "proj_Name"><br><br>
									프로젝트 내용 : <textarea rows="15" cols="30" name="proj_Content" id="proj_Content"></textarea><br>
								</div>
								<div class="modal-footer">
									<input type="button" class="btn btn-default" id = "createBtn" value="생성" />
										
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>


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
			
	$(document).ready(function(){
		$('#createBtn').on('click',function(){
			var mem_Email = $('#mem_Email').val();
			var proj_Name = $('#proj_Name').val();
			var proj_Content = $('#proj_Content').val();
			var mem_Img = $('#mem_Img').val();
			var dataList = {'mem_Email':mem_Email,'proj_Name':proj_Name,'proj_Content':proj_Content,'mem_Img':mem_Img};
			$.ajax({
				url:'createProject',
				contentType:'application/json',
				data: JSON.stringify(dataList),
				type:'post',
				success:function(proj_Num){
					location.href="../project/pmOverView?proj_Num="+proj_Num;
				},
				error : function(){
					alert("프로젝트 생성 실패");
				}
			})
		})
	})
	function goModal(proj_Num){
		var data = {'proj_Num':proj_Num};
		$.ajax({
			url:'mdlValue',
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
			}
		})
	}
	
	
	function gogo(proj_Num){
		location.href="../project/pmOverView?proj_Num="+proj_Num;
	}
	function go_Pb(){
		location.href="<%=request.getContextPath() %>/SkillSharing/SkillSharingList"
	}
	function go_ProjectBoard(){
		location.href="<%=request.getContextPath() %>/project/pmBoardList"
	}
	function go_Fb(){
		location.href="<%=request.getContextPath() %>/freeBoard/freeBoardList"
	}
</script>

</body>

</html>

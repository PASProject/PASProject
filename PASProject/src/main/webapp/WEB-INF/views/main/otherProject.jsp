<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>

</head>

<body>
	<script>
$(function(){
	$('#otherProjectList').css({
		'filter':'brightness(125%)'
	});
	})
</script>
	<!-- Page Content -->
	<div class="container" id="content"
		style="padding-left: 14px; padding-right: 14px;">

		<!-- Page Header -->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					외부 프로젝트 목록
					<form style="float: right; margin-top: -5px;" class="navbar-form"
						action="otherProject" method="post">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="프로젝트 검색"
								name="proj_Search" />
							<div class="input-group-btn inline">
								<button style="width: 40px;" class="btn btn-default"
									type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>






					<!-- <small>Secondary Text</small> -->

				</h3>
			</div>
		</div>
		<!-- /.row -->
		<!-- Projects Row -->
		<c:forEach items="${otherProjectList}" var="projectVo"
			varStatus="status">
			<div class="col-md-3" id="box"
				style="margin-bottom: 30px; background-color: white; float: left; padding: 10px 20px !important; width: 350px; height: 370px; position: relative; margin-left: 15px; margin-right: 15px; border-radius: 4px; border: 1px solid #ccc !important;">
				<h4 style="font-weight: bold; margin-top: 10px;">${projectVo.proj_Name }</h4>
				<h5>${projectVo.proj_Team}</h5>
				<div
					style="min-height: 150px; border: 1px solid #ccc; border-radius: 5px; padding: 5px 10px; background-color: #fff5f5; margin-bottom: 10px;">
					<p>${projectVo.proj_Content}</p>
				</div>

				<hr style="margin-top: 10px; margin-bottom: 10px;">
				<script>
				$(function(){
					goModal(${projectVo.proj_Num});
				})
				
				</script>
				<div id="${projectVo.proj_Num}body"></div>
				<div id="warning" style="display: none;">
					<h4 style="color: red">그만 좀 쳐 누르고 기다려 좀 기다려라</h4>
				</div>
				<c:forEach var="inviteList" items="${inviteList }"
					varStatus="status">
					<c:choose>
						<c:when test="${projectVo.proj_Num == inviteList }">
							<div id="${projectVo.proj_Num}btnZone">
								<input class="btn btn-block btn-default" type="text"
									value="초대 요청이 전달 된 프로젝트 입니다." readonly />
							</div>
						</c:when>

						<c:otherwise>

							<div id="${projectVo.proj_Num}btnZone">
								<input class="btn btn-block btn-default" type="button"
									onclick="javascript:goApply(${projectVo.proj_Num})"
									id="applyBtn" value="참가 신청하기" />
							</div>


						</c:otherwise>
					</c:choose>
				</c:forEach>


				<%-- 				<a href="#" onclick="goModal(${projectVo.proj_Num});"> <img
					class="img-responsive" src="http://placehold.it/700x400"
					data-toggle="modal" data-target="#${projectVo.proj_Num }"
					data-keyboard="false" data-backdrop="static">
				</a> --%>
				<%-- <h3>
					<a href="#">${projectVo.proj_Name }</a>
				</h3>
				<p>${projectVo.proj_Content}</p> --%>
				<%-- <c:if test="${status.count%3==0}"> --%>
				<br>

			</div>

		</c:forEach>
		<!-- /.row -->

		
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
	$(function(){
		$("#applyBtn[value='참가 신청 대기중']").click(function(){
			$('#warning').show();
		});
	})
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
					if(data[i].position_Num==1){
					tt += '<table><tr><td rowspan="2"><img style="border-radius:50%; width:40px; height:40px; margin-right:5px;" src="/pas/resources/upload/'+data[i].mem_Img+'" ></td><td>팀장 : '+data[i].mem_Name+'</td></tr><tr><td> 이메일 : '+data[i].mem_Email+'</td></tr></table><div>'
					}
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
						$('#'+proj_Num+'btnZone #applyBtn').val('참가 승인 대기중');
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
				$('#'+proj_Num+'btnZone #applyBtn').val('참가 승인 대기중');
				$('#'+proj_Num+'btnZone #applyBtn').css('color','red');
				$('#'+proj_Num+'btnZone #applyBtn').removeAttr('onclick');
				var pushData = {'push':data.p_Mem_Email};
				 send(JSON.stringify(pushData)); 
			},error:function(data){
				alert("에러");
			}
		});
	}
</script>

</body>

</html>

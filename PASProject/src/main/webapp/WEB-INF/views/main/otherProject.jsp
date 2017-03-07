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
		style="padding-left: 14px; padding-right: 14px;
		-webkit-box-shadow :none; border:0px solid black; background-color:transparent;
		">
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
				style="-webkit-box-shadow :0 2px 2px 0 rgba(0,0,0,0.14), 0 3px 1px -2px rgba(0,0,0,0.12), 0 1px 5px 0 rgba(0,0,0,0.2);
				margin-bottom: 30px; background-color: white; float: left; padding: 10px 20px !important; width: 350px; height: 370px; position: relative; margin-left: 15px; margin-right: 15px; border-radius: 4px; border: 1px solid #ccc !important;">
				<h4 style="font-weight: bold; margin-top: 10px;">${projectVo.proj_Name } <a class="captain" href="#" onclick="goModal(${projectVo.proj_Num});" id="captain"><img
								src="<%=request.getContextPath() %>/resources/upload/${projectVo.proj_Img}"
								onerror="this.src='<%=request.getContextPath()%>/resources/upload/captain.png'" style="width:50px;" align="right"></a></h4>
				<h5>${projectVo.proj_Team}</h5>
				<div
					style="min-height: 150px; border: 1px solid #ccc; border-radius: 5px; padding: 5px 10px; background-color: #fff5f5; margin-bottom: 10px;">
					<p style="text-align:center;font-size:12pt;"><b>${projectVo.proj_Content}</b></p>
				</div>

				<hr style="margin-top: 10px; margin-bottom: 10px;">
				<div id="${projectVo.proj_Num}body"></div>
				<div id="warning" style="display: none;">
					<h4 style="color: red">...</h4>
				</div>
				
				<c:if test="${empty inviteList and empty applyList}">
				
				<div id="${projectVo.proj_Num}btnZone">
								<input class="btn btn-block btn-default" type="button"
									onclick="javascript:goApply(${projectVo.proj_Num})"
									id="applyBtn" style="margin-right:20px"
									
									value="참가 신청하기" />
							</div>		
				</c:if>
				
				
				<c:if test="${!empty applyList and empty inviteList}">
				
				<c:forEach var="applyList" items="${applyList }">
				<c:if test="${projectVo.proj_Num == applyList}">
				
				<div id="${projectVo.proj_Num}btnZone">
								<input style="color:red" class="btn btn-block btn-default" type="button"
									 value="참가 신청 대기중" />
							</div>		
				
				
				</c:if>
				</c:forEach>
				
				
				
				
				<div id="${projectVo.proj_Num}btnZone">
								<input class="btn btn-block btn-default" type="button"
									onclick="javascript:goApply(${projectVo.proj_Num})"
									id="applyBtn" value="참가 신청하기" />
				
				
							</div>
							</c:if>
							
							
							
							
							
							
							<c:if test="${!empty inviteList and empty applyList}">
				
				<c:forEach var="inviteList" items="${inviteList }">
				<c:if test="${projectVo.proj_Num == inviteList}">
				
				<div id="${projectVo.proj_Num}btnZone">
								<input style="color:blue" class="btn btn-block btn-default" type="button"
									 value="이미 초대 신청이 전달 된 프로젝트" />
							</div>		
				
				
				</c:if>
				</c:forEach>
				
				
				
				
				<div id="${projectVo.proj_Num}btnZone">
								<input class="btn btn-block btn-default" type="button"
									onclick="javascript:goApply(${projectVo.proj_Num})"
									id="applyBtn" value="참가 신청하기" />
				
				
							</div>
							</c:if>
							
							
					<c:if test="${!empty inviteList and !empty applyList}">	
					
					<c:forEach var="applyList" items="${applyList }">
				<c:if test="${projectVo.proj_Num == applyList}">
				
				<div id="${projectVo.proj_Num}btnZone">
								<input style="color:red" class="btn btn-block btn-default" type="button"
									 value="참가 신청 대기중" />
							</div>		
				
				
				</c:if>
				</c:forEach>
				
				
				<c:forEach var="inviteList" items="${inviteList }">
				<c:if test="${projectVo.proj_Num == inviteList}">
				
				<div id="${projectVo.proj_Num}btnZone">
								<input style="color:blue" class="btn btn-block btn-default" type="button"
									 value="이미 초대 신청이 전달 된 프로젝트" />
							</div>		
				
				
				</c:if>
				</c:forEach>
				
			
				
				
				<div id="${projectVo.proj_Num}btnZone">
								<input class="btn btn-block btn-default" type="button"
									onclick="javascript:goApply(${projectVo.proj_Num})"
									id="applyBtn" value="참가 신청하기" />
				
				
							</div>
					
					
				
				
					
					
					</c:if>	
							
							
									
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
	
				
				
				
				
				
				 
<%-- 
				 				<a href="#" onclick="goModal(${projectVo.proj_Num});"> <img
					class="img-responsive" src="http://placehold.it/700x400"
					data-toggle="modal" data-target="#${projectVo.proj_Num }"
					data-keyboard="false" data-backdrop="static">
				</a>  --%>
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
	
	$(document).ready(function() {

 $('.captain').trigger('click');
	});

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
					tt += '<table><tr><td rowspan="2"><img style="border-radius:50%; width:40px; height:40px; margin-right:5px;" src="/pas/resources/upload/'+data[i].mem_Img+'" onerror=this.src="/pas/resources/upload/no.png"></td><td><b>팀장 : '+data[i].mem_Name+'</td></tr><tr><td><b> 이메일 : '+data[i].mem_Email+'</b></td></tr></table><div>'
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
				alert(data.p_Mem_Email);
				 send(JSON.stringify(pushData)); 
			},error:function(data){
				alert("에러");
			}
		});
	}
</script>

</body>

</html>

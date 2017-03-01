<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

.glyphicon {
	margin-right: 10px;
}

.panel-body {
	padding: 0px;
}

.panel-body table tr td {
	padding-left: 30px
}

.panel-body .table {
	margin-bottom: 0px;
}

#colors>div {
	float: left;
	border-radius: 10px;
	width: 20px;
	height: 20px;
	margin: 5px;
}
.panel-title>a{
font-weight:bold;
}
</style>
</head>
<!-- <div class="container">
	<div class="row"> -->
<!-- 		<div class="col-sm-3 col-md-3"> -->

<div class="panel-group" id="accordion">







	<%--프로젝트 이미지 수정해야함 --%>

	<img class="img-thumbnail" id="proj_Img"
		style="width: 180px; height:130px; cursor: pointer; border: 1px solid #ddd; margin-bottom: 15px;"
		src="<%=request.getContextPath()%>/resources/upload2/${sessionScope.joinProjectVo.proj_Img}"
		data-toggle="modal" data-target="#imgUploadModal2"
		data-keyboard="false" data-backdrop="static"
		onerror="this.src='<%=request.getContextPath()%>/resources/upload2/no.png'" />

	<!-- imgUpModal -->
	<div class="modal fade" id="imgUploadModal2" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header"
					style="background: linear-gradient(#FEFEFD, #F9F9F9 3%, #E5E5E5);">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">사진을 등록하렴</h3>
				</div>
				<div class="modal-body">
					<%@ include file="WEB-INF/views/project/c9.jsp"%>
				</div>
				<div class="modal-footer" style="text-align: left">
					<button id="closeModal" type="button" class="btn btn-default"
						data-dismiss="modal">닫기</button>
					<script>
						$(document).ready(function() {
							$('#closeModal').click(function() {
								location.reload();
							});
						})
					</script>
					<button class="btn btn-default pull-right" id="btn-upload2">사진
						등록하기</button>


				</div>
			</div>
		</div>
	</div>






	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseOne" style="text-decoration: none;"><img src="<%=request.getContextPath() %>/resources/img/controls.png"><span>&nbsp;&nbsp;&nbsp;프로젝트
					관리</span></a>
			</h4>
		</div>
		<div id="collapseOne" class="panel-collapse collapse">
			<div class="panel-body">
				<table class="table"
					style="margin-bottom: 0px; border-top: 0px solid blue;">
					<tr>
						<td><a style="text-decoration: none;" href="#">개괄</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/project/pmNoticeList">프로젝트
								공지사항</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
						 href="#" onClick="window.open('http://192.168.202.194:8181/pas/project/pmChat?name=${loginUser.mem_Name}','_blank',
						 'resizable=no,width=350,height=450,top=400,left=1400')">채팅하기</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/project/pmBoardList">프로젝트
								게시판</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/project/billing">돈관리</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a style="text-decoration: none;" data-toggle="collapse"
					data-parent="#accordion" href="#collapseTwo"><img src="<%=request.getContextPath() %>/resources/img/work.png"><span>&nbsp;&nbsp;&nbsp;작업 공간</span></a>
			</h4>
		</div>
		<div id="collapseTwo" class="panel-collapse collapse">
			<div class="panel-body">
				<table class="table" style="margin-bottom: 0px;">
					<tr>
						<td><a href="<%=request.getContextPath()%>/project/work/workList">파일리스트</a>
							<span class="label label-success">New</span></td>
					</tr>
					<tr>
						<td><a href="<%=request.getContextPath()%>/project/work/createWorkForm">파일 생성</a></td>
					</tr>
					<%-- <tr>
						<td><a href="<%=request.getContextPath()%>/project/work/loadFile">들어가기</a></td>
					</tr>
					<tr>
						<td><a href="<%=request.getContextPath()%>/work/"></a></td>
					</tr>
					<tr>
						<td><a
							href="<%=request.getContextPath()%>/work/pmMemberInvite">Tex</a></td>
					</tr> --%>
				</table>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a style="text-decoration: none;" data-toggle="collapse"
					data-parent="#accordion" href="#collapseThree"><img src="<%=request.getContextPath() %>/resources/img/calendar.png"><span>&nbsp;&nbsp;&nbsp;일정 관리</span></a>
			</h4>
		</div>
		<div id="collapseThree" class="panel-collapse collapse">
			<div class="panel-body">
				<table class="table" style="margin-bottom: 0px; border-top: 0px;">
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/project/pmCalendar">월별 일정 관리</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"

							href="<%=request.getContextPath()%>/project/pmGantChart">간트 차트</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"	href="<%=request.getContextPath()%>/schedule/weeklyChecklist">주간 체크 리스트</a></td>

					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a style="text-decoration: none;" data-toggle="collapse"
					data-parent="#accordion" href="#collapseFour"><img src="<%=request.getContextPath() %>/resources/img/users.png"><span>&nbsp;&nbsp;&nbsp;팀원 관리</span></a>
			</h4>
		</div>
		<div id="collapseFour" class="panel-collapse collapse">
			<div class="panel-body">
				<table class="table" style="margin-bottom: 0px;">
					<tr>
						<td><a style="text-decoration: none;" href="<%=request.getContextPath()%>/project/pmMemberList">팀원 리스트</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/project/pmMemberInvite">팀원
								초대</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;" href="#">프로젝트 참가</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a style="text-decoration: none;"
					href="<%=request.getContextPath()%>/project/AccountBoardList"><img src="<%=request.getContextPath() %>/resources/img/cash.png"><span>&nbsp;&nbsp;&nbsp;프로젝트 회계</span></a>
			</h4>
		</div>
		<!-- <div id="collapseFour" class="panel-collapse collapse">
			<div class="panel-body">
				<table class="table" style="margin-bottom: 0px;">
					<tr>
						<td><span class="glyphicon glyphicon-usd"></span><a
							href="http://www.jquery2dotnet.com">Sales</a></td>
					</tr>
					<tr>
						<td><span class="glyphicon glyphicon-user"></span><a
							href="http://www.jquery2dotnet.com">Customers</a></td>
					</tr>
					<tr>
						<td><span class="glyphicon glyphicon-tasks"></span><a
							href="http://www.jquery2dotnet.com">Products</a></td>
					</tr>
					<tr>
						<td><span class="glyphicon glyphicon-shopping-cart"></span><a
							href="http://www.jquery2dotnet.com">Shopping Cart</a></td>
					</tr>
				</table>
			</div>
		</div> -->
	</div>
</div>
<hr style="border: 1px solid; border-color: #ddd">
<div class="panel-group" id="accordion">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a style="text-decoration: none;" data-toggle="collapse"
					data-parent="#accordion" href="#collapseSix"><img src="<%=request.getContextPath() %>/resources/img/comments.png"><span>&nbsp;&nbsp;&nbsp;전체 게시판</span></a>
			</h4>
		</div>
		<div id="collapseSix" class="panel-collapse collapse">
			<div class="panel-body">
				<table class="table" style="margin-bottom: 0px;">
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/notice/totalNoticeList">전체
								공지사항</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/SkillSharing/SkillSharingBoardList">기술공유
								게시판</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/freeBoard/freeBoardList">커뮤니티</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/qna/QnAList">QnA 게시판</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<hr style="border: 1px solid; border-color: #ddd">
<!-- 		</div> -->
<div class="panel-group" id="accordion">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a style="text-decoration: none;" data-toggle="collapse"
					data-parent="#accordion" href="#collapseSeven"><img src="<%=request.getContextPath() %>/resources/img/color.png"><span>&nbsp;&nbsp;&nbsp;색깔 바꾸기</span></a>
			</h4>
		</div>
		<div id="collapseSeven" class="panel-collapse collapse">
			<div class="panel-body">
				<table class="table" style="margin-bottom: 0px;">
					<tr>
						<td>
							<div class="row" id="colors" style="margin: auto;">
								<div class="cc"  style="background-color:#3c5574 "></div>
								<div class="cc"  style="background-color:#303030 "></div>
								<div class="cc"  style="background-color:#717171 "></div>
								<div class="cc"  style="background-color:#786153 "></div>
								<div class="cc"  style="background-color:#ad9f84 "></div>
								<div class="cc"  style="background-color:#d55c53 "></div>
								<div class="cc"  style="background-color:#974140 "></div>
								<div class="cc"  style="background-color:#98b45d "></div>
								<div class="cc"  style="background-color:#58aa48 "></div>
								<div class="cc"  style="background-color:#24945a "></div>
								<div class="cc"  style="background-color:#2b9e99 "></div>
								<div class="cc"  style="background-color:#38716b "></div>
								<div class="cc"  style="background-color:#58adcc "></div>
								<div class="cc"  style="background-color:#6093cc "></div>
								<div class="cc"  style="background-color:#3978bf "></div>
								<div class="cc"  style="background-color:#39699a "></div>
								<div class="cc"  style="background-color:#21497d "></div>
								<div class="cc"  style="background-color:#7278b2 "></div>
								<div class="cc"  style="background-color:#675d91 "></div>
								<div class="cc"  style="background-color:#a36bac "></div>
								<div class="cc"  style="background-color:#ce7da6 "></div>
								<div class="cc"  style="background-color:#720001 "></div>
								<div class="cc"  style="background-color:#297000 "></div>
								<div class="cc"  style="background-color:#4a1059 "></div>
							</div>
					<script>
					$(function(){
						$('.cc').click(function(){
							var $color = $(this).css('background-color');
							var a = location.href;
							if(a.indexOf("otherProject")==-1){
								$('#myProjectList').animate({
									backgroundColor:$color
								},'slow');
							}/* else if(a.indexOf("otherProject")!=-1){
								$('#otherProjectList').css({
									backgroundColor : $color,
									'color':'white'
								});
							} */
						
						$('#navbar').animate({
							backgroundColor: $color
						},'slow');
						$('#navbar2').animate({
							backgroundColor: $color
						},'slow');
						$('#myProjectList').animate({
							backgroundColor: $color
						},'slow');
						$('#otherProjectList').animate({
							backgroundColor: $color,
							'filter':'brightness(125%)'
						},'slow');
						$('#navbar2').animate({
							boderBottomColor : $color
						},'slow');
		
						$('#droptoggle').click(function(){
							$(this).css({
								backgroundColor:$color
							})
						})
						$('#droptoggle').animate({
							backgroundColor:$color
						},'slow');
						
						$('#alarmMenu').animate({
							backgroundColor : $color
						},'slow');
						$('#alarmMenu').click(function(){
							$(this).css({
								backgroundColor:$color
							})
						})
				
						var b = $color.split("(")[1].split(")")[0];
						b = b.split(",");
						
						var hex = b.map(function(x){
							x = parseInt(x).toString(16);
							return(x.length==1)?"0"+x:x;
						})
						hex = hex.join("");
						
							$.ajax({
								url : '/pas/project/color',
								type: 'post',
								data : hex,
								datatype : 'json',
								success : function(result){
									
								},
								error : function(result){
									alert('실패');
								}
							})
							
							
						})
					})
					</script>
						</td>

					</tr>
					<%-- <tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/SkillSharing/SkillSharingBoardList">기술공유
								게시판</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/freeBoard/freeBoardList">커뮤니티</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/qna/QnAList">QnA 게시판</a></td>
					</tr> --%>
				</table>
			</div>
		</div>
	</div>


	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a id="collapseEight" style="text-decoration: none;" href="#collapseEight"><img src="<%=request.getContextPath() %>/resources/img/resize.png"><span>&nbsp;&nbsp;&nbsp;리사이징</span></a>
			</h4>
		</div>
		<!-- <div id="collapseSeven" class="panel-collapse collapse">
			<div class="panel-body">
			</div>
		</div> -->
	</div>
</div>
<script>


/* 	$('#collapseEight').toggle(function(){			
		$('#content').removeClass('col-md-10').addClass('col-md-11');
		$('#submenu').removeClass('col-md-2').addClass('col-md-1');
	})
	
	 */


	function decrease(){
		$('#content').removeClass('col-md-10').addClass('col-md-11');
		$('#submenu').removeClass('col-md-2').addClass('col-md-1');
		$('.panel-title>a>span').hide();
		$('.panel-title').css('text-align','center');
		$('#proj_Img').css('height','80px');
		$('#collapseEight').one("click",increase);
		
	}
	/* k-spreadsheet-pane k-top k-left */
	function increase(){
		$('#content').removeClass('col-md-11').addClass('col-md-10');
		$('#submenu').removeClass('col-md-1').addClass('col-md-2');
		$('.panel-title>a>span').show();
		$('.panel-title').css({
			'text-align':'left'
		})
		$('#proj_Img').css('height','130px');
		$('#collapseEight').one("click",decrease);

	}
$(function(){
	$('#collapseEight').one('click',decrease);
	

})
</script>

<!-- 	</div>
</div> -->

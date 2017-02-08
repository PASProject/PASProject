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
	padding-left: 15px
}

.panel-body .table {
	margin-bottom: 0px;
}
</style>
</head>
<!-- <div class="container">
	<div class="row"> -->
<!-- 		<div class="col-sm-3 col-md-3"> -->
<div class="panel-group" id="accordion">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseOne" style="text-decoration: none;"><img
					style="width: 15%"
					src="<%=request.getContextPath()%>/resources/img/manager.png">&nbsp;&nbsp;프로젝트
					관리</a>
			</h4>
		</div>
		<div id="collapseOne" class="panel-collapse collapse in">
			<div class="panel-body">
				<table class="table"
					style="margin-bottom: 0px; border-top: 0px solid blue;">
					<tr>
						<td><a style="text-decoration: none;" href="#">개괄</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/project/pmNoticeList">프로젝트 공지사항</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;" href="#">채팅하기</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/project/pmBoardList">프로젝트
								게시판</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a style="text-decoration: none;" data-toggle="collapse"
					data-parent="#accordion" href="#collapseTwo"><img
					style="width: 15%"
					src="<%=request.getContextPath()%>/resources/img/file.png">&nbsp;산출물
					관리</a>
			</h4>
		</div>
		<!-- <div id="collapseTwo" class="panel-collapse collapse">
			<div class="panel-body">
				<table class="table" style="margin-bottom: 0px;">
					<tr>
						<td><a href="http://www.jquery2dotnet.com">Orders</a> <span
							class="label label-success">$ 320</span></td>
					</tr>
					<tr>
						<td><a href="http://www.jquery2dotnet.com">Invoices</a></td>
					</tr>
					<tr>
						<td><a href="http://www.jquery2dotnet.com">Shipments</a></td>
					</tr>
					<tr>
						<td><a href="http://www.jquery2dotnet.com">Tex</a></td>
					</tr>
				</table>
			</div>
		</div> -->
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a style="text-decoration: none;" data-toggle="collapse"
					data-parent="#accordion" href="#collapseThree"><img
					style="width: 15%"
					src="<%=request.getContextPath()%>/resources/img/calendar.png">&nbsp;일정
					관리</a>
			</h4>
		</div>
		<div id="collapseThree" class="panel-collapse collapse">
			<div class="panel-body">
				<table class="table" style="margin-bottom: 0px; border-top: 0px;">
					<tr>
						<td><a style="text-decoration: none;"
							href="http://www.jquery2dotnet.com">월별 일정 관리</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							href="http://www.jquery2dotnet.com">주간 체크 리스트</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a style="text-decoration: none;" data-toggle="collapse"
					data-parent="#accordion" href="#collapseFour"><img
					style="width: 15%"
					src="<%=request.getContextPath()%>/resources/img/users.png">&nbsp;팀원
					관리</a>
			</h4>
		</div>
		<div id="collapseFour" class="panel-collapse collapse">
			<div class="panel-body">
				<table class="table" style="margin-bottom: 0px;">
					<tr>
						<td><a style="text-decoration: none;" href="#">팀원 리스트</a></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;" href="#">팀원 초대</a></td>
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
				<a style="text-decoration: none;" href="<%=request.getContextPath()%>/project/AccountBoardList"><img
					style="width: 15%"
					src="<%=request.getContextPath()%>/resources/img/won.png">&nbsp;프로젝트
					회계</a>
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
					data-parent="#accordion" href="#collapseSix"><img
					style="width: 15%"
					src="<%=request.getContextPath()%>/resources/img/chat.png">&nbsp;전체
					게시판</a>
			</h4>
		</div>
		<div id="collapseSix" class="panel-collapse collapse">
			<div class="panel-body">
				<table class="table" style="margin-bottom: 0px;">
					<tr>
						<td><a style="text-decoration: none;"
							href="<%=request.getContextPath()%>/notice/totalNoticeList">전체 공지사항</a></td>
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
<!-- 		</div> -->
<div>
	<div class="well">
		<h3>여기다가는 뭐 쓸까요?</h3>
	</div>
</div>
<!-- 	</div>
</div> -->
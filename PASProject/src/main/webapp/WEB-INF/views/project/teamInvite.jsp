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
<form>
	<div class="col-md-10">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			프로젝트 팀원 초대<small>dfef </small>
		</h2>
		<table class="table table-hover">
			<tr>
				<td>프로필 사진</td>
				<td>이메일</td>
				<td>이름</td>
				<td>시각</td>
				<td>상태여부</td>
			</tr>
			<c:forEach var="InviteList" items="${InviteList }">
				<tr>
					<td><img src="<%=request.getContextPath() %>/resources/upload/${InviteList.mem_Img}"></td>
					<td>${InviteList.mem_Email }</td>
					<td>${InviteList.mem_Name }</td>
					<td>${InviteList.invite_Time }</td>
					<td>미수락중 / <input type="button" value="초대취소" onclick="deleteBtn(this.form)"></td>
				</tr>
				<input type="hidden" name="inviteMem_Email" value="${InviteList.mem_Email }">
			</c:forEach>
		</table>

		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#invite">초대</button>
		
		<div class="modal fade" id="invite" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">팀원 초대</h4>
					</div>
					<div class="modal-body">
			<%-- 		<jsp:include page="invite.jsp"></jsp:include> --%>
					<%@ include file="invite.jsp"%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="inviteInsert">초대</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" id="close">Close</button>
					</div>
				</div>

			</div>
		</div>
	</div>
	</form>
	
	<script>
	$("#close").click(function(){
		
	    $('#zone').text("");

	})
	
	
	function deleteBtn(form){
		
		form.action="deleteInvite";
		form.method="post";
		form.submit();
		
	}
	</script>
</body>
</html>
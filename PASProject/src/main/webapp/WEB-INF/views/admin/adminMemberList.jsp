<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<h3>
		운영자 회원 관리<input type="button" value="EXIT" onclick="go_Home()">
	</h3>
	<a></a>
	<form>
		이메일 : <input type="text" name="mem_Email" />&nbsp; <input
			type="button" onclick="searchEmail(this.form);" value="이메일검색">
	</form>


	<table style="width: 83%">
		<tr>
			<th>회원이메일</th>
			<th>회원이름</th>
			<th>회원전화번호</th>
			<th>가입일자</th>
			<th>회원탈퇴여부</th>
		</tr>
		<c:forEach items="${memberList }" var="memberVo"
			begin="${paging.beginNo}" end="${paging.endNo}" varStatus="status">
			<tr>
				<td><a href="#" data-toggle="modal"
					onclick="goModal('${memberVo.mem_Email}','${status.index}')" 
					data-target="#${status.index }" data-keyboard="false"
					data-backdrop="static">${memberVo.mem_Email} </a> 
					
					<!-- Modal -->
					<div class="modal fade" id="${status.index }" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
								${memberVo.mem_Name } 님의  참여 프로젝트
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title"></h4>
								</div>
								<div class="modal-body" id="${status.index}body"></div> 
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div></td>
				<td>${memberVo.mem_Name}</td>
				<td>${memberVo.mem_Phone }</td>
				<td>${memberVo.mem_Join_Date }</td>
				<td>${memberVo.quit_Check }</td>
				<td><input type="button" value="제명"
					onclick="go_delete('${memberVo.mem_Email}')"></td>
			</tr>




		</c:forEach>

		<tr>
			<td colspan="5" align="right"><c:if
					test="${paging.finalPageNo>0}">
					<c:set value="${paging.prevPageNo}" var="prevPageNo" />
					<c:set value="${paging.finalPageNo}" var="finalPageNo" />

					<c:if test="${paging.pageNo>prevPageNo}">
						<a href="SkillSharingList?page=${prevPageNo}">[이전]</a>
					</c:if>
					<c:forEach begin="1" end="${paging.finalPageNo}" var="i"
						varStatus="status">
						<a href="SkillSharingList?page=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${paging.pageNo<finalPageNo}">
						<a href="SkillSharingList?page=${finalPageNo}">[다음]</a>
					</c:if>
				</c:if></td>
		</tr>
	</table>

	<script>
	function go_Home(){
			location.href = "<%=request.getContextPath()%>/index";

	}
	
	function go_delete(mem_Email) {		
// 		$("input[name=mem_Email]").val();
		location.href = "memberDelete?mem_Email="+mem_Email;
	}
	
	function searchEmail(form) {
		form.action="searchMemEmail";
		form.method="get";
		form.target="_self";
		form.submit();
	};
	function goModal(mem_Email,index){
		var data = {'mem_Email':mem_Email};
		$.ajax({
			url:'mdlValue2',
			data:JSON.stringify(data),
			contentType:'application/json',
			dataType:'json',
			type:'post',
			success:function(data){
				var tt="";
				if(data==null || data==""){
					tt+='<div> 참여 프로젝트가 없습니다.</div>'
				}
				$.each(data,function(i){
					tt += '<div> 프로젝트번호 : '+data[i].proj_Num+'&nbsp&nbsp&nbsp&nbsp프로젝트이름 : '+data[i].proj_Name+'<hr color=\'red\'></div>'
				})
				$("#"+index+"body").empty();
				$("#"+index+"body").append(tt);
				
			}
		});
	}
	
	
	
	
	
	
	</script>
</body>

</html>
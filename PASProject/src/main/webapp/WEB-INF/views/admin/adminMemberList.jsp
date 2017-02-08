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
</style>
</head>
<body>
	<h1>운영자 회원 관리<input type="button" value="EXIT" onclick="go_Home()"></h1>
	<a></a>
	<form>
		이메일 : <input type="text" name="mem_Email" />&nbsp; <input type="button"
			onclick="searchTitle(this.form);" value="검색">
	</form>
	

	<table style="width: 83%">
		<tr>
			<th>회원이메일</th>
			<th>회원비밀번호</th>
			<th>회원이름</th>
			<th>회원전화번호</th>
			<th>가입일자</th>
			<th>회원탈퇴여부</th>
		</tr>
		<c:forEach items="${memberList }" var="memberVo"
			begin="${paging.beginNo}" end="${paging.endNo}">
			<tr>
				<td>${memberVo.mem_Email}</td>
				<td>${memberVo.mem_Pass}</td>
				<td>${memberVo.mem_Name}</td>
				<td>${memberVo.mem_Phone }</td>
				<td>${memberVo.mem_Join_Date }</td>
				<td>${memberVo.quit_Check } </td>
				<td><input type="button" value="제명" onclick="go_delete('${memberVo.mem_Email}')"></td>
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
	
	function searchTitle(form) {
		form.action="searchMemEmail";
		form.method="get";
		form.target="_self";
		form.submit();
	};
	</script>
</body>

</html>
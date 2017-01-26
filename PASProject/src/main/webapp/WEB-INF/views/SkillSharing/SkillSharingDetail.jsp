<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<h1>SkillSharingDetail</h1>
	<form name="frm" method="post">
		<input type="hidden" name="ssb_Article_Num" value="${skillSharingBoardVo.ssb_Article_Num}">
		<table id="orderList">
			<tr>
				<th width="20%">글번호</th>
				<td>${skillSharingBoardVo.ssb_Article_Num}</td>
			</tr>
			<tr>
				<th width="20%">제목</th>
				<td>${skillSharingBoardVo.ssb_Title}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><fmt:formatDate value="${skillSharingBoardVo.ssb_wt_date}" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${skillSharingBoardVo.ssb_Content}</td>
			</tr>
		</table>
		<input type="button" value="수정" onclick="go_update()">
		<input type="button" value="삭제" onclick="go_delete()">
		<input type="button"  value="목록" onClick="go_list()">
	</form>
	<script>
		function go_list(){
			location.href="SkillSharingList"
		}
		function go_update(){
			location.href="SkillSharingUpdate?ssb_Article_Num=${skillSharingBoardVo.ssb_Article_Num}";
		}
		function go_delete(){
			frm.method = "post";
			frm.action ="SkillSharingDelete";
			frm.submit();
		}
	</script>
</body>
</html>
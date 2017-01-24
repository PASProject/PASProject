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

<h1>FreeBoard</h1>
	<form name="frm" method="post">
		<input type="hidden" name="frb_Article_Num" value="${freeBoardVo.frb_Article_Num}">
		<table id="orderList">
			<tr>
				<th width="20%">글번호</th>
				<td>${freeBoardVo.frb_Article_Num}</td>
			</tr>
			<tr>
				<th width="20%">제목</th>
				<td>${freeBoardVo.frb_Title}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><fmt:formatDate value="${freeBoardVo.frb_Wt_Date}" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${freeBoardVo.frb_Content}</td>
			</tr>
		</table>
		<input type="button" value="수정" onclick="go_update()">
		<input type="button" value="삭제" onclick="go_delete()">
		<input type="button"  value="목록" onClick="go_list()">
	</form>
	<script>
		function go_list(){
			location.href="freeBoardList"
		}
		function go_update(){
			location.href="freeBoardUpdate?frb_Article_Num=${freeBoardVo.frb_Article_Num}";
		}
		function go_delete(){
			frm.method = "post";
			frm.action ="freeBoardDelete";
			frm.submit();
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>totalboard detail</title>
</head>
<body>
	<div style="margin: auto; width: 1300px">
		<h1>TotalBoardDetail</h1>
		<br>
		<form name="frm" method="post">
			<input type="hidden" name="ttnotice_Num"
				value="&{param.ttnotice_Num}">
			<table>
				<tr>
					<td width="20%">글번호</td>
					<td>${TotalNoticeVo.ttnotice_Num}</td>
				</tr>
				<tr>
					<td width="20%">제목</td>
					<td>${ TotalNoticeVo.ttnotice_Title}</td>
				</tr>
				<tr>
					<td width="20%">내용</td>
					<td>${TotalNoticeVo.ttnotice_Content }</td>
				</tr>
			</table>
			<input type="button" value="수정" onClick="totalNotice_update()">
			<input type="button" value="삭제" onClick="totalNotice_delete()">
			<input type="button" value="목록" onClick="totalNotice_list()">
		</form>
	</div>
</body>
</html>
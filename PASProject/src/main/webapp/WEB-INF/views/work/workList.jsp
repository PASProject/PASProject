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
	<div class="col-md-10" id="content">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">파일 리스트</h2>
		
		<div>
		
		</div>
		<label for="fileList">30만원을 위하여</label>
		<table class="table table-hover" id="fileList" style="border-bottom: 1px solid #ddd;">

			<tr>
				<td class="col-md-1"><img
					src="<%=request.getContextPath()%>/resources/img/excel.png"></td>
				<td class="col-md-4" style="padding:4px;"><a href="#">동석이와 형기의 즐거운 엑셀채팅</a>
				<br>마지막 업데이트 : </td>
				<td class="col-md-4 text-right"><a href="#">미리보기</a> |  <a href="#">추출</a>  | <a href="#">삭제</a> </td>

			</tr>
			<tr>
				<td ><img
					src="<%=request.getContextPath()%>/resources/img/ppt.png"></td>
				<td></td>
				<td></td>
				
			</tr>
			<tr>
				<td><img
					src="<%=request.getContextPath()%>/resources/img/doc.png"></td>
				<td></td>
				<td></td>
				
			</tr>

		</table>
	</div>
</body>
</html>
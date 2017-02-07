<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
	<!-- <div class="col-md-10"> -->
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			Admin<small>Notice</small>
		</h2>
		<fieldset>
			<table class="table table-hover">
				<tr class="text-center">
				
					<th class="col-md-1" style="text-align: center">답변여부</th>
					<th class="col-md-1" style="text-align: center">번호</th>
					<th class="col-md-4" style="text-align: center">제목</th>
					<th class="col-md-2" style="text-align: center">작성자</th>
					<th class="col-md-1" style="text-align: center">작성일</th>
					<th class="col-md-1" style="text-align: center">조회수</th>
				</tr>
				
		<tr>
			
				<td style ="text-align: center">${noticeList.ttnotice_Num}</td>
				<td>${noticeList.ttnotice_Title}</td>
				<td>${noticeList.ttnotice_Content }</td>
				<td style="text-align: center"></td>
	
		</tr>

</table>


		</fieldset>
<!-- </div> -->
</body>
</html>

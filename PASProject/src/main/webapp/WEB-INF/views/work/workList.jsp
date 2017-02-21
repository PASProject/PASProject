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
		<table class="table table-hover" id="fileList" style="border-bottom: 1px solid #ddd; ">
		<c:if test="${empty documentList}">
			<tr>
				<td>생성한 파일이 없습니다.    <input type="button" class="btn btn-default" id="goCreateDocumentBtn" value="생성하기"></td>
			</tr>
		</c:if>
		<c:forEach items="${documentList}" var = "documentVo">
			<tr>
				<td class="col-md-1"><img
						src="<%=request.getContextPath()%>/resources/img/${documentVo.doc_Img}">
				</td>
				<td class="col-md-4" style="padding:4px;"><a href="<%=request.getContextPath()%>/project/work/selectDocument?doc_Num=${documentVo.doc_Num}&doc_Kind=${documentVo.doc_Kind}" >${documentVo.doc_Name}</a><br>생성 일자 : ${documentVo.doc_Wt_Date}<br> 생성자 : ${documentVo.mem_Name } </td>
				<td class="col-md-4 text-right"><a href="#">미리보기</a> |  <a href="#">추출</a>  | <a href="<%=request.getContextPath()%>/project/work/deleteDocument?doc_Num=${documentVo.doc_Num}">삭제</a> </td>
			</tr>
		</c:forEach>
		</table>
	</div>
	<script>
		$(function(){
			$('#goCreateDocumentBtn').on('click',function(){
				location.href = '/pas/project/work/createWorkForm';
			});
			
		});
	</script>
</body>
</html>

<%-- <tr>
				<td class="col-md-1"><img
					src="<%=request.getContextPath()%>/resources/img/excel.png"></td>
				<td class="col-md-4" style="padding:4px;"><a href="#">동석이와 형기의 즐거운 엑셀채팅</a>
				
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
			--%>
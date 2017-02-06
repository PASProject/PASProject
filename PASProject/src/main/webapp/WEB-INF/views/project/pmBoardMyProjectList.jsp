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
<style>
table tr td{
padding: 10px;
}

</style>
</head>

<body>
	<div class="col-md-10">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			My Project List <small> &nbsp; 내가 쓴 글</small>
		</h2>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			 <button type="submit" onclick="pmBoardList()">목록으로</button>
			 <br><br>
			<fieldset>
			<form name="frm" method="post" action="pmBoardInsert">
		<input type="hidden" name="pb_Content" value="${ProjectBoardVo.pb_Content}">
			
				
				<table class="col-md-10" style="border: 2px solid #ddd">
				<tr>
				<td colspan=2>
				
				</td>
				</tr>
					<tr>
						<td class="col-md-1">이경희 BA</td>
						<td class="col-md-7">
						<textarea rows="7" cols="100" name="pb_Content"></textarea></td>
					</tr>
					<tr>
						<td></td>
						<td style="text-align:right">
							<button class="btn btn-default " type="submit">글올리기</button>
						</td>
					</tr>
					
				</table>
				<br>
				<br>
				<br>
				</form>
				<!-- boardList -->
					<c:forEach var="pbList" items="${pbList}" varStatus="status">
					<br>
					<br>
					<table class="col-md-10" style="border: 2px solid #ddd">
					<tr>
						<td class="col-md-1">이경희 BA</td>
						<td class="col-md-7">
						게시물 번호 : ${pbList.pb_Article_Num}
						<textarea rows="7" cols="100" name="pb_Content" readonly> ${pbList.pb_Content}</textarea>
						<br><br>
						
				<!-- 댓글 -->
				<!-- <form  method="post" method="post" action = "insertProjectBoardReply"> -->
					 <form class="anser-write" method="post" action="insertProjectBoardReply">	
						<textarea rows="1" cols="80" name="pb_Reply_Content"></textarea>
						
						<input type="submit" class="btn btn-default" value="댓글달기"/> 

				</form>	
						<br>
					
						</td>
					</tr>
				
			<tr>
					<td>
						<input type="submit" value="글 수정" onClick=""/>
					</td>
					<td>
						<input type="submit" value="삭  제" onClick="deleteProjectBoard(${pbList.pb_Article_Num})"/>
					</td>
			</tr>
		
					</table>
					<br>
					</c:forEach>
					
			</fieldset>
			<script>
				
				function projectBoardList(){
					location.href="pmBoardList";
				}
				
				 function deleteProjectBoard(pb_Article_Num){
				location.href = "deleteProjectBoard?pb_Article_Num="+pb_Article_Num;
					
				}
			
			</script>
		

	</div>
</body>
</html>

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
			QnA <small>글 읽기</small>
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
			
			 <button type="submit" onclick="go_myProjectList()">내가쓴글 보기</button>
			 <br><br>
			<fieldset>
			<form name="frm" method="post" action="projectBoardInsert">
			<input type="hidden" name="pb_Content" value="${ProjectBoardVo.pb_Content}">
			
				
				<table class="col-md-10" style="border: 2px solid #ddd">
				<tr>
				<td colspan=2>
				&nbsp;
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
					<c:forEach var="pbList" items="${pbList}" >
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
						<textarea rows="1" cols="90" name="pb_Reply_Content"></textarea>
						
						<input type="submit" class="btn btn-default" value="답변하기"/> 
<!-- 					<button class="btn btn-default " type="button">등록</button> -->
				</form>	
						<br>
						<br>
						</td>
					</tr>
					</table>
					<br>
					
					</c:forEach>
			</fieldset>
			<script>
				$(".anser-write input{type=submit}").click(addAnswer);
				function addAnswer(e){
					e.preventDefault();
					console.log("click!");
					
					var queryString = $(".anser-write").serialize();
					console.log("query : " + queryString);
				}
				
				function go_myProjectList(){
					location.href="myProjectList";
				}
				
// 				 function projectBordInsert(){
// 					frm.method = "post";
// 					frm.action ="projectBordInsert";
// 					frm.submit();
					
// 				}
			
			</script>
		

	</div>
</body>
</html>

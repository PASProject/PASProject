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


			<form name="frm" method="post" action="projectBoardList">
				<table class="col-md-10" style="border: 2px solid #ddd">
				<tr>
				<td colspan=2>
				&nbsp;
				</td>
				</tr>
					<tr>
			
						<td class="col-md-1">이경희 BA</td>
						<td class="col-md-7"><textarea rows="7" cols="100"
								name="pb_Content">  </textarea>
						</td>
					</tr>
					<tr>
						<td></td>
						<td style="text-align:right">
							<button class="btn btn-default " type="button"
								onclick="projectBordInsert()">글올리기</button>
						</td>
					</tr>
				</table>
				
				

			</form>
			<script>
				
				function projectBordInsert(){
					frm.method = "post";
					frm.action ="projectBordInsert";
					frm.submit();
					
				}
			
			
			</script>
		

	</div>
</body>
</html>

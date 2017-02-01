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
	<div class="col-md-10">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			QnA <small>글 읽기</small>
		</h2>

		<fieldset>
			<form name="frm" method="post" action="">
				<input type="hidden" name="qb_Article_Num"
					value="${param.qb_Article_Num }">


				<table class="table" style="border-top: 2px;">
					<tr style="border-top: 2px solid #ddd">
						<td class="col-md-9"><h3
								style="margin-top: 10px; margin-bottom: 10px">
								<b>${qnaBoardVo.qb_Title}</b>
							</h3></td>
						<td class="col-md-1"
							style="vertical-align: middle; text-align: right"><span
							style="font-size: 13px">조회수</span>&nbsp; <span
							style="font-size: 11px;"> ${qnaBoardVo.qb_Inq_Count }</span></td>
						<td class="col-md-2"
							style="vertical-align: middle; text-align: right"><span
							style="font-size: 11px"><fmt:formatDate
									value="${qnaBoardVo.qb_Wt_Date}" pattern="yyyy.MM.dd hh:mm:ss" /></span></td>
					</tr>
					<tr>
						<td colspan="3">${qnaBoardVo.mem_Email }</td>
					</tr>
					<tr>
						<td colspan="3">${qnaBoardVo.qb_Content}<br>
						</td>


					</tr>
					<tr style="border-bottom: 2px solid #ddd">
						<td class="text-right" colspan="3"
							style="border-top: 0px solid blue;">
							<button class="btn btn-default text-right" type="button"
								onclick="go_qnalist()">목록</button>
						</td>
					</tr>
					<tr>
						<td style="padding-top: 20px;">댓글'{개수}'</td>
					</tr>
					<tr>
						<td>댓글들어가는 곳</td>
					</tr>
					<tr>
						<td>${qnaBoardReplyVo.qb_Reply_Content}</td>
					</tr>


				</table>


				<input type="button" value="수정" onClick="go_qnaupdate()"> <input
					type="button" value="삭제" onClick="go_delete()">
			</form>
			
			<form name="form" method="post" action="">
				<textarea rows="2" cols="50" name="qnaReply"> </textarea>
				<input type="submit" value="댓글등록" onClick="InsertQnAReply()">

			</form>




			<script>
				function go_qnalist() {
					location.href = "QnAList"

				}
				function go_qnaupdate() {
					location.href = "QnAUpdate?qb_Article_Num=${qnaBoardVo.qb_Article_Num}";
				}

				function go_delete() {
					frm.method = "post"
					frm.action = "QnADelete";
					frm.submit();
				}
				function InsertQnAReply() {
					form.method = "post"
					form.action = "InsertQnAReply";
					form.submit();
				}
			</script>
		</fieldset>





	</div>

</body>
</html>













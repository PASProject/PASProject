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
<!-- <script language="javascript">
		var i = 0
		window.document.onkeydown = protectKey;

		function protectKey() {
			//새로고침을 막는 스크립트.. F5 번키..
			if (event.keyCode == 116) {
				event.keyCode = 0;
				return false;
			}
			//CTRL + N 즉 새로 고침을 막는 스크립트....
			else if ((event.keyCode == 78) && (event.ctrlKey == true)) {
				event.keyCode = 0;
				return false;
			}
		}
	</script> -->
	<c:if test="${like == 'yes' }">
		<script type="text/javascript">
			alert("추천완료!");
		</script>
	</c:if>
	<c:if test="${like == 'no' }">
		<script type="text/javascript">
			alert("이미 추천한 게시글 입니다.");
		</script>
	</c:if>
	<c:if test="${delete == 'no' }">
		<script type="text/javascript">
			alert("작성자만 삭제할 수 있습니다.");
		</script>
	</c:if>
	<c:if test="${modify == 'yes' }">
		<script type="text/javascript">
			alert("수정이 완료 되었습니다.");
		</script>
	</c:if>
	<c:if test="${modify == 'no' }">
		<script type="text/javascript">
			alert("작성자만 수정할 수 있습니다.");
		</script>
	</c:if>

	<!-- 본문! -->
	<div class="col-md-10" id="content">
	<input type="hidden" name="frb_Article_Num" id="frb_Article_Num"
							value="${freeBoardVo.frb_Article_Num}">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">FreeBoard</h2>
		<table class="table" style="border-top: 2px;">
			<tr style="border-top: 2px solid #ddd">
				<td class="col-md-7"><h4
						style="margin-top: 5px; margin-bottom: 5px">
						<b>${freeBoardVo.frb_Title}</b>
					</h4></td>
				<td class="col-md-1"
					style="vertical-align: middle; "> <span
					style="font-size: 11px;">${freeBoardVo.mem_Email }</span></td>
				<td class="col-md-1"
					style="vertical-align: middle; "><span
					style="font-size: 13px">조회수</span>&nbsp; <span
					style="font-size: 11px;"> ${freeBoardVo.frb_Inq_Count }</span></td>
				<td class="col-md-2"
					style="vertical-align: middle; "><span
					style="font-size: 11px"><fmt:formatDate
							value="${freeBoardVo.frb_Wt_Date}" pattern="yyyy.MM.dd hh:mm:ss" /></span></td>

			</tr>


			<tr>
				<td colspan="10" style="padding: 40px 0px 50px 0px; ">${freeBoardVo.frb_Content}<br></td>
				
			</tr>
		</table>

		<div>
			<%-- <form name="frm" method="post">
						
						<fieldset>
							<legend>${freeBoardVo.frb_Title}
								<span>(${freeBoardVo.frb_Article_Num})
									(${freeBoardVo.frb_Wt_Date})</span>
							</legend>
							<span>${freeBoardVo.frb_Content}</span>
							<legend></legend>
							<span>${freeBoardVo.frb_Tag}</span>
						</fieldset>
					</form> --%>
					<span style="text-align: left;">${freeBoardVo.frb_Tag}</span>
			<div align="right">
				<input type="button" class="btn btn-default" value="수정" onclick="go_update()"> 
				<input type="button" class="btn btn-default" value="삭제" onclick="go_delete()"> 
				<input type="button" class="btn btn-default" value="목록" onClick="go_list()"> 
				<input type="button" class="btn btn-default" value="추천!" onClick="go_like()">
			</div>
			<br>
			<legend></legend>
			<!-- 여기서부터 댓글 -->
			<div id="reply" style="overflow:hidden;"></div>
			<textarea rows="5" cols="127" id="frb_Reply_Content"></textarea>
		</div>
		<div align="right">
		<input type="button" class="btn btn-default" value="등록" id="replyBtn">
		</div>
	</div>



	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var frb_Article_Num = $('#frb_Article_Num').val();
							var data = {
								'frb_Article_Num' : frb_Article_Num
							};
							$.ajax({
								url : 'freeBoardReplyList',
								contentType : 'application/json',
								dataType : 'json',
								data : JSON.stringify(data),
								type : 'post',
								success : function(data) {
									$.each(data, function(i) {

										var date = new Date(data[i].frb_Reply_Time)
										var year = date.getFullYear();
										var month = (1 + date.getMonth());
										month = month >= 10 ? month : '0'+ month;
										var day = date.getDate();
										day = day >= 10 ? day : '0' + day;
										var fullD = year + '.' + month + '.'+ day;
										var rfd = '<a href="javascript:void(0);" onclick="go_rfd('+data[i].frb_Reply_Num+')"><span style=" font-weight: bold; color: red;">×</span></a>'
										var tt = '<div><hr>'
												+ data[i].frb_Reply_Mem_Name
												+ '( ' + data[i].frb_Reply_Mem+ ' )'
												+'<span style="font-size: 11px">'+ fullD+'</span>'+rfd+'<div>'
												+ data[i].frb_Reply_Content;
										$('div #reply').append(tt);
									})
								}
							});

							$('#replyBtn').on('click',
											function() {
												var frb_Article_Num = $('#frb_Article_Num').val();
												var frb_Reply_Content = $('#frb_Reply_Content').val();
												var dataWrite = {
													'frb_Article_Num' : frb_Article_Num,
													'frb_Reply_Content' : frb_Reply_Content
												};
												$.ajax({
															url : 'freeBoardReplyWrite',
															data : JSON.stringify(dataWrite),
															type : 'post',
															contentType : 'application/json',
															success : function(data) {
																$('#frb_Reply_Content').val('');
																$('div #reply').empty();
																$.each(data,function(i) {
																	var date = new Date(data[i].frb_Reply_Time)
																	var year = date.getFullYear();
																	var month = (1 + date.getMonth());
																	month = month >= 10 ? month : '0'+ month;
																	var day = date.getDate();
																	day = day >= 10 ? day : '0' + day;
																	var fullD = year + '.' + month + '.'+ day;
																	var rfd = '<a href="javascript:void(0);" onclick="go_rfd('+data[i].frb_Reply_Num+')"><span style=" font-weight: bold; color: red;">×</span></a>'
																	var tt = '<div><hr>'
																			+ data[i].frb_Reply_Mem_Name
																			+ '( ' + data[i].frb_Reply_Mem+ ' )'
																			+'<span style="font-size: 11px">'+ fullD+'</span>'+rfd+'<div>'
																			+ data[i].frb_Reply_Content;
																	$('div #reply').append(tt);
																				})
																send('push:def@naver.com');
															},
															error : function() {
																alert('댓글 등록 실패');
															}
														});
											});
						});
		
		function go_rfd(frb_Reply_Num){
			alert('ㅇㅇ');
			alert(frb_Reply_Num);
		}
		
		function go_list() {
			location.href = "freeBoardList"
		}

		function go_update() {
			location.href = "freeBoardUpdate?frb_Article_Num=${freeBoardVo.frb_Article_Num}";
		}

		function go_delete() {
			frm.method = "post";
			frm.action = "freeBoardDelete";
			frm.submit();
		}
		function go_like() {
			location.href = "FreeBoardLike?frb_Article_Num=${freeBoardVo.frb_Article_Num}";
		}
	</script>          
             
</body>

</html>

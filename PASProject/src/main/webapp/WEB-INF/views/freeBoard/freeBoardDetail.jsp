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
				<h2 class="page-header"
					style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
					FreeBoard <small>글 쓰기</small>
				</h2>

				<div style="border: solid 1px black;">
					<form name="frm" method="post">
						<input type="hidden" name="frb_Article_Num" id="frb_Article_Num"
							value="${freeBoardVo.frb_Article_Num}">
						<fieldset>
							<legend>${freeBoardVo.frb_Title}
								<span>(${freeBoardVo.frb_Article_Num})
									(${freeBoardVo.frb_Wt_Date})</span>
							</legend>
							<span>${freeBoardVo.frb_Content}</span>
							<legend></legend>
							<span>${freeBoardVo.frb_Tag}</span>
						</fieldset>
					</form>
			<!-- 여기서부터 댓글 -->
					<div id="reply" style="border: solid 1px black;"></div>
					<div style="background: gray">

						<textarea rows="5" cols="50" id="frb_Reply_Content"></textarea>
						<input type="button" value="등록" id="replyBtn">
					</div>
				</div>
				<div>
					<input type="button" value="수정" onclick="go_update()"> 
					<input type="button" value="삭제" onclick="go_delete()"> 
					<input type="button" value="목록" onClick="go_list()">
					<input type="button"  value="추천!" onClick="go_like()">
				</div>
			</div>
		
	<script type="text/javascript">
		$(document).ready(function() {
			var frb_Article_Num = $('#frb_Article_Num').val();
			var data ={'frb_Article_Num' : frb_Article_Num};
			$.ajax({
				url:'freeBoardReplyList',
				contentType:'application/json',
				dataType:'json',
				data:JSON.stringify(data),
				type:'post',
				success : function(data){
					$.each(data, function(i) {
						
						var date = new Date(
								data[i].frb_Reply_Time)
						var year = date.getFullYear();
						
						var month = (1 + date.getMonth());
						month = month >= 10 ? month : '0'
								+ month;
						
						var day = date.getDate();
						day = day >= 10 ? day : '0' + day;
						
						var fullD = year + '년' + month
								+ '월' + day + '일';
						
						var tt = '<div>아이디 : '
								+data[i].frb_Reply_Mem_Name +'( '+ data[i].frb_Reply_Mem +' )'
								+ '  /  ' + '작성 날짜 : '
								+ fullD + '<div>  ->'
								+ data[i].frb_Reply_Content
								+'</div></div><br><br>';
						$('div #reply').append(tt);
					})
				}
			});
			
					$('#replyBtn').on(
							'click',
							function() {
								var frb_Article_Num = $('#frb_Article_Num')
										.val();
								var frb_Reply_Content = $('#frb_Reply_Content')
										.val();
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
										$.each(data, function(i) {
											var date = new Date(
													data[i].frb_Reply_Time)
											var year = date.getFullYear();
											var month = (1 + date.getMonth());
											month = month >= 10 ? month : '0'
													+ month;
											var day = date.getDate();
											day = day >= 10 ? day : '0' + day;
											var fullD = year + '년' + month
													+ '월' + day + '일';
											var tt = '<div >아이디 : '
													+data[i].frb_Reply_Mem_Name +'( '+ data[i].frb_Reply_Mem +' )'
													+ '  /  ' + '작성 날짜 : '
													+ fullD + '<div>  ->'
													+ data[i].frb_Reply_Content
													+'</div></div><br><br>';
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
		function go_like(){
			location.href="FreeBoardLike?frb_Article_Num=${freeBoardVo.frb_Article_Num}";
		}

	</script>

</body>
</html>

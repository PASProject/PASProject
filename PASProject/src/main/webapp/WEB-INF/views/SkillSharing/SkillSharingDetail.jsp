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
	<script language="javascript">
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
	</script>
	<h1>SkillSharingDetail</h1>
	<c:if test="${like != null }">
		<script type="text/javascript">
			alert("이미 추천한 게시글 입니다.");
		</script>
	</c:if>
	<c:if test="${modi != null }">
		<script type="text/javascript">
			alert("작성자만 수정할 수 있습니다.");
		</script>
	</c:if>
	<c:if test="${delete != null }">
		<script type="text/javascript">
			alert("작성자만 삭제할 수 있습니다.");
		</script>
	</c:if>
	<c:if test="${likee != null }">
		<script type="text/javascript">
			alert("추천 되었습니다.");
		</script>
	</c:if>

	<form name="frm" method="post">
		<!--전 controller에서 보내준것 가져온다  -->
		<input type="hidden" name="ssb_Inq_Count"
			value="${skillSharingBoardVo.ssb_Inq_Count}">
		<div style="border: solid 1px black;">
			
				
				<fieldset>
					<legend>${skillSharingBoardVo.ssb_Title}
						<span>(${skillSharingBoardVo.ssb_Article_Num})
							(${skillSharingBoardVo.ssb_wt_date})</span>
					</legend>
					<span>${skillSharingBoardVo.ssb_Content}</span>
					<legend></legend>
					<span>${skillSharingBoardVo.ssb_Tag}</span>
				</fieldset>
			
		</div>
		<input type="button" value="수정" onclick="go_update()"> <input
			type="button" value="삭제" onclick="go_delete()"> <input
			type="button" value="목록" onClick="go_list()"> <input
			type="button" value="추천!" onClick="go_like()">

	
	<div class="col-md-10">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			<small>댓글</small>
		</h2>

		<div style="border: solid 1px black;">
			<form name="reply" method="post">
				<input type="hidden" name="ssb_Article_Num" id="ssb_Article_Num"
					value="${skillSharingBoardVo.ssb_Article_Num}">

			</form>
			<div style="background: gray">

				<textarea rows="5" cols="50" id="ssb_Reply_Content"></textarea>
				<input type="button" value="등록" id="replyBtn">
			</div>
			<div id="reply" style="border: solid 1px black;"></div>
		</div>
		<div>
			<input type="button" value="수정" onclick="go_replyUpdate()"> <input
				type="button" value="삭제" onclick="go_replyDelete()">
		</div>
	</div>
    </form>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {//페이지가 켜졌을때 준비 된다.
							var ssb_Article_Num = $('#ssb_Article_Num').val();//#ssb_Article_Num jquery 선택자
							var data = {
								'ssb_Article_Num' : ssb_Article_Num
							}; // json 형태로 바꾸어준다.
							$.ajax({
								url : 'SkillSharingReplyList', //어느 컨트롤러로 보낼거냐
								contentType : 'application/json',
								dataType : 'json',
								data : JSON.stringify(data), //json 형태 data 를 String 화 시킨다.
								type : 'post',
								success : function(data) { //성공했을때 기능
									$.each(data, function(i) { // $.each = for문
										var date = new Date(
												data[i].ssb_Reply_Time)
										var year = date.getFullYear();
										var month = (1 + date.getMonth());
										month = month >= 10 ? month : '0'
												+ month;
										var day = date.getDate();
										day = day >= 10 ? day : '0' + day;
										var fullD = year + '년' + month + '월'
												+ day + '일';
										var tt = '<div>아이디 : '
												+ data[i].ssb_Reply_Mem_Name
												+ '( ' + data[i].ssb_Reply_Mem
												+ ' )' + '  /  ' + '작성 날짜 : '
												+ fullD + '<div>  ->'
												+ data[i].ssb_Reply_Content
												+ '</div></div><br><br>';
										$('div #reply').append(tt);
									})
								}
							});

							$('#replyBtn')
									.on(
											'click',
											function() {
												var ssb_Article_Num = $(
														'#ssb_Article_Num')
														.val();
												var ssb_Reply_Content = $(
														'#ssb_Reply_Content')
														.val();
												var dataWrite = {
													'ssb_Article_Num' : ssb_Article_Num,
													'ssb_Reply_Content' : ssb_Reply_Content
												};
												$
														.ajax({
															url : 'SkillSharingReplyWrite',
															data : JSON
																	.stringify(dataWrite),
															type : 'post',
															contentType : 'application/json',
															success : function(
																	data) {
																$(
																		'#ssb_Reply_Content')
																		.val('');
																$('div #reply')
																		.empty();
																$
																		.each(
																				data,
																				function(
																						i) {
																					var date = new Date(
																							data[i].ssb_Reply_Time)
																					var year = date
																							.getFullYear();
																					var month = (1 + date
																							.getMonth());
																					month = month >= 10 ? month
																							: '0'
																									+ month;
																					var day = date
																							.getDate();
																					day = day >= 10 ? day
																							: '0'
																									+ day;
																					var fullD = year
																							+ '년'
																							+ month
																							+ '월'
																							+ day
																							+ '일';
																					var tt = '<div >아이디 : '
																							+ data[i].ssb_Reply_Mem_Name
																							+ '( '
																							+ data[i].ssb_Reply_Mem
																							+ ' )'
																							+ '  /  '
																							+ '작성 날짜 : '
																							+ fullD
																							+ '<div>  ->'
																							+ data[i].ssb_Reply_Content
																							+ '</div></div><br><br>';
																					$(
																							'div #reply')
																							.append(
																									tt);
																				})
																send('push:def@naver.com');
															},
															error : function() {
																alert('댓글 등록 실패');
															}
														});
											});
						});

		function go_replyUpdate() {
			location.href = "skillSharingBoardUpdate?ssb_Article_Num=${skillSharingBoardVo.ssb_Article_Num}";
		}

		function go_replydelete() {
			reply.method = "post";
			reply.action = "skillSharingBoardDelete";
			reply.submit();
		}
		function go_list() {
			location.href = "SkillSharingBoardList"
		}
		function go_update() {
			location.href = "SkillSharingUpdate?ssb_Article_Num=${skillSharingBoardVo.ssb_Article_Num}";
		}
		function go_delete() {
			frm.method = "post";
			frm.action = "SkillSharingDelete";
			frm.submit();
		}
		function go_like() {
			location.href = "SkillSharingLike?ssb_Article_Num=${skillSharingBoardVo.ssb_Article_Num}";
		}
	</script>
</body>
</html>
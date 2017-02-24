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

	<script>
		$(function() {
			var input = document.getElementsByName('joinProj');
			var joinProj = input[0].value;

			if (joinProj != '') {
				$('.sendMessage').removeClass('container')
						.addClass('col-md-10');
			}
		})
	</script>

	<div class="container sendMessage" id="content">



		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			쪽지 보관함 <small></small>
		</h2>



		<input type="hidden" name="joinProj" value="${sessionScope.joinProj }" />

		<div class="pull-right">
		<span id="receiveSpan" style="font-weight:bold;" >받은 쪽지함</span> <label
				class="rb-switcher red"> <input type="radio"
				name="radio" id="receive" value="receive" checked> <i></i>
			</label><br>
			<span id="sendSpan" >보낸 쪽지함</span> <label class="rb-switcher"><input
				type="radio" name="radio" id="send" value="send" > <i></i> </label>
		 	
		</div>

		<script>
		

			function showSend(){
				$('#sendMessageList').show();
				$('#receiveMessageList').hide();
				
				$('#receiveSpan').css({
					'font-weight':'bold'
				})
				$('#sendSpan').css({
					'font-weight':'normal'
				})
				
				
			
				
				$('#send').one("click",showReceive);
				
			}

			function showReceive(){
				$('#sendMessageList').hide();
				$('#receiveMessageList').show();
				
				$('#sendSpan').css({
					'font-weight':'bold'
				})
				$('#receiveSpan').css({
					'font-weight':'normal'
				})
				
				
				
				$('#receive').one("click",showSend);

			}
		$(function(){
			$('#send').one('click',showSend);
			
		})
		
		</script>

		<c:forEach items="${messageList }" var="messageVo">
			
			<table id="receiveMessageList" class="table table-hover">
			<caption>받은 쪽지함</caption>
				<tr>
					<th>제목</th>
					<th>보낸이</th>
					<th>등록일</th>
					<th>읽은 시간</th>
					<th><input type="checkbox" /></th>
				</tr>
				<tr>
					<td>${messageVo.msg_Title }</td>
					<td>${messageVo.msg_sm_Email }</td>
					<td>${messageVo.msg_Wt_Date }</td>
					<td>${messageVo.msg_Rd_Date }</td>
					<td><input type="checkbox" /></td>
				</tr>
			</table>
		</c:forEach>
		
		
		<c:forEach items="${messageList }" var="messageVo">
			
			<table style="display:none;" id="sendMessageList" class="table table-hover">
			<caption>보낸 쪽지함 </caption>
				<tr>
					<th>제목</th>
					<th>받은이</th>
					<th>등록일</th>
					<th>읽은 시간</th>
					<th><input type="checkbox" /></th>
				</tr>
				<tr>
					<td>${messageVo.msg_Title }</td>
					<td>${messageVo.msg_rm_Email }</td>
					<td>${messageVo.msg_Wt_Date }</td>
					<td>${messageVo.msg_Rd_Date }</td>
					<td><input type="checkbox" /></td>
				</tr>
			</table>
		</c:forEach>

		

	</div>

</body>
</html>
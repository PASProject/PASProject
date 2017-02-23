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
<style>
#messageBtn .notActive{
    color: #3276b1;
    background-color: #fff;
}
</style>
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
	
		
		<input type="hidden" name="joinProj" value="${sessionScope.joinProj }" />
		
		
		<script>
		$(function(){
			$('#send').on('click',function(){
				$('#send').removeClass('notActive'),addClass('notActvie');
				$('#recieve').
			})
			$('#recieve').on('click',function(){
				$('#send').removeClass')
			})
		})
		</script>
		 <div class="form-group">
    		<div class="col-sm-7 col-md-7">
    			<div class="input-group">
    				<div id="messageBtn" class="btn-group">
    					<a class="btn btn-primary btn-sm active" id="receive">받은 메세지</a>
    					<a class="btn btn-primary btn-sm notActive" id="send">보낸 메세지</a>
    				</div>
    				<input type="hidden" name="happy" id="happy">
    			</div>
    		</div>
    	</div>
		<c:forEach items="${messageList }" var="messageVo">
			<table id="sendMessageList" class="table table-hover">
				<tr>
					<th>제목</th>
					<th>보낸이</th>
					<th>등록일</th>
					<th>읽은 시간</th>
					<th><input type="checkbox"/></th>
				</tr>
				<tr>
					<td>${messageVo.msg_Title }</td>
					<td>${messageVo.msg_sm_Email }</td>
					<td>${messageVo.msg_Wt_Date }</td>
					<td>${messageVo.msg_Rd_Date }</td>
					<td><input type="checkbox"/></td>
				</tr>
			</table>
		</c:forEach>
	
		
		
		<c:forEach items="${messageList }" var="messageVo">
			<table id="receiveMessageList" class="table table-hover">
				<tr>
					<th>제목</th>
					<th>보낸이</th>
					<th>등록일</th>
					<th>읽은 시간</th>
					<th><input type="checkbox"/></th>
				</tr>
				<tr>
					<td>${messageVo.msg_Title }</td>
					<td>${messageVo.msg_sm_Email }</td>
					<td>${messageVo.msg_Wt_Date }</td>
					<td>${messageVo.msg_Rd_Date }</td>
					<td><input type="checkbox"/></td>
				</tr>
			</table>
		</c:forEach>

	</div>

</body>
</html>
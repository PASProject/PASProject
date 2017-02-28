<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				$('.Message').removeClass('container')
						.addClass('col-md-10');
			}
		})
	</script>

	<div class="container Message" id="content">

		<h3 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			보낸 쪽지함 <small><a href="<%=request.getContextPath() %>/main/messageWrite">쪽지 보내기</a></small>
		</h3>



		<input type="hidden" name="joinProj" value="${sessionScope.joinProj }" />

		
		<button class="btn btn-default pull-right" id="receive">받은 편지함 가기</button>
	
		<script>
		$(function(){
			$('#receive').on('click',function(){
				location.href="/pas/main/messageReceiveList";
			})
		})
		
		
		</script>

			<table  id="sendMessageList" class="table table-hover">
			<caption><b>보낸 쪽지함</b> </caption>
				<tr>
				
					<th class="col-md-4">제목</th>
					<th class="col-md-1">받은이</th>
					<th class="col-md-1">등록일</th>
					<th class="col-md-1">읽은 시간</th>
					<th class="col-md-1"><input type="checkbox" /></th>
				</tr>
				<c:forEach items="${messageList }" var="messageVo" >
				<tr>
				
					<td><a href="<%=request.getContextPath() %>/main/messageSendDetail?msg_Article_Num=${messageVo.msg_Article_Num }" >${messageVo.msg_Title }</a></td>
					<td>${messageVo.msg_rm_Email }</td>
					<td> <fmt:formatDate value="${messageVo.msg_Wt_Date }" pattern="yyyy-MM-dd"/></td>
					<td>${messageVo.msg_Rd_Date }</td>
					<td><input type="checkbox" /></td>
				</tr>
						</c:forEach>
			</table>


		

	</div>

</body>
</html>
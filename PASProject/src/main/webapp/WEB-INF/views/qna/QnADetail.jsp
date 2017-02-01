<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div style="margin:auto; width:1300px" ><h1>QnaDetail</h1><br>
<form name="frm" method="post">
	<input type ="hidden" name="qb_Article_Num" value="${param.qb_Article_Num }">
	<script>
	
	</script>
	
	<table>
		<tr>
			<th width="20%"> 글번호 </th>
			<td>${qnaBoardVo.qb_Article_Num}</td>
		</tr>
		<tr>
			<th width="20%">제목</th>
			<td> ${qnaBoardVo.qb_Title}</td>
		</tr>
		<tr>
		    <th width="20%">등록일</th>
		    <td> ${qnaBoardVo.qb_Wt_Date}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${qnaBoardVo.qb_Content}</td>
		</tr>

	</table>

		
<br><br>
	 <input type="button" value="수정" onClick="go_qnaupdate()">
	 <input type="button" value="삭제" onClick="go_delete()">
	 <input type="button" value="목록" onClick="go_qnalist()">
<br><br>
${qnaBoardReplyVo.qb_Reply_Content}
<br>
</form>
<form name="form" action="InsertqnaReply">
<!-- 이거 한 줄몰라서 시밤 -->
<input type="hidden" name="qb_Article_Num" value="${qnaBoardVo.qb_Article_Num}">
<!-- 공부하자 -->
<textarea rows="2" cols="50" name="qb_Reply_Content" >
</textarea> <input type="submit" value= "댓글등록" onClick="InsertqnaReply()">
</form>
<br>



<script>
	function go_qnalist(){
		location.href="qnaList"
		
	}
	function go_qnaupdate(){
		location.href="qnaUpdate?qb_Article_Num=${qnaBoardVo.qb_Article_Num}";
	}
	
	
	function go_delete(){
		
		frm.method="post"
		frm.action="qnaDelete";
		frm.submit();
		
	}
	function InsertqnaReply(){
		form.method="post"
		form.action="InsertqnaReply";
		form.submit();
	}

</script>
</div>
</body>
</html>













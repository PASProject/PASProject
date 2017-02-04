<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

<body>
<script language="javascript">

var i=0
window.document.onkeydown = protectKey;

function protectKey()
{
        //새로고침을 막는 스크립트.. F5 번키..
        if(event.keyCode == 116)
        {
                event.keyCode = 0;
                return false;
        }
        //CTRL + N 즉 새로 고침을 막는 스크립트....
        else if ((event.keyCode == 78) && (event.ctrlKey == true))
        {
                event.keyCode = 0;
                return false;
        }
}
</script>
<h1>SkillSharingDetail</h1>
	<c:if test="${like != null }">
		<script type="text/javascript">
			alert("이미추천했다규");
		</script>
	</c:if>

	<form name="frm" method="post">
		<input type="hidden" name="ssb_Article_Num" value="${skillSharingBoardVo.ssb_Article_Num}">
		<input type="hidden" name="ssb_Inq_Count" value="${skillSharingBoardVo.ssb_Inq_Count}">
		<table id="orderList">
			<tr>
				<th width="20%">글번호</th>
				<td>${skillSharingBoardVo.ssb_Article_Num}</td>
			</tr>
			<tr>
				<th width="20%">제목</th>
				<td>${skillSharingBoardVo.ssb_Title}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><fmt:formatDate value="${skillSharingBoardVo.ssb_wt_date}" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${skillSharingBoardVo.ssb_Content}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${skillSharingBoardVo.ssb_Inq_Count}</td>
			</tr>
			<tr>
				<th>추천수</th>
				<td>${likeCount}</td>
			</tr>
		</table>
		<input type="button" value="수정" onclick="go_update()">
		<input type="button" value="삭제" onclick="go_delete()">
		<input type="button"  value="목록" onClick="go_list()">
		<input type="button"  value="추천!" onClick="go_like()">
	</form>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
	})
	</script>
	
	
	
	
	
	
	<script>
		function go_list(){
			location.href="SkillSharingList"
		}
		function go_update(){
			location.href="SkillSharingUpdate?ssb_Article_Num=${skillSharingBoardVo.ssb_Article_Num}";
		}
		function go_delete(){
			frm.method = "post";
			frm.action ="SkillSharingDelete";
			frm.submit();
		}
		function go_like(){
			frm.method="get";
			frm.action ="SkillSharingLike";
			frm.submit();
			location.href="SkillSharingLike?ssb_Article_Num=${skillSharingBoardVo.ssb_Article_Num}";
		}
	</script>
</body>
</html>
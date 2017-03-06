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
   <div class="col-md-10" id="content">
   <h3 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			<span class="glyphicon glyphicon-volume-up"></span>
			프로젝트 공지사항 <small>글 읽기</small>
		</h3>
<form>

<table class="table" style="border-top: 2px;">
<tr style="border-top: 2px solid #add">
<td class="col-md-9">
						<h3 style="margin-top: 10px; margin-bottom: 10px">
							<b>${NoticeVo.notice_Title }</b>
						</h3>
					</td>
					
					<td class="col-md-4"
						style="vertical-align: middle; text-align: right"><h5>날짜:
						${NoticeVo.notice_Date }</h5></td>
						</tr>
						
						<tr>
					<td colspan="3"><h3><b>작성자 :</b> ${NoticeVo.mem_Name }</h3></td>
				</tr>
				
				<tr>
					<td colspan="3"><h3><b>공지글 내용 :</b> ${NoticeVo.notice_Content }"</h3><br>
					</td>
				</tr>
				
				<tr style="border-bottom: 2px solid #ddd">
					<td class="text-right" colspan="3"
						style="border-top: 0px solid blue;">
						
						
							<input type="hidden" name="notice_Num" id="notice_Num" value="${NoticeVo.notice_Num }">
			                <input type="hidden" id="proj_Num" id="proj_Num" value="${NoticeVo.proj_Num }">
					</td>
				</tr>
				

</table>
<c:if test="${memPositionView.position_Name eq 'PL' }">
<input type="button" class="btn btn-default" value="수정" onclick="location.href='<%=request.getContextPath()%>/project/pmNoticeUpdate?proj_Num=${NoticeVo.proj_Num}&notice_Num=${NoticeVo.notice_Num}'"/>
<input type="button" class="btn btn-danger" value="삭제" onclick="deleteBtn(this.form)">

</c:if>
<button class="btn btn-default pull-right" type="button"
							onclick="go_NoticeList()">목록</button>
</form>
</div>

<script>
function deleteBtn(form){
	 form.action="<%=request.getContextPath()%>/project/pmNoticeDelete";
	 form.method="post";
	 form.submit();
	
}

function go_NoticeList(){
	location.href="<%=request.getContextPath()%>/project/pmNoticeList";
	
}

</script>


</body>
</html>
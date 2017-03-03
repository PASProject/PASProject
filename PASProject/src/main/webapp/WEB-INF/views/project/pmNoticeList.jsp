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
 <div class="col-md-10" id="content">
   <h3 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			<span class="glyphicon glyphicon-volume-up"></span>
			ProjectNotice<small>프로젝트 공지사항</small>
		</h3>
 
 
 
 
 
 





<table class="table table-hover">
<tr class="text-center">
<th class="col-md-2" style="text-align: center">글 번호</th>
<th class="col-md-2" style="text-align: center">글 제목</th>
<th class="col-md-2" style="text-align: center">작성자</th>
<th class="col-md-2" style="text-align: center">날짜</th>


</tr>
<c:forEach var="NoticeList" items="${NoticeList }" begin="${paging.beginNo}" end="${paging.endNo}">
<tr>
<td style="text-align: center">${NoticeList.notice_Num }</td>

<td style="text-align: center"><b><a href="<%=request.getContextPath() %>/project/pmNoticeDetail?proj_Num=${NoticeList.proj_Num}&notice_Num=${NoticeList.notice_Num}">${NoticeList.notice_Title }</a></b></td>

<td style="text-align: center">${NoticeList.mem_Name }</td>

<td style="text-align: center"><fmt:formatDate pattern="yyyy-MM-dd" 
            value="${NoticeList.notice_Date }" />
</td>



</tr>

</c:forEach>
<tr>
			<td colspan="5" align="center"><c:if test="${paging.finalPageNo>0}">
					<c:set value="${paging.prevPageNo}" var="prevPageNo" />
					<c:set value="${paging.finalPageNo}" var="finalPageNo" />
  
					<c:if test="${paging.pageNo>prevPageNo}">
						<a href="noticeList?page=${prevPageNo}">[이전]</a>
					</c:if>
					<c:forEach begin="1" end="${paging.finalPageNo}" var="i"
						varStatus="status">
						<a href="noticeList?page=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${paging.pageNo<finalPageNo}">
						<a href="noticeList?page=${finalPageNo}">[다음]</a>
					</c:if>
				</c:if></td>
		</tr>
</table>
<c:if test="${memPositionView.position_Name eq 'PL' }">

<input type="button" value="글쓰기" onclick="writeBtn()" class="btn btn-default pull-right" />
</c:if>
</div>
<script>
function writeBtn(){
	location.href="<%=request.getContextPath()%>/project/pmNoticeWrite";
}
</script>

</body>


</html>
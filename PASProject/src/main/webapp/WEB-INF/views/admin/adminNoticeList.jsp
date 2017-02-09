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
	<!-- <div class="col-md-10"> -->
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			Admin<small>_Notice</small>
		</h2>

		<table class="table table-hover">
			<tr class="text-center">

			
				<th class="col-md-1" style="text-align: center">번호</th>
				<th class="col-md-4" style="text-align: center">제목</th>
				<th class="col-md-2" style="text-align: center">작성자</th>
				<th class="col-md-1" style="text-align: center">작성일</th>
				<th class="col-md-1" style="text-align: center">조회수</th>
			</tr>
	
	<c:forEach var="noticeList" items="${noticeList}">
			<tr>
				
				<td style="text-align: center">${noticeList.ttnotice_Num}</td>
				<td>
				<a href = "<%=request.getContextPath()%>
					/admin/adminNoticeDetail?ttnotice_Num=${noticeList.ttnotice_Num}">
						${noticeList.ttnotice_Title}</a></td>
				<td>이경희</td>
				<td>${noticeList.ttnotice_Date}</td>
				<td style="text-align: center"></td>

			</tr>
	</c:forEach>
		</table>
	<button class="btn btn-default text-right" type="button" onClick="tt_NoticeInsert()">글쓰기</button>

<div class="col-md-12 text-center">
				<c:if test="${paging.finalPageNo>0 }">
					<c:set value="${paging.firstPageNo}" var="firstPageNo" />
					<c:set value="${paging.finalPageNo}" var="finalPageNo" />
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">

							<li class="page-item"><a class="page-link"
								href="totalNoticeList?page=${firstPageNo}" tabindex="-1">첫 페이지</a></li>


							<c:forEach begin="1" end="${paging.finalPageNo}" var="i"
								varStatus="status">
										<li class="page-item" id="number"><a
											class="page-link" href="totalNoticeList?page=${i}">${i}</a></li>
										<script>
										$('li').each(function(){
										    if(window.location.href.indexOf($(this).find('a:first').attr('href'))>-1)
										    {
										    $(this).addClass('active').siblings().removeClass('active');
										    }
										});
										</script>
							</c:forEach>
							<li class="page-item"><a class="page-link"
								href="totalNoticeList?page=${finalPageNo}">끝 페이지</a></li>
						</ul>
					</nav>
				</c:if>
			</div>




	<!-- </div> -->
	<script>
		function tt_NoticeInsert(){
			location.href = "adminNoticeForm";
			
		}
	
	
	
	</script>
</body>
</html>

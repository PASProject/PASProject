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
	<div class="col-md-10">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			QnA <small>뭣이 궁금한ㄷㅣ</small>
		</h2>
		<fieldset>
			<table class="table table-hover">
				<tr class="text-center">
					<th class="col-md-1" style="text-align: center">답변여부</th>
					<th class="col-md-1" style="text-align: center">번호</th>
					<th class="col-md-4" style="text-align: center">제목</th>
					<th class="col-md-2" style="text-align: center">작성자</th>
					<th class="col-md-1" style="text-align: center">작성일</th>
					<th class="col-md-1" style="text-align: center">조회수</th>
				</tr>
				
				
				<c:forEach items="${qnaList}" var="qnaBoardVo"
					begin="${paging.beginNo}" end="${paging.endNo}">
					<tr id="boardContents">
					<td> 
						<c:choose>
							<c:when test='${qnaBoardVo.qb_yn=="0"}'>답변미처리</c:when>
							<c:otherwise>답변완료</c:otherwise>
						</c:choose>
					</td>
						<td style="text-align: center">${qnaBoardVo.qb_Article_Num}</td>
						<td><a 
							href="<%=request.getContextPath()%>/admin/AdminQnADetail?qb_Article_Num=${qnaBoardVo.qb_Article_Num }">
								${qnaBoardVo.qb_Title}</a></td>
						<td>${qnaBoardVo.mem_Email }</td>
						<td style="text-align: center"><fmt:formatDate
								value="${qnaBoardVo.qb_Wt_Date}" pattern="yyyy-MM-dd" /></td>
						<td style="text-align: center">${qnaBoardVo.qb_Inq_Count }</td>

					</tr>
				</c:forEach>
			</table>

			<div class="col-md-12 text-right">
				
				<script>
					function QnaWrite() {
						location.href = "QnAWrite";
					}
				</script>
			</div>

			<div class="col-md-12 text-center">
				<c:if test="${paging.finalPageNo>0 }">
					<c:set value="${paging.firstPageNo}" var="firstPageNo" />
					<c:set value="${paging.finalPageNo}" var="finalPageNo" />
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">

							<li class="page-item"><a class="page-link"
								href="QnAList?page=${firstPageNo}" tabindex="-1">첫 페이지</a></li>


							<c:forEach begin="1" end="${paging.finalPageNo}" var="i"
								varStatus="status">
										<li class="page-item" id="number"><a
											class="page-link" href="AdminQnAList?page=${i}">${i}</a></li>
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
								href="QnAList?page=${finalPageNo}">끝 페이지</a></li>


						</ul>
					</nav>
				</c:if>
			</div>


		</fieldset>
	</div>
</body>
</html>

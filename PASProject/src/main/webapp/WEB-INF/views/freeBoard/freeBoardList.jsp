<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

.container {
	padding: auto;
}

</style>

</head>
<body>


			<!-- Page Header -->

			<div class="col-md-10">
				<h2 class="page-header"
					style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
					FreeBoard <small>마음껏 지껄이시길 바랍니다.</small>
				</h2>

				<table class="table table-hover">
					<tr class="text-center">
						<th class="col-md-1" style="text-align: center">번호</th>
						<th class="col-md-4" style="text-align: center">제목</th>
						<th class="col-md-1" style="text-align: center">작성자</th>
						<th class="col-md-2" style="text-align: center">작성일</th>
						<th class="col-md-1" style="text-align: center">조회수</th>
						<th class="col-md-1" style="text-align: center">추천수</th>
					</tr>
					<c:forEach items="${freeBoardList }" var="freeBoardVo"
						begin="${paging.beginNo}" end="${paging.endNo}">
						<tr id="boardContents">
							<td style="text-align: center">${freeBoardVo.frb_Article_Num }</td>
							<td><a
								href="<%=request.getContextPath()%>/freeBoard/freeBoardDetail?frb_Article_Num=${freeBoardVo.frb_Article_Num }">${freeBoardVo.frb_Title}</a></td>

							<td>${freeBoardVo.mem_Email }</td>
							

							<td style="text-align: center"><fmt:formatDate
									value="${freeBoardVo.frb_Wt_Date}" pattern="yyyy-MM-dd" /></td>
							<td style="text-align: center">${freeBoardVo.frb_Inq_Count }</td>
							<td style="text-align: center">${freeBoardVo.frb_Like }</td>
						</tr>
					</c:forEach>
				</TABLE>

				<c:if test="${paging.finalPageNo>0}">
					<c:set value="${paging.prevPageNo}" var="prevPageNo" />
					<c:set value="${paging.finalPageNo}" var="finalPageNo"/>
					<c:set value="${paging.nextPageNo}" var="nextPageNo" />

					<c:if test="${paging.pageNo>prevPageNo}">
						<a href="freeBoardList?page=${prevPageNo}">[이전]</a>
					</c:if>
					<c:forEach begin="1" end="${paging.finalPageNo}" var="i" varStatus="status">
						<a href="freeBoardList?page=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${paging.pageNo<finalPageNo}">
						<a href="freeBoardList?page=${nextPageNo}">[다음]</a>
					</c:if>
				</c:if>

				<div class="col-md-10">
					<input type="button" value="글쓰기" onclick="wrtie_form()">

					<script>
						function wrtie_form() {
							location.href = "freeBoardWrite";
						}
					</script>
				</div>


			</div>


		
</body>

</html>

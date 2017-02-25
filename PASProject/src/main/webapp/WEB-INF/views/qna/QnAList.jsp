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

	<div class="col-md-10" id="content">

		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			<span class="glyphicon glyphicon-question-sign"></span>QnA <small>게시판</small>
		</h2>


		<form name="form" method="post" action="QnAList">
			<!-- 	<form action="QnaBoardSearch" method="post">	 -->

			<br> <select name="keyField" size="1">
				<option value="title" selected>제목</option>
				<option value="name" selected>작성자</option>
				<option value="number" selected>글번호</option>
				<option value="content" selected>내용</option>
				<option value="title_content" selected>제목+내용</option>
			</select> <input type="text" size="20" name="keyword" value="${keyword}">
			<input type="submit" value="검색"> <br>
			<!-- </form> -->



			<input type="hidden" name="mem_Email"
				value="${qnaBoardReplyVo.mem_Email}"> <br>
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
						<td><c:choose>
								<c:when test='${qnaBoardVo.qb_yn=="0" }'>답변미처리</c:when>
								<c:otherwise>답변완료</c:otherwise>
							</c:choose></td>
						<td style="text-align: center">${qnaBoardVo.qb_Article_Num}</td>
						<td><a
							href="<%=request.getContextPath()%>/qna/QnADetail?qb_Article_Num=${qnaBoardVo.qb_Article_Num }">
								${qnaBoardVo.qb_Title}</a></td>
						<td>${qnaBoardVo.mem_Name }</td>
						<td style="text-align: center">${qnaBoardVo.qb_Wt_Date}</td>
						<td style="text-align: center">${qnaBoardVo.qb_Inq_Count }</td>

					</tr>
				</c:forEach>
			</table>
		</form>

		<div class="col-md-12 text-right">
			<button class="btn btn-default" type="button" onclick="QnaWrite();">글쓰기</button>

			<form name="form" method="post" action="myPostList">
				<button id="ReadMyPost" class="btn btn-default" name="myPost" type="submit"> 내가 쓴 글보기</button>

<!-- if문 -->
			<c:choose>
			<c:when test='${!empty qnaBoardVo.mem_Email}'>
							<script>
							$(function(){
								$('#ReadMyPost').hide();
						})
							</script>
				<input class="btn btn-default inline" name = "qnaTotalList" type="button" onclick="QnAList()" value="목록">						
				
				<div class="col-md-12 text-center">
					<c:if test="${paging.finalPageNo>0 }">
						<c:set value="${paging.firstPageNo}" var="firstPageNo" />
						<c:set value="${paging.finalPageNo}" var="finalPageNo" />
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">

								<li class="page-item"><a class="page-link"
									href="myPostList?page=${firstPageNo}" tabindex="-1">첫 페이지</a></li>


								<c:forEach begin="1" end="${paging.finalPageNo}" var="i"
									varStatus="status">
									<li class="page-item" id="number"><a class="page-link"
										href="myPostList?page=${i}">${i}</a></li>
									<script>
										$('li')
												.each(
														function() {
															if (window.location.href
																	.indexOf($(
																			this)
																			.find(
																					'a:first')
																			.attr(
																					'href')) > -1) {
																$(this)
																		.addClass(
																				'active')
																		.siblings()
																		.removeClass(
																				'active');
															}
														});
									</script>
								</c:forEach>
								<li class="page-item"><a class="page-link"
									href="myPostList?page=${finalPageNo}">끝 페이지</a></li>
							</ul>
						</nav>
					</c:if>
				</div>
			</form>
		</div>
</c:when>


<c:otherwise>
<!-- 전체리스트 페이징 -->
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
							<li class="page-item" id="number"><a class="page-link"
								href="QnAList?page=${i}">${i}</a></li>
							<script>
								$('li').each(
										function() {
											if (window.location.href.indexOf($(
													this).find('a:first').attr(
													'href')) > -1) {
												$(this).addClass('active')
														.siblings()
														.removeClass('active');
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

</c:otherwise>
</c:choose>


		<script>
			function QnAList(){
				location.href="QnAList";
			}
		
			function check() {
				location.href = "QnaBoardSearch?keyField=${keyField}&keyword=${keyword}";

			}

			function QnaWrite() {
				location.href = "QnAWrite";
			}

			function myPostList() {
				location.href = "myPostList";
			}
		</script>

	</div>
</body>
</html>

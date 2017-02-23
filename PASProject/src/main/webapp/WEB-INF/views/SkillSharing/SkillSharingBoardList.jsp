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
			기술공유 <small>게시판</small>
		</h2>

<form name="form" method="post" action="SkillSharingBoardList">
	<input type = "hidden" name = "mem_Email" value="${SkillSharingBoardVo.mem_Email}">
	<br> 
		<select name = "keyField" size = "1">
			<option value="title" selected>제목</option>
			<option value = "name" selected>작성자</option>
			<option value ="number" selected>글번호</option>
			<option value ="content" selected>내용</option>
			<option value = "title_content" selected>제목+내용</option>
			<option value = "tag" selected>태그</option>
		</select>
		<input type ="text" size ="20" name="keyword" value="${keyword}" >
		<input type ="submit" value="검색" >
		
<br>
		
	<table class="table table-hover">
				<tr class="text-center">
				
					<th class="col-md-1" >번호</th>
					<th class="col-md-4" >제목</th>
					<th class="col-md-1" >작성자</th>
					<th class="col-md-1">작성일</th>
					<th class="col-md-1">조회수</th>
					<th class="col-md-1">추천수</th>
				</tr>
	
		<c:forEach items="${skillSharingBoardList }" var="SkillSharingBoardVo"
			begin="${paging.beginNo}" end="${paging.endNo}">
			<tr id="boardContents">
				<td>${SkillSharingBoardVo.ssb_Article_Num }</td>
				<td><a
					href="<%=request.getContextPath()%>/SkillSharing/SkillSharingDetail?ssb_Article_Num=${SkillSharingBoardVo.ssb_Article_Num }">${SkillSharingBoardVo.ssb_Title}</a></td>
			    <td> ${SkillSharingBoardVo.mem_Name} </td>
				<td>${SkillSharingBoardVo.ssb_wt_date }</td>
				
				<td>${SkillSharingBoardVo.ssb_Inq_Count }</td>
				<td>${SkillSharingBoardVo.ssb_Like_Count }</td>
				
			</tr>
		</c:forEach>
		</table>
		</form>
		
		<input type="button" value="글쓰기" onclick="wrtie_form()" class="btn btn-default">
		
		
		<!-- 페이징시작 -->
		<form action ="skill_myPostList" method="post" name="frm">
			<button id = "skillmyPost" class="btn btn-default" type="submit">내가 쓴 글보기</button>
		
			<c:choose>
					<c:when test='${!empty skillSharingBoardVo.mem_Email}'>
						<script>
							$(function() {
								$('#skillmyPost').hide();
							})
						</script>
						<input class="btn btn-default inline" type="button" onclick="SkillSharingBoardList()" value="목록">
						
		<div class="col-md-12 text-center">
				<c:if test="${paging.finalPageNo>0 }">
					<c:set value="${paging.firstPageNo}" var="firstPageNo" />
					<c:set value="${paging.finalPageNo}" var="finalPageNo" />
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">

							<li class="page-item"><a class="page-link"
								href="skill_myPostList?page=${firstPageNo}" tabindex="-1">첫 페이지</a></li>


							<c:forEach begin="1" end="${paging.finalPageNo}" var="i"
								varStatus="status">
										<li class="page-item" id="number"><a
											class="page-link" href="skill_myPostList?page=${i}">${i}</a></li>
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
								href="skill_myPostList?page=${finalPageNo}">끝 페이지</a></li>
								</ul>
							</nav>
						</c:if>
					</div>
	  			</form>
			</div>
		</c:when>
		
		<c:otherwise>
		<div class="col-md-12 text-center">
				<c:if test="${paging.finalPageNo>0 }">
					<c:set value="${paging.firstPageNo}" var="firstPageNo" />
					<c:set value="${paging.finalPageNo}" var="finalPageNo" />
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">

							<li class="page-item"><a class="page-link"
								href="SkillSharingBoardList?page=${firstPageNo}" tabindex="-1">첫 페이지</a></li>


							<c:forEach begin="1" end="${paging.finalPageNo}" var="i"
								varStatus="status">
										<li class="page-item" id="number"><a
											class="page-link" href="SkillSharingBoardList?page=${i}">${i}</a></li>
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
								href="SkillSharingBoardList?page=${finalPageNo}">끝 페이지</a></li>


						</ul>
					</nav>
				</c:if>
			</div>
			

	
	
	</c:otherwise>
</c:choose>
	
	
	<script>
		function SkillSharingBoardList(){
			location.href = "SkillSharingBoardList";
		}
	
		function wrtie_form() {
			location.href = "SkillSharingWrite";
		}
		function searchTitle(form) {
			form.action="searchTitle";
			form.method="get";
			form.target="_self";
			form.submit();
		};
	</script>

	
</body>

</html>
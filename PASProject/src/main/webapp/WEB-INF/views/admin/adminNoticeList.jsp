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
		<form name="form" method="post" action="AdminTotalNoticeList">
		<strong><font size="5" style="margin-left: 8%">전체공지사항</font></strong>
		<select name = "keyField" size = "1" style="width: 100px; margin-left:48% ">
			<option value="title" selected>제목</option>
			<option value ="number" selected>글번호</option>
			<option value ="title_Content" selected>제목_내용</option>
		</select>
		<input type ="text" size ="20" name="keyword" value="${keyword}" >
		<input type ="submit" value="검색" >
		<br>	
		<br>
		<table style="width: 83%; margin-left: 7%; text-align:center;" class="table table-hover">
			<tr class="text-center">
				<th  style="text-align: center;vertical-align:middle !important;">번호</th>
				<th  style="text-align: center;vertical-align:middle !important;">제목</th>
				<th  style="text-align: center;vertical-align:middle !important;">작성자</th>
				<th  style="text-align: center;vertical-align:middle !important;">작성일</th>
				<th  style="text-align: center;vertical-align:middle !important;">조회수</th>
			</tr>
	
	<c:forEach var="noticeList" items="${noticeList}">
			<tr>
				
				<td style="text-align: center">${noticeList.ttnotice_Num}</td>
				<td style="text-align: center">	
				<a href = "<%=request.getContextPath()%>
					/admin/adminNoticeDetail?ttnotice_Num=${noticeList.ttnotice_Num}">
						${noticeList.ttnotice_Title}</a></td>
				<td style="text-align: center">관리자</td>
				<td style="text-align: center"> 
				<fmt:formatDate value="${noticeList.ttnotice_Date}" pattern="yyyy/MM/dd" />
				</td>
				<td style="text-align: center"></td>

			</tr>
	</c:forEach>
		</table>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	  <button class="btn btn-default text-right" type="button" onClick="tt_NoticeInsert()">글쓰기</button>
</form> 

<div class="col-md-12 text-center">
				<c:if test="${paging.finalPageNo>0 }">
					<c:set value="${paging.firstPageNo}" var="firstPageNo" />
					<c:set value="${paging.finalPageNo}" var="finalPageNo" />
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center" style="margin-left: 40%">

							<li class="page-item"><a class="page-link"
								href="AdminTotalNoticeList?page=${firstPageNo}" tabindex="-1">첫 페이지</a></li>


							<c:forEach begin="1" end="${paging.finalPageNo}" var="i"
								varStatus="status">
										<li class="page-item" id="number"><a
											class="page-link" href="AdminTotalNoticeList?page=${i}">${i}</a></li>
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
								href="AdminTotalNoticeList?page=${finalPageNo}">끝 페이지</a></li>
						</ul>
					</nav>
				</c:if>
			</div>
<br>
<br>


	<script>
		function tt_NoticeInsert(){
			location.href = "adminNoticeForm";
			
		}
	
	
	
	</script>
</body>
</html>

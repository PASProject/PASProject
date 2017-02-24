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
	<div class="container" >
		<div class="row">

			<div class="col-md-10">
			<h2 class="page-header"
					style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
					FreeBoard <small>글 쓰기</small>
				</h2>
		
			<form>
				제목: <input type="text" name="notice_Title" /><br> 내용: <input
					type="text" name="notice_Content" /><br>
					작성자: <input type="text" name="notice_Title" value="${loginUser.mem_Name }"/>
					 <input type="button"
					value="글쓰기" onClick="noticeBtn(this.form)" />
			</form>

			<script>
 function noticeBtn(form){
	 form.action="<%=request.getContextPath()%>/project/pmNoticeWrite";
					form.method = "post";
					form.submit();
				}
			</script>
				</div>
		</div>
	</div>
</body>
</html>

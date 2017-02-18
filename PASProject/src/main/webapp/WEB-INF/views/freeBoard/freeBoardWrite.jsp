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
				<h3 class="page-header"
					style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
					FreeBoard <small>글 쓰기</small>
				</h3>
				<!-- Title
				<form name="formm" method="post" action="freeBoardInsert">
					<fieldset>
						<label>Title</label> <input type="text" name="frb_Title" size="64"><br>
						<label>Content</label>
						<textarea rows="8" cols="65" name="frb_Content"></textarea>
						<br>
					</fieldset>
					<div class="clear"></div>
					<div id="buttons" style="float: right">
						<input type="submit" value="글쓰기" class="submit"> <input
							type="reset" value="취소" class="cancel">
					</div>
				</form>
 -->

				<div class="col-md-10">
					<form class="form-horizontal" name="formm" method="post"
						action="freeBoardInsert">
						<fieldset>
							<!-- 						<legend>Legend</legend> -->
							<div class="form-group">
								<label for="subject" class="col-lg-2 control-label">제목</label>
								<div class="col-lg-10">
									<input type="text" name="frb_Title" size="64"
										class="form-control" id="subject" placeholder="제목">
								</div>
							</div>
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">내용</label>
								<div class="col-lg-10">
									<textarea class="form-control" rows="18" id="textArea"
										name="frb_Content"></textarea>
									<span class="help-block text-right">새해 복 많이 받으세요</span>
								</div>
							</div>

							<div class="form-group text-right">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="submit" class="btn btn-default">등록</button>
									<button type="reset" class="btn btn-default">취소</button>
									<button type="button" onclick="location.href='<%=request.getContextPath()%>/freeBoard/freeBoardList'" class="btn btn-default">목록</button>

								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		
</body>
</html>
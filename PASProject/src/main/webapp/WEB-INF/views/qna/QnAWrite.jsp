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
		<div class="col-md-10">
			<form name="form" method="post" action="insertQnABoard">
				<h3 class="page-header"
					style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
					SkillSharingBoard <small>글 쓰기</small>
				</h3>
				<fieldset>

					<div class="form-group">
						<label for="subject" class="col-lg-2 control-label">제목</label>
						<div class="col-lg-10">
							<input type="text" name="qb_Title" size="64" class="form-control"
								id="ssb_Title" placeholder="제목"><br>
						</div>
					</div>
					<div class="form-group">
						<label for="textArea" class="col-lg-2 control-label">내용</label>
						<div class="col-lg-10">
							<textarea class="form-control" rows="18" id="ssb_Content"
								name="qb_Content"></textarea><br>
						</div>
					</div>
					<div class="form-group">
						<label for="textArea" class="col-lg-2 control-label">태그</label>
						<div class="col-lg-10">
							<textarea class="form-control" rows="1" id="ssb_Tag"
								name="ssb_Tag"></textarea>
							<span class="help-block text-right">새해 복 많이 받으세요</span>
						</div>
					</div>

					<div class="form-group text-right">
						<div class="col-lg-10 col-lg-offset-2">
							<button type="submit" class="btn btn-default">등록</button>
							<button type="button"
								onclick="location.href='<%=request.getContextPath()%>/SkillSharing/SkillSharingBoardList'"
								class="btn btn-default">취소</button>
							<input type="button" value="목록" class="btn btn-default" onClick="go_list()">
						</div>
					</div>
				</fieldset>
			</form>

			<script>
				function go_list() {
					location.href = "QnAList"

				}
			</script>



		</div>
	</div>
</body>
</html>
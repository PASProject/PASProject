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
	<div style="margin: auto; width: 1300px">

		<form name="form" method="post" action="insertQnABoard">
			<!-- fieldset태그는 form양식에서 관계된 요소끼리 묶어주며 관계요소 주위에 박스를 그립니다.
주로 legend태그와 함께 쓰임
 -->
			<fieldset>
				<legend>Qna</legend>
				<label>Title</label> <input type="text" name="qb_Title" size="64"><br>
				<label>Content</label>
				<textarea rows="8" cols="65" name="qb_Content"></textarea>
				<br>
			</fieldset>
			<div class="clear"></div>

			<input type="submit" value="글쓰기" class="submit"> 	
			<input type="reset" value="취소" class="cancel"> 
			<input type="button" value="목록" onClick="go_list()">

		</form>
		<script>
			function go_list() {
				location.href = "QnAList"

			}
		</script>
	</div>
</body>
</html>
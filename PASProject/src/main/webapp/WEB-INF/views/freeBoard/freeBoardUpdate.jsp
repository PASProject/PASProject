<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<form name="formm" method="post" action="freeBoardUpdate">
			<fieldset>	
				<legend>FreeBoard</legend>		
			    <label>Title</label>
			    <input type="text" name="frb_Title"  size="64" value="${freeBoardVo.frb_Title}"><br>
				<label>Content</label>
			    <textarea rows="8" cols="65" name="frb_Content" >${freeBoardVo.frb_Content}</textarea><br>
			</fieldset>   
		<div class="clear"></div>
		 <div id="buttons" style="float:right">
			<input type="submit"  value="수정"     class="submit"> 
			<input type="reset"   value="취소"     class="cancel">
		  </div>
		  <input type="hidden" value="${freeBoardVo.frb_Article_Num}" name="frb_Article_Num">
</form>
</body>
</html>
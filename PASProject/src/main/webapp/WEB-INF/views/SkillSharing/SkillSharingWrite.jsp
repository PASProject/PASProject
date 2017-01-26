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
<form name="formm" method="post" action="SkillSharingInsert">
			<fieldset>	
				<legend>SkillSharingBoard</legend>		
			    <label>Title</label>
			    <input type="text" name="ssb_Title"  size="64" ><br>
				<label>Content</label>
			    <textarea rows="8" cols="65" name="ssb_Content"></textarea><br>
			</fieldset>   
		<div class="clear"></div>
		 <div id="buttons" style="float:right">
			<input type="submit"  value="글쓰기"     class="submit"> 
			<input type="button"  value="취소" onClick="go_list()">
		  </div>
</form>
<script>
		function go_list(){
			location.href="SkillSharingList"
		}
</script>
</body>
</html>
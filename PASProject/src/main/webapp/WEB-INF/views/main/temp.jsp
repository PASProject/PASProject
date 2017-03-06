<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>공지사항</title>

</head>
<body>

<script>
$(function(){
	$('.alink').click(function(e){
	    $('#questionMarkId').hide();
	    $('#questionMarkId').css({'top':e.pageY+20,'left':e.pageX+10, 'position':'absolute', 'border':'1px solid black', 'padding':'5px'});
	    $('#questionMarkId').show();
	  	
	    $('body').mouseup(function(e){
			/* e.preventDefault(); */
	    	$('#questionMarkId').hide();
	    })
	   });
	
})

</script>
	<div class="container Message" id="content">

		<h3 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			연습 <small></small>
		</h3>

		<div class="boxFAQ" id="questionMarkId" style="display: none;">
  <span id="divTitle"></span>  
  <a href="<%=request.getContextPath() %>/main/myProject" id="open">HOW ME!</a>
</div>


<br /><br /><br /><br />
<a href="#" class="alink">Link 1</a>
<a href="#" class="alink">Link 2</a>



	</div>
</body>
</html>

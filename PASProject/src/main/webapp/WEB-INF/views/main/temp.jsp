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
<style>
.typed-cursor{
    opacity: 1;
    -webkit-animation: blink 0.7s infinite;
    -moz-animation: blink 0.7s infinite;
    animation: blink 0.7s infinite;
}
@keyframes blink{
    0% { opacity:1; }
    50% { opacity:0; }
    100% { opacity:1; }
}
@-webkit-keyframes blink{
    0% { opacity:1; }
    50% { opacity:0; }
    100% { opacity:1; }
}
@-moz-keyframes blink{
    0% { opacity:1; }
    50% { opacity:0; }
    100% { opacity:1; }
}
</style>
	<script src="<%=request.getContextPath() %>/resources/js/typed.js"></script>
	<script>
  $(function(){
      $("#headTitle").typed({
    	  
        strings: ["your project with us. ^2000 ","and <b>Finish</b> your project with us. ^5000"],
        contentType: 'html',
        typeSpeed : 10,
        backSpeed : 10,
		loop : true,
		loopCount : 50
      });
  });
</script>
	<div class="container Message" id="content">
	
		<h3 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			연습 <small></small>
		</h3>
		<div id="a" style="display:inline">Begin&nbsp;</div><div id="headTitle" style="display:inline"></div>
		

	</div>
</body>
</html>

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
<div class="col-md-10" id="content">
 <h1>${sessionScope.joinProj }번프로젝트  오버뷰</h1> 
</div>
<script>
history.pushState(null, null, location.href); 
window.onpopstate = function(event) { 
history.go(1); 
}




var i=0
window.document.onkeydown = protectKey;
function down() {
        window.footer_cart.scrollBy(0,31)
        return;
}
function up() {
        window.footer_cart.scrollBy(0,-31)
        return;
}
function protectKey()
{
        //새로고침을 막는 스크립트.. F5 번키..
        if(event.keyCode == 116)
        {
                event.keyCode = 0;
                return false;
        }
        //CTRL + N 즉 새로 고침을 막는 스크립트....
        else if ((event.keyCode == 78) && (event.ctrlKey == true))
        {
                event.keyCode = 0;
                return false;
        }
}


</script>
</body>

</html>
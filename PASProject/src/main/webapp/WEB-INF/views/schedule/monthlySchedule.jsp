<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href='<%=request.getContextPath()%>/resources/css/fullcalendar.min.css'
	rel='stylesheet' />
<link
	href='<%=request.getContextPath()%>/resources/lib/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />
<script src='<%=request.getContextPath()%>/resources/lib/moment.min.js'></script>
<script src='<%=request.getContextPath()%>/resources/lib/jquery.min.js'></script>
<script
	src='<%=request.getContextPath()%>/resources/lib/fullcalendar.min.js'></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/lib/gcal.js"></script>

<script>
	$(document).ready(function() {
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();

		$('#calendar').fullCalendar({

			header : {
				left : 'prev, next today',
				center : 'title',
				right : 'month'

			},
			editable : true,
			events : [ {
				title : '01 All Day Event',
				start : new Date(y, m, 1)
			}]
		})

	});
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div id='calendar'></div>

</body>
</html>
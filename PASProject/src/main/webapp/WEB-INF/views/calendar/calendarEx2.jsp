<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link
	href='<%=request.getContextPath()%>/resources/css/fullcalendar.min.css'
	rel='stylesheet' />
<link
	href='<%=request.getContextPath()%>/resources/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />
<script src='<%=request.getContextPath()%>/resources/lib/moment.min.js'></script>
<script src='<%=request.getContextPath()%>/resources/lib/jquery.min.js'></script>
<script
	src='<%=request.getContextPath()%>/resources/fullcalendar.min.js'></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/gcal.js"></script>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(
			function() {
				$(function() {
					$.ajax({

						type : "POST",
						url : "calendarAjax",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						error : function(request, status, error) {
							alert("code : " + request.status + "\r\nmessage : "
									+ request.reponseText);
						},
						success : function(data) {
							setCalendar(data);
						}
					});
				})
			});

	function setCalendar(data) {
		/* var jsonData = JSON.stringify(data)
		alert(jsonData) */

		$('#calendar').fullCalendar({
			editable : true,
			eventLimit : true,
			events : data,
			dayClick:function(date,jsEvent,view){
			            $('#modalTitle').text(event.title);
			            $('#modalBody').text(date.format());
			            $('#eventUrl').attr('href',event.url);
			            $('#calendarModal').modal();
			}
			
		});

		
	}
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
	<div id='calendar'>
	</div>
	
	
	<div id="calendarModal" class="modal fade">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
            <h4 id="modalTitle" class="modal-title"></h4>
        </div>
        <div id="modalBody" class="modal-body"> </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
    </div>
</div>
</div>

	
	
</body>
</html>

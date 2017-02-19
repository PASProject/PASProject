<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
</head>
<body>
	<div id='calendar' style=" margin:auto;">
	</div>
	<div id="calendarModal" class="modal fade">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
            <h4 id="modalTitle" class="modal-title"></h4>
        </div>
        <div id="modalBody" class="modal-body">
        	일정명 : <input type="text" id="title"><br><br>
        	시작 날짜 : <input type="text" id="datePicker1" readonly="readonly" class="flatpicker-input active" > ~ 종료 날짜 : <input type="text" id="datePicker2" readonly="readonly">
        </div>
        <div class="modal-footer">
        	<button type="button" class="btn btn-default" id="addCalendar">등록</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
    </div>
</div>
</div>

	
	<script>
// 	$(document).ready(
// 			function() {
// 				$(function() {
// 					$.ajax({

// 						type : "POST",
// 						url : "calendarAjax.do",
// 						dataType : "json",
// 						contentType : "application/json; charset=UTF-8",
// 						error : function(request, status, error) {
// 							alert("code : " + request.status + "\r\nmessage : "
// 									+ request.reponseText);
// 						},
// 						success : function(data) {
// 							setCalendar(data);
// 						}
// 					});
// 				})
// 			});

// 	function setCalendar(data) {
// 		/* var jsonData = JSON.stringify(data)
// 		alert(jsonData) */

// 		$('#calendar').fullCalendar({
// 			editable : true,
// 			eventLimit : true,
// 			events : data,
// 			dayClick:function(date,jsEvent,view){
// 			            $('#modalTitle').text(event.title);
// 			            $('#modalBody').text(date.format());
// 			            $('#eventUrl').attr('href',event.url);
// 			            $('#calendarModal').modal();
// 			},
// 			eventClick:function(calEvent,jsEvent,view){
// 				$('#modalTitle').text("일정등록");
// 				/* $('#modalBody').text(calEvent.title+"일정"+moment(calEvent.start).format('MMM Do h:mm A') +" : "+calEvent.end); */
// 				$('#calendarModal').modal();
// 			}
			
// 		});

		
// 	}

$(function(){
	$('#calendar').fullCalendar({
			editable : true,
			eventLimit : true,
			buttonIcons:true,
			themeButtonIcons:{
			    prev: 'circle-triangle-w',
			    next: 'circle-triangle-e',
			    prevYear: 'seek-prev',
			    nextYear: 'seek-next'
			},
			header:{
				left:'prev,next,today',
				center:'title',
				right:'month,agendaWeek,agendaDay'
			} ,
			eventSources :[{ 
			     	url : "calendarList",
			     	type:'get',
			 		textColor:'white'
			}],
			dayClick:function(date,jsEvent,view){
				 $('#modalTitle').text("일정 등록");
				 $('#datePicker1').val(date.format());
				 $('#datePicker2').val(date.format());
				 $('#calendarModal').modal();
			}
		});
	
	$('#datePicker1').change(function(){
		$('#datePicker2').val($('#datePicker1').val());
	});
		
	/* $('#datePicker1,#datePicker2').datepicker({
			dateFormat: 'yy-mm-dd', // 데이터는 yyyy-MM-dd로 나옴
	        closeText: '닫기',
            prevText: '이전달',
            nextText: '다음달',
            currentText: '오늘',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            
	}); */
	flatpickr("#datePicker1,#datePicker2",{
		enableTime: true,
		altFormat: "F j, Y h:i K",
		
	})
	$('#addCalendar').on('click',function(){
		var start = $('#datePicker1').val();
		var end = $('#datePicker2').val();
		var title = $('#title').val();
		var dataList = {'start':start,'end':end,'title':title};
		$.ajax({
			dataType:'json',
			contentType:'application/json',
			url:'addCal',
			data:JSON.stringify(dataList),
			type:'post',
			success:function(data){
				$('#calendar').fullCalendar('renderEvent', data, true);
				$("#calendarModal").modal("hide");
				$("#title").val("");
				$("#datePicker1").val("");
				$("#datePicker2").val("");
			}
		})
	})
})
</script>
</body>
</html>

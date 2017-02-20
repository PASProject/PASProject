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

<div class="col-md-10" id="content">
<h3> 월별 일정 관리</h3>
<c:forEach items="${memPositionViewVo}" var="memPositionView" >
<div style=" width:100px; background-color: <c:out value='${memPositionView.pjj_Color}'/>" > ${memPositionView.mem_Name}</div>
</c:forEach>
<br>
	<div id='calendar' >
	</div>
	<div id="addCalendarModal" class="modal fade">
		<div class="modal-dialog">
		    <div class="modal-content">
		        <div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
		            <h4 id="modalTitle" class="modal-title"></h4>
		        </div>
		        <div id="modalBody" class="modal-body">
		        	일정명 : <input type="text" id="title"><br><br>
					내용 :<br> <textarea rows="5" cols="75" name="description" id="description"></textarea><br><br>        	
					
		        	시작 날짜 : <input type="text" id="datePicker1" readonly="readonly" class="flatpicker-input active" > ~ 종료 날짜 : <input type="text" id="datePicker2" readonly="readonly">
		        </div>
		        <div class="modal-footer">
		        	<button type="button" class="btn btn-default" id="addCalendar">등록</button>
		            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        </div>
		    </div>
		</div>
	</div>


	<div id="detailCalendarModal" class="modal fade">
		<div class="modal-dialog">
		    <div class="modal-content">
		        <div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
		            <h4 id="detailModalTitle" class="modal-title"></h4>
		        </div>
		        <div id="modalBody" class="modal-body">
		        	일정명 : <input type="text" id="detailTitle"><br><br>
					내용 :<br> <textarea rows="5" cols="75" name="detailDescription" id="detailDescription"></textarea><br><br>        	
		        	시작 날짜 : <input type="text" id="detailDatePicker1" readonly="readonly" class="flatpicker-input active" > ~ 종료 날짜 : <input type="text" id="detailDatePicker2" readonly="readonly">
		        </div>
		        <div class="modal-footer" id="detailFooter">
		        </div>
		    </div>
		</div>
	</div>



</div>
	
	<script>
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
				 $('#datePicker1').val(date.format()+' 12:00');
				 $('#datePicker2').val(date.format()+' 12:00');
				 $('#addCalendarModal').modal();
			},eventClick:function(calEvent,jsEvent,view){
				
				$('#detailModalTitle').text("일정 확인"+calEvent.id);
				$('#detailTitle').val(calEvent.title);
				$('#detailDatePicker1').val(moment(calEvent.start).format('YYYY-MM-DD HH:mm'));
				if(calEvent.end !=null){
					$('#detailDatePicker2').val(moment(calEvent.end).format('YYYY-MM-DD HH:mm'))
				}else{
					$('#detailDatePicker2').val(moment(calEvent.start).format('YYYY-MM-DD HH:mm'));
				}
				var loginUser = '${loginUser.mem_Email}';
				
				if((calEvent.id).indexOf(loginUser)>-1){
					$('#detailFooter').html('<button type="button" class="btn btn-default" id="updateCalendar">수정</button> <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>'
							+'<input type="hidden" value="'+(calEvent.id).substring(loginUser.length)+'" id="sc_Num">'+
							'<input type="hidden" value="'+calEvent.color+'" id="sc_Color">'
					);
					
				}else{
					$('#detailFooter').html('<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>')
				}
				
				$('#detailDescription').val(calEvent.description);
				$('#detailCalendarModal').modal();
			}
			
		});
	
	$('#datePicker1').change(function(){
		$('#datePicker2').val($('#datePicker1').val());
	});
		
	flatpickr("#datePicker1,#datePicker2,#detailDatePicker1,#detailDatePicker2",{
		enableTime: true,
		altFormat: "F j, Y h:i K",
		
	})
	$('#addCalendar').on('click',function(){
		var start = $('#datePicker1').val();
		var end = $('#datePicker2').val();
		var title = $('#title').val();
		var description = $('#description').val();
		var dataList = {'start':start,'end':end,'title':title,'description':description};
		$.ajax({
			dataType:'json',
			contentType:'application/json',
			url:'addCal',
			data:JSON.stringify(dataList),
			type:'post',
			success:function(data){
				$('#calendar').fullCalendar('renderEvent', data, true);
				$("#addCalendarModal").modal("hide");
				$("#title").val("");
				$("#datePicker1").val("");
				$("#datePicker2").val("");
				$("#description").val("");
			}
		})
	});
	
	$(document).on('click','#updateCalendar',function(){
		var start = $('#detailDatePicker1').val();
		var end =$('#detailDatePicker2').val();
		var title = $('#detailTitle').val();
		var id = $('#sc_Num').val();
		var color = $('#sc_Color').val();
		
		
		var calEvent = new Object();
		calEvent = $('#event').val();
		
		var description = $('#detailDescription').val();
		var dataList = {'start':start,'end':end,'title':title,'description':description,'id':id,'color':color};
		$.ajax({
			dataType:'json',
			contentType:'application/json',
			url:'updateCal',
			data:JSON.stringify(dataList),
			type:'post',
			success:function(data){
				 var item = $("#calendar").fullCalendar('clientEvents',data.id); 
				/* calEvent.id = data.id; */
				item.start = data.start;
				item.title = data.title;
				item.end = data.end;
				item.color = data.color;
				item.description = data.description;
				$('#calendar').fullCalendar('updateEvents',item);
				$('#calendar').fullCalendar('refetchEvents');
				$('#detailCalendarModal').modal("hide");
				$('#detailDatePicker1').val("");
				$('#detailDatePicker2').val("");
				$('#detailDescription').val("");
			}
		})
	})
})
</script>
</body>
</html>

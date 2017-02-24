<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2017. 2. 24.      PC14      최초작성
* Copyright (c) 2017 by DDIT All right reserved
 --%>
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
<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			간트 차트
		</h2>
		<!-- <input type="button" id = "a1234"  value="ㅋㅋ"> -->
        <div id="gantt"></div>
</div>


<script>   
$(function(){  
	
	$.ajax({
		url:'setGant',
		dataType:'json',
		contentType:'application/json',
		success:function(data){
			go(data);
		}
	});
	function go(data){
          $("#gantt").kendoGantt({
            dataSource: data,
            columns: [
                      { field: "title", title: "Title", width:100 },
                      { field: "start", title: "Start Time", width: 200 },
                      { field: "end", title: "End Time", width: 200 }
                    ]
          });
          $('#a1234').on('click',function(){
          var gantt = $("#gantt").data("kendoGantt");
          task = gantt.dataSource;
          alert(JSON.stringify(task));
          });
	}
})      
</script>          
</body>
</html>  



<!--  { 
                id: 1,
                orderId: 0,
                title: "Task1",
                start: new Date("2014/6/17 9:00"),
                end: new Date("2014/6/17 11:00"),
                percentComplete :"0.3"
              },
              {
                id: 2,
                orderId: 1,
                title: "Task2",
                start: new Date("2014/6/17 12:00"),
                end: new Date("2014/6/17 13:00")
              },
              {
                  id: 3,
                  orderId: 2,
                  title: "Task3",
                  start: new Date("2014/6/18 12:00"),
                  end: new Date("2014/6/19 13:00")
                },
                {
                    id: 4,
                    orderId: 3,
                    title: "Task5",
                    start: new Date("2014/6/17 12:00"),
                    end: new Date("2014/6/17 13:00")
                  } -->
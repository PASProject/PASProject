<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<div class="col-md-10" id="content">
<br><Br><br>

<table class="table table-strip">
  <tr style="background-color: white">
    <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 30px;">
    	월</th>
   <th class="col-md-7" style="  border: 1px solid #dddddd; text-align: left; padding: 30px;">
 
<!--    내용버튼 -->
   	<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#Monday"
   	style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:pink;"
   	value="요구사항정의서만들기                                                                                                                                                                                                                                                                                                                                    ">
 </th>
   		
	
    <th class="col-md-2" style="  border: 1px solid #dddddd; text-align: left; padding: 30px;">
    	Country</th>
  </tr>
 	<tr>
 	</tr>
</table>
<!-- 월요일 모달 -->
  <div class="modal fade" id="Monday" role="dialog">
    <div class="modal-dialog">
    
      Monday
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> Monday</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
<!----------------------------------------------------------------------------------------------- 화요일 -->
<table class="table table-strip">
  <tr style="background-color: white">
    <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 30px;">
    	화</th>
   <th class="col-md-7" style="  border: 1px solid #dddddd; text-align: left; padding: 30px;">
 
<!--    내용버튼 -->
   	<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#thusday"
   	style="border-width : 0px; box-shadow:none; outline:none; background-color:white; font-color:black;"
   	value="여기에 내용을 넣을것임">
 </th>
   		
	
    <th class="col-md-2" style="  border: 1px solid #dddddd; text-align: left; padding: 30px;">
    	Country</th>
  </tr>
 	<tr>
 	</tr>
</table>
<!-- 화요일 모달 -->
  <div class="modal fade" id="thusday" role="dialog">
    <div class="modal-dialog">
    
      Thuseday
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Thuseday</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <table>
	<tr>
		<th>시작날짜</th>
		
		<th>종료날짜</th>
	
		<th>일정</th>

		<th>Description</th>
		
		
	</tr>
	
      <c:forEach items="${weelyList}" var="scheduleCalendarVo">
    <tr>
		<td>${scheduleCalendarVo.sc_Start_Date} </td>
		<td> ${scheduleCalendarVo.start_Day} </td>
		<td>${scheduleCalendarVo.sc_End_Date} </td>
		<td> ${scheduleCalendarVo.end_Day}</td>
		<td>${scheduleCalendarVo.sc_Title}</td>
		<td>${scheduleCalendarVo.sc_Description}</td>
		
		
	</tr>
	</c:forEach>
	
</table>





</div>
</body>
</html>
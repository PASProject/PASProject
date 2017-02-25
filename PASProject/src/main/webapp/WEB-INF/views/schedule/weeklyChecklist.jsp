<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>



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
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
#titlee{
color:red;
}

</style>

<body>
<div class="col-md-10" id="content">
<br><Br><br>


<h4>이번주 시작하는 나의 일감</h4>

<div class="container">         
  <table class="table table-bordered">
    <thead>
      <tr>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">월</th>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">화</th>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">수</th>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">목</th>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">금</th>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">토</th>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">일</th>
    
      </tr>
    </thead>
          
    <tbody>
      <tr style="background-color: white">

		<td>
		<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.start_Day eq "월요일" }'> 
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#Monday_Start"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}"> <br></c:when>
		</c:choose>
		</c:forEach>
		</td>
		
		<td>
		<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose> <c:when test='${scheduleCalendarVo.start_Day eq "화요일" }'>
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#tuesday_Start"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}"><br></c:when>
		</c:choose>
		</c:forEach>
		</td>
		
		<td>
		<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose> <c:when test='${scheduleCalendarVo.start_Day eq "수요일" }'>
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#wednesday_Start"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}"><br></c:when>
		</c:choose>
		</c:forEach>
		</td>
		
		
		<td>
		<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose> <c:when test='${scheduleCalendarVo.start_Day eq "목요일" }'>
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#thursday_Start"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}"><br></c:when>
		</c:choose>
		</c:forEach>
		</td>
		
		<td>
		<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose> <c:when test='${scheduleCalendarVo.start_Day eq "금요일" }'>
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#friday_Start"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}"><br></c:when>
		</c:choose>
		</c:forEach>
		</td>
		
		<td>
		<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose> <c:when test='${scheduleCalendarVo.start_Day eq "토요일" }'>
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#saturday_Start"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}"><br></c:when>
		</c:choose>
		</c:forEach>
		</td>
		
		<td>
		<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose> <c:when test='${scheduleCalendarVo.start_Day eq "일요일" }'> 
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#sunday_Start"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}"><br></c:when>
		</c:choose>
		</c:forEach>
		</td>
      </tr>
      	
      
    </tbody>
  </table>
 </div> 
 		 <h4>이번주 마감하는 나의 일감</h4>
<div class="container">         
  <table class="table table-bordered">
    <thead>
      <tr>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">월</th>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">화</th>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">수</th>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">목</th>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">금</th>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">토</th>
        <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 6px;">일</th>
      </tr>
    </thead>
          
    <tbody>
      <tr style="background-color: white">

		<td>
		<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.end_Day eq "월요일" }'>
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#Monday_End"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}">     
		<br></c:when>
		</c:choose>
		</c:forEach>
		</td>
		
		<td>
		<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose> <c:when test='${scheduleCalendarVo.end_Day eq "화요일" }'> 
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#tuesday_End"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}">   <br></c:when>
		</c:choose>
		</c:forEach>
		</td>
		
		<td>
		<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose> <c:when test='${scheduleCalendarVo.end_Day eq "수요일" }'>
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#wednesday_End"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}">   <br></c:when>
		</c:choose>
		</c:forEach>
		</td>
		
		<td>
		<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose> <c:when test='${scheduleCalendarVo.end_Day eq "목요일" }'>
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#thursday_End"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}">   <br></c:when>
		</c:choose>
		</c:forEach>
		</td>
		
		<td>
		<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose> <c:when test='${scheduleCalendarVo.end_Day eq "금요일" }'> 
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#friday_End"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}">   <br></c:when>
		</c:choose>
		</c:forEach>
		</td>
		
		<td>
		<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose> <c:when test='${scheduleCalendarVo.end_Day eq "토요일" }'> 
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#saturday_End"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}">   <br></c:when>
		</c:choose>
		</c:forEach>
		</td>
		
		<td>
		<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose> <c:when test='${scheduleCalendarVo.end_Day eq "일요일" }'>
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#sunday_End"
   		style="border-width : 0px; box-shadow:none; outline:none; background-color:white; color:darkgray; font-size:10pt;"
   		value=" ${scheduleCalendarVo.sc_Title}">   <br></c:when>
		</c:choose>
		</c:forEach>
		</td>
      </tr>
      	
      
    </tbody>
  </table>
  
</div>


<br><Br>

<!-- 월요일 시작일감 모달 -->
<div class="modal fade" id="Monday_Start" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> Monday</h4>
        </div>
      
        <div class="modal-body">
        <c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.start_Day eq "월요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
		
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- 화요일 시작일감 모달 -->
<div class="modal fade" id="tuesday_Start" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> tuesday</h4>
        </div>
        
       <c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.start_Day eq "화요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
		
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
    <!-- 수요일 시작일감 모달 -->
<div class="modal fade" id="wednesday_Start" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> wednesday</h4>
        </div>
       
	<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.start_Day eq "수요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
	</c:forEach>
		
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
    <!-- 목요일 시작일감 모달 -->
<div class="modal fade" id="thursday_Start" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> thursday</h4>
        </div>
        
        <c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.start_Day eq "목요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
		
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
    <!-- 금요일 시작일감 모달 -->
<div class="modal fade" id="friday_Start" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> friday</h4>
        </div>
      
      <c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.start_Day eq "금요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
		
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
    <!-- 토요일 시작일감 모달 -->
<div class="modal fade" id="saturday_Start" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> saturday</h4>
        </div>
       
       <c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.start_Day eq "토요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
		
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
    <!-- 일요일 시작일감 모달 -->
<div class="modal fade" id="sunday_Start" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> sunday</h4>
        </div>
        
        <c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.start_Day eq "일요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
		
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<!-- 월요일 마감일감 모달 --------------------------------------------------------------------------------------------->
<div class="modal fade" id="Monday_End" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> Monday</h4>
        </div>
       <c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.end_Day eq "월요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- 화요일 마감일감 모달 -->
<div class="modal fade" id="tuesday_End" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> Monday</h4>
        </div>
        <c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.end_Day eq "화요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- 수요일 마감일감 모달 -->
<div class="modal fade" id="wednesday_End" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> Monday</h4>
        </div>
        
         <c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.end_Day eq "수요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- 목요일 마감일감 모달 -->
<div class="modal fade" id="#thursday_End" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> Monday</h4>
        </div>
        
         <c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.end_Day eq "목요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- 금요일 마감일감 모달 -->
<div class="modal fade" id="friday_End" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> Monday</h4>
        </div>
        
         <c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.end_Day eq "금요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- 토요일 마감일감 모달 -->
<div class="modal fade" id="saturday__End" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> Monday</h4>
        </div>
        
         <c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.end_Day eq "토요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- 일요일 마감일감 모달 -->
<div class="modal fade" id="sunday_End" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> Monday</h4>
        </div>
         <c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
		<c:choose>
		<c:when test='${scheduleCalendarVo.end_Day eq "일요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}" pattern="yyyy-MM-dd"/> (${scheduleCalendarVo.end_Day})<Br><br>
	    </c:when>
		</c:choose>
		</c:forEach>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>



  
  
<!----------------------------------------------------------------------------------------------- 월요일 -->
<table class="table table-strip">
  <tr style="background-color: white">
    <th class="col-md-1" style="  border: 1px solid #dddddd; text-align: center; padding: 30px;">
    	월</th>
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




</div>
</body>
</html>
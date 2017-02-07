<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

</style>
</head>
<body>

<div class="col-md-8">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			프로젝트 인원<small> ${memPositionView.proj_Name}</small>
		</h2>
		<form>
			<table class="table" >
				<tr>
					<td class="col-md-2 text-center" >직책</td>
					<td class="col-md-2 text-center">이름</td>
					<td class="col-md-5 text-center">이메일</td>
			</tr>
				<c:forEach var="pmMemberList" items="${pmMemberList }">
					<tr class="text-center">
					<td class="text-center">${pmMemberList.position_Name }</td>
					<td class="text-center"><a href="#" data-toggle="modal"
											data-target="#${pmMemberList.mem_Name }">${pmMemberList.mem_Name }</a>
											
			<!-- Modal -->
  <div class="modal fade" id="${pmMemberList.mem_Name }" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">상세 정보</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
         <img class="img-thumbnail"
				src="<%=request.getContextPath() %>/resources/upload/${pmMemberList.mem_Img}"
				id="blah" alt="your image" style="border-radius: 50%;
	width: 160px;
	height: 160px;"/>
           <br>
            <c:choose>
            <c:when test="${memPositionView.position_Name eq 'PL' }">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">직책
            <span class="caret"></span></button><br>
            <ul class="dropdown-menu">
            <li><a href="#">PL</a></li>
            <li><a href="#">TA</a></li>
            <li><a href="#">AA</a></li>
            <li><a href="#">DA</a></li>
            <li><a href="#">BA</a></li>
            
            </ul>
 
            </c:when>
            <c:otherwise>
                  직책:<input type="text" id="position_Name" value="${pmMemberList.position_Name }" READONLY><br>
            </c:otherwise>
            </c:choose>
          이메일:<input type="email" id ="mem_Email" value="${pmMemberList.mem_Email }" READONLY><br>
        이름:<input type="text" id="mem_Name" value="${pmMemberList.mem_Name }" READONLY><br>   
        전화번호:<input type="text" id="mem_Phone" value="${pmMemberList.mem_Phone }" READONLY>
       
        </div>
        <div class="modal-footer">
        
        <c:if test="${memPositionView.position_Name eq 'PL' }">
         <input type="button" class="btn btn-default" data-dismiss="modal" id="AccountUpdate" value="직책 수정">
         <input type="button" class="btn btn-default" data-dismiss="modal" id="AccountDelete" value="팀원 탈퇴">
        </c:if>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  													
											
											
											
											
											
											
											
											
											
											</td>
					<td>${pmMemberList.mem_Email }</td>
					</tr>
				</c:forEach>
			</table>
			
			
			<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">등록</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회계 등록</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
                 날짜:<input type="text" id="acc_Date">
          수입:<input type="text" id ="acc_Imp">
        비용:<input type="text" id="acc_Exp">  
        내용:<input type="text" id="acc_Content">
       
        </div>
        <div class="modal-footer">
         <input type="button" class="btn btn-default" data-dismiss="modal" id="AccountInsert" value="회계 등록">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
    
  



		</form>
	</div>

</body>
</html>
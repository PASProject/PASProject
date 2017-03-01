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

<script type="text/javascript">



         $(function() {
            // 콤보박스가 변경될 때 이벤트 발생
            $('#positionSelect').change(function() {
                // 드롭다운리스트에서 선택된 값을 텍스트박스에 출력
                var selectedText =
                   
                   /*   $("option:selected").text();
                    //$("option:selected").text();
 */                  $(":selected").text(); 
                $('#position_Name').val(selectedText);
                 $('#position_Name option:eq(0)').attr("selected","selected"); 
            });
         })   
            
        
            
            
            
            $(function() {
            $('#TeamMemberUpdate').click(function() {
            var position_Name=$("#position_Name").val();
            var mem_Email =$("#mem_Email").val();
            
            var dataList={
                  'position_Name':position_Name,'mem_Email':mem_Email};
            $.ajax({
               
               type:'POST',
               url:'TeamMemberUpdate',
               dataType:'JSON',
               contentType : 'application/json; charset=UTF-8',
            data : JSON.stringify(dataList),
            success : function(data) {
            	alert('직책수정완료');
            	location.href="<%= request.getContextPath()%>/project/pmMemberList";
               
            }
               
               
            });
            })
            
        });
         
         function show(mem_Email){
            
            
            $(function(){
               var dataList = {'mem_Email': mem_Email};
               
               $.ajax({
                 
                  type:'POST',
                  url:'activeMemberModal',
                  dataType:'JSON',
                  data:JSON.stringify(dataList),
                  contentType: 'application/json; charset=UTF-8',
                  success:function(data){
                	 if(data.position_Name=='PL'){
                		 $('#positionSelect').attr('style','display:none');
                		 $('#updateBtn').attr('style','display:none');
                		 $('#deleteBtn').attr('style','display:none');
                	 }else{
                		 $('#positionSelect').attr('style','display:inlline');
                		 $('#updateBtn').attr('style','display:inline');
                		 $('#deleteBtn').attr('style','display:inline');
                		 
                	 } 
                	  
                     $('#mem_Img').attr('src','<%=request.getContextPath()%>/resources/upload/data.mem_Img');
                     $('#position_Name').val(data.position_Name);
                     $('#mem_Email').val(data.mem_Email);
                     $('#mem_Name').val(data.mem_Name);
                     $('#mem_Phone').val(data.mem_Phone);
                     $('#memList').modal('show');
                     
                     
                     
                     
                     
                     
                  }
                  
                  
               })
               
               
               
            })
            
            
            
         }
         
         $(function() {
        
            $('#TeamMemberDelete').click(function(){
               
               
               var mem_Email = $('#mem_Email').val();
               
               
               var dataList={'mem_Email':mem_Email};
               
               
               $.ajax({
               type: 'POST',
               url: 'TeamMemberDelete',
               datType:'json',
               data:JSON.stringify(dataList),
               contentType: 'application/json; charset=UTF-8',
               success:function(data){
                
                  alert('팀원탈퇴성공');
                  location.href="<%= request.getContextPath()%>/project/pmMemberList";
                  
                  
                  
                  
               }
                  
                  
                  
                  
                  
               })
              
           
               
               
            })
            
            
            
         })
         
         
            
            
            
         
    </script>





<div class="col-md-10" id="content">
      <h3 class="page-header"
         style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
         프로젝트 인원<small> ${memPositionView.proj_Name}</small>
      </h3>
      <form>
         <table class="table" >
            <tr>
               <td class="col-md-2 text-center" >직책</td>
               
               <td class="col-md-2 text-center">이름</td>
               <td class="col-md-2 text-center">이메일</td>
               <td class="col-md-4 text-center">마지막 접속 시간</td>
         </tr>
            <c:forEach var="pmMemberList" items="${pmMemberList }">
               <tr class="text-center">
               <td class="text-center">${pmMemberList.position_Name }</td>
               <td class="text-center"><input type="button" class="btn btn-default" onclick="show('${pmMemberList.mem_Email }')" value="${pmMemberList.mem_Name } "/> </td>
               <td>${pmMemberList.mem_Email }</td>
               <td>${pmMemberList.proj_Log_Time}</td>
               </tr>
            </c:forEach>
         </table>
         
         
         
         
         <!-- Modal -->
  <div class="modal fade" id="memList" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">상세 정보</h4>
        </div>
        <div class="modal-body">
            
            <div class="row">
		<div class="col-md-16">
			<h2 class="page-header"
				style="border: 0px; padding-bottom: 0px; margin-top: 0px; margin-left: 10px;">
				<img class="img-thumbnail"
					src="#"
					id="mem_Img" style="width: 80px; height: 80px" onerror = "this.src='<%=request.getContextPath()%>/resources/upload/no.png'"/>

			</h2>
			<div id="bubble" style="height: auto; padding-left: 30px;">
				<div class="row">
					<div id="1">
						<form class="form-horizontal" id="update_form" >
						<div class="form-group">
								<label class="col-md-4 control-label">직책</label>
								<div class="col-md-6  inputGroupContainer">
						    <c:choose>
            <c:when test="${memPositionView.position_Name eq 'PL' }">
            
            <select id="positionSelect">
            <option></option>
            <option>PL</option>
            <option>DA</option>
            <option>TA</option>
            <option>AA</option>
            <option>BA</option>
           </select>
         
           <div class="input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-folder-open"></i></span> 
			<input name="position_Name" id="position_Name" class="form-control" type="text" readonly>
									</div>
 
            </c:when>
            <c:otherwise>
                  직책:<input type="text" id="position_Name" readonly><br>
            </c:otherwise>
            </c:choose>
            </div>
            </div>
            
            
						
							<div class="form-group">
								<label class="col-md-4 control-label">이메일 주소</label>
								<div class="col-md-6  inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"> <i
											class="glyphicon glyphicon-envelope"></i></span> <input
											name="mem_Email" id="mem_Email" 
											class="form-control" type="text" readonly>
									</div>
								</div>
							</div>

							<div class="form-group" >
								<label class="col-md-4 control-label">이름</label>
								<div class="col-md-6  inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <input name="mem_Name"
											 id="mem_Name" class="form-control"
											type="text" readonly>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">전화번호</label>
								<div class="col-md-6  inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-earphone"></i></span> <input
											name="mem_Phone" 
											id="mem_Phone" class="form-control" type="text" readonly>
									</div>
								</div>
							</div>
							</form>
							</div>
							</div>
							</div>
							</div>
							</div>
							
  
        </div>
        <div class="modal-footer">
        
        <c:if test="${memPositionView.position_Name eq 'PL' }">
         <input type="button" id="updateBtn" class="btn btn-default" data-dismiss="modal" id="TeamMemberUpdate" value="직책 수정">
         <input type="button" id="deleteBtn" class="btn btn-danger" data-dismiss="modal" id="TeamMemberDelete" value="팀원 탈퇴">
        </c:if>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          
        </div>
      </div>
      
    </div>
  </div>
         
         
         
         
         
         
      <!--         모달 구분선                                -->   
      



      </form>
   </div>

</body>
</html>
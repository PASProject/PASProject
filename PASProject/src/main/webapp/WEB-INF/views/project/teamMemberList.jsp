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
               /*  $('[name="positionSelect"] option:eq(0)').attr("selected","selected"); */
              
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
				success : function() {
					
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
					<td class="text-center"><input type="button" onclick="show('${pmMemberList.mem_Email }')" value="${pmMemberList.mem_Name } "/> </td>
					<td>${pmMemberList.mem_Email }</td>
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
          <p>Some text in the modal.</p>
         <img class="img-thumbnail"
				src="#"
				id="mem_Img" alt="your image" style="border-radius: 50%;
	width: 160px;
	height: 160px;"/>
           <br>
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
           <input type="text" id="position_Name" readonly/><br>
 
            </c:when>
            <c:otherwise>
                  직책:<input type="text" id="position_Name" readonly><br>
            </c:otherwise>
            </c:choose>
          이메일:<input type="email" id ="mem_Email" READONLY><br>
        이름:<input type="text" id="mem_Name"  READONLY><br>   
        전화번호:<input type="text" id="mem_Phone" >
       
        </div>
        <div class="modal-footer">
        
        <c:if test="${memPositionView.position_Name eq 'PL' }">
         <input type="button" class="btn btn-default" data-dismiss="modal" id="TeamMemberUpdate" value="직책 수정">
         <input type="button" class="btn btn-default" data-dismiss="modal" id="TeamMemberDelete" value="팀원 탈퇴">
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
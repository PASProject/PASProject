<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<script type="text/javascript">

var availableTags = ["�ڵ��ϼ����","Autocomplete","���߷�¥","����"];

$(function() {
  $("#name").autocomplete({source:availableTags});
});


$(function(){
	
	  $('#alertBtn').click(function(){
			alert("<%=session.getAttribute("memberList")%>");
			
		})
});
	  
	  





</script>
<input type="text" id="name">
<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">�ʴ�</button>
 <input type="button" id="alertBtn" value="Ȯ��">
 
 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
   <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">���� �ʴ�</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
                 �˻�:<input type="text" id="mem_Email">
          
      
       
        </div>
        <div class="modal-footer">
         <input type="button" class="btn btn-default" data-dismiss="modal" id="AccountInsert" value="ȸ�� ���">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

</body>
</html>
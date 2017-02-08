<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jquery/lib/jquery.js"></script>
<script type='text/javascript' src="<%=request.getContextPath() %>/resources/jquery/lib/jquery.bgiframe.min.js"></script>
<script type='text/javascript' src="<%=request.getContextPath() %>/resources/jquery/lib/jquery.ajaxQueue.js"></script>
<script type='text/javascript' src="<%=request.getContextPath() %>/resources/jquery/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/jquery/jquery.autocomplete.css" />

</head>	
<body>

	<script>
	var data = [{name : '라쿠시', tel : '01000000000', company : '라쿠시 엔터테인먼트1'}
	,{name : '라쿠시', tel : '01000000000', company : '마쿠시 엔터테인먼트2'}
	,{name : '라쿠시', tel : '01000000000', company : '다쿠시 엔터테인먼트3'}
	,{name : '라쿠시', tel : '01000000000', company : '라쿠시 엔터테인먼트2'}
	,{name : '라쿠시', tel : '01000000000', company : '라쿠시 엔터테인먼트3'}
							
						];
	</script>
	
	 <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
	
	
	 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
         <input type="text" id="searchbox">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
	
	
	
	
	
	
	
	
	
	
	
	
	  
	
	

	

	<script>
	$(document).ready(function() {
	    $("#searchbox").autocomplete(data,{ 
	    	matchContains: true,
	        minChars: 0,
	       width: 172,
	       max: 10,
	       multiple: false,
	       scroll: true,
	       scrollHeight: 300,
	        formatItem: function(item){ return item.company; }


	    }); 
	    
	
	});
	
	
	</script>
        
</body>

</html>
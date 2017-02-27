<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2017. 2. 21.      PC14      최초작성
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
<div class="col-md-10" id="content" style=" padding-left: 0px;
    padding-right: 0px;
    background-color: white;
    border: 0px solid black;">
    <h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			SpreadSheet
			<small>&nbsp;&nbsp;&nbsp;
				<input type="button" value="저장하기" id="saveDataBtn" class="btn btn-default">
				<input type="button" value="돌아가기" id="goBackBtn" class="btn btn-default">
			</small>
		</h2><br>
		
    <div id="spreadsheet" style="width:auto;"></div>
</div>
<script>  
$(function() {
	var initData = '${spreadSheetVo.sp_Content}';
	var ds = initData;
    $("#spreadsheet").kendoSpreadsheet({
        excel: {                
            // Required to enable saving files in older browsers
            proxyURL: "https://demos.telerik.com/kendo-ui/service/export"
        },
        pdf: {                
            proxyURL: "https://demos.telerik.com/kendo-ui/service/export"
        },
        sheets:[JSON.parse(ds)],
        sheetsbar:false,
        toolbar:true
        
    });
    $('#saveDataBtn').on('click',function(){
		var spreadsheet = $("#spreadsheet").data("kendoSpreadsheet");
    	var sheet = spreadsheet.sheetByIndex(0);
    	var doc_Num = '${spreadSheetVo.doc_Num}';
        var dataList = {'sheet':JSON.stringify(sheet),'doc_Num':doc_Num};
    	$.ajax({  
        	type : "POST",
			url : "saveFile",
			dataType : "json", 
			data : JSON.stringify(dataList),
			contentType : "application/json",
			success:function(result){
				if(result){
				 alert('저장되었습니다.');
				}else{
					alert("실패하였습니다.");
				}  
			}
        });
    });
    
    $('#goBackBtn').on('click',function(){
    	location.href="/pas/project/work/workList";
    })
});
      
    </script>        
</body>    
</html>
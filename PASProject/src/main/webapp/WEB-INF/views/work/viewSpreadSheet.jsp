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
    
    <div id="spreadsheet" style="width:auto;"></div>
</div>
<script>
$(function() {
	var initData = '${spreadSheetVo.sp_Content}';
    $("#spreadsheet").kendoSpreadsheet({
        excel: {                
            // Required to enable saving files in older browsers
            proxyURL: "https://demos.telerik.com/kendo-ui/service/export"
        },
        pdf: {                
            proxyURL: "https://demos.telerik.com/kendo-ui/service/export"
        },
        sheets: [JSON.parse(initData)],
        sheetsbar:false,
        toolbar:true
    });
});
    
    </script>   
</body>
</html>
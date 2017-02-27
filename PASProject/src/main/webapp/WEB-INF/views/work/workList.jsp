
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="col-md-10" id="content">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">파일 리스트</h2>
		
		<div>
		
		</div>
		<label for="fileList">30만원을 위하여</label>
		<table class="table table-hover" id="fileList" style="border-bottom: 1px solid #ddd; ">
		<c:if test="${empty documentList}">
			<tr>
				<td>생성한 파일이 없습니다.    <input type="button" class="btn btn-default" id="goCreateDocumentBtn" value="생성하기"></td>
			</tr>
		</c:if>
		<c:forEach items="${documentList}" var = "documentVo">
			<tr>
				<td class="col-md-1"><img
						src="<%=request.getContextPath()%>/resources/img/${documentVo.doc_Img}">
				</td>
				<td class="col-md-4" style="padding:4px;"><a href="<%=request.getContextPath()%>/project/work/selectDocument?doc_Num=${documentVo.doc_Num}&doc_Kind=${documentVo.doc_Kind}" >${documentVo.doc_Name}</a><br>생성 일자 : ${documentVo.doc_Wt_Date}<br> 생성자 : ${documentVo.mem_Name } </td>
				<td class="col-md-4 text-right"><a href="#" id="downloadFile" class="${documentVo.doc_Num}"> 미리보기 /  추출 </a>  |  <a href="<%=request.getContextPath()%>/project/work/deleteDocument?doc_Num=${documentVo.doc_Num}">삭제</a> </td>
			</tr>
		</c:forEach>
		</table>
	</div>
	
	<div id="preViewModal" class="modal fade" >
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span> <span class="sr-only">close</span>
						</button>
						<h4 id="modalTitle" class="modal-title">미리보기</h4>
					</div>
					<div id="modalBody" class="modal-body">
						<div id="preViewZone" style="width:auto; height: 800px;"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="addCalendar">다운로드</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		
	<script>
		$(function(){
			
			$('#goCreateDocumentBtn').on('click',function(){
				location.href = '/pas/project/work/createWorkForm';
			});
			
			$(document).on('click','#downloadFile',function(e){
				e.preventDefault();
				var ds ="";
				var doc_Num = $(this).attr('class');
				var dataList = {'doc_Num':doc_Num};
				$.ajax({
					dataType:'json',
					contentType:'application/json',
					type:'post',
					url:'preViewFile',
					data: JSON.stringify(dataList),
					success:function(data){
						ds = data.sp_Content;
						
					},
					complete : function(){
						view(ds);
					}
				});
				
			})
			
		});
		function view(ds){
			$("#preViewZone").empty();
			setTimeout(function(){
			    $("#preViewZone").kendoSpreadsheet({
			    	 excel: {                
			             // Required to enable saving files in older browsers
			             proxyURL: "https://demos.telerik.com/kendo-ui/service/export"
			         },
			        sheets:[JSON.parse(ds)],
			        columns:100,
			        rows:100,
			        sheetsbar:false,
			        toolbar:true,
			    })
		     	var spreadsheet = $("#preViewZone").data("kendoSpreadsheet");
		        var sheet = spreadsheet.sheetByIndex(0);
		        var range = sheet.range("A1:XY999");  
 		        $('.k-spreadsheet-toolbar').hide();
				$('ul.k-tabstrip-items.k-reset').hide();
				$('div.k-tabstrip-wrapper').hide();
		        range.enable(false);    
		        },2000);     
			
		    $('#preViewModal').modal();
		   
		};
		
	</script>    
</body>        
</html>       
        
<%-- <tr>
				<td class="col-md-1"><img
					src="<%=request.getContextPath()%>/resources/img/excel.png"></td>
				<td class="col-md-4" style="padding:4px;"><a href="#">동석이와 형기의 즐거운 엑셀채팅</a>
				
				<td class="col-md-4 text-right"><a href="#">미리보기</a> |  <a href="#">추출</a>  | <a href="#">삭제</a> </td>

			</tr>
			<tr>
				<td ><img
					src="<%=request.getContextPath()%>/resources/img/ppt.png"></td>
				<td></td>
				<td></td>
				
			</tr>
			<tr>
				<td><img
					src="<%=request.getContextPath()%>/resources/img/doc.png"></td>
				<td></td>
				<td></td>
				 
			</tr>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="col-md-10" id="content">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">파일 리스트</h2>
		
		<div>
		
		</div>
		<label for="fileList">30만원을 위하여</label>
		<table class="table table-hover" id="fileList" style="border-bottom: 1px solid #ddd; ">
		<c:if test="${empty documentList}">
			<tr>
				<td>생성한 파일이 없습니다.    <input type="button" class="btn btn-default" id="goCreateDocumentBtn" value="생성하기"></td>
			</tr>
		</c:if>
		<c:forEach items="${documentList}" var = "documentVo">
			<tr>
				<td class="col-md-1"><img
						src="<%=request.getContextPath()%>/resources/img/${documentVo.doc_Img}">
				</td>
				<td class="col-md-4" style="padding:4px;"><a href="<%=request.getContextPath()%>/project/work/selectDocument?doc_Num=${documentVo.doc_Num}&doc_Kind=${documentVo.doc_Kind}" >${documentVo.doc_Name}</a><br>생성 일자 : ${documentVo.doc_Wt_Date}<br> 생성자 : ${documentVo.mem_Name } </td>
				<td class="col-md-4 text-right"><a href="#" id="preViewBtn" class="${documentVo.doc_Num}"> 미리보기 /  추출 </a>  |  <a href="<%=request.getContextPath()%>/project/work/deleteDocument?doc_Num=${documentVo.doc_Num}">삭제</a> </td>
			</tr>
		</c:forEach>
		</table>
	</div>
	
	<div id="preViewModal" class="modal fade" >
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span> <span class="sr-only">close</span>
						</button>
						<h4 id="modalTitle" class="modal-title">미리보기</h4>
					</div>
					<div id="modalBody" class="modal-body">
						<div id="preViewZone" style="width:auto; height: 800px;"></div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-default" id="exportBtn" value="다운로드">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>      
				</div>
			</div>
		</div>
		
		    
	<script>
		$(function(){
// 		 	$("body").click(function(event){ 

// 		     	alert("clicked:"+event.target.className);
// 		     	/* k-button k-primary */  
// 			//node name을 알고 싶다면
// 			alert("id : "+ event.target.id);   
// 			alert("clicked:"+event.target.nodeName );

// 		}); 
			
			$('#goCreateDocumentBtn').on('click',function(){
				location.href = '/pas/project/work/createWorkForm';
			});   
			    
			$('#exportBtn').on('click',function(){
				var spreadsheet = $("#preViewZone").data("kendoSpreadsheet");
				$('.k-i-file-excel').trigger('click');
			});
			    
			$(document).on('click','#preViewBtn',function(e){
				e.preventDefault();   
				var ds ="";
				var doc_Num = $(this).attr('class');
				var dataList = {'doc_Num':doc_Num};
				$.ajax({
					dataType:'json',
					contentType:'application/json',
					type:'post',
					url:'preViewFile',
					data: JSON.stringify(dataList),
					success:function(data){
						ds = data.sp_Content;
					},
					complete : function(){
						view(ds);
					}
				});
				
			})
			
		});
		function view(ds){
			$("#preViewZone").empty();
			setTimeout(function(){
			    $("#preViewZone").kendoSpreadsheet({
			    	 excel: {                
			             // Required to enable saving files in older browsers
			             proxyURL: "https://demos.telerik.com/kendo-ui/service/export"
			         },
			        sheets:[JSON.parse(ds)],
			        columns:100,
			        rows:100,
			        sheetsbar:false,
			        toolbar:true,
			    })
		     	var spreadsheet = $("#preViewZone").data("kendoSpreadsheet");
		        var sheet = spreadsheet.sheetByIndex(0);
		        var range = sheet.range("A1:XY999");  
 		        $('.k-spreadsheet-toolbar').hide();
				$('ul.k-tabstrip-items.k-reset').hide();
				$('div.k-tabstrip-wrapper').hide();
		        range.enable(false);    
		        },2000);     
			
		    $('#preViewModal').modal();
		   
		};
		          
		    
	</script> 
</body>       
</html>      
<%-- <tr>     
				<td class="col-md-1"><img 
					src="<%=request.getContextPath()%>/resources/img/excel.png"></td>
				<td class="col-md-4" style="padding:4px;"><a href="#">동석이와 형기의 즐거운 엑셀채팅</a>
				
				<td class="col-md-4 text-right"><a href="#">미리보기</a> |  <a href="#">추출</a>  | <a href="#">삭제</a> </td>

			</tr>
			<tr>
				<td ><img
					src="<%=request.getContextPath()%>/resources/img/ppt.png"></td>
				<td></td>
				<td></td>
				
			</tr>
			<tr>
				<td><img
					src="<%=request.getContextPath()%>/resources/img/doc.png"></td>
				<td></td>
				<td></td>
				 
			</tr>
>>>>>>> branch 'master' of https://github.com/PASProject/PASProject.git
			--%>

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
	<script type="text/javascript">
		$(function() {
			$('#AccountInsert').click(function() {
				var acc_Date = $('#acc_Date').val();
				var acc_Imp = $('#acc_Imp').val();
				var acc_Exp = $('#acc_Exp').val();
				var acc_Content = $('#acc_Content').val();
				var proj_Num = $('#proj_Num').val();

				var dataList = {
					'acc_Date' : acc_Date,
					'acc_Imp' : acc_Imp,
					'acc_Exp' : acc_Exp,
					'acc_Content' : acc_Content,
					'proj_Num' : proj_Num
					
				};
				$.ajax({

					type : 'POST',
					url : 'AccountBoardInsert',
					dataType : 'json',
					contentType : 'application/json; charset=UTF-8',
					data : JSON.stringify(dataList),
					success : function(result) {
						alert("등록완료");
						location.href="AccountBoardList";
					}
				});
			})
			
		

		})
		
		
		
		$(function() {
			$('#AccountUpdate').click(function() {
				var acc_Date = $('#upacc_Date').val();
				var acc_Num = $('#upacc_Num').val();
				var acc_Imp = $('#upacc_Imp').val();
				var acc_Exp = $('#upacc_Exp').val();
				var acc_Content = $('#upacc_Content').val();
				var proj_Num = $('#upproj_Num').val();

				var dataList = {
						
				    'acc_Num' : acc_Num,
					'acc_Date' : acc_Date,
					'acc_Imp' : acc_Imp,
					'acc_Exp' : acc_Exp,
					'acc_Content' : acc_Content,
					'proj_Num' : proj_Num
				};
				$.ajax({

					type : 'POST',
					url : 'AccountBoardUpdate',
					dataType : 'json',
					contentType : 'application/json; charset=UTF-8',
					data : JSON.stringify(dataList),
					success : function(result) {
						alert("수정완료");
						location.href="AccountBoardList";
					}
				});
			})
			
		

		})
		
		
		$(function() {
			$('#AccountDelete').click(function() {
				var acc_Date = $('#upacc_Date').val();
				var acc_Num = $('#upacc_Num').val();
				var acc_Imp = $('#upacc_Imp').val();
				var acc_Exp = $('#upacc_Exp').val();
				var acc_Content = $('#upacc_Content').val();
				var proj_Num = $('#upproj_Num').val();

				var dataList = {
						
				    'acc_Num' : acc_Num,
					'acc_Date' : acc_Date,
					'acc_Imp' : acc_Imp,
					'acc_Exp' : acc_Exp,
					'acc_Content' : acc_Content,
					'proj_Num' : proj_Num
				};
				$.ajax({

					type : 'POST',
					url : 'AccountBoardDelete',
					dataType : 'json',
					contentType : 'application/json; charset=UTF-8',
					data : JSON.stringify(dataList),
					success : function(result) {
						alert("삭제완료");
						location.href="AccountBoardList";
					}
				});
			})
			
		

		})
		
		


   $(document).ready(function(){
	 
	   var Imp = parseInt(${sumImp});
	   var Exp = parseInt(${sumExp});
	   
	   var total = Imp-Exp;
	   
	   
   })

	


		
	</script>


	<div class="col-md-10">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			프로젝트 회계<small>총 수입: ${sumImp}원 / 총 지출:${sumExp}원  [total.val();원 ] </small>
		</h2>
		<form>
			<table class="table">
				<tr>
					<td class="col-md-4">날짜</td>
					<td class="col-md-1">수입</td>
					<td class="col-md-1">지출</td>
					<td class="col-md-2 text-center">내용</td>
					<td class="col-md-1">총합</td>
					
				</tr>
				<c:forEach var="AccountBoardList" items="${AccountBoardList }">
					<tr>
						<td><a href="#" data-toggle="modal"
											data-target="#${AccountBoardList.acc_Num}">${AccountBoardList.acc_Date}</a>
											
						<!-- Modal -->
  <div class="modal fade" id="${AccountBoardList.acc_Num}" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">상세 정보</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
          <input type="text" id="upproj_Num" value="${joinProj }">
          <input type="text" id="upacc_Num" value="${AccountBoardList.acc_Num }">
                 날짜:<input type="date" id="upacc_Date" value="${AccountBoardList.acc_Date }">
          수입:<input type="text" id ="upacc_Imp" value="${AccountBoardList.acc_Imp }">
        비용:<input type="text" id="upacc_Exp" value="${AccountBoardList.acc_Exp }">   
        내용:<input type="text" id="upacc_Content" value="${AccountBoardList.acc_Content }">
       
        </div>
        <div class="modal-footer">
         <input type="button" class="btn btn-default" data-dismiss="modal" id="AccountUpdate" value="회계 수정">
         <input type="button" class="btn btn-default" data-dismiss="modal" id="AccountDelete" value="회계삭제">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  					
											
											
											
											
											
											
											</td>
						<td>${AccountBoardList.acc_Imp }</td>
						<td>${AccountBoardList.acc_Exp }</td>
						<td class="col-md-4 text-center">${AccountBoardList.acc_Content }</td>
						<td>${AccountBoardList.acc_Total }</td>
						
					</tr>
				</c:forEach>
				<tr>
			<td colspan="5" align="center"><c:if test="${paging.finalPageNo>0}">
					<c:set value="${paging.prevPageNo}" var="prevPageNo" />
					<c:set value="${paging.finalPageNo}" var="finalPageNo" />

					<c:if test="${paging.pageNo>prevPageNo}">
						<a href="noticeList?page=${prevPageNo}">[이전]</a>
					</c:if>
					<c:forEach begin="1" end="${paging.finalPageNo}" var="i"
						varStatus="status">
						<a href="noticeList?page=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${paging.pageNo<finalPageNo}">
						<a href="noticeList?page=${finalPageNo}">[다음]</a>
					</c:if>
				</c:if></td>
		</tr>
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
         프로젝트번호 <input type="text" id="proj_Num" value="${joinProj }" readonly>
                 날짜:<input type="date" id="acc_Date">
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
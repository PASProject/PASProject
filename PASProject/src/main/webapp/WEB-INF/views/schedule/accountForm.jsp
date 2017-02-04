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
				var proj_Num = '1';

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
					}
				});
			})

		})
		$('#modalPriceLoad').on('click',
				'#pmaSetDate1,#pmaSetDate2,#pmaShowDate1,#pmaShowDate2',
				function() {
					$('#ui-datepicker-div').appendTo($('#uploadModal'));
					$(this).datepicker();
					$(this).datepicker("show");
				});

		
	</script>


	<div class="col-md-10">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			프로젝트 회계<small>총 수입: / 총 지출: </small>
		</h2>
		<form>
			<table class="table">
				<tr>
					<td class="col-md-1">게시물 번호</td>
					<td class="col-md-2">날짜</td>
					<td class="col-md-1">수입</td>
					<td class="col-md-1">지출</td>
					<td class="col-md-4 text-center">내용</td>
					<td class="col-md-1">총합</td>
				</tr>
				<c:forEach var="AccountBoardList" items="${AccountBoardList }">
					<tr>
						<td>${AccountBoardList.acc_Num }</td>
						<td>${AccountBoardList.acc_Date }</td>
						<td>${AccountBoardList.acc_Imp }</td>
						<td>${AccountBoardList.acc_Exp }</td>
						<td class="col-md-4 text-center">${AccountBoardList.acc_Content }</td>
						<td>${AccountBoardList.acc_Total }</td>
					</tr>
				</c:forEach>
			</table>


			<button type="button" class="btn btn-default" data-toggle="modal"
				data-target="#myModal">회계 등록</button>
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content" id="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">회계 등록</h4>
						</div>
						<div class="modal-body">
							날짜 :<input type="text" id="acc_Date"><br> 수입 :<input
								type="text" id="acc_Imp"><br> 지출 :<input
								type="text" id="acc_Exp"><br> 내용 :<input
								type="text" id="acc_Content">
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" id="AccountInsert"
								value="등록">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>



		</form>
	</div>


</body>
</html>
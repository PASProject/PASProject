<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
<h1>ProjectBoard</h1>
	<div style="border: solid 1px black;">
		
		<div style="background: gray">
			<input type="text" id="pb_Title">
			<textarea rows="5" cols="50" id="pb_Content"></textarea><input type="button" value="등록" id="writeBtn">
		</div>
		<div id="reply" style="border: solid 1px black;">
		</div>
	</div>
	<div>
			<input type="button" value="수정" onclick="go_update()">
			<input type="button" value="삭제" onclick="go_delete()">
			
	</div>
		<script type="text/javascript">
			$(document).ready(function(){
				$.ajax({
					url:'projectBoardList',
					dataType:'json',
					contentType : "application/json",
					type:'post',
					success:function(data){
						$.each(data,function(i){
							var date = new Date(data[i].pb_wt_date)
							var year = date.getFullYear();
							var month = (1+date.getMonth());
							month = month>=10? month:'0'+month;
							var day = date.getDate();
							day = day>=10?day:'0'+day;
							var fullD = year+'년'+month+'월'+day+'일';
							var tt = '<div >아이디 : '+data[i].mem_Email +'  /  '+'작성 날짜 : '+fullD+'<div>  ->   '+data[i].pb_Content+'</div></div><br><br>';
							$('div #reply').append(tt); 
						})
					},
					error:function(){
						alert("에러");
					}
				
				})
				
				
				$('#writeBtn').on('click',function(){
					var pb_Content = $('#pb_Content').val();
					var pb_Title = $('#pb_Title').val();
					var dataWrite = {'pb_Content':pb_Content, 'pb_Title':pb_Title};
					$.ajax({
						url:'projectBoardWrite',
						data:JSON.stringify(dataWrite),
						type:'post',
						contentType: 'application/json',
						success: function(data){
							$('#pb_Content').val('');
							$('div #reply').empty();
							$.each(data,function(i){
								var date = new Date(data[i].pb_wt_date)
								var year = date.getFullYear();
								var month = (1+date.getMonth());
								month = month>=10? month:'0'+month;
								var day = date.getDate();
								day = day>=10?day:'0'+day;
								var fullD = year+'년'+month+'월'+day+'일';
								var tt = '<div >아이디 : '+data[i].mem_Email +'  /  '+'작성 날짜 : '+fullD+'<div>  ->'+data[i].pb_Content+'</div></div><br><br>';
								$('div #reply').append(tt); 
							})
						},
						error: function(){
							alert('등록 실패');
						}
					});
			});
		});
		
		function go_update(){
			location.href="projectBoardUpdate?pb_Article_Num=${ProjectBoardVo.pb_Article_Num}";
		}
		
		function go_delete(){
			frm.method = "post";
			frm.action ="projectBoardDelete";
			frm.submit();
		}
	</script>
</body>
</html>
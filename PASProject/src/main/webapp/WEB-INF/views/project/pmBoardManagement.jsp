<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
 <div class="col-md-10" id="content">

		<h3 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			게시판 관리
		</h3>
		<div style="border: 1px solid #498eab; float: left; width:50%; height: 450px">&nbsp;&nbsp;
			<h3 style="margin:10px">게시판 리스트</h3>
			<div id="boardListZone">
				<table class="table table-hover">
				    <thead>
				      <tr>
				        <th>게시판 타이틀</th>
				        <th>생성자</th>
				        <th>생성날짜</th>
				        <th>비고</th>
				      </tr>
				    </thead>
				    <tbody id="boardList">
				     
				    </tbody>
				   </table>
			
			</div>
		</div>
		<div style="border: 1px solid #498eab; float: left; width:50%; height: 450px">&nbsp;&nbsp;
			<h3 style="margin:10px">게시판 생성하기</h3>
			<br>  
			&nbsp;&nbsp;게시판 타이틀 : <input type="text"id ="bm_Title" style="background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;"><br><br>
			 <table class="table table-hover" >
			    <thead>
			      <tr>
			        <th>이름</th>
			        <th>직책</th>
			        <th>읽기권한</th>
			        <th>쓰기권한</th>
			      </tr>
			    </thead>
			<tbody>
			<c:forEach items="${memberList}" var="member">
				<tr id="memItems">
					<td>${member.mem_Name}</td>
					<td> ${member.position_Name}</td>
					<td><label class="checkbox-inline"><input type="checkbox" value="${member.mem_Email}" id="1" >허용</label></td>
					<td><label class="checkbox-inline"><input type="checkbox" value="${member.mem_Email}" id="2">허용</label></td>
				<tr>
			</c:forEach>
			</tbody>
			</table>
			<input type="button" class="btn btn-default pull-right" value="생성하기"  id="createBoardBtn">
		</div>
		<div style = "border: 1px solid #498eab; width:100% ;">&nbsp;&nbsp;
			<h3 style="margin:10px">권한 보기</h3>
			<div>
			<div id="boardName" style="text-align: center; font-size: 20px; font-weight: bold;"></div><br> 
			<table class="table table-hover">
				    <thead>
				      <tr>
				        <th>아이디</th>
				        <th>이름</th>
				        <th>읽기권한</th>
				        <th>쓰기권한</th>
				      </tr>
				    </thead>
				    <tbody id="boardJoinList">
				     
				    </tbody>
				   </table>
			</div>    
		</div>
</div>  
<script>
	$(function(){  
		$.ajax({
			dataType:'json',
			type:'post',
			url:'boardManagementList',  
			success:function(result){
				$('#boardList').empty();
				var dt="";
				$.each(result,function(i){
					dt += "<tr id='listItem' class='"+result[i].bm_Num+"'><td>"+result[i].bm_Title+"</td><td>"+result[i].bm_Mem_Email+"</td>"
			        +"<td>"+result[i].bm_Create_Date+"</td><td><a href='#' onclick='delteBoard("+result[i].bm_Num+")'><span class='glyphicon glyphicon-remove' style='font-size: 12px; margin-left: 5px; margin-right: 5px; color: red;'>"
			        +"</span></a></td></tr>";   
				})
				$('#boardList').append(dt); 
			}
		})
		
		
		$('#createBoardBtn').on('click',function(){
			var memberObj = [];
			var bm_Title = $('#bm_Title').val();
			var dataList = {"bm_Title":bm_Title};
			if(bm_Title==""||bm_Title==null){
				alert("타이틀을 입력해주세요");
				$('#bm_Title').focus();
				return ;
			}
			$.ajax({
				data  :JSON.stringify(dataList),
				dataType:'json',
				contentType:'application/json',
				type:'post',
				url:'insertBoard',  
				success:function(result){
					if(result){
						 $('tbody #memItems').each(function(i){
								var bj_Mem_Email;
								var bj_Write = 'n';
								var bj_Read ='n'; 
								var bj_Mem_Name = $(this).find('td').eq(0).text();
								bj_Mem_Email = $(this).find('input[type="checkbox"]').eq(1).val();
								var d = $(this).find('input[type="checkbox"]');
								d.each(function(){
									if(this.checked){
										if($(this).attr('id')==1){
											bj_Write ='y';
										}else if($(this).attr('id')==2){
											bj_Read = 'y';
										}
									}  
								})
								memberObj = {"bj_Mem_Email":bj_Mem_Email,"bj_Write":bj_Write,"bj_Read":bj_Read,"bj_Mem_Name":bj_Mem_Name};
									$.ajax({
										url:'insertBoardJoin',
										contentType:'application/json',
										data : JSON.stringify(memberObj),
										type:'post',
									})
										
								}); 
					}
				},complete:function(){
					$('label[class="checkbox-inline"]>input[type="checkbox"]').prop("checked",false);
					$.ajax({
						dataType:'json',
						type:'post',
						url:'boardManagementList',
						success:function(result){  
							$('#boardList').empty();
							var dt=""
							$.each(result,function(i){
								dt += "<tr id='listItem' class='"+result[i].bm_Num+"'><td>"+result[i].bm_Title+"</td><td>"+result[i].bm_Mem_Email+"</td>"
						        +"<td>"+result[i].bm_Create_Date+"</td><td><a href='#' onclick='delteBoard("+result[i].bm_Num+")'><span class='glyphicon glyphicon-remove' style='font-size: 12px; margin-left: 5px; margin-right: 5px; color: red;'>"
						        +"</span></a></td></tr>";  
							})
							$('#boardList').append(dt);  
						}
					});  
					$('#bm_Title').val("");

				}  
			})
		});
		$(document).on('click','#listItem',function(e){ 
			e.preventDefault();
			var bm_Num = $(this).attr('class');
			var dt ="";
			var dataList = {'bm_Num':bm_Num};
			$('#boardName').empty();	
			$('#boardName').text($(this).find('td').eq(0).text()); 
			$.ajax({
				contentType:'application/json',
				dataType:'json',
				type:'post',
				data:JSON.stringify(dataList),
				url:'boardJoinList',
				success:function(result){
					$('#boardJoinList').empty();
					$.each(result,function(i){
						dt += "<tr><td>"+result[i].bj_Mem_Email+"</td><td>"+result[i].bj_Mem_Name+"</td>"
						+"<td>"+result[i].bj_Write+"</td><td>"+result[i].bj_Read+"</td></tr>";	
					});
					 dt+="<tr><td colspan='4' style='text-align: center; font-weight: bold;'><a href='#' id='addItem'><span style='color: red'>추가하기</span</a></td></tr>"
					$('#boardJoinList').append(dt);
				}
			});
		});
		
		$(document).on('click','#addItem',function(e){
			e.preventDefault();
			var item = "<tr><td><input type='text'></td><td><input type='text'></td><td>n</td><td>n</td></tr>";
			$(this).parents('tr').before(item);
		})
	})
	
	function delteBoard(bm_Num){
			location.href = "/pas/project/deleteBoard?bm_Num="+bm_Num;
	}
</script>    
  
</body>        
</html>  
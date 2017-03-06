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
		<div style="border: 1px solid #498eab; float: left; width:50%; min-height: 450px;">&nbsp;&nbsp;
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
			        <th>쓰기권한</th>
			        <th>읽기권한</th>
			      </tr>
			    </thead>
			<tbody>
			<c:forEach items="${memberList}" var="member">
				<tr id="memItems">
					<td>${member.mem_Name}</td>
					<td> ${member.position_Name}</td>
					<td><label class="checkbox-inline"><input type="checkbox" value="${member.mem_Email}" id="1">허용</label></td>
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
				      	<th>번호</th>
				        <th>아이디</th>
				        <th>이름</th>
				        <th>쓰기권한</th>
				        <th>읽기권한</th>
				        <th>비고</th>
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
			$('#boardName').append($(this).find('td').eq(0).text()+"<input type='hidden' value='"+bm_Num+"' id='bm_NumZone'>"); 
			$.ajax({
				contentType:'application/json',
				dataType:'json',
				type:'post',
				data:JSON.stringify(dataList),
				url:'boardJoinList',
				success:function(result){
					$('#boardJoinList').empty();
					$.each(result,function(i){
						var idx = i+1;
						dt += "<tr><td>"+idx+"</td><td>"+result[i].bj_Mem_Email+"</td><td>"+result[i].bj_Mem_Name+"</td>"
						+"<td>"+result[i].bj_Write+"</td><td>"+result[i].bj_Read+"</td><td><input type='button' class='btn btn-default' id='updateJoinMemberBtn' value='수정'> </td></tr>";	
					});
					 dt+="<tr><td colspan='6' style='text-align: center; font-weight: bold;'><a href='#' id='addItem'><span style='color: red'>추가하기</span</a></td></tr>"
					$('#boardJoinList').append(dt);
				}
			});
		});
		
		$(document).on('click','#addItem',function(e){
			e.preventDefault();
			var num = $(this).parents('tr').siblings().length + 1;
			var item = "<tr><td>"+num+"</td><td><input type='text' id='bj_Mem_Email' readonly='readonly'></td><td><input type='text' id='bj_Mem_Name' readonly='readonly' ></td>"
			+"<td><label class='checkbox-inline'><input type='checkbox' value='${member.mem_Email}' id='1' >허용</label></td>"
			+"<td><label class='checkbox-inline'><input type='checkbox' value='${member.mem_Email}' id='2' >허용</label></td><td><input type='button' value='확인' class='btn btn-default'><td></tr>";
			$(this).parents('tr').before(item);
		});
		
		$(document).on('click','#updateJoinMemberBtn',function(){
			var mem_Email = $(this).parent().siblings('td').eq(1).text();
			/* var bj_Write =  */
			var obj = $(this).parent();
			var optionItem1 ="";
			var optionItem2="";
			var firstItem = $(this).parent().siblings('td').eq(3).text();
			var secondItem = $(this).parent().siblings('td').eq(4).text();
			if($(this).parent().siblings('td').eq(3).text() =='y'){
				optionItem1 = "<label class='checkbox-inline'><input type='checkbox' value='"+mem_Email+"' id='1' checked>허용</label>";	
			}else{
				optionItem1 = "<label class='checkbox-inline'><input type='checkbox' value='"+mem_Email+"' id='1'>허용</label>";
			}
			
			if($(this).parent().siblings('td').eq(4).text() =='y'){
				optionItem2 = "<label class='checkbox-inline'><input type='checkbox' value='"+mem_Email+"' id='2' checked >허용</label>";
			}else{
				optionItem2 = "<label class='checkbox-inline'><input type='checkbox' value='"+mem_Email+"' id='2' >허용</label>";
			}
			
			obj.siblings('td').eq(3).empty();
			obj.siblings('td').eq(4).empty();
			obj.siblings('td').eq(3).append(optionItem1);
			obj.siblings('td').eq(4).append(optionItem2);
			obj.empty();
			obj.append("<input type='button' class='btn btn-default' id = 'goUpdateBtn' value='확인'>  /  <input type='button' class='btn btn-default' id='cancleBtn' value='취소'>"
						+"<input type='hidden' value='"+firstItem+"' id='firstItem'><input type='hidden' value='"+secondItem+"' id='secondItem'>");
		}) 
		
		$(document).on('click','#goUpdateBtn',function(){
			var obj = $(this).parent().siblings('td');
			var parentObj = $(this).parent();
			var bj_Mem_Email = obj.eq(1).text();
			var bj_Mem_Name = obj.eq(2).text();
			var bj_Write = "n"; 
			var bj_Read = "n";
			var bm_Num =$('#bm_NumZone').val();
			  if(obj.eq(3).find('input[type="checkbox"]').is(':checked')){
				bj_Write = 'y';
			}
			 if(obj.eq(4).find('input[type="checkbox"]').is(':checked')){
				bj_Read = 'y';
			}
			 var dataList = {'bj_Mem_Email':bj_Mem_Email,'bm_Num':bm_Num,'bj_Write':bj_Write,'bj_Read':bj_Read};
			 $.ajax({
				 dataType:'json',
				 contentType:'application/json',
				 data :JSON.stringify(dataList),
				 url:'updateBoardJoin',
				 type:'post',
				 success:function(result){
					 obj.eq(3).empty();
					 obj.eq(4).empty();
					 parentObj.empty(); 
					 obj.eq(3).append(bj_Write);
					 obj.eq(4).append(bj_Read);
					 parentObj.append("<input type='button' class='btn btn-default' id='updateJoinMemberBtn' value='수정'>");
				 } 
			 })	 
		
		});
		
		$(document).on('click','#cancleBtn',function(){
			var firstItem  =$(this).siblings('#firstItem').val();
			var secondItem = $(this).siblings('#secondItem').val();
			var parentObj = $(this).parent();
			parentObj.siblings('td').eq(3).empty();
			parentObj.siblings('td').eq(4).empty();
			parentObj.siblings('td').eq(3).text(firstItem);
			parentObj.siblings('td').eq(4).text(secondItem);
			parentObj.empty();
			parentObj.append("<input type='button' class='btn btn-default' id='updateJoinMemberBtn' value='수정'>");
		});
	})
	
	function delteBoard(bm_Num){   
			location.href = "/pas/project/deleteBoard?bm_Num="+bm_Num;
	}
</script>     
</body>        
</html>  

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>

<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/jquery/lib/jquery.js"></script>
<script type='text/javascript'
	src="<%=request.getContextPath()%>/resources/jquery/lib/jquery.bgiframe.min.js"></script>
<script type='text/javascript'
	src="<%=request.getContextPath()%>/resources/jquery/lib/jquery.ajaxQueue.js"></script>
<script type='text/javascript'
	src="<%=request.getContextPath()%>/resources/jquery/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/jquery/jquery.autocomplete.css" />

	<script>
		var data = "";
		
		$(function() {
			
			$.ajax({
				type : 'POST',
				url : 'pmMemberInvite',
				dataType : 'JSON',
				success : function(d) {
					setData(JSON.parse(d));
				}

			})

			function setData(d) {
				$("#searchbox").autocomplete(
						d,
						{
							matchContains : true,
							minChars : 1,
							width : 310,
							max : 10,
							multiple : false,
							scroll : true,
							scrollHeight : 300,
							formatItem : function(d, i, max) { // suggest 목록에 보여줄 글자
								return i + "/" + max + ": \""
										+ d.mem_Email + "\" ["
										+ d.mem_Name + "]";
							},
							formatMatch : function(d, i, max) { // suggest 검색 대상 필드
								return d.mem_Email + " "
										+ d.mem_Name;
							},
							formatResult : function(d) {
								return d.mem_Email;
							}

						});
			}
			
			$("#inviteInsert")
					.click(
							function() {
								var mem_Email = $("input[type=hidden]").val();
								alert(mem_Email+"알ㄹ라라라라라");
								var d = "";
								
								$('#zone').text("");
								 $.ajax({
											type : 'POST',
											url : 'pmInviteInsert',
											dataType : 'JSON',
											contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
											data : {
												'mem_Email' : mem_Email
											},
											success : function() {
												alert('초대완료!');
												location.href="<%=request.getContextPath()%>/project/pmMemInvite"

											}
										});
								 
								
								

							})
							
							$("#chuga").    click(function(){
								
								var email = $('#searchbox').val();
								var data="";
								data=$('#zone').html();
							    alert(data);
								data +='<a href="#">'+email+' </a> <input type="hidden" id="'+email+'" value="'+email+'"/><br>'; 	
								if(email!=null){
									$('#zone').html(data);	
								}else{
									alert("빈값은 등록할 수 없습니다");
								}
							    
							    
	
							})
		})
	</script>
	<a href="#" onclick="" id=""></a>
	<span class="glyphicon glyphicon-user"></span>
	<input type="text" id="searchbox"><input type="button" id="chuga" value="추가"><br><br>
	<div id = "zone" style="border: 1px solid black"></div>
	
	
	


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
table tr td {
	padding: 10px;
}
</style>
</head>

<body>
	<div class="col-md-10">
		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			프로젝트 게시판 <small>프로젝트 게시판입니다. 경희씨 여기서 잡담하지 마세요.</small>
		</h2>



		<!-- <button type="submit" onclick="go_myProjectList()">내가쓴글 보기</button> -->

		<div class="col-md-10">
			<div id="pbd"
				style="padding: 10px; background-color: white; border: 1px solid #ddd; border-radius: 2px; margin-bottom: 20px;">
				<div style="height: 80px;">
					<form name="frm" method="post" action="pmBoardInsert">
						<table class="col-md-12">
							<tr>
								<td>사진</td>
								<td><textarea style="resize: none; border: none;" rows="2"
										cols="100;" name="pb_Content"></textarea></td>
							</tr>
							<tr>
								<td></td>
								<td><button class="btn btn-default pull-right" type="submit">글올리기</button></td>
							</tr>
						</table>
					</form>


					<div>
						
					

					</div>

				</div>
			</div>



			<c:forEach var="pbList" items="${pbList}">
				<div style="margin-bottom: 20px;">
					<div id="pbd"
						style="padding: 10px; background-color: white; border: 1px solid #ddd; border-bottom: 0px; border-top-left-radius: 2px; border-top-right-radius: 2px;">
						<table class="col-md-12">
							<tr>
								<td rowspan=3>사진</td>
								<td>이름 ${pbList.mem_Email } </td>
								<td class="text-right">
									<div class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown"
											role="button"><span
											class="glyphicon glyphicon-chevron-down"></span></a>
										<ul class="dropdown-menu">
											<li><a href="#">글 수정하기</a></li>
											<li><a href="#">글 삭제하기</a></li>
											<!-- <li><a href="#">Something else here</a></li>
										<li role="separator" class="divider"></li>
										<li class="dropdown-header">Nav header</li>
										<li><a href="#">Separated link</a></li>
										<li><a href="#">One more separated link</a></li> -->
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<td>게시글등록날짜<fmt:formatDate value="${pbList.pb_Wt_Date}" pattern="yyyy-MM-dd"/> </td>
								<td></td>
							</tr>
						</table>

						<div>
							<h3>${pbList.pb_Content}</h3>
						</div>
						<hr style="border-color: #ddd">
						<div style="font-size:">
							<span class="glyphicon glyphicon-thumbs-up">좋아요</span>
							&nbsp;&nbsp;<span class="glyphicon glyphicon-comment">댓글달기</span>
						</div>
					</div>

					<div id="pbd"
						style="background-color: #f5f5f5; border: 1px solid #ddd; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px;">
						<div id = "${pbList.pb_Article_Num}"></div>
							<textarea style="border: none; resize: none;" rows="1" cols="83"
								name="pb_Reply_Content" id = "${pbList.pb_Article_Num}pb_Reply_Content"></textarea>
								
							<input type="button" class="btn btn-default ${pbList.pb_Article_Num }" id="addReply" value="댓글달기" onclick="javascript:reply(${pbList.pb_Article_Num})" />
							
						<br> <br>

					</div>
				</div>
			</c:forEach>




			<script>
			
			$(document).ready(function(){
					 $.ajax({
						url:'selectProjectBoardReply',
						contentType:'application/json',
						dataType:'json',
						type:'POST',
						success:function(data){
							var d ="";
							$.each(data,function(i){
								$.each(data[i],function(j){
									var dt="";
									dt = '<span>작성자  '+data[i][j].pb_Reply_Mem +' / 내용  '+ data[i][j].pb_Reply_Content+'</span><br><br>';
									$('#'+data[i][j].pb_Article_Num).append(dt);
								});
							});
						}
					})
				
			})
			
				function reply(pb_Article_Num){
					
					var Article_Num = pb_Article_Num;
					var pb_Reply_Content = $('#'+Article_Num+'pb_Reply_Content').val();
					var dataList = {'pb_Reply_Content':pb_Reply_Content,'pb_Article_Num':Article_Num};
					
					$.ajax({
						url:'insertProjectBoardReply',
						data: JSON.stringify(dataList),
						contentType:'application/json',
						dataType:'json',
						type:'post',
						success:function(data){
							var dt = "";
							$.each(data,function(i){
								dt += '<span>작성자  '+data[i].pb_Reply_Mem +' / 내용  '+ data[i].pb_Reply_Content+'</span><br><br>';
							});
							
							$('#'+Article_Num).empty();
							$('#'+Article_Num).append(dt);
							$('#'+Article_Num+'pb_Reply_Content').val("");
						}
					});
				}
				

				$(".anser-write input{type=submit}").click(addAnswer);
				function addAnswer(e) {
					e.preventDefault();
					console.log("click!");

					var queryString = $(".anser-write").serialize();
					console.log("query : " + queryString);
				}

				function go_myProjectList() {
					location.href = "pmBoardMyProjectList";
				}
			</script>


		</div>
	</div>
</body>
</html>

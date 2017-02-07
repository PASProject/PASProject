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
				<div style="padding:10px;">
					<table class="col-md-12">
						<tr>
							<td>사진</td>
						</tr>
						<tr>
							<td>
								<form name="frm" method="post" action="pmBoardInsert">
									<textarea style="resize: none; border: none;" rows="2"
										cols="80;" name="pb_Content"></textarea>
									<button class="btn btn-default " type="submit">글올리기</button>
								</form>
							</td>
						</tr>
					</table>

					<hr style="color: #ddd">
					
					<div>
						<span class="glyphicon glyphicon-thumbs-up">좋아요</span>
						&nbsp;&nbsp;<span class="glyphicon glyphicon-comment">댓글달기</span>
					</div>
				</div>
			</div>




			<c:forEach var="pbList" items="${pbList}">

				<div id="pbd"
					style="background-color: white; border: 1px solid #ddd; border-top-left-radius: 2px; border-top-right-radius: 2px;">


					<table class="col-md-12">
						<tr>
							<td rowspan=3>사진</td>
							<td>이름</td>
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
							<td>게시글등록날짜</td>
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
					<form class="anser-write" method="post"
						action="insertProjectBoardReply">
						<textarea style="border: none; resize: none;" rows="1" cols="83"
							name="pb_Reply_Content"></textarea>
						<input type="submit" class="btn btn-default" value="댓글달기" />
						<button class="btn btn-default " type="button">등록</button>
					</form>
					<br> <br>

				</div>
			</c:forEach>




			<script>
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

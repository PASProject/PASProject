<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>


</head>

<body>


	<!-- Page Content -->
	<div class="container">

		<!-- Page Header -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">
					내 프로젝트 목록
					<!-- <small>Secondary Text</small> -->
				<button>생성하기</button>
				</h2>  
				
			</div>
		</div>
		<!-- /.row -->
		<c:choose>
		<c:when test="${empty myProjectList}">
		<h1> 프로젝트를 생성해주세요</h1>
		</c:when>
		<c:otherwise>
		
		<!-- Projects Row -->
		<c:forEach items="${myProjectList}" var="projectVo">
			<div class="col-md-4 portfolio-item">
				<a href="#" onclick="modalOpen();"> <img class="img-responsive"
					src="http://placehold.it/700x400" alt="">
				</a>
				<h3>
					<a href="#">${projectVo.proj_Name }</a>
				</h3>
				<p>${projectVo.proj_Content}</p>
			</div>
		</c:forEach>
		<!-- /.row -->
      
		</c:otherwise>
        </c:choose>
	
		<hr>

		<!-- Pagination -->
		<div class="row text-center">
			<div class="col-lg-12">
				<ul class="pagination">
					<li><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
























		<hr>
		<footer>
			<!-- Footer -->

			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Your Website 2014</p>
				</div>
			</div>
			<!-- /.row -->
		</footer>

	</div>


</body>

</html>

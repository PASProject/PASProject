<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<%--css --%>
<link href="<%=request.getContextPath() %>/resources/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/admin/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/admin/css/font-awesome.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/admin/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/admin/css/pages/dashboard.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/admin/css/pages/report.css" rel="stylesheet">
<%--js --%>
<script src="<%=request.getContextPath() %>/resources/admin/js/jquery-1.7.2.min.js"></script> 
<script src="<%=request.getContextPath() %>/resources/admin/js/excanvas.min.js"></script> 
<script src="<%=request.getContextPath() %>/resources/admin/js/chart.min.js" type="text/javascript"></script> 
<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/js/full-calendar/fullcalendar.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/js/base.js"></script> 

<body>
<div class="col-md-10" id="content">
        <div class="row">
          <div class="col-md-6">
            <div class="card">
              <h3 class="card-title">커뮤니티 게시판</h3>
              <form name="form" method="post" action="freeBoardList">
   				<table class="table table-condensed">
               <c:forEach items="${freeBoardList }" var="freeBoardVo">
                  <tr id="boardContents">
                  <td><a href="<%=request.getContextPath()%>/freeBoard/freeBoardDetail?frb_Article_Num=${freeBoardVo.frb_Article_Num }">${freeBoardVo.frb_Title}</a></td>
                  </tr>
               </c:forEach>
               </table>
         </form>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card">
              <h3 class="card-title">Striped Table</h3>
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="clearfix"></div>
          <div class="col-md-6">
            <div class="card">
              <h3 class="card-title">Bordered Table</h3>
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card">
              <h3 class="card-title">Table Hover</h3>
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="clearfix"></div>
          <div class="col-md-6">
            <div class="card">
              <h3 class="card-title">Condensed Table</h3>
              <table class="table table-condensed">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <td>4</td>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <td>5</td>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card">
              <h3 class="card-title">Responsive Table</h3>
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Username</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td>@mdo</td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>Jacob</td>
                      <td>Thornton</td>
                      <td>@fat</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>Larry</td>
                      <td>the Bird</td>
                      <td>@twitter</td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>Jacob</td>
                      <td>Thornton</td>
                      <td>@fat</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>




<script>
</script>

</body>

</html>











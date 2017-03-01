<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">

<%--css --%>
<link href="<%=request.getContextPath() %>/resources/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/admin/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/admin/css/font-awesome.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/admin/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/admin/css/pages/dashboard.css" rel="stylesheet">

<%--js --%>
<script src="<%=request.getContextPath() %>/resources/admin/js/jquery-1.7.2.min.js"></script> 
<script src="<%=request.getContextPath() %>/resources/admin/js/excanvas.min.js"></script> 
<script src="<%=request.getContextPath() %>/resources/admin/js/chart.min.js" type="text/javascript"></script> 
<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/js/full-calendar/fullcalendar.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/js/base.js"></script> 

<style>
#menuIcon{
margin-bottom:10px;
}
</style>





<title></title>
</head>
<body>
<header>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="index.html">PAS 관리자 페이지 </a>
      <div class="nav-collapse">
        <ul class="nav pull-right">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i> admin <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="<%request.getContextPath();%>/pas/index">Logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <!--/.nav-collapse --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<!-- /navbar -->
<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li><a href="adminMain"><i><img id="menuIcon" src="<%=request.getContextPath() %>/resources/admin/img/dashboard.png"></i><span>대쉬보드</span> </a> </li>
        <li><a href="memberList"><i><img id="menuIcon" src="<%=request.getContextPath() %>/resources/admin/img/multiple-users-silhouette.png"></i><span>회원</span> </a> </li>
        <li><a href="projectList"><i><img id="menuIcon" src="<%=request.getContextPath() %>/resources/admin/img/file.png"></i><span>프로젝트</span> </a></li>
        <li><a href="AdminQnAList"><i><img id="menuIcon" src="<%=request.getContextPath() %>/resources/admin/img/question-mark.png"></i><span>Q&A</span> </a> </li>
        <li><a href="AdminTotalNoticeList"><i><img id="menuIcon" src="<%=request.getContextPath() %>/resources/admin/img/promote.png"></i><span>공지사항</span> </a> </li>
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>
<!-- /subnavbar -->

</header> 

<decorator:body />


</body>
<script>
  

var lineChartData = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
		{
		    fillColor: "rgba(220,220,220,0.5)",
		    strokeColor: "rgba(220,220,220,1)",
		    pointColor: "rgba(220,220,220,1)",
		    pointStrokeColor: "#fff",
		    data: [65, 59, 90, 81, 56, 55, 40]
		},
		{
		    fillColor: "rgba(151,187,205,0.5)",
		    strokeColor: "rgba(151,187,205,1)",
		    pointColor: "rgba(151,187,205,1)",
		    pointStrokeColor: "#fff",
		    data: [28, 48, 40, 19, 96, 27, 100]
		}
	]

}

var myLine = new Chart(document.getElementById("area-chart").getContext("2d")).Line(lineChartData);


var barChartData = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
		{
		    fillColor: "rgba(220,220,220,0.5)",
		    strokeColor: "rgba(220,220,220,1)",
		    data: [65, 59, 90, 81, 56, 55, 40]
		},
		{
		    fillColor: "rgba(151,187,205,0.5)",
		    strokeColor: "rgba(151,187,205,1)",
		    data: [28, 48, 40, 19, 96, 27, 100]
		}
	]

}    

$(document).ready(function() {
var date = new Date();
var d = date.getDate();
var m = date.getMonth();
var y = date.getFullYear();
var calendar = $('#calendar').fullCalendar({
  header: {
    left: 'prev,next today',
    center: 'title',
    right: 'month,agendaWeek,agendaDay'
  },
  selectable: true,
  selectHelper: true,
  select: function(start, end, allDay) {
    var title = prompt('Event Title:');
    if (title) {
      calendar.fullCalendar('renderEvent',
        {
          title: title,
          start: start,
          end: end,
          allDay: allDay
        },
        true // make the event "stick"
      );
    }
    calendar.fullCalendar('unselect');
  },
  editable: true,
  events: [
    {
      title: 'All Day Event',
      start: new Date(y, m, 1)
    },
    {
      title: 'Long Event',
      start: new Date(y, m, d+5),
      end: new Date(y, m, d+7)
    },
    {
      id: 999,
      title: 'Repeating Event',
      start: new Date(y, m, d-3, 16, 0),
      allDay: false
    },
    {
      id: 999,
      title: 'Repeating Event',
      start: new Date(y, m, d+4, 16, 0),
      allDay: false
    },
    {
      title: 'Meeting',
      start: new Date(y, m, d, 10, 30),
      allDay: false
    },
    {
      title: 'Lunch',
      start: new Date(y, m, d, 12, 0),
      end: new Date(y, m, d, 14, 0),
      allDay: false
    },
    {
      title: 'Birthday Party',
      start: new Date(y, m, d+1, 19, 0),
      end: new Date(y, m, d+1, 22, 30),
      allDay: false
    },
    {
      title: 'EGrappler.com',
      start: new Date(y, m, 28),
      end: new Date(y, m, 29),
      url: 'http://EGrappler.com/'
    }
  ]
});
});
</script><!-- /Calendar -->

</html>
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
<body>

<style>
.mtbox{
margin-top:0px !important;
}
.mtbox>.box0>p{
color:white;
}
.box0:hover p {
color:#989898 !important;
}
.mtbox>.box0>p:hover{
color:#989898 !important;
}
</style>

<script language="javascript">

var i=0
window.document.onkeydown = protectKey;
function down() {
        window.footer_cart.scrollBy(0,31)
        return;
}
function up() {
        window.footer_cart.scrollBy(0,-31)
        return;
}
function protectKey()
{
        //새로고침을 막는 스크립트.. F5 번키..
        if(event.keyCode == 116)
        {
                event.keyCode = 0;
                return false;
        }
        //CTRL + N 즉 새로 고침을 막는 스크립트....
        else if ((event.keyCode == 78) && (event.ctrlKey == true))
        {
                event.keyCode = 0;
                return false;
        }
}

</script>

<div class="col-md-10" id="content">

<%--css --%>
<%-- <link href="<%=request.getContextPath() %>/resources/overview/css/bootstrap.css" rel="stylesheet"> --%>
    <!--external css-->
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>


    <link href="<%=request.getContextPath() %>/resources/overview/css/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/overview/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/overview/js/gritter/css/jquery.gritter.css" />
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/overview/lineicons/style.css">   
    
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath() %>/resources/overview/css/style.css" rel="stylesheet"> 
    <link href="<%=request.getContextPath() %>/resources/overview/css/style-responsive.css" rel="stylesheet">


<%--js --%>
    <script src="<%=request.getContextPath() %>/resources/overview/js/chart-master/Chart.js"></script>
<script src="<%=request.getContextPath() %>/resources/overview/js/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/resources/overview/js/jquery-1.8.3.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/overview/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="<%=request.getContextPath() %>/resources/overview/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="<%=request.getContextPath() %>/resources/overview/js/jquery.scrollTo.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/overview/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/resources/overview/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="assets/js/sparkline-chart.js"></script>    
	<script src="assets/js/zabuto_calendar.js"></script>	


<div class="row">
                  <div class="col-lg-9 main-chart">
                 
                  	<div class="row mtbox"  style="height: 180px;">
                  		<div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                  			<div class="box1">
					  			<img id="menuIcon" src="<%=request.getContextPath() %>/resources/overview/img/multiple-users-silhouette2.png">
					  			<h3>${joinMem }</h3>
                  			</div>
					  			<p style="width:105%;">현재 ${joinMem }명의 인원이 프로젝트를 &nbsp;참가 중 입니다.</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<img id="menuIcon" src="<%=request.getContextPath() %>/resources/overview/img/file2.png">
					  			<h3>${countDoc }</h3>
                  			</div>         
					  			<p style="width:105%;">현재 ${countDoc }개의 파일이 작업 중 입니다.</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<img id="menuIcon" src="<%=request.getContextPath() %>/resources/overview/img/money-bag.png">
					  			<h3>${countAccount }</h3>
                  			</div>
					  			<p>현재 ${countAccount }개의 회계정보가 있습니다.</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<img id="menuIcon" src="<%=request.getContextPath() %>/resources/overview/img/calendar.png">
					  			<h3>${countSchedule }</h3>
                  			</div>
					  			<p style="width:105%;">현재 ${countSchedule }개의 일정이 등록 되었습니다.</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<img id="menuIcon" src="<%=request.getContextPath() %>/resources/overview/img/megaphone.png">
					  			<h3>${countProjNotice }</h3>
                  			</div>
					  			<p>현재 ${countProjNotice }개의 프로젝트 공지사항이 등록 되었습니다.</p>
                  		</div>
                  	
                  	</div><!-- /row mt -->	
                  
                      
                      <div class="row mt">
                      <!-- SERVER STATUS PANELS -->
                      	<div class="col-md-4 col-sm-4 mb">
                      		<div class="white-panel pn donut-chart">
                      			<div class="white-header">
						  			<h5>SERVER LOAD</h5>
                      			</div>
								<div class="row">
									<div class="col-sm-6 col-xs-6 goleft">
										<p><i class="fa fa-database"></i> 70%</p>
									</div>
	                      		</div>
								<canvas id="serverstatus01" height="120" width="120"></canvas>
								<script>
									var doughnutData = [
											{
												value: 70,
												color:"#68dff0"
											},
											{
												value : 30,
												color : "#fdfdfd"
											}
										];
										var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
								</script>
	                      	</div><! --/grey-panel -->
                      	</div><!-- /col-md-4-->
                      	

                      	<div class="col-md-4 col-sm-4 mb">
                      		<div class="white-panel pn">
                      			<div class="white-header">
						  			<h5>TOP PRODUCT</h5>
                      			</div>
								<div class="row">
									<div class="col-sm-6 col-xs-6 goleft">
										<p><i class="fa fa-heart"></i> 122</p>
									</div>
									<div class="col-sm-6 col-xs-6"></div>
	                      		</div>
	                      		<div class="centered">
										<img src="assets/img/product.png" width="120">
	                      		</div>
                      		</div>
                      	</div><!-- /col-md-4 -->
                      	
						<div class="col-md-4 mb">
							<!-- WHITE PANEL - TOP USER -->
							<div class="white-panel pn">
								<div class="white-header">
									<h5>TOP USER</h5>
								</div>
								<p><img src="assets/img/ui-zac.jpg" class="img-circle" width="80"></p>
								<p><b>Zac Snider</b></p>
								<div class="row">
									<div class="col-md-6">
										<p class="small mt">MEMBER SINCE</p>
										<p>2012</p>
									</div>
									<div class="col-md-6">
										<p class="small mt">TOTAL SPEND</p>
										<p>$ 47,60</p>
									</div>
								</div>
							</div>
						</div><!-- /col-md-4 -->
                      	

                    </div><!-- /row -->
                    
                    				
					<div class="row">
						<!-- TWITTER PANEL -->
						<div class="col-md-4 mb">
                      		<div class="darkblue-panel pn">
                      			<div class="darkblue-header">
						  			<h5>DROPBOX STATICS</h5>
                      			</div>
								<canvas id="serverstatus02" height="120" width="120"></canvas>
								<script>
									var doughnutData = [
											{
												value: 60,
												color:"#68dff0"
											},
											{
												value : 40,
												color : "#444c57"
											}
										];
										var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
								</script>
								<p>April 17, 2014</p>
								<footer>
									<div class="pull-left">
										<h5><i class="fa fa-hdd-o"></i> 17 GB</h5>
									</div>
									<div class="pull-right">
										<h5>60% Used</h5>
									</div>
								</footer>
                      		</div><! -- /darkblue panel -->
						</div><!-- /col-md-4 -->
						
						
						<div class="col-md-4 mb">
							<!-- INSTAGRAM PANEL -->
							<div class="instagram-panel pn">
								<i class="fa fa-instagram fa-4x"></i>
								<p>@THISISYOU<br/>
									5 min. ago
								</p>
								<p><i class="fa fa-comment"></i> 18 | <i class="fa fa-heart"></i> 49</p>
							</div>
						</div><!-- /col-md-4 -->
						
						<div class="col-md-4 col-sm-4 mb">
							<!-- REVENUE PANEL -->
							<div class="darkblue-panel pn">
								<div class="darkblue-header">
									<h5>REVENUE</h5>
								</div>
								<div class="chart mt">
									<div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,464,655]"></div>
								</div>
								<p class="mt"><b>$ 17,980</b><br/>Month Income</p>
							</div>
						</div><!-- /col-md-4 -->
						
					</div><!-- /row -->
					
					<div class="row mt">
                      <!--CUSTOM CHART START -->
                      <div class="border-head">
                          <h3>VISITS</h3>
                      </div>
                     <div id="container" style="min-width: 300px; height: 400px; margin: 0 auto"></div>
               
					</div><!-- /row -->	
					
                  </div><!-- /col-lg-9 END SECTION MIDDLE -->
                  
                  
      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                  
                  <div class="col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
						<h3>프로젝트 공지사항</h3>
                   <div class="col-lg-3 ds" style="padding-left: 0px; height:415px; width:228px;">
                     <table class="table">
					   <c:forEach var="NoticeList" items="${NoticeList }" begin="${paging.beginNo}" end="${paging.endNo}">
						<tr>
						<td style="width: 40px;">${NoticeList.notice_Num }</td>
						<td><b><a href="<%=request.getContextPath() %>/project/pmNoticeDetail?proj_Num=${NoticeList.proj_Num}&notice_Num=${NoticeList.notice_Num}">${NoticeList.notice_Title }</a></b></td>
						</tr>
						</c:forEach>
					 </table>
                   </div>                
               
						
				   <div class="col-lg-3 ds" style="padding-left: 0px; height:800px; width:228px;">
					     <h3>참가 중인 맴버</h3>
                      <table class="table">
 
					   <c:forEach var="joinmember" items="${joinmember }" begin="${paging1.beginNo}" end="${paging1.endNo}">
						<tr>
						<td><img style="border-radius:50%; width:40px; height:40px; margin-right:5px;" src="/pas/resources/upload/${joinmember.mem_Img }" onerror="this.src=&quot;/pas/resources/upload/no.png&quot;">
						
						${joinmember.mem_Name } (${joinmember.position_Name })<br>　　　　${joinmember.mem_Email }</td>
						</tr>
					
					   </c:forEach>
					  </table>
				    </div>

                        <!-- CALENDAR-->
                        <div id="calendar" class="mb">
                            <div class="panel green-panel no-margin">
                                <div class="panel-body">
                                    <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                        <div class="arrow"></div>
                                        <h3 class="popover-title" style="disadding: none;"></h3>
                                        <div id="date-popover-content" class="popover-content"></div>
                                    </div>
                                    <div id="my-calendar"></div>
                                </div>
                            </div>
                        </div><!-- / calendar -->
                      
                  </div><!-- /col-lg-3 -->
              </div><! --/row --></div>
           
<script>
/* $(function(){
	$.ajax({
		url:"",
		type:'post',
		dataType:'',
		success:function(data){
			Highcharts(data);
		}
	})
}); */

Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'World\'s largest cities per 2014'
    },
    subtitle: {
        text: 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
    },
    xAxis: {
        type: 'category',
        labels: {
            rotation: -45,
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Population (millions)'
        }
    },
    legend: {
        enabled: false
    },
    tooltip: {
        pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>'
    },
    series: [{
        name: 'Population',
        data: [
            ['Shanghai', 23.7],
            ['Lagos', 16.1],
            ['Istanbul', 14.2],
            ['Karachi', 14.0],
            ['Mumbai', 12.5],
            ['Moscow', 12.1]
    ],
        dataLabels: {
            enabled: true,
            rotation: -90,
            color: '#FFFFFF',
            align: 'right',
            format: '{point.y:.1f}', // one decimal
            y: 10, // 10 pixels down from the top
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    }]
});

</script>
</body>

</html>











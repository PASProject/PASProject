<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title></title>
</head>    
<body>
<style>
#big_stats .stat{
width:20% !important;
}
</style>
<div class="main">
  <div class="main-inner">
    <div class="container">
      <div class="row">
        <div class="span6">
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3>현황</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
                  <div id="big_stats" class="cf">
                     <div class="stat"><h3>오늘 방문자</h3><span class="value">${total_proj }</span> </div>
                   
                   <div class="stat"><h3>회원 수</h3><span class="value" style="margin-top:10px;">${total_Mem }</span> </div>
                    <!-- .stat -->
                    
                    
                    <div class="stat"><h3>프로젝트 수</h3><span class="value">${total_proj }</span> </div>
                    <!-- .stat -->
                    
                    <div class="stat"><h3>미답변 수</h3><span class="value">${total_QnaN }</span> </div>
                    <!-- .stat -->
                   
                  </div>
                </div>
                <!-- /widget-content --> 
                
              </div>
            </div>
          </div>
          <!-- /widget -->
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Recent News</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div id='calendar'>
              </div>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
          
        </div>
        <!-- /span6 -->
        <div class="span6">
          <!-- /widget -->
          <div class="widget">
            <div class="widget-header"> <i class="icon-signal"></i>
              <h3>방문자수 그래프</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <canvas id="area-chart" class="chart-holder" height="250" width="538"> </canvas>
              <!-- /area-chart --> 
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
          <div class="widget widget-table action-table">
            <div class="widget-header"> <i class="icon-th-list"></i>
              <h3>숫자로 이해하는 블루마인</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                    <th> Free Resource </th>
                    <th> Download</th>
                    <th class="td-actions"> </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>오늘 가입한 회원</td>
                    <td>
                    <c:forEach items="${todayMemberList}" var="memberVo">
                    <span id="todayMem"> 
                    ${memberVo.mem_Name},&nbsp;
                    </span>
                    </c:forEach>
                    <span id="asdf">                   
                    </span>
                    <script>
                    $(function(){
                    	var a = $('#todayMem').text();
                    	var b = a.slice(0,-2);
                    	})
                    </script>
                    </td>
                    <td>${joinCount} 명 </td>
                  </tr>
                  <tr>
                    <td>오늘 생성된 프로젝트 </td>
                    <td>
                     <c:forEach items="${projCreateList}" var="ProjectVo">
                    ${ProjectVo.proj_Name},&nbsp;
                    </c:forEach>
                  
                    </td>
                    <td>${projCount} 개</td>
                  </tr>
                
                  <tr>
                    <td>총 방문자 수</td>
                    <td> ${visitorNum} 번</td>
                    <td></td>
                    
                  </tr>
                  <tr>
                    <td> 총 누적 탈퇴회원</td>
                    <td> 
                    <c:forEach items="${exit_MemList}" var="memberVo">
                    ${memberVo.mem_Name},&nbsp;
                    </c:forEach>
                    </td>
                    <td> ${exitCount} 명</td>
                  </tr>
                  <tr>
                    <td> 활동 지수</td>
                    <td> http://www.egrappler.com/ </td>
                    <td class="td-actions"><a href="javascript:;" class="btn btn-small btn-success"><i class="btn-icon-only icon-ok"> 
                    </i></a><a href="javascript:;" class="btn btn-danger btn-small"><i class="btn-icon-only icon-remove"> </i></a></td>
                  </tr>
                
                </tbody>
              </table>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget --> 
          
        </div>
        <!-- /span6 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /main-inner --> 
</div>
<!-- /main -->
<div class="extra">
  <div class="extra-inner">
    <div class="container">
      <div class="row">
                    <div class="span3">
                        <h4>
                            About Free Admin Template</h4>
                        <ul>
                            <li><a href="javascript:;">EGrappler.com</a></li>
                            <li><a href="javascript:;">Web Development Resources</a></li>
                            <li><a href="javascript:;">Responsive HTML5 Portfolio Templates</a></li>
                            <li><a href="javascript:;">Free Resources and Scripts</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Support</h4>
                        <ul>
                            <li><a href="javascript:;">Frequently Asked Questions</a></li>
                            <li><a href="javascript:;">Ask a Question</a></li>
                            <li><a href="javascript:;">Video Tutorial</a></li>
                            <li><a href="javascript:;">Feedback</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Something Legal</h4>
                        <ul>
                            <li><a href="javascript:;">Read License</a></li>
                            <li><a href="javascript:;">Terms of Use</a></li>
                            <li><a href="javascript:;">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Open Source jQuery Plugins</h4>
                        <ul>
                            <li><a href="http://www.egrappler.com">Open Source jQuery Plugins</a></li>
                            <li><a href="http://www.egrappler.com;">HTML5 Responsive Tempaltes</a></li>
                            <li><a href="http://www.egrappler.com;">Free Contact Form Plugin</a></li>
                            <li><a href="http://www.egrappler.com;">Flat UI PSD</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                </div> 
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /extra-inner --> 
</div>
<!-- /extra -->
<div class="footer">
  <div class="footer-inner">
    <div class="container">
      <div class="row">
        <div class="span12"> &copy; 2013 <a href="http://www.egrappler.com/">Bootstrap Responsive Admin Template</a>. </div>
        <!-- /span12 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /footer-inner --> 
</div>


</body>
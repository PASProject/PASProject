<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

   


    <!-- Core CSS - Include with every page -->

<%--     <link href="<%=request.getContextPath() %>/resources/test/assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
   <link href="<%=request.getContextPath() %>/resources/test/assets/css/style.css" rel="stylesheet" />
      <link href="<%=request.getContextPath() %>/resources/test/assets/css/main-style.css" rel="stylesheet" /> --%>
    <!-- Page-Level CSS -->
    <link href="<%=request.getContextPath() %>/resources/test/assets/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />

    <!--  wrapper -->
  
            <!-- <div class="row">
                  page header
              
                end  page header
            </div> -->
       
                <div style="width:100%;">
                    <!--  Area Chart -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            회계 내역
                        </div>
                        <div class="panel-body2">
                            <div id="morris-area-chart"></div>
                        </div>
                    </div>
                    <!-- End Area Chart -->
                </div>
         
    <!-- Core Scripts - Include with every page -->

    <script src="<%=request.getContextPath() %>/resources/test/assets/plugins/pace/pace.js"></script>
    <script src="<%=request.getContextPath() %>/resources/test/assets//scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="<%=request.getContextPath() %>/resources/test/assets/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/test/assets/plugins/morris/morris.js"></script>
    <script src="<%=request.getContextPath() %>/resources/test/assets/scripts/morris-demo.js"></script>



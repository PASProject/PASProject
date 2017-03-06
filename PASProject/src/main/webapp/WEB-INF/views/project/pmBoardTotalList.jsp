<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2017. 3. 6.      PC14      최초작성
* Copyright (c) 2017 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
 <div class="col-md-10" id="content">
    <h3 class="page-header"
            style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
            <span class="glyphicon glyphicon-globe"></span>${boardTotalName}
         </h3>
         
         
        <table class="table table-hover">
               <tr class="text-center">
                  <th style="width:10%">번호</th>
                  <th style="width:60%">제목</th>
                  <th style="width:15%">작성자</th>
                  <th style="width:15%">작성일</th>
               </tr>
               <c:forEach items="${boardTotalList}" var="boardTotalVo" varStatus="status">
                  <tr id="boardContents">
                     <td>${status.count }</td>
                     <td><a href="#">${boardTotalVo.bt_Title}</a></td>
                     <td>${boardTotalVo.bt_Mem_Email}</td>
                     <td><fmt:formatDate value="${boardTotalVo.bt_Wt_Date}" pattern="yyyy-MM-dd" /></td>
                  </tr>
               </c:forEach>
            </table>
             <input type="button" class="btn btn-default" value="글쓰기">
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.container {
   padding: auto;
}
</style>

</head>
<body>
   <div class="col-md-10" id="content">
      <c:if test="${delete == 'yes' }">
         <script type="text/javascript">
            alert("삭제 되었습니다.");
         </script>
      </c:if>
      <!-- Page Header -->

      
         <h3 class="page-header"
            style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
            <span class="glyphicon glyphicon-globe"></span>FreeBoard <small>자유롭게 이야기하세요</small>
         </h3>

         <form name="form" method="post" action="freeBoardList">
            <!--    <form action="QnaBoardSearch" method="post">    -->

            <br> <select name="keyField" size="1">
               <option value="title" selected>제목</option>
               <option value="number" selected>글번호</option>
               <option value="content" selected>내용</option>
               <option value="name" selected>작성자</option>
               <option value="title_Content" selected>제목+내용</option>
               <option value="tag" selected>태그</option>
            </select> <input type="text" size="20" name="keyword" value="${keyword}">
            <input class="btn btn-default" type="submit" value="검색"> <br>



            <table class="table table-hover">
               <tr class="text-center">
                  <th class="col-md-1" >번호</th>
                  <th class="col-md-6">제목</th>
                  <th class="col-md-1" >작성자</th>
                  <th class="col-md-2">작성일</th>
                  <th class="col-md-1">조회수</th>
                  <th class="col-md-1">추천수</th>
               </tr>
               <c:forEach items="${freeBoardList }" var="freeBoardVo"
                  begin="${paging.beginNo}" end="${paging.endNo}">
                     
                  <tr id="boardContents">
                     <td>${freeBoardVo.frb_Article_Num }</td>
                     
                     <td><div><span style="display:none;" id="tag${freeBoardVo.frb_Article_Num }">${freeBoardVo.frb_Tag}</span></div>
                       <div class="btnGen${freeBoardVo.frb_Article_Num }"></div>
                            <script>
                           $(function(){
                        	   var tags = $('#tag${freeBoardVo.frb_Article_Num }').text();
                               var a = tags.split(',');
                               for (i = 0; i < a.length; i++){
                            	   var result = a[i];
                            	   $('.btnGen${freeBoardVo.frb_Article_Num }').append($('<button/>',{
                            		   class : "btn btn-info btn-xs",
                            		   text : result
                            	   } 
                            	   ))
                               }
                               $('#btn${freeBoardVo.frb_Article_Num }').text(result);
                               $('.btn.btn-info.btn-xs').css({
                            	   'margin-right':'5px'
                               })
                           })
                   
                            </script>
                             <!--  <script>
                     		
                              
                     	$(function(){
                    	/*  var a = $('.tag${freeBoardVo.frb_Tag}'); */
                    	
                    		var a = $('#tag${freeBoardVo.frb_Tag}').text(); 
                   			var b = 	
                    	
                    		var asplit = a.split('#');
                    		for(var i in asplit){
                    			alert(asplit[i]);
                    		}
                    	
                    	
                    	
                    	
                     		})
                     
                     </script>   --> 
                     <h4><a href="<%=request.getContextPath()%>/freeBoard/freeBoardDetail?frb_Article_Num=${freeBoardVo.frb_Article_Num }">${freeBoardVo.frb_Title}</a></h4></td>
                     <td >${freeBoardVo.mem_Name}</td>
                     <td ><fmt:formatDate
                           value="${freeBoardVo.frb_Wt_Date}" pattern="yyyy-MM-dd" /></td>
                     <td>${freeBoardVo.frb_Inq_Count }</td>
                     <td>${freeBoardVo.frb_Like_Count }</td>
                  </tr>
               </c:forEach>
            </TABLE>
         </form>

       <form name="form" method="post" action="frb_myPost">
         <input type="button" class="btn btn-default" value="글쓰기"
            onclick="wrtie_form()">
            <button id = "ReadFrbPost" class="btn btn-default" type="submit">내가 쓴 글보기</button>
       </form>


            <c:choose>
               <c:when test='${!empty freeBoardVo.mem_Email }'>
                  <script>
                     $(function() {
                        $('#ReadFrbPost').hide();
                     })
                  </script>
                  <input class="btn btn-default inline" type="button" onclick="freeBoardList()" value="목록">
                  
                  <div class="col-md-12 text-center">
                     <c:if test="${paging.finalPageNo>0}">
                        <c:set value="${paging.prevPageNo}" var="prevPageNo" />
                        <c:set value="${paging.finalPageNo}" var="finalPageNo" />
                        <nav aria-label="Page navigation example">
                           <ul class="pagination justify-content-center">

                              <li class="page-item"><a class="page-link"
                                 href="frb_myPost?page=${firstPageNo}" tabindex="-1">첫                                 
                                    페이지</a></li>


                              <c:forEach begin="1" end="${paging.finalPageNo}" var="i"
                                 varStatus="status">
                                 <li class="page-item" id="number"><a class="page-link"
                                    href="frb_myPost?page=${i}">${i}</a></li>
                                 <script>
                                    $('li')
                                          .each(
                                                function() {
                                                   if (window.location.href
                                                         .indexOf($(
                                                               this)
                                                               .find(
                                                                     'a:first')
                                                               .attr(
                                                                     'href')) > -1) {
                                                      $(this)
                                                            .addClass(
                                                                  'active')
                                                            .siblings()
                                                            .removeClass(
                                                                  'active');
                                                   }
                                                });
                                 </script>
                              </c:forEach>
                              <li class="page-item"><a class="page-link"
                                 href="frb_myPost?page=${finalPageNo}">끝 페이지</a></li>
                           </ul>
                        </nav>
                     </c:if>
                  </div>   
              
           
      </c:when>

      <c:otherwise>
      <div class="col-md-12 text-center">
                     <c:if test="${paging.finalPageNo>0}">
                        <c:set value="${paging.prevPageNo}" var="prevPageNo" />
                        <c:set value="${paging.finalPageNo}" var="finalPageNo" />
                        <nav aria-label="Page navigation example">
                           <ul class="pagination justify-content-center">

                              <li class="page-item"><a class="page-link"
                                 href="freeBoardList?page=${firstPageNo}" tabindex="-1">첫페이지</a></li>


                              <c:forEach begin="1" end="${paging.finalPageNo}" var="i"
                                 varStatus="status">
                                 <li class="page-item" id="number"><a class="page-link"
                                    href="freeBoardList?page=${i}">${i}</a></li>
                                 <script>
                                    $('li')
                                          .each(
                                                function() {
                                                   if (window.location.href
                                                         .indexOf($(
                                                               this)
                                                               .find(
                                                                     'a:first')
                                                               .attr(
                                                                     'href')) > -1) {
                                                      $(this)
                                                            .addClass(
                                                                  'active')
                                                            .siblings()
                                                            .removeClass(
                                                                  'active');
                                                   }
                                                });
                                 </script>
                              </c:forEach>
                              <li class="page-item"><a class="page-link"
                                 href="freeBoardList?page=${finalPageNo}">끝 페이지</a></li>
                           </ul>
                        </nav>
                     </c:if>
                  </div>
</c:otherwise>
</c:choose>
 </div> 


   
   <script>
      
         
   
      function freeBoardList(){
         location.href ="freeBoardList";
      }
      function wrtie_form() {
         location.href = "freeBoardWrite";
      }
   </script>

</body>

</html>

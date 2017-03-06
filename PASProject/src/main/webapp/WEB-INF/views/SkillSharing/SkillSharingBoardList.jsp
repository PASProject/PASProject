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
      <c:if test="${modify == 'yes' }">
         <script type="text/javascript">
            alert("수정 되었습니다.");
         </script>
      </c:if>
      <!-- Page Header -->

      
         <h3 class="page-header"
            style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
            <span class="glyphicon glyphicon-qrcode"></span>SkillSharingBoard <small>신기술 공유 게시판</small>
         </h3>

         <form name="form" method="post" action="SkillSharingBoardList">
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
                  <th class="col-md-1">작성자</th>
                  <th class="col-md-2" >작성일</th>
                  <th class="col-md-1" >조회수</th>
                  <th class="col-md-1" >추천수</th>
               </tr>
               <c:forEach items="${skillSharingBoardList }" var="skillSharingBoardVo"
                  begin="${paging.beginNo}" end="${paging.endNo}">
                  <tr id="boardContents">
                     <td >${skillSharingBoardVo.ssb_Article_Num }</td>
                     
                     <td><div><span style="display:none;" id="tag${skillSharingBoardVo.ssb_Article_Num}">${skillSharingBoardVo.ssb_Tag}</span></div>
                     <div class="btnGen${skillSharingBoardVo.ssb_Article_Num}"></div>
                     <script>
                     $(function(){
                  	   var tags = $('#tag${skillSharingBoardVo.ssb_Article_Num}').text();
                         var a = tags.split(',');
                         for (i = 0; i < a.length; i++){
                      	   var result = a[i];
                      	   $('.btnGen${skillSharingBoardVo.ssb_Article_Num}').append($('<button/>',{
                      		   class : "btn btn-info btn-xs",
                      		   text : result
                      	   } 
                      	   ))
                         }
                        
                         $('.btn.btn-info.btn-xs').css({
                      	   'margin-right':'5px',
                    	   'margin-bottom':'2px'
                         })
                     })
                     </script>
                     
                     <a href="<%=request.getContextPath()%>/SkillSharing/SkillSharingDetail?ssb_Article_Num=${skillSharingBoardVo.ssb_Article_Num }">${skillSharingBoardVo.ssb_Title}</a></td>
                     
                     
                       
                       <div class="btnGen${freeBoardVo.frb_Article_Num }"></div>
                            <script>
                          
                   
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
                     <a href="<%=request.getContextPath()%>/freeBoard/freeBoardDetail?frb_Article_Num=${freeBoardVo.frb_Article_Num }">${freeBoardVo.frb_Title}</a></td>
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     <td>${skillSharingBoardVo.mem_Name}</td>
                     <td ><fmt:formatDate
                           value="${skillSharingBoardVo.ssb_wt_date}" pattern="yyyy-MM-dd" /></td>
                     <td>${skillSharingBoardVo.ssb_Inq_Count }</td>
                     <td>${skillSharingBoardVo.ssb_Like_Count }</td>
                  </tr>
               </c:forEach>
            </TABLE>
         </form>

		 <form name="form" method="post" action="skill_myPostList">
         <input type="button" class="btn btn-default" value="글쓰기"
            onclick="wrtie_form()">
            <button id = "ReadssbPost" class="btn btn-default" type="submit">내가 쓴 글보기</button>
 		</form>


            <c:choose>
               <c:when test='${!empty skillSharingBoardVo.mem_Email }'>
                  <script>
                     $(function() {
                        $('#ReadssbPost').hide();
                     })
                  </script>
                  <input class="btn btn-default inline" type="button" onclick="skillSharingBoardList()" value="목록">
                  
                  <div class="col-md-12 text-center">
                     <c:if test="${paging.finalPageNo>0}">
                        <c:set value="${paging.prevPageNo}" var="prevPageNo" />
                        <c:set value="${paging.finalPageNo}" var="finalPageNo" />
                        <nav aria-label="Page navigation example">
                           <ul class="pagination justify-content-center">

                              <li class="page-item"><a class="page-link"
                                 href="skill_myPostList?page=${firstPageNo}" tabindex="-1">첫                                 
                                    페이지</a></li>


                              <c:forEach begin="1" end="${paging.finalPageNo}" var="i"
                                 varStatus="status">
                                 <li class="page-item" id="number"><a class="page-link"
                                    href="skill_myPostList?page=${i}">${i}</a></li>
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
                                 href="skill_myPostList?page=${finalPageNo}">끝 페이지</a></li>
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
                                 href="SkillSharingBoardList?page=${firstPageNo}" tabindex="-1">첫페이지</a></li>


                              <c:forEach begin="1" end="${paging.finalPageNo}" var="i"
                                 varStatus="status">
                                 <li class="page-item" id="number"><a class="page-link"
                                    href="SkillSharingBoardList?page=${i}">${i}</a></li>
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
                                 href="SkillSharingBoardList?page=${finalPageNo}">끝 페이지</a></li>
                           </ul>
                        </nav>
                     </c:if>
                  </div>
</c:otherwise>
</c:choose>
 </div> 


   
   <script>
   	
   		
   
      function skillSharingBoardList(){
         location.href ="SkillSharingBoardList";
      }
      function wrtie_form() {
         location.href = "SkillSharingWrite";
      }
   </script>

</body>

</html>
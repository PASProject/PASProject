<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<body>
<!-- 	<script src="http://momentjs.com/downloads/moment-with-locales.min.js"></script> -->
<style>
.tableContents {
	text-overflow: ellipsis;
}

li {
	word-break: break-all;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	table-layout: fixed;
	display: block;
}
</style>
<!-- 	<script>
	moment.lang('ko', {
	    weekdays: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"], 
	    weekdaysShort: ["일","월","화","수","목","금","토"],
	});
		$(function() {
			var m = moment();
			var month = m.format("MM");
			var date = m.format("DD")
			var day = m.format("ddd");
			alert(day);
			var a = $('.day').text();
			alert(a);
		})
	</script> -->
	<div class="col-md-10" id="content">

		<h2 class="page-header"
			style="PADDING-BOTTOM: 0PX; BORDER-BOTTOM: 0PX">
			주간 일정 체크
			<!-- <small>자유롭게 이야기하세요</small> -->
		</h2>
		<script>
			
		</script>
		<table class="table table-bordered col-md-7"
			style="table-layout: fixed;">
			<thead>
				<tr>
				<c:forEach items="${weekly_dateList}" var="ScheduleCalendarVo">
					<th class="col-md-1 day">${ScheduleCalendarVo.dy} ${ScheduleCalendarVo.dt}</th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="tableContents">
						<ul style="font-size: 12px;">
							<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
								<c:if test='${scheduleCalendarVo.start_Day eq "월요일" }'>
									<li><span style="color: #425bd6; font-weight: bold;">시작&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Monday_Start">${scheduleCalendarVo.sc_Title }</a>
									</li>
								</c:if>
							</c:forEach>
							<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">

								<c:if test='${scheduleCalendarVo.end_Day eq "월요일" }'>
									<li><span style="color: #fd7037; font-weight: bold;">마감&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Monday_End">${scheduleCalendarVo.sc_Title}</a>
									</li>
								</c:if>

							</c:forEach>
						</ul>

					</td>
					<td class="tableContents">
						<ul style="font-size: 12px;">
							<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
								<c:if test='${scheduleCalendarVo.start_Day eq "화요일" }'>
									<li><span style="color: #425bd6; font-weight: bold;">시작&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Tuesday_Start">${scheduleCalendarVo.sc_Title }</a>
									</li>
								</c:if>
							</c:forEach>
							<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">

								<c:if test='${scheduleCalendarVo.end_Day eq "화요일" }'>
									<li><span style="color: #fd7037; font-weight: bold;">마감&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Tuesday_End">${scheduleCalendarVo.sc_Title}</a>
									</li>
								</c:if>

							</c:forEach>
						</ul>

					</td>
					<td class="tableContents">
						<ul style="font-size: 12px;">
							<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
								<c:if test='${scheduleCalendarVo.start_Day eq "수요일" }'>
									<li><span style="color: #425bd6; font-weight: bold;">시작&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Wednesday_Start">${scheduleCalendarVo.sc_Title }</a>
									</li>
								</c:if>
							</c:forEach>
							<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">

								<c:if test='${scheduleCalendarVo.end_Day eq "수요일" }'>
									<li><span style="color: #fd7037; font-weight: bold;">마감&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Wednesday_End">${scheduleCalendarVo.sc_Title}</a>
									</li>
								</c:if>

							</c:forEach>
						</ul>

					</td>
					<td class="tableContents">
						<ul style="font-size: 12px;">
							<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
								<c:if test='${scheduleCalendarVo.start_Day eq "목요일" }'>
									<li><span style="color: #425bd6; font-weight: bold;">시작&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Thursday_Start">${scheduleCalendarVo.sc_Title }</a>
									</li>
								</c:if>
							</c:forEach>
							<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">

								<c:if test='${scheduleCalendarVo.end_Day eq "목요일" }'>
									<li><span style="color: #fd7037; font-weight: bold;">마감&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Thursday_End">${scheduleCalendarVo.sc_Title}</a>
									</li>
								</c:if>

							</c:forEach>
						</ul>

					</td>
					<td class="tableContents">
						<ul style="font-size: 12px;">
							<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
								<c:if test='${scheduleCalendarVo.start_Day eq "금요일" }'>
									<li><span style="color: #425bd6; font-weight: bold;">시작&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Friday_Start">${scheduleCalendarVo.sc_Title }</a>
									</li>
								</c:if>
							</c:forEach>
							<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">

								<c:if test='${scheduleCalendarVo.end_Day eq "금요일" }'>
									<li><span style="color: #fd7037; font-weight: bold;">마감&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Friday_End">${scheduleCalendarVo.sc_Title}</a>
									</li>
								</c:if>

							</c:forEach>
						</ul>

					 </td>
					<td class="tableContents">
						<ul style="font-size: 12px;">
							<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
								<c:if test='${scheduleCalendarVo.start_Day eq "토요일" }'>
									<li><span style="color: #425bd6; font-weight: bold;">시작&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Thursday_Start">${scheduleCalendarVo.sc_Title }</a>
									</li>
								</c:if>
							</c:forEach>
							<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">

								<c:if test='${scheduleCalendarVo.end_Day eq "토요일" }'>
									<li><span style="color: #fd7037; font-weight: bold;">마감&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Thursday_End">${scheduleCalendarVo.sc_Title}</a>
									</li>
								</c:if>

							</c:forEach>
						</ul>

					</td>
					<td class="tableContents">
						<ul style="font-size: 12px;">
							<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
								<c:if test='${scheduleCalendarVo.start_Day eq "일요일" }'>
									<li><span style="color: #425bd6; font-weight: bold;">시작&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Friday_Start">${scheduleCalendarVo.sc_Title }</a>
									</li>
								</c:if>
							</c:forEach>
							<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">

								<c:if test='${scheduleCalendarVo.end_Day eq "일요일" }'>
									<li><span style="color: #fd7037; font-weight: bold;">마감&nbsp;</span><a
										style="color: black; text-decoration: none;"
										href="javascript:void(0);" data-toggle="modal"
										data-target="#Friday_End">${scheduleCalendarVo.sc_Title}</a>
									</li>
								</c:if>

							</c:forEach>
						</ul>

					</td> 
				</tr>
			</tbody>
		</table>


		<br> <Br>

		<!-- 월요일 시작일감 모달 -->
		<div class="modal fade" id="Monday_Start" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Monday</h4>
					</div>

					<div class="modal-body">
						<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
							<c:choose>
								<c:when test='${scheduleCalendarVo.start_Day eq "월요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
										pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
										pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
									<br>
								</c:when>
							</c:choose>
						</c:forEach>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!-- 화요일 시작일감 모달 -->
		<div class="modal fade" id="Tuesday_Start" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">tuesday</h4>
					</div>

					<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.start_Day eq "화요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!-- 수요일 시작일감 모달 -->
		<div class="modal fade" id="Wednesday_Start" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">wednesday</h4>
					</div>

					<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.start_Day eq "수요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!-- 목요일 시작일감 모달 -->
		<div class="modal fade" id="Thursday_Start" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">thursday</h4>
					</div>

					<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.start_Day eq "목요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!-- 금요일 시작일감 모달 -->
		<div class="modal fade" id="Friday_Start" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">friday</h4>
					</div>

					<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.start_Day eq "금요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
<%-- 		<!-- 토요일 시작일감 모달 -->
		<div class="modal fade" id="saturday_Start" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">saturday</h4>
					</div>

					<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.start_Day eq "토요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!-- 일요일 시작일감 모달 -->
		<div class="modal fade" id="sunday_Start" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">sunday</h4>
					</div>

					<c:forEach items="${weelyList_start}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.start_Day eq "일요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div> --%>

		<!-- 월요일 마감일감 모달 --------------------------------------------------------------------------------------------->
		<div class="modal fade" id="Monday_End" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Monday</h4>
					</div>
					<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.end_Day eq "월요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

		<!-- 화요일 마감일감 모달 -->
		<div class="modal fade" id="Tuesday_End" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Monday</h4>
					</div>
					<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.end_Day eq "화요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

		<!-- 수요일 마감일감 모달 -->
		<div class="modal fade" id="Wednesday_End" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Monday</h4>
					</div>

					<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.end_Day eq "수요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

		<!-- 목요일 마감일감 모달 -->
		<div class="modal fade" id="Thursday_End" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Monday</h4>
					</div>

					<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.end_Day eq "목요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

		<!-- 금요일 마감일감 모달 -->
		<div class="modal fade" id="Friday_End" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Monday</h4>
					</div>

					<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.end_Day eq "금요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

		<%-- <!-- 토요일 마감일감 모달 -->
		<div class="modal fade" id="saturday__End" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Monday</h4>
					</div>

					<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.end_Day eq "토요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div> --%>

		<%-- <!-- 일요일 마감일감 모달 -->
		<div class="modal fade" id="sunday_End" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Monday</h4>
					</div>
					<c:forEach items="${weelyList_end}" var="scheduleCalendarVo">
						<c:choose>
							<c:when test='${scheduleCalendarVo.end_Day eq "일요일" }'> 		
	${scheduleCalendarVo.sc_Title}<br>
	상세내용  : ${scheduleCalendarVo.sc_Description}<br>
	기간 :  <fmt:formatDate value="${scheduleCalendarVo.sc_Start_Date }"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.start_Day})
	~  <fmt:formatDate value="${scheduleCalendarVo.sc_End_Date}"
									pattern="yyyy-MM-dd" /> (${scheduleCalendarVo.end_Day})<Br>
								<br>
							</c:when>
						</c:choose>
					</c:forEach>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div> --%>





		<!----------------------------------------------------------------------------------------------- 월요일 -->
		<table class="table table-strip">
			<tr style="background-color: white">
				<th class="col-md-1"
					style="border: 1px solid #dddddd; text-align: center; padding: 30px;">
					월</th>
				<th class="col-md-7"
					style="border: 1px solid #dddddd; text-align: left; padding: 30px;">
					<div id="zozo"> <span id="mon_textZone"> 여기다 내용 넣을 것</span></div>					
				</th>


				<th class="col-md-2"
					style="border: 1px solid #dddddd; text-align: left; padding: 30px;">
					Country</th>
			</tr>
			<tr>
			</tr>
		</table>
<script>  

// value=\'입력\'
	$('#mon_textZone').on('click',function(){
 		var a ="";
		var content = $('#mon_textZone').text();
		$('#zozo').empty();
		a = "<textarea  cols=\'80\' rows=\'3\' style=\"outline: none;border-style: none; border-color: Transparent; \" >"
		+content+"</textarea><input type=\'button\' class= \'btn btn-default\' >"
		$('#zozo').html(a);
	})
</script>           

	<!----------------------------------------------------------------------------------------------- 화요일 -->
		<table class="table table-strip">
			<tr style="background-color: white">
				<th class="col-md-1"
					style="border: 1px solid #dddddd; text-align: center; padding: 30px;">
					화</th>
				<th class="col-md-7"
					style="border: 1px solid #dddddd; text-align: left; padding: 30px;">
					<div id="zozo">
					
					<br><Br><Br>
					<input type="text" name="" size="100"  style="border: 0px;" onKeyDown="onKeyDown();"
					 placeholder='이 곳을 클릭하여 일정을 적어주세요' >
				
									
			</div>
				</th>
			

				<th class="col-md-2"
					style="border: 1px solid #dddddd; text-align: left; padding: 30px;">
					Country</th>
			</tr>
			<tr>
			</tr>
		</table>
         
       
         
	</div>       
	<script>
	function onKeyDown()
	{
	     if(event.keyCode == 13)
	     {
	        alert("ㅜㅜㅜㅜㅜ");
	     }
	}
	
	
	
	
	</script>
	
	   
</body>           
</html>
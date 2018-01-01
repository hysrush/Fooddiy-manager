<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>| Fooddiy-Order Admin+ |</title>

    <link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <!-- Gritter -->
    <link href="${ pageContext.request.contextPath }/resources/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
    <link href="${ pageContext.request.contextPath }/resources/css/custom.css" rel="stylesheet">

<style>
h3{
   padding: 3%;
   text-align : center;

}
h4{
   text-align : center;
   padding: 3%;
}
.title{
	color : #024c3d;
	background-color: #36ceaf69;
}
th{
   padding:3%;
}
table.space{
   border-spacing: 0;
}
table.space th, td{
   padding: 2%;
}
</style>
</head>

<body>
    <div id="wrapper">
        <!-- sidebar -->
        <jsp:include page="/resources/include/sidebar.jsp"/>
        
        <div id="page-wrapper" class="gray-bg dashbard-1">
          <!-- topbar -->
           <jsp:include page="/resources/include/topbar.jsp"/>
                <div class="row  border-bottom white-bg dashboard-header">
                    <div class="col-md-3" style="margin: 1%">
                       <div class="row">
                          <div class="row" style="border: 2px solid; padding: 2%">
                             <table style="width: 100%;">
                                <tr>
                                   <th class="title" colspan="3" style="padding: 3%;">바로가기</th>
                                </tr>
                                <tr>
                                   <th style="padding: 3%">${ loginVO.branch } 점 </th>
                                   <th colspan="2"> ID: ${ loginVO.id }</th>
                                </tr>
								<tr>
									<th><a href="${pageContext.request.contextPath}/orderManagement/orderList.do">현재 주문 상황</a></th>
									<th><a href="${ pageContext.request.contextPath }/menu/menuBoard.do">메뉴관리</a></th>
									<th><a href="${ pageContext.request.contextPath }/member/memberList.do">회원관리</a></th>
								</tr>
                             </table>
						</div><br/>
						<div class="row" style="border: 2px solid; padding: 2%">
                             <table style="width: 100%;">
                                <tr>
                                   <th colspan="3" class="title" style="padding: 3%;">건의사항</th>
                                </tr>
                                <tr>
                                   <th style="padding:3%" colspan="1">건의 제목</th>
                                   <th>회원 ID</th>
                                   <th>등록일</th>
                                </tr>
									<c:forEach items="${ qna }" var="q">
									<tr>
									<c:choose>
										<c:when test="${fn:length(q.question) > 10}">
											<td style="padding:3%; font-weight: normal;" title="${ q.question }">
												<a href="${ pageContext.request.contextPath }/community/claim/claimList.do"><c:out value="${fn:substring(q.question,0,6)}"/>....</a>
											</td>
										</c:when>
										<c:otherwise>
											<th style="padding:3%; font-weight: normal;" title="${ q.question }">
												<a href="${ pageContext.request.contextPath }/community/claim/claimList.do"><c:out value="${q.question}"/></a>
											</th>
										</c:otherwise> 
									</c:choose>
	                              <th style="font-weight: normal;">${ q.answer }</th>
	                              <th style="font-weight: normal;">${ q.regDate }</th>
								</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<!-- 두번째 -->
				<div class="col-md-4" style="margin: 1% 1% 1% 2.3%;">
					<div class="row">
						<div class="row" style="border: 2px solid; padding: 2%">
							<table style="width: 100%;" class="space">
								<tr>
                                   <th class="title" style="padding: 2%; width: 40%; font-size: 20px;">&lt; TODAY 현황 &gt;</th>
                                </tr>
								<tr>
									<td>
										<div style="border: 2px solid; padding: 2%">
											<table style="width: 100%;">
												<tr>
													<th class="title" style="padding: 3%; width: 50%; text-align: center;">주문수</th>
												</tr>
												<tr>
													<th style="text-align: center;"><a href="${ pageContext.request.contextPath }/orderManagement/todayOrderList.do">${ count } 건 </a></th>
												</tr>
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div style="border: 2px solid; padding: 2%">
											<table style="width: 100%;">
												<tr>
													<th class="title" style="padding: 3%; width: 50%; text-align: center;">시간대별 판매기록</th>
												</tr>
												<tr>
													<td>
														<div class="flot-chart dashboard-chart">
															<div class="flot-chart-content" id="flot-dashboard-chart"></div>
														</div>
														<div class="row text-left">
															<div class="col-xs-4">
																<div class=" m-l-md">
																	<span class="h4 font-bold m-t block">$ 1</span>
																	<small class="text-muted m-b block">Sales marketing report</small>
																</div>
															</div>
															<div class="col-xs-4">
																<span class="h4 font-bold m-t block">$ 2</span>
																<small class="text-muted m-b block">Annual sales revenue</small>
															</div>
															<div class="col-xs-4">
																<span class="h4 font-bold m-t block">$ 3</span>
																<small class="text-muted m-b block">Half-year revenue margin</small>
															</div>
														</div>
													</td>
												</tr>
                                         </table>
                                      </div>
									</td>
								</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- 3번재 줄 -->
			<div class="col-md-3" style="margin: 1%">
				<div class="row" style="border: 2px solid; padding: 2%">
					<table style="width: 100%;">
						<tr class="title">
							<th style="padding: 3%"><strong>공지사항</strong></th>
							<td align="right">
								<a href="${ pageContext.request.contextPath }/community/subway/noticeList.do">
									<small style="font-weight: bolder; color:#024c3d;"> + more</small>
								</a>
							</td>
						</tr>
						<tr>
							<th width="60%" style="padding: 3%">제목</th>
							<th>작성일</th>
						</tr>
						<c:forEach items="${ notice }" var="n">
                        <tr>
							<td width="60%" style="padding: 3%">
								<c:choose>
									<c:when test="${ n.type eq 'A' }">
										<c:choose>
											<c:when test="${fn:length(n.title) > 20}">
												<strong>[공지사항]&nbsp;</strong>
												<a href="${ pageContext.request.contextPath }/community/subway/noticeDetail.do?no=${n.no}">
													<c:out value="${fn:substring(n.title,0,19)}"/>....
												</a>
											</c:when>
											<c:otherwise>
												<strong>[공지사항]&nbsp;</strong>
												<a href="${ pageContext.request.contextPath }/community/subway/noticeDetail.do?no=${n.no}">
													<c:out value="${n.title}"/>
												</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${fn:length(n.title) > 20}">
												<strong>[보도자료]&nbsp;</strong>
												<a href="${ pageContext.request.contextPath }/community/subway/noticeDetail.do?no=${n.no}">
													<c:out value="${fn:substring(n.title,0,19)}"/>....
												</a>
											</c:when>
											<c:otherwise>
												<strong>[보도자료]&nbsp;</strong>
												<a href="${ pageContext.request.contextPath }/community/subway/noticeDetail.do?no=${n.no}">
													<c:out value="${n.title}"/>
												</a>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
                           	</td>
                           <th style="font-weight: normal;">${ n.regDate }</th>
                        </tr>
                     </c:forEach>
                  </table>
				</div><br/>
				<div class="row" style="border: 2px solid; padding: 2%">
					<table style="width: 100%;">
						<tr class="title">
							<th colspan="2" style="padding: 3%;">이벤트 사항</th>
                            <td colspan="2" align="right">
                            	<a href="${ pageContext.request.contextPath }/event/eventPage.do">
                            		<small style="font-weight: bolder; color:#024c3d;"> + more</small>
                            	</a>
                            </td>
						</tr>
						<tr>
							<th style="padding:3%">이벤트 제목</th>
							<th>지점</th>
							<th>시작일</th>
							<th>종료일</th>
						</tr>
						<c:forEach items="${ event }" var="e">
						<tr>
                        	<td style="padding:3%">
                        		<c:choose>
									<c:when test="${fn:length(n.title) > 20}">
										<a href="${ pageContext.request.contextPath }/event/eventDetail.do?no=${ e.no }">
											<c:out value="${fn:substring(e.title,0,19)}"/>....
										</a>
									</c:when>
									<c:otherwise>
										<a href="${ pageContext.request.contextPath }/event/eventDetail.do?no=${ e.no }">
											<c:out value="${e.title}"/>
										</a>
									</c:otherwise> 
								</c:choose>
                        		
                        	</td>
                        	<td>${ e.storeName }</td>
                        	<th style="font-weight: normal;">${ e.startDate }</th>
                        	<th style="font-weight: normal;">${ e.endDate }</th>
                    	 </tr>
                  		</c:forEach>
					</table>
				</div>
			</div>
			<div class="footer">
				<jsp:include page="/resources/include/bottom.jsp"></jsp:include>
			</div>
        </div>
   </div>
</div>
  <!-- Mainly scripts -->
    <script src="${ pageContext.request.contextPath }/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Flot -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/flot/jquery.flot.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/flot/jquery.flot.pie.js"></script>

    <!-- Peity -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/peity/jquery.peity.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/demo/peity-demo.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/inspinia.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pace/pace.min.js"></script>

    <!-- jQuery UI -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- GITTER -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/gritter/jquery.gritter.min.js"></script>

    <!-- Sparkline -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/sparkline/jquery.sparkline.min.js"></script>

    <!-- Sparkline demo data  -->
    <script src="${ pageContext.request.contextPath }/resources/js/demo/sparkline-demo.js"></script>

    <!-- ChartJS-->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/chartJs/Chart.min.js"></script>

    <!-- Toastr -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/toastr/toastr.min.js"></script>

    <script>
        $(document).ready(function() {

        	// sidebar li 클래스 active
        	$('.mainLI').addClass("active");
        	
            setTimeout(function() {
                toastr.options = {
                    closeButton: true,
                    progressBar: true,
                    showMethod: 'slideDown',
                    timeOut: 2000
                };
                toastr.success('Welcome to Fooddiy-Order Admin+');

            }, 1300);


            var data1 = [
                [0,4],[1,8],[2,5],[3,10],[4,4],[5,16],[6,5],[7,11],[8,6],[9,11],[10,30],[11,10],[12,13],[13,4],[14,3],[15,3],[16,6]
            ];
            var data2 = [
                [0,1],[1,0],[2,2],[3,0],[4,1],[5,3],[6,1],[7,5],[8,2],[9,3],[10,2],[11,1],[12,0],[13,2],[14,8],[15,0],[16,0]
            ];
            $("#flot-dashboard-chart").length && $.plot($("#flot-dashboard-chart"), [
                data1, data2
            ],
                    {
                        series: {
                            lines: {
                                show: false,
                                fill: true
                            },
                            splines: {
                                show: true,
                                tension: 0.4,
                                lineWidth: 1,
                                fill: 0.4
                            },
                            points: {
                                radius: 0,
                                show: true
                            },
                            shadowSize: 2
                        },
                        grid: {
                            hoverable: true,
                            clickable: true,
                            tickColor: "#d5d5d5",
                            borderWidth: 1,
                            color: '#d5d5d5'
                        },
                        colors: ["#1ab394", "#1C84C6"],
                        xaxis:{
                        },
                        yaxis: {
                            ticks: 4
                        },
                        tooltip: false
                    }
            );

            var doughnutData = {
                labels: ["App","Software","Laptop" ],
                datasets: [{
                    data: [300,50,100],
                    backgroundColor: ["#a3e1d4","#dedede","#9CC3DA"]
                }]
            } ;


            var doughnutOptions = {
                responsive: false,
                legend: {
                    display: false
                }
            };


            var ctx4 = document.getElementById("doughnutChart").getContext("2d");
            new Chart(ctx4, {type: 'doughnut', data: doughnutData, options:doughnutOptions});

            var doughnutData = {
                labels: ["App","Software","Laptop" ],
                datasets: [{
                    data: [70,27,85],
                    backgroundColor: ["#a3e1d4","#dedede","#9CC3DA"]
                }]
            } ;


            var doughnutOptions = {
                responsive: false,
                legend: {
                    display: false
                }
            };


            var ctx4 = document.getElementById("doughnutChart2").getContext("2d");
            new Chart(ctx4, {type: 'doughnut', data: doughnutData, options:doughnutOptions});

        });
    </script>
</body>
</html>

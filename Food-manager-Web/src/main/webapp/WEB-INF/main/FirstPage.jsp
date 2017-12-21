<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                          <div class="row" style="border: 2px solid; padding: 5%">
                             <table style="width: 100%;">
                                <tr>
                                   <th class="title" colspan="2" style="padding: 3%;">바로가기</th>
                                </tr>
                                <tr>
                                   <th style="padding: 3%">${ loginVO.branch } 점 </th>
                                   <th colspan="2"> ID: ${ loginVO.id }</th>
                                </tr>
                           <tr>
                              <th><a href="${pageContext.request.contextPath}/orderManagement/todayOrderList.do">TODAY 주문</a></th>
                                   <th><a href="${ pageContext.request.contextPath }/menu/menuBoard.do">메뉴관리</a></th>
                                   <th><a href="${ pageContext.request.contextPath }/member/memberList.do">회원관리</a></th>
                           </tr>
                        </table>
                     </div><br/>
                     <div class="row" style="border: 2px solid; padding: 5%">
                             <table style="width: 100%;">
                                <tr>
                                   <th colspan="2" class="title" style="padding: 3%;">건의사항</th>
                                </tr>
                                <tr>
                                   <th style="padding:3%" colspan="1">건의 제목</th>
                                   <th>회원 ID</th>
                                   <th>등록일</th>
                                </tr>
                       <c:forEach items="${ qna }" var="q">
                           <tr>
                              <td style="padding:3%">${ q.title }</td>
                              <td>${ q.startDate }</td>
                              <td>${ q.endDate }</td>
                           </tr>
                        </c:forEach>
                        </table>
                     </div>
                       </div>
                    </div>
                    <!-- 두번째 -->
                    <div class="col-md-4" style="margin: 1% 1% 1% 2.3%;">
                       <div class="row">
                          <div class="row" style="border: 2px solid; padding: 5%">
                             <table style="width: 100%;" class="space">
                                <tr>
                                   <th class="title" style="padding: 2%; width: 40%; font-size: 20px;">[ TODAY 현황 ]</th>
                                </tr>
                           <tr>
                              <td>
                                 <div style="border: 2px solid; padding: 2%">
                                    <table style="width: 100%;">
                                       <tr>
                                               <th class="title" style="padding: 3%; width: 50%; text-align: center;">주문수</th>
                                            </tr>
                                            <tr>
                                               <th style="text-align: center;"> ${ count } 건</th>
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
                                                             <span class="h4 font-bold m-t block">$ 406,100</span>
                                                      <small class="text-muted m-b block">Sales marketing report</small>
                                                           </div>
                                                </div>
                                                     <div class="col-xs-4">
                                                        <span class="h4 font-bold m-t block">$ 150,401</span>
                                                        <small class="text-muted m-b block">Annual sales revenue</small>
                                                       </div>
                                                     <div class="col-xs-4">
                                                        <span class="h4 font-bold m-t block">$ 16,822</span>
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
                       <div class="row" style="border: 2px solid; padding: 5%">
                          <table style="width: 100%;">
                             <tr>
                                <th class="title" style="padding: 3%"><strong>공지사항</strong></th>
                                <td align="right"><a href="${ pageContext.request.contextPath }/community/subway/noticeList.do"><small >[더보기]</small></a></td>
                             </tr>
                             <tr>
                                <th width="60%" style="padding: 3%">제목</th>
                                <th>작성일</th>
                             </tr>
                     <c:forEach items="${ notice }" var="n">
                        <tr>
							<td width="60%" style="padding: 3%">
								<a href="${ pageContext.request.contextPath }/community/subway/noticeDetail.do?no=${n.no}">${ n.title }</a>
                           	</td>
                           <td>${ n.regDate }</td>
                        </tr>
                     </c:forEach>
                  </table>
                    </div><br/>
                    <div class="row" style="border: 2px solid; padding: 5%">
                       <table style="width: 100%;">
                          <tr>
                             <th class="title" colspan="2" style="padding: 3%;">이벤트 사항</th>
                             <td colspan="2" align="right"><a href="${ pageContext.request.contextPath }/event/eventPage.do"><small >[더보기]</small></a></td>
                          </tr>
                          <tr>
                             <th style="padding:3%">이벤트 제목</th>
                             <th>지점</th>
                             <th>시작일</th>
                             <th>종료일</th>
                          </tr>
                  <c:forEach items="${ event }" var="e">
                     <tr>
                        <td style="padding:3%"><a href="${ pageContext.request.contextPath }/event/eventDetail.do?no=${ e.no }">${ e.title }</a></td>
                        <td>${ e.storeName }</td>
                        <td>${ e.startDate }</td>
                        <td>${ e.endDate }</td>
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
        <!-- 채팅 -->
<%--         <div class="small-chat-box fadeInRight animated">
            <div class="heading" draggable="true">
                <small class="chat-date pull-right">
                    02.19.2015
                </small>
                Small chat
            </div>
            <div class="content">
                <div class="left">
                    <div class="author-name">
                        Monica Jackson <small class="chat-date">
                        10:02 am
                    </small>
                    </div>
                    <div class="chat-message active">
                        Lorem Ipsum is simply dummy text input.
                    </div>

                </div>
                <div class="right">
                    <div class="author-name">
                        Mick Smith
                        <small class="chat-date">
                            11:24 am
                        </small>
                    </div>
                    <div class="chat-message">
                        Lorem Ipsum is simpl.
                    </div>
                </div>
                <div class="left">
                    <div class="author-name">
                        Alice Novak
                        <small class="chat-date">
                            08:45 pm
                        </small>
                    </div>
                    <div class="chat-message active">
                        Check this stock char.
                    </div>
                </div>
                <div class="right">
                    <div class="author-name">
                        Anna Lamson
                        <small class="chat-date">
                            11:24 am
                        </small>
                    </div>
                    <div class="chat-message">
                        The standard chunk of Lorem Ipsum
                    </div>
                </div>
                <div class="left">
                    <div class="author-name">
                        Mick Lane
                        <small class="chat-date">
                            08:45 pm
                        </small>
                    </div>
                    <div class="chat-message active">
                        I belive that. Lorem Ipsum is simply dummy text.
                    </div>
                </div>
            </div>
            <div class="form-chat">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control">
                    <span class="input-group-btn"> <button
                        class="btn btn-primary" type="button">Send
                </button> </span></div>
            </div>
        </div>
        <div id="small-chat">
            <span class="badge badge-warning pull-right">5</span>
            <a class="open-small-chat">
                <i class="fa fa-comments"></i>
            </a>
        </div>
        <div id="right-sidebar" class="animated">
            <div class="sidebar-container">
                <ul class="nav nav-tabs navs-3">
                    <li class="active"><a data-toggle="tab" href="#tab-1">
                        Notes
                    </a></li>
                    <li><a data-toggle="tab" href="#tab-2">
                        Projects
                    </a></li>
                    <li class=""><a data-toggle="tab" href="#tab-3">
                        <i class="fa fa-gear"></i>
                    </a></li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> Latest Notes</h3>
                            <small><i class="fa fa-tim"></i> You have 10 new message.</small>
                        </div>

                        <div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${ pageContext.request.contextPath }/resources/img/a1.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">

                                        There are many variations of passages of Lorem Ipsum available.
                                        <br>
                                        <small class="text-muted">Today 4:21 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${ pageContext.request.contextPath }/resources/img/a2.jpg">
                                    </div>
                                    <div class="media-body">
                                        The point of using Lorem Ipsum is that it has a more-or-less normal.
                                        <br>
                                        <small class="text-muted">Yesterday 2:45 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${ pageContext.request.contextPath }/resources/img/a3.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        Mevolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                                        <br>
                                        <small class="text-muted">Yesterday 1:10 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${ pageContext.request.contextPath }/resources/img/a4.jpg">
                                    </div>

                                    <div class="media-body">
                                        Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the
                                        <br>
                                        <small class="text-muted">Monday 8:37 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${ pageContext.request.contextPath }/resources/img/a8.jpg">
                                    </div>
                                    <div class="media-body">

                                        All the Lorem Ipsum generators on the Internet tend to repeat.
                                        <br>
                                        <small class="text-muted">Today 4:21 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${ pageContext.request.contextPath }/resources/img/a7.jpg">
                                    </div>
                                    <div class="media-body">
                                        Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
                                        <br>
                                        <small class="text-muted">Yesterday 2:45 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${ pageContext.request.contextPath }/resources/img/a3.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        The standard chunk of Lorem Ipsum used since the 1500s is reproduced below.
                                        <br>
                                        <small class="text-muted">Yesterday 1:10 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${ pageContext.request.contextPath }/resources/img/a4.jpg">
                                    </div>
                                    <div class="media-body">
                                        Uncover many web sites still in their infancy. Various versions have.
                                        <br>
                                        <small class="text-muted">Monday 8:37 pm</small>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>

                    <div id="tab-2" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-cube"></i> Latest projects</h3>
                            <small><i class="fa fa-tim"></i> You have 14 projects. 10 not completed.</small>
                        </div>

                        <ul class="sidebar-list">
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9 hours ago</div>
                                    <h4>Business valuation</h4>
                                    It is a long established fact that a reader will be distracted.

                                    <div class="small">Completion with: 22%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs">Project end: 4:00 pm - 12.06.2014</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9 hours ago</div>
                                    <h4>Contract with Company </h4>
                                    Many desktop publishing packages and web page editors.

                                    <div class="small">Completion with: 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9 hours ago</div>
                                    <h4>Meeting</h4>
                                    By the readable content of a page when looking at its layout.

                                    <div class="small">Completion with: 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-primary pull-right">NEW</span>
                                    <h4>The generated</h4>
                                    There are many variations of passages of Lorem Ipsum available.
                                    <div class="small">Completion with: 22%</div>
                                    <div class="small text-muted m-t-xs">Project end: 4:00 pm - 12.06.2014</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9 hours ago</div>
                                    <h4>Business valuation</h4>
                                    It is a long established fact that a reader will be distracted.

                                    <div class="small">Completion with: 22%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs">Project end: 4:00 pm - 12.06.2014</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9 hours ago</div>
                                    <h4>Contract with Company </h4>
                                    Many desktop publishing packages and web page editors.

                                    <div class="small">Completion with: 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9 hours ago</div>
                                    <h4>Meeting</h4>
                                    By the readable content of a page when looking at its layout.

                                    <div class="small">Completion with: 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-primary pull-right">NEW</span>
                                    <h4>The generated</h4>
                                    <!--<div class="small pull-right m-t-xs">9 hours ago</div>-->
                                    There are many variations of passages of Lorem Ipsum available.
                                    <div class="small">Completion with: 22%</div>
                                    <div class="small text-muted m-t-xs">Project end: 4:00 pm - 12.06.2014</div>
                                </a>
                            </li>

                        </ul>

                    </div>

                    <div id="tab-3" class="tab-pane">

                        <div class="sidebar-title">
                            <h3><i class="fa fa-gears"></i> Settings</h3>
                            <small><i class="fa fa-tim"></i> You have 14 projects. 10 not completed.</small>
                        </div>

                        <div class="setings-item">
                    <span>
                        Show notifications
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example">
                                    <label class="onoffswitch-label" for="example">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                    <span>
                        Disable Chat
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" checked class="onoffswitch-checkbox" id="example2">
                                    <label class="onoffswitch-label" for="example2">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                    <span>
                        Enable history
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example3">
                                    <label class="onoffswitch-label" for="example3">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                    <span>
                        Show charts
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example4">
                                    <label class="onoffswitch-label" for="example4">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                    <span>
                        Offline users
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" checked name="collapsemenu" class="onoffswitch-checkbox" id="example5">
                                    <label class="onoffswitch-label" for="example5">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                    <span>
                        Global search
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" checked name="collapsemenu" class="onoffswitch-checkbox" id="example6">
                                    <label class="onoffswitch-label" for="example6">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                    <span>
                        Update everyday
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example7">
                                    <label class="onoffswitch-label" for="example7">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="sidebar-content">
                            <h4>Settings</h4>
                            <div class="small">
                                I belive that. Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                And typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
                                Over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  
 --%>
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

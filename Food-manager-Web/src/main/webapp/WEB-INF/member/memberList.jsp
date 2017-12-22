<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>| 회원목록 |</title>

    <link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- FooTable -->
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/footable/footable.core.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">



</head>

<body>

    <div id="wrapper">

   <!-- sidebar -->
        <jsp:include page="/resources/include/sidebar.jsp"/>

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <span class="m-r-sm text-muted welcome-message">Welcome to INSPINIA+ Admin Theme.</span>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope"></i>  <span class="label label-warning">16</span>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/a7.jpg">
                                </a>
                                <div class="media-body">
                                    <small class="pull-right">46h ago</small>
                                    <strong>Mike Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
                                    <small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/a4.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right text-navy">5h ago</small>
                                    <strong>Chris Johnatan Overtunk</strong> started following <strong>Monica Smith</strong>. <br>
                                    <small class="text-muted">Yesterday 1:21 pm - 11.06.2014</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/profile.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right">23h ago</small>
                                    <strong>Monica Smith</strong> love <strong>Kim Smith</strong>. <br>
                                    <small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a href="mailbox.html">
                                    <i class="fa fa-envelope"></i> <strong>Read All Messages</strong>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell"></i>  <span class="label label-primary">8</span>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="mailbox.html">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> You have 16 messages
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="profile.html">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="grid_options.html">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a href="notifications.html">
                                    <strong>See All Alerts</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>


                <li>
                    <a href="login.html">
                        <i class="fa fa-sign-out"></i> Log out
                    </a>
                </li>
            </ul>

        </nav>
        </div>
        <!-- ------------------------------------------------------------------------------------------------------------------------- -->
            <div class="row wrapper border-bottom white-bg page-heading">
                <div style="font-size: 35px" class="col-lg-10">
                    	<strong>회원 목록</strong>
                </div>
                <div class="col-lg-2">

                </div>
            </div>

        <div class="wrapper wrapper-content animated fadeInRight ecommerce">


            <div style="padding: 10px 20px 0px 20px" class="ibox-content m-b-sm border-bottom">
                            <label style="font-size: 25px" class="control-label" for="product_name"><strong>회원 검색</strong></label>
          
            <!-- <a href="#"> <span style="height:30px; width:94px; font-size: 14px" class=" label label-primary">회원 랭킹보기</span></a> -->
            <button style="margin-left:5%; border-color:white; height:30px; width: 114px; font-size: 14px" type="button" class="label label-primary">회원 랭킹보기</button> 
                      
                <div class="row">
                    <!-- <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="product_name">회원 전화번호</label>
                            <input type="text" id="product_name" name="product_name" value="" placeholder="Member Phone" class="form-control">
                        </div>
                    </div> -->
                    <div class="col-sm-2" style="padding-right: 2px">
                        <div class="form-group">
                            <label class="control-label" for="membername">회원 정보</label>
                            <input type="text" id="membername" name="membername" value="" placeholder="Member Name" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-2" style=" padding-left:60px; padding-right: 2px">
                        <div class="form-group">
                            <label class="control-label" for="price">포인트 검색</label>
                            <input type="text" id="price" name="price" value="" placeholder="Member Name" class="form-control">
                        </div>
                    </div><br/>
                   <!-- <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="status">Status</label>
                            <select name="status" id="status" class="form-control">
                                <option value="1" selected>Enabled</option>
                                <option value="0">Disabled</option>
                            </select>
                        </div>
                    </div> -->
                </div>

            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content">

                            <table id="membertable" class="table table-stripped toggle-arrow-tiny" data-page-size="15">
                                <thead> 
                                <tr style="font-size: 17px">
                                    <th style="width:150px"><span>이름</span></th>
                                    <th style="width:300px">생년월일</th>
                                    <th style="width:130px">성별</th>
                                    <th>PHONE</th>
                                    <th style="width:300px">메일</th>
                                    <th style="width:130px" >등급</th>
                                    <th>스탬프</th>

                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${ memberList }" var="user">
                                <tr style="font-size: 14px">
                                <td><a onclick="modalD('${user.id}')">${ user.id }</a></td>
                                <td>${ user.name }</td>
                                <td>${ user.birth }</td>
                                <td>${ user.sex }</td>
                                <td>${ user.phone }</td>
                                <td>${ user.email }</td>
                                <td>${ user.grade }</td>
                             </tr>
                                </c:forEach>
                                   <%-- 
                                 <tr> 
                                    <td>
                               			<a href="#" data-toggle="modal" data-target="#myModal4">류대현</a>
                                    </td>
                                    <td>
                                        1993년 05월 26일
                                    </td>
                                    <td>
                                       	 여성
                                    </td>
                                    <td>
                                        010-1234-1234
                                    </td>
                                    <td>
                                        dreaming@naver.com
                                    </td>
                                    <td>
                                        VIP
                                    </td>
                                    <td>
                                       	 2,000 P.
                                    </td>
                                    <td>
                                		도장 도장 도장 도장
                                    </td> 
                                    </tr> --%>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <ul class="pagination pull-right"></ul>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>


        </div>

        </div>
        </div>
<!-- modal -->
	<%-- <div style="position:absolute; top: 100px; right: 100px"class="modal inmodal" id="myModal4" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div style=" width:1000px;" class="modal-content animated fadeIn">
				<div style="padding:15px; " class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">회원 정보</h4>
				</div>
			  <div style="padding: 20px 10px 5px" class="wrapper wrapper-content animated fadeInRight">
                    	 <c:forEach items="${ memberList }" var="user">
							<tr>
        <div class="row">
            <div class="col-lg-12">
                <div style="padding:0px " class="contact-box">
                    <div style="margin-left: 130px" class="col-sm-3">
                        <div class="text-center">
                            <img style="width: 200px; margin-top:12px; max-width: 150%" alt="image" class="img-circle m-t-xs img-responsive" src="${ pageContext.request.contextPath }/resources/img/a6.jpg">
                            <div style="font-size: 15px" class="m-t-xs font-bold">${ user.id }</div>
                        </div>
                    </div>
                    <div style="width:40%; text-align: center; margin-left:8%; margin-top: 30px; font-size: 20px" class="col-sm-8">
                         <h2><strong>${ user.name }</strong></h2>
                        <address>
                            <span>${ user.sex }</span><br>
                            <span>${ user.grade }</span><br>
                            <span>${ user.birth }</span><br>
                            <span>${ user.phone }</span><br>
                            <span>${ user.email }</span><br>
                        </address>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
                    </tr>
                    </c:forEach>
      </div>
				<div style="padding-bottom: 6px; padding-top: 4px" class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> --%>
		<!-- 모달 -->
	<div class="modal inmodal fade" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 모달내용 -->
				
			</div>
		</div>
	</div>
	

	<!-- --------------------------------------------------------------------------------------------------------------------- -->

    <!-- Mainly scripts -->
    <script src="${ pageContext.request.contextPath }/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/inspinia.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pace/pace.min.js"></script>

    <!-- FooTable -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/footable/footable.all.min.js"></script>

    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function() {

            $('.footable').footable();
            
            $("#membername").keyup(function() {
            	  var k = $(this).val();
            	   $("#membertable > tbody > tr").hide();
            	   var temp = $("#membertable > tbody > tr > td:contains('" + k + "')");

            	   $(temp).parent().show();
            })

        });
        function modalD(no) {
        	var url = "${pageContext.request.contextPath}/member/memberDetail.do?id=" + no;
        	$('div.modal').modal().removeData();
		    $('div.modal').modal({ remote : url  });
        }
    </script>
</body>

</html>

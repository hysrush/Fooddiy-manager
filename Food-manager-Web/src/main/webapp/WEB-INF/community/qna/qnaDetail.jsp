<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<!-- Basic -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>| Fooddiy-Order Admin+ |</title>	

	<link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

	<!-- Toastr style -->
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
<style type="text/css">
</style>
</head>
<body>
	<div id="wrapper">    
	    <!-- sidebar -->
	    <jsp:include page="/resources/include/sidebar.jsp"/>

    <div id="page-wrapper" class="gray-bg">        
        <!-- topbar -->
	    <jsp:include page="/resources/include/topbar.jsp"/>
	    
       	<!-- 페이지 헤더 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>자주묻는질문 상세내용</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                    </li>
                    <li>
                        <a>커뮤니티 관리</a>
                    </li>
                    <li>
                        <a>자주묻는질문 관리</a>
                    </li>
                    <li class="active">
                        <strong>자주묻는질문 상세내용</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        
		<!-- 페이지 컨텐츠 -->
        <div class="wrapper wrapper-content animated fadeInRight article">
			<!-- 자주묻는질문 디테일 -->
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <div class="ibox">
						<div class="ibox-content">
							<div class="pull-right">
								<button class="btn btn-white btn-xs" type="button">Model</button>
								<button class="btn btn-white btn-xs" type="button">Publishing</button>
								<button class="btn btn-white btn-xs" type="button">Modern</button>
							</div>
							<div class="text-center article-title">
								<span class="text-muted"><i class="fa fa-clock-o"></i>
									${ qnaVO.regDate }
								</span>
								<h1>${ qnaVO.question }</h1>
							</div>
							<p>
								${ qnaVO.answer }
							</p>
							<hr>
							<div class="row">
								<div class="col-md-6">
									<h5>Tags:</h5>
									<button class="btn btn-primary btn-xs" type="button">Model</button>
									<button class="btn btn-white btn-xs" type="button">Publishing</button>
								</div>
								<div class="col-md-6">
									<div class="small text-right">
										<h5>Stats:</h5>
										<div>
											<i class="fa fa-comments-o"> </i> 56 comments
										</div>
										<i class="fa fa-eye"> </i> 144 views
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-12">

									<h2>Comments:</h2>
									<div class="social-feed-box">
										<div class="social-avatar">
											<a href="" class="pull-left"> <img alt="image"
												src="img/a1.jpg">
											</a>
											<div class="media-body">
												<a href="#"> Andrew Williams </a> <small class="text-muted">Today
													4:21 pm - 12.06.2014</small>
											</div>
										</div>
										<div class="social-body">
											<p>Many desktop publishing packages and web page editors
												now use Lorem Ipsum as their default model text, and a
												search for 'lorem ipsum' will uncover many web sites still
												default model text.</p>
										</div>
									</div>
									<div class="social-feed-box">
										<div class="social-avatar">
											<a href="" class="pull-left"> <img alt="image"
												src="img/a2.jpg">
											</a>
											<div class="media-body">
												<a href="#"> Michael Novek </a> <small class="text-muted">Today
													4:21 pm - 12.06.2014</small>
											</div>
										</div>
										<div class="social-body">
											<p>Many desktop publishing packages and web page editors
												now use Lorem Ipsum as their default model text, and a
												search for 'lorem ipsum' will uncover many web sites still
												default model text, and a search for 'lorem ipsum' will
												uncover many web sites still in their infancy. Packages and
												web page editors now use Lorem Ipsum as their default model
												text.</p>
										</div>
									</div>
									<div class="social-feed-box">
										<div class="social-avatar">
											<a href="" class="pull-left"> <img alt="image"
												src="img/a3.jpg">
											</a>
											<div class="media-body">
												<a href="#"> Alice Mediater </a> <small class="text-muted">Today
													4:21 pm - 12.06.2014</small>
											</div>
										</div>
										<div class="social-body">
											<p>Many desktop publishing packages and web page editors
												now use Lorem Ipsum as their default model text, and a
												search for 'lorem ipsum' will uncover many web sites still
												in their infancy. Packages and web page editors now use
												Lorem Ipsum as their default model text.</p>
										</div>
									</div>
									<div class="social-feed-box">
										<div class="social-avatar">
											<a href="" class="pull-left"> <img alt="image"
												src="img/a5.jpg">
											</a>
											<div class="media-body">
												<a href="#"> Monica Flex </a> <small class="text-muted">Today
													4:21 pm - 12.06.2014</small>
											</div>
										</div>
										<div class="social-body">
											<p>Many desktop publishing packages and web page editors
												now use Lorem Ipsum as their default model text, and a
												search for 'lorem ipsum' will uncover many web sites still
												in their infancy. Packages and web page editors now use
												Lorem Ipsum as their default model text.</p>
										</div>
									</div>


								</div>
							</div>

						</div>
					</div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <div class="footer">
	    	<jsp:include page="/resources/include/bottom.jsp"/>
        </div>
        </div>
        </div>

    <!-- Mainly scripts -->
    <script src="${ pageContext.request.contextPath }/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	
    <!-- Custom and plugin javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/inspinia.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pace/pace.min.js"></script>

    </body>
</html>
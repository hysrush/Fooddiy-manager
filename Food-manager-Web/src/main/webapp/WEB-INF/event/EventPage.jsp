<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		<!-- Basic -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">	

		<title> | Fooddiy-Order Admin+ |</title>	

		<meta name="keywords" content="HTML5 Template" />
		<meta name="description" content="Porto - Responsive HTML5 Template">
		<meta name="author" content="okler.net">
		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<!-- Web Fonts  -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800%7CShadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/vendor/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/vendor/animate/animate.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/vendor/simple-line-icons/css/simple-line-icons.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/vendor/owl.carousel/assets/owl.carousel.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/vendor/owl.carousel/assets/owl.theme.default.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/vendor/magnific-popup/magnific-popup.min.css">

		<!-- Theme CSS -->
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/css/theme.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/css/theme-elements.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/css/theme-blog.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/css/theme-shop.css">

		<!-- Current Page CSS -->
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/vendor/rs-plugin/css/settings.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/vendor/rs-plugin/css/layers.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/vendor/rs-plugin/css/navigation.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/vendor/circle-flip-slideshow/css/component.css">

		<!-- Skin CSS -->
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/css/skins/skin-shop-9.css"> 

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/css/demos/demo-shop-9.css">

		<!-- Head Libs -->
		<script src="${ pageContext.request.contextPath}/userResources/vendor/modernizr/modernizr.min.js"></script>


		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/userResources/css/custom.css">

	</head>
	<body>
		<div class="body">
		
			<div role="main" class="main">

				<section class="page-header">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<ul class="breadcrumb">
									<li><a href="#">Home</a></li>
									<li class="active">Events</li>
								</ul>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<h1>브랜드 EVENT</h1>
							</div>
						</div>
					</div>
				</section>

				<div class="container">

					<div class="row">
						<div class="col-md-3">
							<aside class="sidebar" id="sidebar" data-plugin-sticky data-plugin-options="{'minWidth': 991, 'containerSelector': '.container', 'padding': {'top': 110}}">

									<h4 class="heading-primary">이벤트</h4>
								<ul class="nav nav-list mb-xlg">
									<li class="active"><a href="${ pageContext.request.contextPath }/event/EventPage.jsp">브랜드 이벤트</a></li>
									<li>
										<a href="${ pageContext.request.contextPath }/event/storeEventPage.jsp">점포별 이벤트</a>
									</li>
								</ul>
							</aside>
						</div>
						<div class="col-md-9">
							<!-- START -->
							<div class="row">
								<div class="col-md-12">
		
									<div class="tabs tabs-bottom tabs-center tabs-simple">
										<ul class="nav nav-tabs">
											<li class="active">
												<a href="#tabsNavigationSimple1" data-toggle="tab" aria-expanded="true">진행중인 이벤트</a>
											</li>
											<li class="">
												<a href="#tabsNavigationSimple2" data-toggle="tab" aria-expanded="false">종료된 이벤트 </a>
												
											</li>
										</ul>
										<div class="tab-content">
											<div class="tab-pane active" id="tabsNavigationSimple1">
												<div class="center">	
													<!-- 1 -->
															<c:forEach items="${ eventList }" var="eventVO">	
													<div class="col-md-12">
														<ul>
															<li>
																<div class="col-md-6">
																<a href="${ pageContext.request.contextPath }/event/eventDetail.do?no=${ eventVO.no }">
																	<img alt="" class="img-responsive img-rounded" src="../upload/${ eventVO.imgFileName }"  style=" width:600px;height:150px">
																</a>
																</div>
																<div class="col-md-6" align="left"> 
																	<h4><strong>${ eventVO.title }</strong></h4>
																	<br/>
																	<br/>
																	<span> ${ eventVO.startDate } &nbsp; ~  ${ eventVO.endDate }</span>														
																</div>
															<hr/><br/><br/>	
															</li>				
														</ul>
													</div>
												</c:forEach>
													
														<div class="col-md-12">
														<ul class="pagination">
														
															<!-- 이전 페이지 이동  -->
															<li><a onclick='pagePre(${p.pageStartNum},${p.pageCnt});'><i class="fa fa-chevron-left"></i></a></li>
														
															<!--  페이지 번호  -->
														<c:forEach var='i' begin ="${p.pageStartNum }" end = "${p.pageLastNum}" step="1">
															<li class='pageIndex$[i]'><a onclick="pageIndex(${i});">${i}</a></li>
														</c:forEach>
															<!-- 다음 페이지 이동 -->
															
															  <li><a onclick='pageNext(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'><i class="fa fa-chevron-right"></i></a></li>
														</ul>
														
															 <form action="./eventPage.do" method="post" id='frmPaging'>
													            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
													            <input type='hidden' name='index' id='index' value='${p.index}'>
													            <input type='hidden' name='pageStartNum' id='pageStartNum' value='${p.pageStartNum}'>
													            <input type='hidden' name='listCnt' id='listCnt' value='${p.listCnt}'>    
													        </form>
													</div>	
														
														
														
														<br/>
													<div align="right">		
														
														<a href = "${ pageContext.request.contextPath}/event/eventWrite.do"><input type = "button" value="글 등록 "/></a>
													</div>
													
												</div>
											</div>
											<div class="tab-pane" id="tabsNavigationSimple2">
												<div class="center">
													<!-- 종료된이벤트 탭   -->
															
													<c:forEach items="${ eventEndList }" var="eventVO">	
													<div class="col-md-12">
														<ul>
															<li>
																<div class="col-md-6">
																<a href="${ pageContext.request.contextPath }/event/eventDetail.do?no=${ eventVO.no }">
																	<img alt="" class="img-responsive img-rounded" src="../upload/${ eventVO.imgFileName }"  style=" width:600px;height:150px">
																</a>
																</div>
																<div class="col-md-6" align="left"> 
																	<h4><strong>${ eventVO.content }</strong></h4>
																	<br/>
																	<br/>
																	<span> ${ eventVO.startDate } &nbsp; ~  ${ eventVO.endDate }</span>														
																</div>
															<hr/><br/><br/>	
															</li>				
														</ul>
													</div>
												</c:forEach>
													
														<div class="col-md-12">
														<ul class="pagination">
														
															<!-- 이전 페이지 이동  -->
															<li><a onclick='pagePre(${p.pageStartNum},${p.pageCnt});'><i class="fa fa-chevron-left"></i></a></li>
														
															<!--  페이지 번호  -->
														<c:forEach var='i' begin ="${p.pageStartNum }" end = "${p.pageLastNum}" step="1">
															<li class='pageIndex$[i]'><a onclick="pageIndex(${i});">${i}</a></li>
														</c:forEach>
															<!-- 다음 페이지 이동 -->
															
															  <li><a onclick='pageNext(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'><i class="fa fa-chevron-right"></i></a></li>
														</ul>
														
															 <form action="./eventPage.do" method="post" id='frmPaging'>
													            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
													            <input type='hidden' name='index' id='index' value='${p.index}'>
													            <input type='hidden' name='pageStartNum' id='pageStartNum' value='${p.pageStartNum}'>
													            <input type='hidden' name='listCnt' id='listCnt' value='${p.listCnt}'>    
													        </form>
													</div>	
													

													
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- END -->
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<script>
			function frmPaging() {
			    document.getElementById("frmPaging").submit();
			}
			// 이전 페이지 index
			function pagePre(index, pageCnt) {
			    if (0 < index - pageCnt) {
			        index -= pageCnt;
			        document.getElementById("pageStartNum").value = index;
			        document.getElementById("index").value = index - 1;
			        frmPaging();
			    }
			}
			// 다음 페이지 index
			function pageNext(index, total, listCnt, pageCnt) {
			    var totalPageCnt = Math.ceil(total / listCnt);
			    var max = Math.ceil(totalPageCnt / pageCnt);
			    if (max * pageCnt > index + pageCnt) {
			        index += pageCnt;
			        document.getElementById("pageStartNum").value = index;
			        document.getElementById("index").value = index - 1;
			        frmPaging();
			    }
			}
			
			// index 리스트 처리
			function pageIndex(pageStartNum) {
			    document.getElementById("index").value = pageStartNum - 1;
			    frmPaging();
			}
			// 리스트출력개수 처리
			function listCnt() {
			    document.getElementById("index").value = 0;
			    document.getElementById("pageStartNum").value = 1;
			    document.getElementById("listCnt").value = document.getElementById("listCount").value;
			    frmPaging();
			}
			window.onload = function() {
			    // 현재번호 active
			    var index = document.getElementById("index").value;
			    var pageIndex = document.querySelector('.pageIndex'+(Number(index)+1));
			   
			    // 리스트갯수 selected 처리
			    $("#listCount > option").each(function () {
			        if ($(this).val() == $('#listCnt').val()) {
			            $(this).prop("selected", true);
			        }
			    });
			}


			</script>	
	
	
	
	
	
		
			<!-- Vendor -->
		<script src="${ pageContext.request.contextPath}/userResources/vendor/jquery/jquery.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/jquery.appear/jquery.appear.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/jquery.easing/jquery.easing.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/jquery-cookie/jquery-cookie.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/common/common.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/jquery.validation/jquery.validation.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/jquery.easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/jquery.gmap/jquery.gmap.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/jquery.lazyload/jquery.lazyload.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/isotope/jquery.isotope.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/owl.carousel/owl.carousel.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/vide/vide.min.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="${ pageContext.request.contextPath}/userResources/js/theme.js"></script>
		
		<!-- Current Page Vendor and Views -->
		<script src="${ pageContext.request.contextPath}/userResources/vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
		<script src="${ pageContext.request.contextPath}/userResources/vendor/circle-flip-slideshow/js/jquery.flipshow.min.js"></script>
		
		<!-- Current Page Vendor and Views -->
		<script src="${ pageContext.request.contextPath}/userResources/js/views/view.contact.js"></script>

		<!-- Demo -->
		<script src="${ pageContext.request.contextPath}/userResources/js/demos/demo-shop-9.js"></script>
		
		<!-- Theme Custom -->
		<script src="${ pageContext.request.contextPath}/userResources/js/custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="${ pageContext.request.contextPath}/userResources/js/theme.init.js"></script>
	</body>
</html>
							
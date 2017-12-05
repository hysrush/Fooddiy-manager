<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

		<!-- Basic -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">	

		<title>Fooddiy-Order</title>	

		<meta name="keywords" content="HTML5 Template" />
		<meta name="description" content="Porto - Responsive HTML5 Template">
		<meta name="author" content="okler.net">

		<!-- Favicon -->
		<link rel="shortcut icon" href="${ pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
		<link rel="apple-touch-icon" href="${ pageContext.request.contextPath}/resources/img/apple-touch-icon.png">

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
		
		<!-- js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 	
		<script	src="${pageContext.request.contextPath}/userResources/js/jquery-3.2.1.min.js"></script>

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
							<!-- 디테일 게시판 -->
								
								<div class="col-md-9">
									<table class="table" align="center">
										<thead>
											<tr>
												
												<th>
													<strong>${eventVO.content}</strong>	
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<span>이벤트 기간 :  ${ eventVO.startDate } &nbsp; ~ &nbsp; ${ eventVO.endDate }</span>	
												</td>
												
											</tr>
											<tr>
												<td>
													<img src="../upload/${ eventVO.imgFileName }" >
												</td>
												
											</tr>
											
										</tbody>
									</table>
								</div>
									<br/><br/>
								<div class="row" align="center" >
								
								    <div class="col-md-12">
													
										<button onclick="doAction('U')">수정</button>&nbsp;&nbsp;
										<button onclick="doAction('D')">삭제</button>&nbsp;&nbsp;
													
										<button onclick="doAction('L')">목록</button>
										
									</div>
								</div>
	
									
								   
									<!--  	<table class="table table-bordered">
								            <tr>
													<th width="10%">번호</th>
													<td>${ eventVo.no }</td>
												</tr>
												<tr>
													<th>제목</th>
													<td>${ eventVO.title }</td>
												</tr>
												<tr>
													<th></th>
													<td>
														<img src="../upload/${ eventVO.imgFileName }" width="250">
													</td>
												</tr>
												
												<tr>
													<th>내용</th>
													<td>${ eventVO.content }</td>
												<%-- 	<td><c:out value="${ tvo.content }" /></td>  --%>
												</tr>
												<tr>
													<th>시작일</th>
													<td>${ eventVO.startDate }</td>
												</tr>
												<tr>
													<th>종료일</th>
													<td>${ eventVO.endDate }</td>
												</tr>
											
												<tr>
													<th>등록일</th>
													<td>${ evenetVO.regDate }</td>
												</tr>
											</table>
											
											<br/><br/>
											<div class="row" align="center">
								    			<div class="col-md-12">
													
														<button onclick="doAction('U')">수정</button>&nbsp;&nbsp;
														<button onclick="doAction('D')">삭제</button>&nbsp;&nbsp;
													
													<button onclick="doAction('L')">목록</button>
													<button id="com" class="btn btn-secondary">답글</button>
												</div>
											</div>


															-->	

	

					</div>
				</div>
			</div>
		
	</div>
	
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
		
		
			<script type="text/javascript">
			function doAction(type) {
				switch(type) {
				case 'U' : 
					if(confirm("수정 하시겠습니까?")) {
						location.href="<%=request.getContextPath()%>/reWrite.do"+"?no=${ param.no }";
					}
					break;
				case 'D' : 
					if(confirm("삭제 하시겠습니까?")) {
						location.href="<%=request.getContextPath()%>/delete.do"+"?no=${ param.no }";
					}
					break;
				case 'L' : 
					if(confirm("목록으로 돌아가시겠습니까?")) {
						location.href = "<%=request.getContextPath()%>/tipList.do";
					}
					break;
				}
			}
		</script>
	
		
		
		
</body>
</html>
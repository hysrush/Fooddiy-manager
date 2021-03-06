<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<style type="text/css">
	#logo {
		font-size: 10pt;
	}
	#fooddiy {
		font-size: 6pt;
	}
</style>
</head>
<nav class="navbar-default navbar-static-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav metismenu" id="side-menu">
			<li class="nav-header">
				<div class="dropdown profile-element">
					<span>
						<a href="${ pageContext.request.contextPath }/main/FirstPage?storeName=${loginVO.branch}">
							<img alt="image" width="40%" class="img-circle" src="${ pageContext.request.contextPath }/resources/img/subway.png" />
						</a>
					</span> 
				 	<a data-toggle="dropdown" class="dropdown-toggle" href="#">
                       <span class="clear">
							<span class="block m-t-xs"> <strong class="font-bold">${ loginVO.name } 관리자</strong></span>
							<span class="text-muted text-xs block">${ loginVO.branch } 점 <b class="caret"></b></span>
						</span>
					</a>
				<ul class="dropdown-menu animated fadeInRight m-t-xs">
					<li><a href="${ pageContext.request.contextPath }/sign/profile?id=${loginVO.id}">Profile</a></li>
					<li><a href="${ pageContext.request.contextPath }/sign/login">Logout</a></li>
				</ul>
			</div>
			<div class="logo-element" id="logo"><span id="fooddiy">Fooddiy-Order</span> Admin+</div>
		</li>
		<li class="mainLI"><a href="${ pageContext.request.contextPath }/main/FirstPage?storeName=${loginVO.branch}"><i
				class="fa fa-th-large"></i> <span class="nav-label">Main</span></a></li>
		<!-- <li><a href="#"><i class="fa fa-magic"></i>
				<span class="nav-label">메인페이지 관리</span><span
				class="label label-info pull-right">NEW</span></a></li> -->
		<li class="menuLI"><a href="#"><i class="fa fa-sitemap"></i> <span
				class="nav-label">메뉴 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li class="menuBoard"><a href="${ pageContext.request.contextPath }/menu/menuBoard.do">메뉴 관리</a></li>
				<li class="menuRegister"><a href="${ pageContext.request.contextPath }/menu/menuRegister.do">메뉴 등록</a></li>
			</ul></li>
		<li class = "orderManagementLI"><a href="#"><i class="fa fa-shopping-cart"></i> <span
				class="nav-label">주문 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li class="totalOrderList"><a href="${pageContext.request.contextPath}/orderManagement/totalOrderList.do">전체주문내역</a></li>
				<li class="todayOrderList"><a href="${pageContext.request.contextPath}/orderManagement/todayOrderList.do">TODAY 주문</a></li>
				<li class="orderList"><a href="${pageContext.request.contextPath}/orderManagement/orderList.do">주문 내용</a></li>
			</ul></li>
		<li class="memberLI"><a href="#"><i class="fa fa-user-circle"></i> <span
				class="nav-label">회원 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li  class="memberLI2"><a href="${ pageContext.request.contextPath }/member/memberList.do">회원 리스트</a></li>
			</ul></li> 
		<li class="eventLI"><a href="#"><i class="fa fa-star"></i> <span
				class="nav-label">이벤트 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li class="eventLI2"><a href="${ pageContext.request.contextPath }/event/eventPage.do">이벤트 관리</a></li>
			</ul>
		</li>
		<li class="communityLI"><a href="#"><i class="fa fa-desktop"></i> <span
				class="nav-label">커뮤니티 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li class="qnaLI"><a href="${ pageContext.request.contextPath }/community/qna/qnaList.do">자주묻는질문 관리</a></li>
				<li class="noticeLI"><a href="${ pageContext.request.contextPath }/community/subway/noticeList.do">Subway소식 관리</a></li>
				<li class="claimLI"><a href="${ pageContext.request.contextPath }/community/claim/claimList.do">1:1문의 관리</a></li>
				<li class="snsLI"><a href="${pageContext.request.contextPath }/community/sns/snsPage.do">SNS게시판 관리</a></li>
			</ul></li>
		<li class="storeLI"><a href="#"><i class="fa fa-group"></i>
			<span class="nav-label">매장찾기 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li class="storeLI2"><a href="${ pageContext.request.contextPath }/store/storeList.do">매장 찾기 관리</a></li>
			</ul>
		</li>
		<!-- <li><a href="#"><i class="fa fa-globe"></i> <span
				class="nav-label">마이페이지 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li><a href="toastr_notifications.html">회원정보 관리</a></li>
				<li><a href="nestable_list.html">최근주문내역 관리</a></li>
				<li><a href="agile_board.html">나만의메뉴 관리</a></li>
				<li><a href="timeline_2.html">나의문의사항 관리</a></li>
			</ul></li> -->
		<!-- <li><a href="#"><i class="fa fa-bar-chart-o"></i> <span
				class="nav-label">통계 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li><a href="ecommerce_products_grid.html">회원 분석</a></li>
				<li><a href="ecommerce_product_list.html">메뉴 분석</a></li>
				<li><a href="ecommerce_product.html">매출 분석</a></li>
				<li><a href="ecommerce_product_detail.html">주문 분석</a></li>
			</ul></li>
		<li><a href="#"><i class="fa fa-group"></i> <span
				class="nav-label">사원 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li><a href="form_basic.html">사원 리스트</a></li>
				<li><a href="form_advanced.html">사원 등록</a></li>
				<li><a href="form_editors.html">출결 관리</a></li>
			</ul></li> -->
		
		<li class="special_link"><a href="http://localhost:8000/Food-diy-Web/main/Start" target="_blank">
			<i class="fa fa-home"></i><span class="nav-label">Fooddiy-Order</span></a>
		</li>
	</ul>
</div>
</nav>
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
				<span> <img alt="image" class="img-circle"
					src="${ pageContext.request.contextPath }/resources/img/profile_small.jpg" />
				</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
					class="clear"> <span class="block m-t-xs"><strong
							class="font-bold">홍길동 매니저</strong></span> <span
						class="text-muted text-xs block">강남역점<b class="caret"></b></span>
				</span>
				</a>
				<ul class="dropdown-menu animated fadeInRight m-t-xs">
					<li><a href="profile.html">Profile</a></li>
					<li><a href="contacts.html">Contacts</a></li>
					<li><a href="mailbox.html">Mailbox</a></li>
					<li class="divider"></li>
					<li><a href="${ pageContext.request.contextPath }/login.jsp">Logout</a></li>
				</ul>
			</div>
			<div class="logo-element" id="logo"><span id="fooddiy">Fooddiy-Order</span> Admin+</div>
		</li>
		<li class="mainLI"><a href="${ pageContext.request.contextPath }/FirstPage.jsp"><i
				class="fa fa-th-large"></i> <span class="nav-label">Main</span></a></li>
		<li><a href="css_animation.html"><i class="fa fa-magic"></i>
				<span class="nav-label">메인페이지 관리</span><span
				class="label label-info pull-right">NEW</span></a></li>
		<li class="menuLI"><a href="#"><i class="fa fa-sitemap"></i> <span
				class="nav-label">메뉴 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li class="menuAll"><a href="${ pageContext.request.contextPath }/menu/menuAll.do">메뉴 리스트</a></li>
				<li class="menuBoard"><a href="${ pageContext.request.contextPath }/menu/menuBoard.do">메뉴 관리</a></li>
				<li class="menuRegister"><a href="${ pageContext.request.contextPath }/menu/menuRegister.do">메뉴 등록</a></li>
			</ul></li>
		<li><a href="#"><i class="fa fa-shopping-cart"></i> <span
				class="nav-label">주문 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li><a href="graph_rickshaw.html">전체주문내역</a></li>
				<li><a href="graph_morris.html">TODAY 주문</a></li>
				<li><a href="graph_flot.html">주문 내용</a></li>
			</ul></li>
		<li><a href="#"><i class="fa fa-user-circle"></i> <span
				class="nav-label">회원 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li><a href="${ pageContext.request.contextPath }/member/memberList">회원 리스트</a></li>
				<li><a href="${ pageContext.request.contextPath }/member/memberRank">회원 랭킹</a></li>
			</ul></li>
		<li><a href="#"><i class="fa fa-star"></i> <span
				class="nav-label">이벤트 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li><a href="${ pageContext.request.contextPath }/event/eventPage.do">브랜드 이벤트 관리</a></li>
				<li><a href="lockscreen.html">매장별 이벤트 관리</a></li>
				<li><a href="login_two_columns.html">매장 찾기 관리</a></li>
			</ul></li>
		<li class="communityLI"><a href="#"><i class="fa fa-desktop"></i> <span
				class="nav-label">커뮤니티 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li class="qnaLI"><a href="${ pageContext.request.contextPath }/community/qna/qnaList.do">자주묻는질문 관리</a></li>
				<li><a href="profile.html">공지사항 관리</a></li>
				<li><a href="profile_2.html">보도자료 관리</a></li>
				<li><a href="contacts_2.html">1:1문의 관리</a></li>
				<li><a href="projects.html">SNS게시판 관리</a></li>
			</ul></li>
		<li><a href="#"><i class="fa fa-globe"></i> <span
				class="nav-label">마이페이지 관리</span><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level collapse">
				<li><a href="toastr_notifications.html">회원정보 관리</a></li>
				<li><a href="nestable_list.html">최근주문내역 관리</a></li>
				<li><a href="agile_board.html">나만의메뉴 관리</a></li>
				<li><a href="timeline_2.html">나의문의사항 관리</a></li>
			</ul></li>
		<li><a href="#"><i class="fa fa-bar-chart-o"></i> <span
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
			</ul></li>
		<li class="special_link"><a href="http://localhost:8000/Food-diy-Web/index2.jsp">
			<i class="fa fa-home"></i><span class="nav-label">Fooddiy-Order</span></a>
		</li>
	</ul>
</div>
</nav>
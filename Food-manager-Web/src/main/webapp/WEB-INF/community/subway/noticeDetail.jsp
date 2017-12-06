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

    <!-- FooTable -->
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/footable/footable.core.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">

<script type="text/javascript">
	function doAction(btn, type) {
		switch (btn) {
		case 'L':
			if (type == 'A') {
				location.href = "${ pageContext.request.contextPath}/community/notice.do";
			} else if (type == 'B') {
				location.href = "${ pageContext.request.contextPath}/community/news.do";
			}
			break;
		default:
			break;
		}
	}
	
	function submit() {
		document.getElementById("dForm").submit();
	}
	
</script>
</head>
<body>

	<div id="wrapper">    
	    <!-- sidebar -->
	    <jsp:include page="/resources/include/sidebar.jsp"/>
    
    <div id="page-wrapper" class="gray-bg">        
        <!-- topbar -->
	    <jsp:include page="/resources/include/topbar.jsp"/>
        
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>메뉴 관리</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                        </li>
                        <li>
                            <a>메뉴관리</a>
                        </li>
                        <li class="active">
                            <strong>메뉴 관리</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>

        <div class="wrapper wrapper-content animated fadeInRight ecommerce">


            <div class="ibox-content m-b-sm border-bottom">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="product_name">Product Name</label>
                            <input type="text" id="product_name" name="product_name" value="" placeholder="Product Name" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="price">Price</label>
                            <input type="text" id="price" name="price" value="" placeholder="Price" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="quantity">Quantity</label>
                            <input type="text" id="quantity" name="quantity" value="" placeholder="Quantity" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="status">Status</label>
                            <select name="status" id="status" class="form-control">
                                <option value="1" selected>Enabled</option>
                                <option value="0">Disabled</option>
                            </select>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content">

                            <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="15">
                                <thead>
                                <tr>

                                    <th data-toggle="true">메뉴 이름</th>
                                    <th data-hide="phone">타입</th>
                                    <th data-hide="all">설명</th>
                                    <th data-hide="phone">가격</th>
                                    <!-- <th data-hide="phone,tablet" >Quantity</th> -->
                                    <th data-hide="phone">상태</th>
                                    <th class="text-right" data-sort-ignore="true">Action</th>

                                </tr>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${ menuList }" var="menu">
                                
                                <tr class="boardList">
                                    <td>
                                       ${ menu.name }
                                    </td>
                                    <td class="convType">
                                       TYPE
                                    </td>
                                    <td>
                                        ${ menu.detail }
                                    </td>
                                    <td>
                                        ${ menu.price }원
                                    </td>
                                    <!-- <td>
                                        1000
                                    </td> -->
                                    <td>
                                        <span class="label label-primary">Enable</span>
                                        <!-- <span class="label label-danger">Disabled</span>
                                        <span class="label label-warning">Low stock</span> -->
                                    </td>
                                    <td class="text-right">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs" id="view" onclick="btnClick(${menu.no})">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                        <div class = "menuType" style = "display: none">${ menu.type }</div>
                                    </td>
                                </tr>
                                
								</c:forEach>

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

    <!-- FooTable -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/footable/footable.all.min.js"></script>
	
	<!-- ****************************************************************************************************************************** -->
	<div class="body">
		
		<div role="main" class="main">

			<section class="page-header">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<ul class="breadcrumb">
								<li><a href="#">커뮤니티</a></li>
								<li class="active">공지사항</li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<h1>Subway 소식</h1>
						</div>
					</div>
				</div>
			</section>

			<div class="container">

				<div class="row">
					<!-- 스티키 사이드바 -->
					<div class="col-md-2 hidden-xs hidden-sm">
						<aside class="sidebar" id="sidebar" data-plugin-sticky data-plugin-options="{'minWidth': 991, 'containerSelector': '.container', 'padding': {'top': 110}}">
							<h4 class="heading-primary"><strong>커뮤니티 </strong></h4>
							<ul class="nav nav-list mb-xlg sort-source" data-sort-id="portfolio" data-option-key="filter" data-plugin-options="{'layoutMode': 'fitRows', 'filter': '*'}">
								<li><a href="${ pageContext.request.contextPath }/community/qna.do">자주묻는 질문</a></li>
								<li class="active"><a href="#">Subway 소식</a>
									<ul>
										<c:if test="${ noticeVO.type eq 'A' }">
											<li class="active"><a href="${ pageContext.request.contextPath }/community/notice.do">공지사항</a></li>
											<li><a href="${ pageContext.request.contextPath }/community/news.do">보도자료</a></li>
										</c:if>
										<c:if test="${ noticeVO.type eq 'B' }">
											<li><a href="${ pageContext.request.contextPath }/community/notice.do">공지사항</a></li>
											<li class="active"><a href="${ pageContext.request.contextPath }/community/news.do">보도자료</a></li>
										</c:if>
									</ul>
								</li>
								<li><a href="${ pageContext.request.contextPath }/community/claimWrite.do">1:1 문의</a></li>
								<li><a href="${ pageContext.request.contextPath }/notice/SNSBoard.jsp">SNS게시판</a></li>
							</ul>
						</aside>
					</div>
					<!-- START! -->
					<div class="col-md-10">
						<section class="section section-default">
							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<h4 class="mb-none">Subway 소식! 공지사항과 보도자료입니다.</h4>
										<br>
										<p class="mb-none">Subway 소식! 공지사항과 보도자료입니다.</p>
									</div>
								</div>
							</div>
						</section>
						<div class="tabs tabs-bottom tabs-center tabs-simple">
							<ul class="nav nav-tabs">
								<c:if test="${ noticeVO.type eq 'A' }">
									<li class="active"><a href="${ pageContext.request.contextPath }/community/notice.do">공지사항</a></li>
								</c:if>
								<c:if test="${ noticeVO.type eq 'B' }">
									<li class="active"><a href="${ pageContext.request.contextPath }/community/notice.do">보도자료</a></li>
								</c:if>
							</ul>
							<div class="tab-content">
								<!-- 공지사항 / 보도자료 디테일 -->
								<div class="blog-posts single-post">
										<div class="center">
											<div class="post-content">
												<div class="post-meta" style="float: right;">
													<span><a href="${ pageContext.request.contextPath }/index2.jsp"><i class="fa fa-home"></i></a> > </span>
													<span><a href="${ pageContext.request.contextPath }/community/notice.do">Subway소식</a> > </span>
													<c:if test="${ noticeVO.type eq 'A' }">
														<span><a href="#">공지사항</a></span>
													</c:if>
													<c:if test="${ noticeVO.type eq 'B' }">
														<span><a href="#">보도자료</a></span>
													</c:if>
												</div>
												<br>
												<form action="/Mission-Web/fileDownload" method="post" id="dForm">
													<table class="table table-bordered">
															<tr>
																<td>
																	<!-- 제목 -->
																	<h4 class="mb-none">
																		<strong><c:out value="${ noticeVO.title }"></c:out></strong>
																	</h4>
																</td>
																<div class="post-meta">
																	<!-- 조회수 -->
																	<td width="15%"><i class="fa fa-eye"></i> 조회수 ${ noticeVO.viewCnt }</td>
																	<!-- 등록일 -->
																	<td width="15%"><i class="fa fa-calendar"></i>&nbsp;${ noticeVO.regDate }</td>
																</div>
															</tr>
														<tr>
															<!-- 내용 -->
															<td colspan="3"><p><c:out value="${ noticeVO.content }"></c:out></p></td>
														</tr>
														<!-- 첨부파일 -->
														<c:if test="${ not empty fileList }">
															<tr>
																<th width="15%">첨부파일</th>
																<td colspan="5"><c:forEach items="${ fileList }"
																		var="file">
																		<a href="#" onclick="submit(); return false;"> <input
																			type="hidden" value="${ file.fileSaveName }">
																			${ file.fileOriName }
																		</a>
																	&nbsp;(${ file.fileSize })bytes<br>
																	</c:forEach></td>
															</tr>
															<tr>
																<th width="15%">미리보기</th>
																<td colspan="5"><c:forEach items="${ fileList }"
																		var="file">
																		<img src="/Mission-Web/upload/${ file.fileSaveName }"
																			style="max-width: 200px">
																	&nbsp;&nbsp;
																</c:forEach></td>
															</tr>
														</c:if>
													</table>
												</form>
												<div class="center">
													<button type="button" class="btn btn-primary" onclick="doAction('L','${ noticeVO.type }')">목록</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<footer id="footer">
		</footer>

		<!-- Vendor -->
		<script src="${ pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/jquery.appear/jquery.appear.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/jquery-cookie/jquery-cookie.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/common/common.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/jquery.validation/jquery.validation.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/jquery.easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/jquery.gmap/jquery.gmap.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/jquery.lazyload/jquery.lazyload.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/isotope/jquery.isotope.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/vide/vide.min.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="${ pageContext.request.contextPath}/resources/js/theme.js"></script>
		
		<!-- Current Page Vendor and Views -->
		<script src="${ pageContext.request.contextPath}/resources/vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
		<script src="${ pageContext.request.contextPath}/resources/vendor/circle-flip-slideshow/js/jquery.flipshow.min.js"></script>
		
		<!-- Current Page Vendor and Views -->
		<script src="${ pageContext.request.contextPath}/resources/js/views/view.contact.js"></script>

		<!-- Demo -->
		<script src="${ pageContext.request.contextPath}/resources/js/demos/demo-shop-9.js"></script>
		
		<!-- Theme Custom -->
		<script src="${ pageContext.request.contextPath}/resources/js/custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="${ pageContext.request.contextPath}/resources/js/theme.init.js"></script>
</body>
</html>
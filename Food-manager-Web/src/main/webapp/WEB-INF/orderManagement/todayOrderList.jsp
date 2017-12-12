<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>INSPINIA | E-commerce</title>

<link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
<!-- dataTables -->
<link href="${ pageContext.request.contextPath }/resources/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
<!-- FooTable -->
<link href="${ pageContext.request.contextPath }/resources/css/plugins/footable/footable.core.css" rel="stylesheet">

<link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">

<style type="text/css">
	.convType > span {
		width: 60px;
	}
</style>

</head>

<body>

	<div id="wrapper">
		<!-- sidebar -->
		<jsp:include page="/resources/include/sidebar.jsp" />

		<div id="page-wrapper" class="gray-bg">
			<!-- topbar -->
			<jsp:include page="/resources/include/topbar.jsp" />
			
			<!-- 페이지 헤더 -->
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>메뉴 관리</h2>
					<ol class="breadcrumb">
						<li>
							<a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
						</li>
						<li>
							<a>주문관리</a>
						</li>
						<li class="active">
							<strong>TODAY 주문</strong>
						</li>
					</ol>
				</div>
				<div class="col-lg-2">
				</div>
			</div>


			<!-- 페이지 컨텐츠 -->
			<div class="wrapper wrapper-content animated fadeInRight ecommerce">
				<!-- Search box -->
				<div class="ibox-content m-b-sm border-bottom">
					<div class="row">
						<div class="col-sm-2">
							<div class="form-group">
								<label class="control-label" for="type">타입</label>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="menuname">총 주문 건수 : </label>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="price">총 결제 금액</label>
							</div>
						</div>
					</div>
				</div>
				<!-- menu List -->
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox">
							<div class="ibox-content">
								<div class="table-responsive">
									<table class="footable table table-stripped toggle-arrow-tiny dataTables-example" data-page-size="25">
										<thead>
											<tr>
												<th data-hide="phone" data-sort-ignore="true">주문번호</th>
												<th data-hide="phone" data-sort-ignore="true">주문시간</th>
												<th data-hide="phone" data-sort-ignore="true">메뉴</th>
												<th data-hide="phone" data-sort-ignore="true">주문자</th>
												<th data-hide="phone" data-sort-ignore="true">주문금액</th>
												<th data-hide="phone" data-sort-ignore="true">총 결제금액</th>
												<th data-hide="phone" data-sort-ignore="true">결제방법</th>
												<th data-toggle="true" data-sort-ignore="true">결제상태</th>
												<th data-hide="all" data-sort-ignore="true">주문취소</th>
												<th data-hide="phone" data-sort-ignore="true">가격</th>
												<th data-hide="phone" data-sort-ignore="true">등록일</th>
												<th class="text-right" data-sort-ignore="true">Action</th>
											</tr>
										</thead>
										<tbody>

										<c:forEach items="${ menuList2 }" var="menu">

											<tr class="boardList">
												<td class="convType" width="100px;">
			                                    <span class="label label-primary">${ menu.type }</span>
		                                  		</td>
												<td>${ menu.name }</td>
												<td style="word-break:keep-all;">
													${ menu.detail }
												</td>
												<td>
		                                        	${ menu.price }원
		                                   		</td>
												<td width="10%" nowrap>
													${ menu.regDate }
												</td>												
												<td class="text-right">
													<div class="btn-group" width="10%" nowrap>
														<button class="btn-white btn btn-xs" id="view" onclick="btnClick(${menu.no})"><i class="fa fa-search"></i></button>
														<button class="btn-white btn btn-xs"><i class="fa fa-edit"></i></button>
		                                          		<button class="btn-white btn btn-xs delete"><i class="fa fa-trash"></i></button>
													</div>
													<div class="menuType" style="display: none">${ menu.type }</div>
												</td>
											</tr>

										</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer">
				<jsp:include page="/resources/include/bottom.jsp"/>
			</div>
		</div>
	</div>

	


	<!-- Mainly scripts -->
	<script	src="${ pageContext.request.contextPath }/resources/js/jquery-3.1.1.min.js"></script>
	<script	src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script	src="${ pageContext.request.contextPath }/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script	src="${ pageContext.request.contextPath }/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- dataTables -->
	<script src="${ pageContext.request.contextPath }/resources/js/plugins/dataTables/datatables.min.js"></script>	

	<!-- Custom and plugin javascript -->
	<script	src="${ pageContext.request.contextPath }/resources/js/inspinia.js"></script>
	<script	src="${ pageContext.request.contextPath }/resources/js/plugins/pace/pace.min.js"></script>

	<!-- FooTable -->
	<script	src="${ pageContext.request.contextPath }/resources/js/plugins/footable/footable.all.min.js"></script>

	<!-- Page-Level Scripts -->
	<script>
        $(document).ready(function() {
        	
        	// sidebar li & ul 클래스 active
			$('.menuLI').addClass("active");
			$('.menuLI > ul').addClass("in");
			$('.menuBoard').addClass("active");

            $('.footable').footable();            
            
			for(var i = 0; i < $('.boardList').length; ++i) {    			
    			var product  = $('.boardList').eq(i).find('.label');
	    		if( product.text() == 'R'){
	    			product.attr("class","label label-danger");
	    			product.html("추천메뉴");
	    		}
	    		else if(product.text() == 'P'){
	    			product.attr("class","label label-success");
	    			product.html("프리미엄");
	    		}
	    		else if(product.text() == 'B'){
	    			product.attr("class","label label-primary");
	    			product.html("베스트");
	    		}
	    		else if(product.text() == 'C'){
	    			product.attr("class","label label-information");
	    			product.html("클래식");
	    		}
	    		else if(product.text() == 'M'){
	    			product.attr("class","label label-warning");
	    			product.html("아침식사");
	    		}	    		
	    		else if(product.text() == 'S'){
	    			product.attr("class","label label-information");
	    			product.html("샐러드");
	    		}
	    		else if(product.text() == 'N'){
	    			product.attr("class","label label-plain");
	    			product.html("추가메뉴");
	    		}
	    		else if(product.text() == 'D'){
	    			product.attr("class","label label-plain");
	    			product.html("음료");
	    		}
    		}
			
			
			// 데이터테이블 생성
			$('.footable').css("width","100%");
			$('.dataTables-example').DataTable({
                pageLength: 25,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    {extend: 'copy'},
                    {extend: 'csv'},
                    {extend: 'excel', title: 'ExampleFile'},
                    {extend: 'pdf', title: 'ExampleFile'},
                    {extend: 'print',
                     customize: function (win){
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');
                            $(win.document.body).find('table').addClass('compact').css('font-size', 'inherit');
                    	}
                    }
                ]
            });
			
			

        });
        
        function btnClick(no) {
        	location.href = '${ pageContext.request.contextPath}/menu/menuDetail.do?no=' + no;
        } 
	    	

    </script>

</body>

</html>

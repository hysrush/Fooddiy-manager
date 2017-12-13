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

<!-- sweetalert js & css -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> 
<link rel="stylesheet" href="https://wfolly.firebaseapp.com/node_modules/sweetalert/dist/sweetalert.css">
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
					<h2>TODAY 주문</h2>
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
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="type">오늘날짜 : </label>
								<label class="control-label today" for="type"></label>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="menuname">총 주문 건수 : </label>
								<label class="control-label total-count-order" for="type"></label>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="price">총 결제 금액 : </label>
								<label class="control-label total-order-price commaN" for="type"></label>
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
												<th data-hide="phone" data-sort-ignore="true">주문상태</th>
												<th data-hide="phone" data-sort-ignore="true">주문취소</th>
											</tr>
										</thead>
										<tbody>

										<c:forEach items="${ orderList }" var="order">

											<tr class="boardList">
												<a data-toggle="modal" href="remote.html" data-target="#modal">
													<td class="convType orderNumber" width="100px;">
				                                    	${ order.no }
			                                  		</td>
													<td>${ order.regDate }</td>
													<td>
														<c:forEach items = "${  order.detailOrderList }" var = "oneOrder" varStatus="status">
															${ oneOrder.name }
															<c:if test="${ !status.last }">, </c:if>
														</c:forEach>
			                                   		</td>
													<td width="10%" nowrap>
														${ order.id }
													</td>	
													
													<td class = "commaN orderPrice">${ order.order_price }</td>											
													<td class = "commaN finalPrice">${ order.final_price }</td>											
													<td>${ order.payment }</td>			
													
													<td class = "orderStatus"><span class="label label-primary">${ order.orderStatus }</span></td>		
													<td class = "cancel-button"></td>									
												</a>
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

	<!-- 모달 -->
	<div class="modal inmodal" id="myModal4" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content animated fadeIn">
				<!-- 모달내용 -->
				
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
			$('.orderManagementLI').addClass("active");
			$('.orderManagementLI > ul').addClass("in");
			$('.todayOrderList').addClass("active");

            $('.footable').footable();            
            
          //오늘날짜
			var now = new Date();

			var year = now.getFullYear();
			var mon = (now.getMonth() + 1) > 9 ? ''
					+ (now.getMonth() + 1) : '0'
					+ (now.getMonth() + 1);
			var day = now.getDate() > 9 ? '' + now.getDate()
					: '0' + now.getDate();

			var chan_val = year + '-' + mon + '-' + day;

			$('.today').text(chan_val);

			//총 주문건수
			var orderCount = $('tbody tr').length;
			$('.total-count-order').text(orderCount);

			//총 결제 금액
			var totalFinalPrice = 0;
			for (var i = 0; i < orderCount; ++i) {
				totalFinalPrice += uncomma($('tbody tr').eq(i)
						.find('.finalPrice').text()) * 1;
			}
			$('.total-order-price')
					.text(comma(totalFinalPrice));
			
			$('.footable').footable();
			
			
			// 삭제 alert창
			function orderCancel(no) {
				swal({
			        title: "주문을 취소하시겠습니까?",
			        type: "warning",
			        showCancelButton: true,
			        cancelButtonText: "취소",
			        confirmButtonColor: "#DD6B55",
			        confirmButtonText: "확인",
			        closeOnConfirm: false
			    }, function () {
			        swal("주문이 취소되었습니다!", "", "success");
			        // OK 누르면 삭제 실행
			        $('.confirm').click(function () {
			        	location.href = '${ pageContext.request.contextPath}/orderManagement/orderCancel.do?no=' + no;
					});
			    });
			}
			//주문 상태 표시
			$('.orderStatus').each(function() {

						var status = $(this).children().text();

						if (status == '1') {
							var no  = $(this).siblings('.orderNumber').text();
							$(this).children().text('대기중');
							$(this).children().attr('class', 'label label-primary');
							$(this).siblings('.cancel-button').append('<button type="button" class="btn btn-outline btn-danger button-cancel">주문취소</button');
						} else if (status == '2') {
							$(this).children().text('준비중');
							$(this).children().attr('class', 'label label-warning');
						} else if (status == '3') {
							$(this).children().text('준비완료');
							$(this).children().attr('class', 'label label-information');
						} else if (status == '0') {
							$(this).children().text('주문취소');
							$(this).children().attr('class', 'label label-danger');
						}

			});
			
			//주문 취소 버튼 클릭 시 이벤트 발생 
			$('.button-cancel').each(function() {
				$(this).click(function() {
					var no = $(this).parent().siblings('.orderNumber').text();
					orderCancel(no);
				});
			});
			
			
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>MenuList</title>

    <link href="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="${ pageContext.request.contextPath}/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    
	<!-- sweetalert js & css -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> 
	<link rel="stylesheet" href="https://wfolly.firebaseapp.com/node_modules/sweetalert/dist/sweetalert.css">
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
                <h2>주문 내용</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                    </li>
                    <li>
                        <a>주문 관리</a>
                    </li>
                    <li class="active">
                        <strong>주문 내용</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
            
            	<c:forEach items="${ orderList }" var="order">
            		<c:forEach items = "${ order.detailOrderList }" var="detailOrder">
            			
		                <div class="col-md-3 order-info-box">
		                    <div class="ibox">
		                        <div class="ibox-content product-box">
		                            <div class="product-imitation" style="height: 322.22px; text-align: left; font-size: 18px; color: black; padding: 50px 10px">
		                            	<div style="position: absolute; top: 0; right: 0; font-size: 14px; color: white; background-color: #6b6766; padding: 3px 6px" > ${ order.eatType} </div>
		                            		
		                            	<div>
			                            	<div>${ detailOrder.name}${ detailOrder.size}, ${ detailOrder.qty }개</div>
			                            	<div>${ detailOrder.bread }</div>
			                            	<div>${ detailOrder.cheese }</div>
			                            	<div>${ detailOrder.topping }</div>
			                            	<div>${ detailOrder.vegetable }</div>
			                            	<div>${ detailOrder.sauce }</div>
		                            	</div>
		                            </div>
		                            <div class="product-desc" style="max-height: 180px">
		                                <span class="product-price">
		                                	${ order.id }
		                                </span>
										<button type="button" class="btn btn-w-m btn-primary">완료</button>
										<button type="button" class="btn btn-w-m btn-danger button-cancel">취소</button>
										<div class = "orderNumber" style="display: none">${order.no}</div>		
		                            </div>
		                        </div>
		                    </div>
		                </div>
	                </c:forEach>
               	</c:forEach>
               	
               	
               	<div class = "none-order-info"style="font-size: 100px; text-align: center; margin-top: 150px; display: none;">
               		현재 주문이 없습니다.
               	</div>
            </div>
        </div>
        <div class="footer">
				<jsp:include page="/resources/include/bottom.jsp"/>
		</div>
    </div>
</div>



<!-- Mainly scripts -->
<script src="${ pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${ pageContext.request.contextPath}/resources/js/inspinia.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/plugins/pace/pace.min.js"></script>
    <script>
    	$(document).ready(function() {
    		
  
    		// sidebar li & ul 클래스 active
			$('.orderManagementLI').addClass("active");
			$('.orderManagementLI > ul').addClass("in");
			$('.orderList').addClass("active");
    		
			
			var playOrder;
			
			if($('.order-info-box').length == 0) {
				$('.none-order-info').css('display','block');
				//playOrder = setInterval( checkOrder(), 1000 * 2);
			}
			
	/* 		if($('.order-info-box').length < 10) {
				playOrder = setInterval( checkOrder(), 1000 * 2);
			} */
			
    		
    		for(var i = 0; i < $('.product-box').length; ++i) {
    			
    			var product  = $('.product-box').eq(i);    			
    			
	    		if( product.find('.menuType').text() == 'R'){
	    			product.find('.text-muted').html("추천메뉴");}
	    		else if(product.find('.menuType').text() == 'P'){
	    			product.find('.text-muted').html("프리미엄");}
	    		else if(product.find('.menuType').text() == 'B'){
	    			product.find('.text-muted').html("베스트");}
	    		else if(product.find('.menuType').text() == 'C'){
	    			product.find('.text-muted').html("클래식");}
	    		else if(product.find('.menuType').text() == 'M'){
	    			product.find('.text-muted').html("아침식사");}
	    		else if(product.find('.menuType').text() == 'S'){
	    			product.find('.text-muted').html("샐러드");}
	    		else if(product.find('.menuType').text() == 'N'){
	    			product.find('.text-muted').html("추가메뉴");}
	    		else if(product.find('.menuType').text() == 'D'){
	    			product.find('.text-muted').html("음료");}
    		}
			
			
			
    	});
    	
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
		        	location.href = '${ pageContext.request.contextPath}/orderManagement/orderCancel.do?no=' + no +"&url=orderList";
		        	
		        	$('.order-info-box').each(function() {
		        		
		        		if($(this).find('orderNumber').text() == no) {
							$(this).remove();		
						}
		        	}); 
				});
		    });
		}
    	
		//주문 취소 버튼 클릭 시 이벤트 발생 
		$('.button-cancel').each(function() {
			$(this).click(function() {
				var no = $(this).siblings('.orderNumber').text();
				orderCancel(no);
			});
		});
    	
    	function checkOrder() {
 			alert("시작");
    		$.ajax({
    			
    			url : "${pageContext.request.contextPath}/orderManagement/orderList.do",
    			type : "POST",
    			success : function(data) {
    				
    			}
    				
    		});
    	}
    </script>
</body>
</html>
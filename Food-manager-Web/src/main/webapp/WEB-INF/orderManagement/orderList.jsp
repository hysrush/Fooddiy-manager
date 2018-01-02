<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>| Fooddiy-Order Admin+ |</title>	

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
		<jsp:include page="/resources/include/sidebar.jsp" />

		<div id="page-wrapper" class="gray-bg">
			<!-- topbar -->
			<jsp:include page="/resources/include/topbar.jsp" />

			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>주문 내용</h2>
					<ol class="breadcrumb">
						<li><a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a></li>
						<li><a>주문 관리</a></li>
						<li class="active"><strong>주문 내용</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>

			<div class="wrapper wrapper-content animated fadeInRight total-orderFormat" onclick="clearBlinkBorder()" style="min-height: 680px">
				<div class="row">

					<c:forEach items="${ orderList }" var="order">
						<c:forEach items="${ order.detailOrderList }" var="detailOrder">

							<div class="col-md-3 order-info-box">
								<div class="ibox">
									<div class="ibox-content product-box">
										<div class="product-imitation" style="height: 322.22px; text-align: left; font-size: 18px; color: black; padding: 50px 10px">
											<div style="position: absolute; top: 0; right: 0; font-size: 14px; color: white; background-color: #6b6766; padding: 3px 6px">${ order.eatType}</div>

											<div>
												<div>${ detailOrder.name}${ detailOrder.size},${ detailOrder.qty }개</div>
												<div>${ detailOrder.bread }</div>
												<div>${ detailOrder.cheese }</div>
												<div>${ detailOrder.topping }</div>
												<div>${ detailOrder.vegetable }</div>
												<div>${ detailOrder.sauce }</div>
											</div>
										</div>
										<div class="product-desc" style="max-height: 180px">
											<span class="product-price member-id"> 
												<c:choose>
													<c:when test="${ order.id == '비회원'}">
														비회원 (${ order.no })
													</c:when>
													<c:otherwise>
														${ order.id } (${ order.no })
													</c:otherwise>
												</c:choose>
											</span>
											<button type="button" class="btn btn-w-m btn-primary" onclick="orderComplete(${order.no})">완료</button>
											<button type="button" class="btn btn-w-m btn-danger" onclick="orderCancel(${order.no})">취소</button>
											<div class="orderNumber" style="display: none">${order.no}</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:forEach>


					<div class="none-order-info" style="font-size: 100px; text-align: center; margin-top: 150px; display: none;">현재 주문이 없습니다.</div>
				</div>
			</div>
			<div class="footer">
				<jsp:include page="/resources/include/bottom.jsp" />
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
	
    	var orderInterval;
    	var currentOrderCount;
    	var blinkBorder;
    	var flag;
    	var color = [ "purple", "#ed9c28", "#47a447", "#1c84c6", "#5bc0de", "#383f48" ];
    	
    	$(document).ready(function() {
  
    		// sidebar li & ul 클래스 active
			$('.orderManagementLI').addClass("active");
			$('.orderManagementLI > ul').addClass("in");
			$('.orderList').addClass("active");
			
    		//현재 주문횟수를 확인하고 폴링시작
			checkCurrentCount();
    		
    		var infoBox =$('.order-info-box');
    		for(var i = 0; i < infoBox.length; ++i) {
    			var no = infoBox.eq(i).find('.orderNumber').text() * 1;
    			var colorNum = no % 6;
    			infoBox.eq(i).find('.member-id').css("background-color", color[colorNum]);
    			console.log(colorNum + "_");
    			
    		}
    	});
    	
    	
		function checkCurrentCount() {
    		
    		currentOrderCount = $('.order-info-box').length;
    		
    		//인터벌 초기화
    		clearInterval(orderInterval);
    		
    		console.log("currentOrderCount : " + currentOrderCount + "개");
	   		if(currentOrderCount == 0) {
	   			flag = 0;
	   			orderInterval = setInterval(function() {addOrder();}, 2 * 1000);
	   			$('.none-order-info').fadeIn(1000);
	   		}else if(currentOrderCount < 4 ) {
	   			flag = 1;
   				$('.none-order-info').hide();	
   				orderInterval = setInterval(function() {addOrder();}, 2 * 1000);
	   		}
    	};
     	// 주문취소 alert창
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
				
		    	$.ajax({
		    		url : "${pageContext.request.contextPath}/orderManagement//orderCancel.do",
		    		type: "GET",
		    		data : {"no" : no , "url" : "orderList"},
		    		success : function() {
		    			$('.order-info-box').each(function() {
							if($(this).find('.orderNumber').text() == no) {
								$(this).remove();		
							}
			        	}); 
		    			checkCurrentCount();
		    		}
		    	});
		    }); 
		};
		
    	//주문완료
    	function orderComplete(no) {
			$.ajax({
				url : "${pageContext.request.contextPath}/orderManagement/orderComplete.do?no=" + no,
				type : "GET",
				success : function() {
					$('.order-info-box').each(function() {
						if($(this).find('.orderNumber').text() == no) {
							$(this).remove();		
						}
		        	}); 
					checkCurrentCount();
				},
				error : function() {
					alert('실패');
				}
			});
    	};
    	
    	
    	//주문추가 - 폴링 
    	function addOrder() {
    		$.ajax({
    			
    			url : "${pageContext.request.contextPath}/orderManagement/orderList.do",
    			type : "POST",
    			success : function(responseData) {
    				
    					if(responseData != "null") {
								oneOrder = JSON.parse(responseData);
		    			 	
								
								var detailOrderList = JSON.parse(oneOrder.detailOrderList);
								for(var  j = 0; j < detailOrderList.length; ++j) {
									
									var no = oneOrder.no
									var colorNum = no % 6;
									var order = "";
									order += '<div class="col-md-3 order-info-box">';
									order += 	'<div class="ibox">';
									order +=    '<div class="ibox-content product-box">';
									order +=        '<div class="product-imitation" style="height: 322.22px; text-align: left; font-size: 18px; color: black; padding: 50px 10px">';
									order +=        	'<div style="position: absolute; top: 0; right: 0; font-size: 14px; color: white; background-color: #6b6766; padding: 3px 6px">' + oneOrder.eatType +' </div>';                
									order +=        	'<div>';
									order +=            	'<div>' + detailOrderList[j].name +  detailOrderList[j].size + detailOrderList[j].qty  + '개</div>';
									order +=            	'<div>' + detailOrderList[j].bread + '</div>';
									order +=            	'<div>' + detailOrderList[j].cheese +'</div>';
									order +=            	'<div>' + detailOrderList[j].topping +'</div>';
									order +=           		'<div>' + detailOrderList[j].vegetable + '</div>';
									order +=            	'<div>' + detailOrderList[j].sauce +'</div>';
									order +=        	'</div>';
									order +=        '</div>';
									order +=        '<div class="product-desc" style="max-height: 180px">';
									order +=            '<span class="product-price member-id" style="background-color:'+ color[colorNum]  +'">';
															if(oneOrder.id == "비회원") {
									order +=                 	비회원(no)			
															}else {
									order +=            		oneOrder.id + "&#40;" + no+ "&#41;";
															}
									order +=            '</span>';
									order +=			'<button type="button" class="btn btn-w-m btn-primary" onclick="orderComplete('+ no +')">완료</button>';
									order +=			'<button type="button" class="btn btn-w-m btn-danger" onclick="orderCancel(' +no + ')">취소</button>';
									order +=			'<div class = "orderNumber" style="display: none">' + no + '</div>'		;
									order +=       '</div>';
									order +=    '</div>';
									order += 	'</div>';
									order += '</div>';
				
									if(flag == 0) {
										blinkBorder = setInterval(function() {
										 var border = $('.total-orderFormat');
										 
										 if(!border.data("clickStatus")) {
											 border.css({
												"border-style" : "solid",
												"border-color" : "red",
												"border-width" : "8px"
											})	
											border.data("clickStatus", 1);
										 }else {
											 border.css({
												"border-style" : "none"
											})									
											border.data("clickStatus", 0);
										 }
										 
										}, 500);
									};
									$('.total-orderFormat .row').append(order);
									
								};
								
				        		//현재 주문횟수를 확인하고 폴링시작
								checkCurrentCount();
    				}
    			},
    			error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
    		});
    	};
    	
    	
    	//주문시 깜박임 없애기
    	function clearBlinkBorder() {
    		clearInterval(blinkBorder);
    		$('.total-orderFormat').css("border-style", "none");
    	}
    	
    </script>
</body>
</html>
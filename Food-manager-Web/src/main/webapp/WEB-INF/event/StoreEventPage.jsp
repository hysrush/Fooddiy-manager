<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		<!-- Basic -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">	

		<title>| Fooddiy-Order Admin+ |</title>	

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
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/vendor/animate/animate.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/vendor/owl.carousel/assets/owl.carousel.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/vendor/owl.carousel/assets/owl.theme.default.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.min.css">

		<!-- Theme CSS -->
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/theme.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/theme-elements.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/theme-blog.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/theme-shop.css">

		<!-- Current Page CSS -->
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/vendor/rs-plugin/css/settings.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/vendor/rs-plugin/css/layers.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/vendor/rs-plugin/css/navigation.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/vendor/circle-flip-slideshow/css/component.css">

		<!-- Skin CSS -->
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/skins/skin-shop-9.css"> 

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/demos/demo-shop-9.css">

		<!-- Head Libs -->
		<script src="${ pageContext.request.contextPath}/resources/vendor/modernizr/modernizr.min.js"></script>


		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/custom.css">
	<script src="${ pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>


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
								<h1>매장별 EVENT</h1>
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
									<li><a href="${ pageContext.request.contextPath }/event/eventPage.do">브랜드 이벤트</a></li>
									<li class="active">
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
												<a href="#tabsNavigationSimple1" data-toggle="tab" aria-expanded="true">매장별 이벤트</a>
											</li>
										</ul>
										<div class="tab-content">
											<div class="tab-pane active" id="tabsNavigationSimple1">
												<div class="center">
												<!--  cart -->
											 			<div class="col-md-12">
										<div class="featured-box featured-box-primary align-left mt-xlg">
											<div class="box-content">
												<h4 class="heading-primary text-uppercase mb-md">지역검색</h4>
													<div class="row">
														<div class="form-group">
															<div class="col-md-6">
																<label>시,도</label>
																<select class="form-control" id ="sido">
																	<option value="" selected="selected" disabled= "disabled">시,도 를 선택해주세요 </option>
																	  <c:forEach var="city" items="${ cityList }" varStatus="i">
																	  		<option value="${city.cityNo}">${ city.cityName }</option>																		    
																	  </c:forEach>
																</select>
															</div>
															
															<div class="col-md-6">
																<label>군,구</label>
																<select class="form-control" id= "gugun">
																	<option value="" selected="selected">구,군 을 선택해주세요 </option>
																	 	<c:forEach var="location" items="${ locationList }" varStatus="i">
																	 			
																			<option value="${ location.locationNo }" >${ location.locationName }</option>
																	     
																	  </c:forEach>
																</select>
															</div>	
														</div>
													</div>
												<!-- <div class="row">
														<div class="form-group">
															<div class="col-md-12">
																<label>매장별 검색</label>
																<input type="text" value="" class="form-control">
															</div>
														</div>
													</div> -->
													<div class="row">
														<div class="col-md-12">
																		<!--  ajax로 보내버리는 a태그  -->
																	
																		<input type="button" id="search" value="Search" class="btn btn-default pull-right mb-xl" data-loading-text="Loading...">
																	
														</div>
													</div>
												
													<!--  AJAX 테이블이 생성될 공간  -->
														<div class="row">
															<div class="col-md-12">
																<form action="storeEventPage.do" method ="post">
																	<table class="table table-hover" width="80%">
																		<thead>
																			<tr>
																				<th>매장번호</th>
																				<th>매장명</th>
																				<th>매장 주소 </th>
																				<th>매장 전화번호</th>
																				<th> 선택 </th>
																			</tr>
																		</thead>
																		<tbody id = "storeList">
																			
																			
																		</tbody>
																	</table>
																</form>
															</div>
														</div>
										</div>
									</div>	
												<!--  선택한 매점 이름과 매칭되는 이벤트 불러오기  -->
													<div class="center" id ="eventByStore">	
												
													
													
													
													
													</div>
													
													<!--  -->
										<div class="col-md-12">
											<ul class="pagination">
												<li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
												<li class="active"><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#">4</a></li>
												<li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
											</ul>
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
	</div>	
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
		
		<!-- Examples -->
		<script src="${ pageContext.request.contextPath}/resources/js/examples/examples.portfolio.js"></script>
		
		<script type="text/javascript">
			
			$("#sido").change(function(){
				
				// 1. Parameter setting
				var sido = $("#sido").val();
				console.log( "선택된 값1 : " + $("#sido").val() );
	       		
				// 2. ajax call
				$.ajax({
		              url : "./test",
		              type: "post",
		              data : { "sido" : sido },
		              success : function(responseData){
		                  			var data = JSON.parse(responseData);
		                  			
		                  			// 3. result setting
		  				          	alert('다녀옴 , result = ' + data.result);
		  				          	alert('다녀옴 , guList[1] = ' + data.guList[0].LOC_NAME);
		  				          	alert('다녀옴 , guList[1] = ' + data.guList[0].LOC_NO);
		                  			
		  				          	$('#gugun').empty();
			  				        $('#gugun').append('<option value="" selected="selected">구,군 을 선택해주세요 </option>');
		  				          	for(var i = 0 ; i < data.guList.length ; i++){
		  				          		$('#gugun').append('<option value="'+ data.guList[i].LOC_NO + '">' + data.guList[i].LOC_NAME + '</option>');	
		  				          	} 	
		              }
		          });
			});
			
			/* $("#gugun").change(function(){
				
				// 1. Parameter setting
				
				var gugun = $("#gugun").val();
				
				console.log( "선택된 값1 : " + $("#gugun").val() );
				
				// 2. ajax call
				$.ajax({
		              url : "./test2",
		              type: "post",
		              data : {"gugun" : gugun},
		              success : function(responseData){
		                  			var data = JSON.parse(responseData);
		                  			
		                  			// 3. result setting
		  				          	alert('다녀옴 , result = ' + data.result);
		  				          	alert('다녀옴 , storeList = ' + data.storeList[0].STO_NO);
		  				          	alert('다녀옴 , storeList = ' + data.storeList[0].STO_NAME);
		                  			
		  				          	}
		  				        
			  				          $('#gugun').append('<option value="" selected="selected">구,군 을 선택해주세요 </option>');
		  				          	for(var i = 0 ; i < data.guList.length ; i++){
		  				          		$('#gugun').append('<option value="" selected="selected">' + data.guList[i] + '</option>');	 
		  				              
		          });
				});  */
			
			
				$("#search").click(function(){
					
					var gugun = $("#gugun").val();
					console.log( " 구군 값 : " + $("#gugun").val());
					
					$.ajax({
						url : "./test3",
						type : "post",
						data : {"gugun" : gugun},
						success : function(responseData){
									var data = JSON.parse(responseData);
									
									alert("result = " + data.result);
									alert("매장이름 = " + data.storeList[0].storeName);
									$('#storeList').empty();
								 	for(var i = 0 ; i < data.storeList.length; i++){
										var contents = '';
										contents += '<tr>';
										contents +=		'<td>'+ data.storeList[i].storeNo+'</td>';
										contents +=		'<td id="storeName" value="'+data.storeList[i].storeName +'">'+ data.storeList[i].storeName+'</td>';
										contents +=		'<td >'+ data.storeList[i].storeAddr+'</td>';
										contents +=		'<td>'+ data.storeList[i].storePhone+'</td>';
										contents +=		'<td><input type="button" name = "storeChoice" onclick="test(\''+data.storeList[i].storeName+'\')" value="선택" /></td>';
										contents += '</tr>';
									
										$('#storeList').append(contents);

								 	}		
						}
					});
		
				});
				
 				function test(storeName){
 					alert('storeName = ' + storeName);
 					
 					var btn = this;
 					var store = storeName;
 					
 					$.ajax({
 						url : "./test4",
 						type : "post",
 						data : {"store" : store},
 						success : function(responseData){
 							var data = JSON.parse(responseData);
 							
 							alert("result = " +data.result);
 							alert("이벤트 제목 = " + data.eventList[0].imgFileName);
 							
 							$('#eventList').empty();
 						for(var i=0; i< data.eventList.length; i++){	
 							
 						 	var contents ='';
 							
							contents +='<div class="col-md-12">';
							contents += 	'<ul>';
							contents += 		'<li>';
							contents += 			'<div class="col-md-6">';
							contents += 				'<a href="${ pageContext.request.contextPath }/event/eventDetail.do?no=${ eventVO.no }">';
							contents += 					'<img alt="" class="img-responsive img-rounded" src="../upload/'+data.eventList[i].imgFileName+'" width:600px;height:150px">';
							contents += 				'</a>';
							contents += 			'</div>';
							contents += 			'<div class="col-md-6" align="left">';
							contents += 				'<h4><strong>'+ data.eventList[i].content+'</strong></h4>';
							contents += 			'<br/><br/>';		
							contents += 			'<span>'+data.eventList[i].startDate + '~' + data.eventList[i].endDate + '</span>';											
							contents += 		'<div>';
							contents += 	'<hr/><br/><br/>';
							contents += '</li>';
							contents += '</ul>';
							contents += '</div>';
							//'<td><input type="button" name = "storeChoice" onclick="test(\''+data.storeList[i].storeName+'\')" value="선택" /></td>';
							//contents += 			'</div>';
							$('#eventByStore').append(contents);
 						}

 						}
 						
 					});
 					
 					
 					
 				}
				
				
				
				//ajax3 
				/* $("input[name=storeChoice]").click(function(){
					alert('들어옴');
					var btn = this;
					
					var storeName = $(btn).val();
					console.log("매장이름 : " +$("#storeName").val());
					
					$.ajax({
						url : "./test4",
						type : "post",
						data : {"storeName" : storeName},
						success : function(responseData){
								var data = JSON.parse(responseData);	
								
								
								$(btn).removeAttr('disabled');
								
								
						}
					});
				});*/
				
			
			
			
		
		</script>
	</body>
</html>
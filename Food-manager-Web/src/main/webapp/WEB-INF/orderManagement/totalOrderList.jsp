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
<link href="${ pageContext.request.contextPath }/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">

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
					<h2>전체주문내역</h2>
					<ol class="breadcrumb">
						<li>
							<a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
						</li>
						<li>
							<a>주문관리</a>
						</li>
						<li class="active">
							<strong>전체주문내역</strong>
						</li>
					</ol>
				</div>
				<div class="col-lg-2">
				</div>
			</div>


			<!-- 페이지 컨텐츠 -->
			<div class="wrapper wrapper-content animated fadeInRight ecommerce">
				<!-- Search box -->
				<div class="ibox-content m-b-sm border-bottom todayOrderInfo">
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered" style="margin-bottom: 0px">
								<tbody>
									<tr>
										<th style="text-align: center; font-size: 20px; padding-top:30px;">주문검색 날짜</th>
										<td style="padding-left: 30px">
											<div class = "row">
							                    <div class="col-sm-4">
							                        <div class="form-group">
							                            <label class="control-label" for="date_added">시작날짜</label>
							                            <div class="input-group date">
							                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input id="date_start" type="text" class="form-control">
							                            </div>
							                        </div>
							                    </div>
							                    <div class="col-sm-4">
							                        <div class="form-group">
							                            <label class="control-label" for="date_modified">종료날짜</label>
							                            <div class="input-group date">
							                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input id="date_end" type="text" class="form-control">
							                            </div>
							                        </div>
							                    </div>
												<div class="col-sm-4" style="padding-top: 25px">
				                                    <div data-toggle="buttons" class="btn-group">
				                                    	<form class ="search-form" method="post">
				                                        	<input type="hidden" class = "input-type" name = "type"/>
				                                        	<input type="hidden" class = "input-start" name = "date_start"/>
				                                        	<input type="hidden" class = "input-end" name = "date_end"/>
				                                        	<button type="submit" class="btn btn-outline btn-primary today-button" onclick="search('T')">오늘</button>
				                                       		<button type="submit" class="btn btn-outline btn-primary week-button" onclick="search('W')">일주일</button>
				                                        	<button type="submit" class="btn btn-outline btn-primary month-button" onclick="search('D')">한달</button>
				                                        	<button type="submit" class="btn btn-w-m bg-muted btn-default search-button" onclick="search('S')" style="margin-left: 20px">검색</button>
				                                    	</form>
				                                    </div>
				                                </div>
			                                </div>
										</td>
									</tr>												
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- menu List -->
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox">
							<div class="ibox-content">
								<div class="table-responsive">
									<table class="footable table table-stripped toggle-arrow-tiny dataTables-example" data-page-size="3000">
										<thead>
											<tr>
												<th data-hide="phone" data-sort-ignore="true" style="width: 95px">주문번호</th>
												<th data-hide="phone" data-sort-ignore="true" style="width: 95px">주문시간</th>
												<th data-hide="phone" data-sort-ignore="true" style="width: 300px">메뉴</th>
												<th data-hide="phone" data-sort-ignore="true" style="width: 137px">주문자</th>
												<th data-hide="phone" data-sort-ignore="true" style="width: 95px">주문금액</th>
												<th data-hide="phone" data-sort-ignore="true" style="width: 112px">총 결제금액</th>
												<th data-hide="phone" data-sort-ignore="true" style="width: 95px">결제방법</th>
												<th data-hide="phone" data-sort-ignore="true" style="width: 95px">주문상태</th>
												<th data-hide="phone" data-sort-ignore="true" style="width: 95px">주문취소</th>
											</tr>
										</thead>
										<tbody class= "todayOrderList">

										<c:forEach items="${ orderList }" var="order">

											<tr>
													<td class="convType orderNumber" width="100px;">
				                                    	${ order.no }
			            				      		</td>
														
													<td>${ order.regDate }</td>
													<td>
														<a onclick = "modalFunc(${ order.no })">
														<c:forEach items = "${  order.detailOrderList }" var = "oneOrder" varStatus="status">
															${ oneOrder.name }
															<c:if test="${ !status.last }">, </c:if>
														</c:forEach>
														</a>
			                                   		</td>
													<td width="10%" nowrap>
														<c:choose>
															<c:when test="${ order.id == '비회원'}">
																비회원(${ order.no })
															</c:when>
															<c:otherwise>
																${ order.id }
															</c:otherwise>
														</c:choose>
													</td>	
													
													<td class = "commaN orderPrice">${ order.order_price }원</td>											
													<td class = "commaN finalPrice">${ order.final_price }원</td>											
													<td>${ order.payment }</td>			
													
													<c:choose>
														<c:when test="${ order.orderStatus == '0'}">
															<td><span class="orderStatus label label-danger">주문취소</span></td>		
															<td class = "cancel-button"></td>									
														</c:when>
														
														<c:when test="${ order.orderStatus == '1' }">
															<td><span class="orderStatus label label-primary">대기중</span></td>		
															<td class = "cancel-button"></td>									
														</c:when>
														
														<c:when test="${ order.orderStatus == '2' }">
															<td><span class="orderStatus label label-warning">주문중</span></td>
															<td class = "cancel-button"></td>									
														</c:when>
														
														<c:otherwise>
															<td><span class="orderStatus label label-information">주문완료</span></td>		
															<td class = "cancel-button"></td>									
														</c:otherwise>
													</c:choose>
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
	<div class="modal inmodal fade" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
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

	<!-- Data picker -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>

	<!-- FooTable -->
	<script	src="${ pageContext.request.contextPath }/resources/js/plugins/footable/footable.all.min.js"></script>

	<!-- Page-Level Scripts -->
	<script>
        $(document).ready(function() {
        	
        	// sidebar li & ul 클래스 active
			$('.orderManagementLI').addClass("active");
			$('.orderManagementLI > ul').addClass("in");
			$('.totalOrderList').addClass("active");

			// footable 시작
            $('.footable').footable();        
			
        	//오늘날짜
			var now = new Date();
			var year = now.getFullYear();
			var mon = (now.getMonth() + 1) > 9 ? ''
					+ (now.getMonth() + 1) : '0'
					+ (now.getMonth() + 1);
			var day = now.getDate() > 9 ? '' + now.getDate()
					: '0' + now.getDate();

			var today = year + '-' + mon + '-' + day;
            $('#date_start').attr('value', today);
            $('#date_end').attr('value', today);

            $('#date_start').datepicker({
            	format : 'yyyy-mm-dd',	// 날짜 포맷
            	defaultDate: '+0',
    			endDate: '+0',			// 오늘 이후 날짜 선택 불가
            	todayBtn: "linked",
            	todayHighlight: true,	// 오늘날짜 하이라이트
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true
            });
			
        	
            $('#date_end').datepicker({
            	format : 'yyyy-mm-dd',	// 날짜 포맷
    			defaultDate: '+0d',
    			endDate: '+0d',			// 오늘 이후 날짜 선택 불가	            	
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true
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
			        	location.href = '${ pageContext.request.contextPath}/orderManagement/orderCancel.do?no=' + no +"&url=totalOrderList";
					});
			    });
			}
			
			//주문 취소 버튼 클릭 시 이벤트 발생 
			$('.button-cancel').each(function() {
				$(this).click(function() {
					var no = $(this).parent().siblings('.orderNumber').text();
					orderCancel(no);
				});
			});
			
			
			// 데이터테이블 생성 & 옵션 변경
			$('.footable').css("width","100%");
			$('.dataTables-example').DataTable({
				pageLength: 10,
                bPaginate: true,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                "oLanguage": {
                	// 기본 info (고정값)
                	"sInfo": "총 데이터 : _TOTAL_개 (현재 페이지 : _START_ to _END_)",
                	// 검색 후 info (고정값)
                    "sInfoFiltered": "*",
                    // 결과 없을때 info
                	"sInfoEmpty": "검색 결과 : _TOTAL_개",
                	// 결과 없을때 테이블 안 info
                    "sZeroRecords" : "입력하신 검색어와 일치하는 결과가 없습니다. 다시 한번 검색해주세요!",
                    // 검색 text
                    "sSearch" : "전체 검색 : ",
                    // 보기 text
                    "sLengthMenu" : "보기 : _MENU_",
                    // 페이징 버튼 text
                    "oPaginate": {
                    	"sPrevious": "<<",
                    	"sNext": ">>"
                      }
                },
                "iDisplayLength": -1,
                "aaSorting": [[ 0, "desc" ]], // Sort by first column descending
      
                // 버튼 옵션
                buttons: [
                    {extend: 'copy', text: '<i class="fa fa-copy" aria-hidden="true"> Copy</i>'},
                    //{extend: 'csv'},
                    {extend: 'excel', title: 'ExcelFile', text: '<i class="fa fa-file-excel-o" aria-hidden="true"> Excel</i>'},
                    {extend: 'pdf', title: 'PdfFile', text: '<i class="fa fa-file-pdf-o" aria-hidden="true"> Pdf</i>'},
                    {extend: 'print', text: '<i class="fa fa-print" aria-hidden="true"> Print</i>',
                     customize: function (win){
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');
                            $(win.document.body).find('table').addClass('compact').css('font-size', 'inherit');
                    	}
                    }
                ]
            });
			// 데이터테이블 검색입력 시, 단어 추출 작업
			$('#DataTables_Table_0_filter input').keyup(function() {
				var keyupWord = $(this).val();
				var empty = $('table .dataTables_empty').text();
				var text = $('#DataTables_Table_0_info').text();
				
				if (empty == "입력하신 검색어와 일치하는 결과가 없습니다. 다시 한번 검색해주세요!") {
					$('#DataTables_Table_0_info').html(text.replace("*", "<br><strong>" + keyupWord + "</strong>와(과) 일치하는 검색결과가 없습니다."));
				} else if (keyupWord.length > 0){
					$('#DataTables_Table_0_info').html(text.replace("*", "<br><strong>" + keyupWord + "</strong>와(과) 일치하는 검색결과입니다."));
				} 
			});
        });
        
        //모달화면 출력
        function modalFunc(no) {
        	var url = "${pageContext.request.contextPath}/orderManagement/todayOrderDetail.do?no=" + no;
        	$('div.modal').modal().removeData();
		    $('div.modal').modal({ remote : url  });
        }
        
        
        //Date 포맷 변환함수
        function dateConvertFormat(date){
            function pad(num) {
                num = num + '';
                return num.length < 2 ? '0' + num : num;
            }
            return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
        }

         
        //검색버튼함수
      	function search(type) {
      		//오늘날짜
			var now = new Date();
			var year = now.getFullYear();
			var mon = (now.getMonth() + 1) > 9 ? ''
					+ (now.getMonth() + 1) : '0'
					+ (now.getMonth() + 1);
			var day = now.getDate() > 9 ? '' + now.getDate()
					: '0' + now.getDate();

			var today = year + '-' + mon + '-' + day;
        	var date = new Date(today);
        	
        	
        	$('.saarch-form').attr('action', "${pageContext.request.contextPath}/orderManagement/totalOrderList.do");
        	
        	if(type == "T") {
        		$('.input-type').val('D');
        		$('.input-start').val(today);
        		$('.input-end').val(today);
        	}else if(type == "W") {
        		
        		//일주일전 날짜 구하기
        		date.setDate(date.getDate() - 7);
        		date = dateConvertFormat(date);
        		
        		$('.input-type').val('W');
        		$('.input-start').val(date);
        		$('.input-end').val(today);
        	}else if(type == "M"){
        		
        		//한달전 날짜 구하기
        		date.setDate(date.getDate() - 30);
        		date = dateConvertFormat(date);
        		
        		$('.input-type').val('M');
        		$('.input-start').val(date);
        		$('.input-end').val(today);

        	}else if(type == "S") {
        		var date_start = new Date($('#date_start').val());
            	var date_end =  new Date($('#date_end').val());
            	
            	if(date_end >= date_start) {
            		
	        		$('.input-type').val('S');
	        		$('.input-start').val($('#date_start').val());
	        		$('.input-end').val($('#date_end').val());
            	}else {
            		swal({
    			        title: "날짜 검색",
    			        text: "시작날짜와 종료날짜가 잘못되었습니다!",
    			        type: "warning",
    			        confirmButtonColor: "#DD6B55",
    			        confirmButtonText: "확인",
    			        closeOnConfirm: true
    			    });
            		
            		$('.search-form').attr('action', "#");
            	}
        	}
        	
        	
        	alert($('.input-type').val());
        	alert($('.input-start').val());
        	alert($('.input-end').val());
        	$('.search-form').submit();
        	
        }
    </script>

</body>

</html>

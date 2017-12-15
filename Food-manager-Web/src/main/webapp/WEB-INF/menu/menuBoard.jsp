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
<!-- iCheck -->
<link href="${ pageContext.request.contextPath }/resources/css/plugins/iCheck/custom.css" rel="stylesheet">

<link rel="stylesheet" href="https://wfolly.firebaseapp.com/node_modules/sweetalert/dist/sweetalert.css">

<link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">

<style type="text/css">
	.convType > span {
		width: 60px;
	}
	.btn-default {
		text-align: right;
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


			<!-- 페이지 컨텐츠 -->
			<div class="wrapper wrapper-content animated fadeInRight ecommerce">
				<!-- Search box -->
				<div class="ibox-content m-b-sm border-bottom">
					<div class="row">
						<div class="col-sm-2">
							<div class="form-group">
								<label class="control-label" for="type">타입</label>
								<select	name="type" id="type" class="form-control">
									<option value="" selected>타입선택</option>
									<option value="R">추천메뉴</option>
									<option value="P">프리미엄</option>
									<option value="B">베스트</option>
									<option value="C">클래식</option>
									<option value="M">아침식사</option>
									<option value="S">샐러드</option>
									<option value="N">추가메뉴</option>
									<option value="D">음료</option>
								</select>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="menuname">이름</label>
								<input type="text" id="menuname" name="menuname" value="" placeholder="메뉴 이름" class="form-control">
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="price">가격</label>
								<input type="text" id="price" name="price" value="" placeholder="가격"	class="form-control">
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-group">
								<label class="control-label" for="regDate">등록일</label>
								<input type="date" id="regDate" name="regDate" value=""	placeholder="regDate" class="form-control">
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
									<table class="footable table table-stripped toggle-arrow-tiny dataTables-example" data-page-size="100">
										<thead>
											<tr>
												<th data-hide="phone" data-sort-ignore="true" style="width: 95px">
													<div class = "total-select">
														<input type="checkbox" class="i-checks" id="chkall">														
													</div>
												</th>
												<th data-hide="phone" data-sort-ignore="true">타입</th>
												<th data-toggle="true" data-sort-ignore="true">이름</th>
												<th data-hide="all" data-sort-ignore="true">메뉴소개</th>
												<th data-hide="phone" data-sort-ignore="true">가격</th>
												<th data-hide="phone" data-sort-ignore="true">등록일</th>
												<th class="text-right" data-sort-ignore="true">Action</th>
											</tr>
										</thead>
										
										
										<tbody>

										<c:forEach items="${ menuList2 }" var="menu">

											<tr class="boardList">
												<td>
													<input type="checkbox" class="i-checks" name="chk">
													<div style="display: none">${ menu.no }</div>
												</td>
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
														<button class="btn-white btn btn-xs" id="view" onclick="btnClick('V', ${menu.no})"><i class="fa fa-search"></i></button>
														<button class="btn-white btn btn-xs" onclick="btnClick('E', ${menu.no})"><i class="fa fa-edit"></i></button>
		                                          		<button class="btn-white btn btn-xs" onclick="btnClick('D', ${menu.no})"><i class="fa fa-trash"></i></button>
													</div>
													<div class="menuType" style="display: none">${ menu.type }</div>
												</td>
											</tr>

										</c:forEach>

										</tbody>
									</table><button class="btn btn-outline btn-danger btn-md" type="button" onclick="delRow()">선택삭제</button>
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
	<!-- sweetalert js & css -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> 	
	<!-- iCheck -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/iCheck/icheck.min.js"></script>

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
			
			// 체크박스
			$('.i-checks').iCheck({
	            checkboxClass: 'icheckbox_square-green',
	            radioClass: 'iradio_square-green',
	        });
			
			
			$(document).ready('load', function(){
				$('#DataTables_Table_0_info').before('<button/>');
			});
			
			/* '<button class="btn btn-default btn-xs" type="button" onclick="delRow()">선택삭제</button>' */
			
    		// 체크박스 전체 선택
    		var start = 4;
    		$('input').eq(start).on('ifChecked', function(){
    			$('.icheckbox_square-green').addClass("checked");
    		});
    		$('input').eq(start).on('ifUnchecked', function(){
    			$('.icheckbox_square-green').removeClass("checked");
    		});
			
    		// 체크박스 초기화
    		$(document).on('change', '.input-sm', function(){
    			$('.icheckbox_square-green').removeClass("checked");
    		});
    		$(document).on('click', '.pagination', function(){
    			$('.icheckbox_square-green').removeClass("checked");
    		});
    		
			
			// 데이터테이블 생성
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
                buttons: [
                    {extend: 'copy'},
                    {extend: 'csv'},
                    {extend: 'excel', title: 'ExcelFile'},
                    {extend: 'pdf', title: 'PdfFile'},
                    {extend: 'print',
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
                
        
     	// action 함수
		function btnClick(type, no) {
			switch (type) {
			case 'V':
				location.href = '${ pageContext.request.contextPath }/menu/menuDetail.do?no=' + no;
				break;
			case 'E':
				location.href = '${ pageContext.request.contextPath }/menu/menuEditForm.do?no=' + no;
				break;
			case 'D':
				deleteMenu(no);
				break;
			default:
				break;
			}
	    }
        
		// 삭제 확인창
		function deleteMenu(no) {
			swal({
		        title: "정말 삭제하시겠습니까?",
		        type: "warning",
		        showCancelButton: true,
		        cancelButtonText: "취소",
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "삭제",
		        closeOnConfirm: false
		    }, function () {
		        swal("삭제되었습니다!", "", "success");
		        // OK 누르면 삭제 실행
		        $('.confirm').click(function () {
		        	location.href = '${ pageContext.request.contextPath}/menu/menuDelete.do?no=' + no;
				});
		    });
		}
		
		
		// 체크박스 선택삭제
		var cnt = 0;
		var nums = "";
		function delRow() {﻿
			cnt = 0;
			nums = "";
			$('.checked').each(function(index) {
				cnt++;
				nums += $(this).next().text() + ",";
			});
			if($('.icheckbox_square-green').eq(0).hasClass('checked')){
				cnt--;
			}
			if(cnt != 0){
				deleteRow(nums, cnt);
			}
			else{
				deleteZero();
			}
		}
		
		// 선택삭제 alert 확인창
		function deleteRow(nums, cnt) {
			swal({
		        title: cnt + "개 메뉴를 삭제하시겠습니까?",
		        type: "warning",
		        showCancelButton: true,
		        cancelButtonText: "취소",
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "삭제",
		        closeOnConfirm: false
		    }, function () {
		        swal("삭제되었습니다!", "", "success");
		        // OK 누르면 삭제 실행
		        $('.confirm').click(function () {
		        	location.href = '${ pageContext.request.contextPath}/menu/menuDeleteSome.do?nums=' + nums;
				});
		    });
		}
		
		// 선택한 메뉴 없을 때 alert
		function deleteZero() {			
            swal({
                title: "선택하신 메뉴가 없습니다 :(",
                text: ""
            });	        
		}
		﻿
		

		
		
		
		
	    	

    </script>

</body>

</html>

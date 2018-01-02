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

	<!-- dataTables -->
	<link href="${ pageContext.request.contextPath }/resources/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <!-- FooTable -->
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/footable/footable.core.css" rel="stylesheet">
	<!-- iCheck -->
	<link href="${ pageContext.request.contextPath }/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
	<!-- sweetalert js & css -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> 
	<link rel="stylesheet" href="https://wfolly.firebaseapp.com/node_modules/sweetalert/dist/sweetalert.css">
	
    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
<style type="text/css">
	.pace-done{
		padding-right: 0 !important;
	}
	.convType > span {
		width: 60px;
	}
</style>
</head>
<body>
	<div id="wrapper">    
	    <!-- sidebar -->
	    <jsp:include page="/resources/include/sidebar.jsp"/>
    
    <div id="page-wrapper" class="gray-bg">        
        <!-- topbar -->
	    <jsp:include page="/resources/include/topbar.jsp"/>
        
       	<!-- 페이지 header -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>매장 관리</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                    </li>
                    <li>
                        <a>매장 관리</a>
                    </li>
                    <li class="active">
                        <strong>매장 관리</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">
            </div>
        </div>
        
		<!-- 페이지 body -->
        <div class="wrapper wrapper-content animated fadeInRight ecommerce">
            <div class="row">
                <div class="col-lg-12">
                    <div class="tabs-container">
						<ul class="nav nav-tabs">
						    <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-list"></i>리스트</a></li>
						    <li class=""><a href="${ pageContext.request.contextPath}/store/storeWrite.do"><i class="fa fa-save"></i>매장 등록</a></li>
						    <li class=""><a href="#"><i class="fa fa-edit"></i>수정</a></li>
						</ul>
						<div class="tab-content">
							<!-- 첫번째 Tab : 자주묻는질문 리스트 -->
							<div id="tab-1" class="tab-pane active">
							    <div class="panel-body">
                                   	<h2>매장 리스트</h2>
									<div class="ibox">
										<div class="ibox-content">
											<div class="table-responsive">
												<table class="datatable table table-stripped toggle-arrow-tiny dataTables-example" data-page-size="100">
													<thead>
													 <tr>
													 	<th data-hide="phone" data-sort-ignore="true" width="55px;">
															<div class ="total-select" >
																<input type="checkbox" class="i-checks" id="chkall">														
															</div>
														</th>
													     <th style="width:5%">매장번호</th>
													     <th style="width:20%">매장명</th>
													     <th style="width:45%">매장 주소</th>
													     <th style="width:20%">매장 전화번호</th>
													     <th style="width:20%">등록일</th>
													     <th style="width:10%">Action</th>
													 </tr>
													</thead>
					                                <tbody>
					                                <c:forEach items="${ storeList }" var="store">
						                                <tr class="storeList">
						                                	<td>
																<input type="checkbox" class="i-checks" name="chk">
																<div style="display: none">${ claim.no }</div>
															</td>
						                                    <td class="convType" width="7%">
							                                    <span class="label label-primary">${ store.storeNo }</span>
						                                    </td>
						                                    <td>
						                                        ${ store.storeName }점
						                                    </td>
						                                    <td style="word-break:keep-all;">
						                                        ${ store.storeAddr }
						                                    </td>
						                                    <td width="10%" nowrap>
						                                        ${ store.storePhone }
						                                    </td>
						                                    <td width="10%" nowrap>
						                                        ${ store.regDate }
						                                    </td>
						                                    <td class="text-right">
						                                        <div class="btn-group" width="10%" nowrap>
						                                        	<button class="btn-white btn btn-xs" data-toggle="tooltip" data-placement="top" title="수정" 
						                                            		onclick="action('E', ${claim.no})"><i class="fa fa-edit"></i></button>
						                                            <button class="btn-white btn btn-xs" data-toggle="tooltip" data-placement="top" title="삭제" 
						                                            		onclick="action('D', ${claim.no})"><i class="fa fa-trash"></i></button>
						                                        </div>
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
							<!-- 두번째 Tab : 자주묻는질문 등록 -->
							<div id="tab-2" class="tab-pane">
							    <div class="panel-body">
							    </div>
							</div>
							<!-- 세번째 Tab : 자주묻는질문 수정 -->
							<div id="tab-3" class="tab-pane">
							    <div class="panel-body">
							    </div>
							</div>
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
	
	<!-- dataTables -->
	<script src="${ pageContext.request.contextPath }/resources/js/plugins/dataTables/datatables.min.js"></script>
    <!-- FooTable -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/footable/footable.all.min.js"></script>
	
    <!-- Custom and plugin javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/inspinia.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pace/pace.min.js"></script>
	
	<!-- iCheck -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/iCheck/icheck.min.js"></script>
	
    
    <!-- Page-Level Scripts -->
    <script type="text/javascript">
		$(document).ready(function() {
			
			
			
			// sidebar li & ul 클래스 active
			$('.storeLI').addClass("active");
			$('.storeLI > ul').addClass("in");
			$('.storeLI2').addClass("active");
			
			// footable 시작
			$('.footable').footable();
			
			// 체크박스
			$('.i-checks').iCheck({
	            checkboxClass: 'icheckbox_square-green',
	            radioClass: 'iradio_square-green',
	        });
			
			// 체크박스 전체 선택
			var start = 4;
			$('#chkall').on('ifChecked', function(){
				$('.icheckbox_square-green').addClass("checked");
			});
			$('#chkall').on('ifUnchecked', function(){
				$('.icheckbox_square-green').removeClass("checked");
			});
			
			// 체크박스 초기화
			$(document).on('change', '.input-sm', function(){
				$('.icheckbox_square-green').removeClass("checked");
			});
			$(document).on('click', '.pagination', function(){
				$('.icheckbox_square-green').removeClass("checked");
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
                // 우선순위 Sort
                "aaSorting": [[ 5, "desc" ]], // Sort by first column descending
                // 컬럼 Sort 없애기
                "aoColumnDefs": [
                    { "bSortable": false, "aTargets": [ 0 ] }
                ],
                // 버튼 옵션
                buttons: [
                    {extend: 'copy'},
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
			
			// 선택삭제 버튼 생성
			table.button().add( 4, {
			    text: '<i class="fa fa-trash" aria-hidden="true"> 선택삭제</i>',
			    action: function () {
			    	delRow();
			    }
			} );
			// 선택삭제 버튼 위치 변경
			var clone = $('.dt-buttons a').eq(4).clone(true);
			//clone.appendTo('#DataTables_Table_0_paginate').css('float','left');
			$('#DataTables_Table_0_paginate').before(clone).css('float','right');
			$('.dt-buttons a').eq(4).show();
			
		});
		
		// QnA action 함수
		function action(type, no) {
			switch (type) {
			case 'V':
				// QnA 디테일 모달
				$('div.modal').modal().removeData();
			    var url = '${ pageContext.request.contextPath}/store/storeDetail.do?no=' + no;
			    $('div.modal').modal({ remote : url  });
				break;
			case 'E':
				location.href = '${ pageContext.request.contextPath}/store/storeModifyForm.do?no=' + no;
				break;
			case 'D':
				deleteQnA(no);
				break;
			default:
				break;
			}
	    }
		
		// 체크박스 선택삭제
		var cnt = 0;
		var nums = "";
		function delRow() {﻿
			cnt = 0;
			nums = "";
			$('.checked').each(function() {
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
		        title: "선택 삭제",
		        text: cnt + "개의 게시물을 삭제하시겠습니까?",
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
		        	location.href = '${ pageContext.request.contextPath}/community/claim/claimDeleteSome.do?nums=' + nums;
				});
		    });
		}
		
		// 선택한 메뉴 없을 때 alert
		function deleteZero() {			
            swal({
                title: "선택한 게시물이 없습니다!",
              	type: "error"
            });	        
		}
		
		// 삭제 alert창
		function deleteQnA(no) {
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
		        	location.href = '${ pageContext.request.contextPath}/store/deleteStore.do?no=' + no;
				});
		    });
		}
		
	</script>
	</body>
</html>
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
	.label-primary {
		background-color: #7aa93c;
	}
	.dataTables_wrapper {
		padding-bottom: 0 !important;
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
                <h2>Subway소식 관리</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                    </li>
                    <li>
                        <a>커뮤니티 관리</a>
                    </li>
                    <li class="active">
                        <strong>Subway소식 관리</strong>
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
						    <li class=""><a href="${ pageContext.request.contextPath}/community/subway/noticeWriteForm.do"><i class="fa fa-save"></i>등록</a></li>
						    <!-- <li class=""><a href="#"><i class="fa fa-edit"></i>수정</a></li> -->
						</ul>
						<div class="tab-content">
							<!-- 첫번째 Tab : 서브웨이소식 리스트 -->
							<div id="tab-1" class="tab-pane active">
							    <div class="panel-body">
                                   	<h2>Subway소식 리스트</h2>
									<div class="ibox">
										<div class="ibox-content">
											<div class="table-responsive">
												<table class="footable table table-stripped toggle-arrow-tiny dataTables-example" data-page-size="60">
													<thead>
													 <tr>
														<th data-hide="phone" data-sort-ignore="true" width="45px;">
															<div class ="total-select">
																<input type="checkbox" class="i-checks" id="chkall">														
															</div>
														</th>
													     <th data-hide="phone" data-sort-ignore="true">타입</th>
													     <th data-toggle="true" data-sort-ignore="true">제목</th>
													     <th data-hide="all" data-sort-ignore="true">내용</th>
													     <th data-hide="phone" data-sort-ignore="true">작성자</th>
													     <th data-hide="phone" data-sort-ignore="true">등록일</th>
													     <th data-hide="phone" data-sort-ignore="true">조회</th>
													     <th class="text-right" data-sort-ignore="true">Action</th>
													 </tr>
													</thead>
					                                <tbody>
					                                <c:forEach items="${ noticeList }" var="notice">
						                                <tr class="noticeList">
						                                	<td>
																<input type="checkbox" class="i-checks" name="chk">
																<div style="display: none">${ notice.no }</div>
															</td>
						                                    <td class="convType" width="100px;">
							                                    <span class="label label-primary">${ notice.type }</span>
						                                    </td>
						                                    <td>
						                                        ${ notice.title }
						                                    </td>
						                                    <td style="word-break:keep-all;">
						                                        ${ notice.content }
						                                    </td>
						                                    <td width="10%" nowrap>
						                                        ${ notice.writer }
						                                    </td>
						                                    <td width="10%" nowrap>
						                                        ${ notice.regDate }
						                                    </td>
						                                    <td width="50px;" nowrap>
						                                        ${ notice.viewCnt }
						                                    </td>
						                                    <td class="text-right" width="100px;" >
						                                        <div class="btn-group" nowrap>
						                                            <button class="btn-white btn btn-xs" id="view" onclick="action('V', ${notice.no})"><i class="fa fa-search"></i></button>
						                                            <button class="btn-white btn btn-xs" onclick="action('E', ${notice.no})"><i class="fa fa-edit"></i></button>
						                                            <button class="btn-white btn btn-xs" onclick="action('D', ${notice.no})"><i class="fa fa-trash"></i></button>
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
							<!-- <div id="tab-3" class="tab-pane">
							    <div class="panel-body">
							    </div>
							</div> -->
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
        
	<!-- 모달들 -->
	<div class="modal inmodal" id="myModal4" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated fadeIn">
				<!-- 모달내용 -->
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
	
    <!-- Custom and plugin javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/inspinia.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pace/pace.min.js"></script>
	
	<!-- iCheck -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/iCheck/icheck.min.js"></script>
	
    <!-- FooTable -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/footable/footable.all.min.js"></script>
    
    <!-- Page-Level Scripts -->
    <script type="text/javascript">
		$(document).ready(function() {
			
			// sidebar li & ul 클래스 active
			$('.communityLI').addClass("active");
			$('.communityLI > ul').addClass("in");
			$('.noticeLI').addClass("active");
		    
			// footable 시작
			$('.footable').footable();
		    
			// QnA 타입별 라벨 클래스명 & 텍스트 변경
			for(var i = 0; i < $('.noticeList').length; ++i) {    	
				var noticeType  = $('.noticeList').eq(i).find('.label');
				if(noticeType.text() == 'A'){
					noticeType.attr("class","label label-primary");
					noticeType.html("공지사항");
				}
				else if(noticeType.text() == 'B'){
					noticeType.attr("class","label label-danger");
					noticeType.html("보도자료");
				}
			}
			
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
			var table = $('.dataTables-example').DataTable({
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
                    // 로딩 text
                    "sLoadingRecords" : "읽는중...",
                    // 처리 text
                    "sProcessing" : "처리중...",
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
			// 선택삭제 버튼 생성
			table.button().add( 4, {
			    text: '<i class="fa fa-trash" aria-hidden="true"> 선택삭제</i>',
			    action: function () {
			    	delRow();
			    }
			} );
			// 선택삭제 버튼 위치 변경
			var clone = $('.dt-buttons a').eq(4).clone(true);
			clone.appendTo('#DataTables_Table_0_paginate').css('float','left');
			$('.dt-buttons a').eq(4).hide();
		});
		
		// Notice action 함수
		function action(type, no) {
			switch (type) {
			case 'V':
				// Notice 디테일
				alert("디테일");
				/* $('div.modal').modal().removeData();
			    var url = '${ pageContext.request.contextPath}/community/qna/qnaDetail.do?no=' + no;
			    $('div.modal').modal({ remote : url  }); */
				break;
			case 'E':
				// Notice 수정
				location.href = '${ pageContext.request.contextPath}/community/subway/noticeEditForm.do?no=' + no;
				break;
			case 'D':
				// Notice 삭제
				deleteNotice(no);
				break;
			default:
				break;
			}
	    }
		
		// 삭제 alert창
		function deleteNotice(no) {
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
		        	location.href = '${ pageContext.request.contextPath}/community/subway/noticeDelete.do?no=' + no;
				});
		    });
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
		        	location.href = '${ pageContext.request.contextPath}/community/subway/noticeDeleteSome.do?nums=' + nums;
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
		
	</script>
	</body>
</html>
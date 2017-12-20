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
                <h2>SNS관리</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                    </li>
                    <li>
                        <a>SNS관리</a>
                    </li>
                    <li class="active">
                        <strong>SNS관리</strong>
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
						    
						</ul>
						<div class="tab-content">
							<!-- 첫번째 Tab : 자주묻는질문 리스트 -->
							<div id="tab-1" class="tab-pane active">
							    <div class="panel-body">
                                   	<h2>SNS 리스트</h2>
									<div class="ibox">
										<div class="ibox-content">
											<div class="table-responsive">
												<table class="datatable table table-stripped toggle-arrow-tiny dataTables-example" data-page-size="25">
													<thead>
													 <tr>
													     <th style="width:5%">게시물 번호</th>
													     <th style="width:5%">작성자</th>
													     <th style="width:20%">사진</th>
													     <th style="width:45%"> 제목</th>
													     <th style="width:20%">추천수</th>
													     <th style="width:10%">Action</th>
													 </tr>
													</thead>
					                                <tbody>
					                                <c:forEach items="${ snsList}" var="snsVO">
						                                <tr class="storeList">
						                                    <td class="convType" width="100px;">
							                                    <span class="label label-primary">${ snsVO.no }</span>
						                                    </td>
						                                    <td class="convType" width="100px;">
							                                    ${ snsVO.id }
						                                    </td>
						                                    <td>
						                                        <a href="${ pageContext.request.contextPath }/community/snsDetail.do?no=${ snsVO.no }">
																	<img alt="" class="img-responsive img-rounded" src="${pageContext.request.contextPath}/upload/SNS/${ snsVO.fileName }"  style=" width:600px;height:150px">
																</a>
						                                    </td>
						                                    <td style="word-break:keep-all;">
						                                        ${ snsVO.title }
						                                    </td>
						                                    <td width="10%" nowrap>
						                                        ${snsVO.like }
						                                    </td>
						                                    <td class="text-right">
						                                        <div class="btn-group" width="10%" nowrap>
						                                            <button class="btn-white btn btn-xs" id="view" onclick="action('V', ${snsVO.no})"><i class="fa fa-search"></i></button>
						                                            <button class="btn-white btn btn-xs" onclick="action('E', ${snsVO.no})"><i class="fa fa-edit"></i></button>
						                                            <button class="btn-white btn btn-xs" onclick="action('D', ${snsVO.no})"><i class="fa fa-trash"></i></button>
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
	
    <!-- FooTable -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/footable/footable.all.min.js"></script>
    
    <!-- Page-Level Scripts -->
    <script type="text/javascript">
		$(document).ready(function() {
			
			 
					
			// sidebar li & ul 클래스 active
			$('.eventLI').addClass("active");
			$('.eventLI > ul').addClass("in");
			$('.eventLI2').addClass("active");
				    
			
			
			// footable 시작
			$('.footable').footable();
		    
			
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
                // 버튼 옵션
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
		
		// QnA action 함수
		function action(type, no) {
			switch (type) {
			case 'V':
				// QnA 디테일 모달
				$('div.modal').modal().removeData();
			    var url = '${ pageContext.request.contextPath}/community/snsDetail.do?no=' + no;
			    $('div.modal').modal({ remote : url  });
				break;
			case 'E':
				location.href = '${ pageContext.request.contextPath}/community/snsModifyForm.do?no=' + no;
				break;
			case 'D':
				deleteQnA(no);
				break;
			default:
				break;
			}
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
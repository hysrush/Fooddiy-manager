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
        
       	<!-- 페이지 헤더 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>자주묻는질문 관리</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                    </li>
                    <li>
                        <a>커뮤니티 관리</a>
                    </li>
                    <li class="active">
                        <strong>자주묻는질문 관리</strong>
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
                            <select name="type" id="type" class="form-control">
                                <option value="F" selected>푸디오더</option>
                                <option value="P">포인트</option>
                                <option value="O">주문</option>
                                <option value="M">회원정보</option>
                                <option value="X">기타</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="question">Q</label>
                            <input type="text" id="question" name="question" value="" placeholder="질문" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="answer">A</label>
                            <input type="text" id="answer" name="answer" value="" placeholder="답변" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="regDate">등록일</label>
                            <input type="date" id="regDate" name="regDate" value="" placeholder="regDate" class="form-control">
                        </div>
                    </div>
                </div>
            </div>
			<!-- 자주묻는질문 List -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content">
                        	<div class="table-responsive">
	                            <table class="footable table table-stripped toggle-arrow-tiny dataTables-example" data-page-size="25">
	                                <thead>
		                                <tr>
		                                    <th data-hide="phone" data-sort-ignore="true">타입</th>
		                                    <th data-toggle="true" data-sort-ignore="true">Q</th>
		                                    <th data-hide="all" data-sort-ignore="true">A</th>
		                                    <th data-hide="phone" data-sort-ignore="true">등록일</th>
		                                    <th class="text-right" data-sort-ignore="true">Action</th>
		                                </tr>
	                                </thead>
	                                <tbody>
	                                <c:forEach items="${ qnaList }" var="qna">
		                                <tr class="qnaList">
		                                    <td class="convType" width="100px;">
			                                    <span class="label label-primary">${ qna.type }</span>
		                                    </td>
		                                    <td>
		                                        ${ qna.question }
		                                    </td>
		                                    <td style="word-break:keep-all;">
		                                        ${ qna.answer }
		                                    </td>
		                                    <td width="10%" nowrap>
		                                        ${ qna.regDate }
		                                    </td>
		                                    <td class="text-right">
		                                        <div class="btn-group" width="10%" nowrap>
		                                            <button class="btn-white btn btn-xs" id="view" onclick="action('V', ${qna.no})"><i class="fa fa-search"></i></button>
		                                            <button class="btn-white btn btn-xs" onclick="action('E', ${qna.no})"><i class="fa fa-edit"></i></button>
		                                            <button class="btn-white btn btn-xs" onclick="action('D', ${qna.no})"><i class="fa fa-trash"></i></button>
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
			$('.communityLI').addClass("active");
			$('.communityLI > ul').addClass("in");
			$('.qnaLI').addClass("active");
		    
			// footable 시작
			$('.footable').footable();
		    
			// QnA 타입별 라벨 클래스명 & 텍스트 변경
			for(var i = 0; i < $('.qnaList').length; ++i) {    	
				var qnaType  = $('.qnaList').eq(i).find('.label');
				if(qnaType.text() == 'F'){
					qnaType.attr("class","label label-primary");
					qnaType.html("푸디오더");
				}
				else if(qnaType.text() == 'P'){
					qnaType.attr("class","label label-danger");
					qnaType.html("포인트");
				}
				else if(qnaType.text() == 'O'){
					qnaType.attr("class","label label-warning");
					qnaType.html("주문");
				}
				else if(qnaType.text() == 'M'){
					qnaType.attr("class","label label-success");
					qnaType.html("회원정보");
				}
				else if(qnaType.text() == 'X'){
					qnaType.attr("class","label label-plain");
					qnaType.html("기타");
				}
			}
			
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
			    var url = '${ pageContext.request.contextPath}/community/qna/qnaDetail.do?no=' + no;
			    $('div.modal').modal({ remote : url  });
				break;
			case 'E':
				alert("수정");
				break;
			case 'D':
				deleteQnA(no);
				break;
			default:
				break;
			}
	    }
		
		// 삭제 확인창
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
		        	location.href = '${ pageContext.request.contextPath}/community/qna/qnaDelete.do?no=' + no;
				});
		    });
		}
		
	</script>
	</body>
</html>

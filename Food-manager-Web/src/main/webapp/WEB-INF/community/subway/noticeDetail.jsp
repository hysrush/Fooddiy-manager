<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>| Fooddiy-Order Admin+ |</title>	

	<link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

	<!-- Toastr style -->
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- sweetalert js & css -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> 
	<link rel="stylesheet" href="https://wfolly.firebaseapp.com/node_modules/sweetalert/dist/sweetalert.css">

    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/custom.css" rel="stylesheet">
    
<style type="text/css">
	#typeLabel {
		font-size: 10pt;
	}
	h3 {
		font-size: 26px;
	}
	.article-title {
		margin: 30px 0 50px 0;
	}
	.small text-right {
		margin-bottom: 40px;
	}
	.content {
		background: #f8fafb;
		padding: 20px 30px 30px 20px;
		font-size: 14px !important;
	}
	#fileImg {
		max-width: 700px;
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
        <div class="wrapper wrapper-content animated fadeInRight article">
        	<div class="row">
                <div class="col-lg-12">
                    <div class="tabs-container">
						<ul class="nav nav-tabs">
						    <li class=""><a href="${ pageContext.request.contextPath}/community/subway/noticeList.do"><i class="fa fa-list"></i>리스트</a></li>
						    <li class=""><a href="${ pageContext.request.contextPath}/community/subway/noticeWriteForm.do"><i class="fa fa-save"></i>등록</a></li>
						    <li class="active"><a data-toggle="tab" href="#tab-3"><i class="fa fa-search"></i>보기</a></li>
						</ul>
                        <div class="tab-content">
							<!-- 첫번째 Tab : 서브웨이소식 리스트 -->
                            <div id="tab-1" class="tab-pane">
                                <div class="panel-body">
                                </div>
                            </div>
                            <!-- 두번째 Tab : 서브웨이소식 등록 -->
                            <div id="tab-2" class="tab-pane">
                                <div class="panel-body">
                                </div>
                            </div>
                            <!-- 세번째 Tab : 서브웨이소식 보기 -->
                            <div id="tab-3" class="tab-pane active">
                                <div class="panel-body">
			                    	<div class="ibox">
				                    	<h2>Subway소식 보기</h2>
										<div class="ibox-content">
		                                	<div class="col-lg-10 col-lg-offset-1">
												<div class="text-center">
													<span class="label label-primary" id="typeLabel">${ noticeVO.type }</span>
												</div>
												<div class="text-center article-title">
													<h3>${ noticeVO.title }</h3>
												</div>
												<div class="row">
													<div class="col-md-12">
														<span class="text-muted"><i class="fa fa-user-circle"></i>
															${ noticeVO.writer }점
														</span>
														<span class="text-muted float-right"><i class="fa fa-eye"></i>
															${ noticeVO.viewCnt } views
														</span>
														<span class="text-muted float-right"><i class="fa fa-clock-o"></i>
															${ noticeVO.regDate }&nbsp;&nbsp;&nbsp;
														</span>
													</div>
												</div>
												<hr>
												<c:if test="${ not empty fileVO }">
													<div class="text-center">
														<img id="fileImg" alt="첨부파일" src="${ pageContext.request.contextPath}/upload/notice/${ fileVO.filePath }">
													</div>
												</c:if>
												<p class="content list-group-item-text">
													<!-- 자동 단락 나누기 (jstl - fn) -->
													${ fn:replace(noticeVO.content, cn, br) }
												</p>
												<c:if test="${ not empty fileVO }">
													<div class="text-left">
														<i class="fa fa-file"></i>&nbsp;
														<a onclick="action('F', ${ noticeVO.no })">
															<span class="text-muted fileName">${ fileVO.fileOriName }</span>
														</a>
															<span class="text-muted"> (${ fileVO.fileSize }KB)</span>
													</div>
												</c:if>
												<hr>
												<div class="col-md-12">
													<div class="pull-right">
														<button class="btn btn-default" type="button" onclick="action('E', ${ noticeVO.no })"><i class="fa fa-edit"></i>&nbsp;&nbsp;수정</button>
														<button class="btn btn-default" type="button" onclick="action('D', ${ noticeVO.no })"><i class="fa fa-trash"></i>&nbsp;&nbsp;삭제</button>
														<button class="btn btn-default" type="button" onclick="action('L', ${ noticeVO.no })"><i class="fa fa-list"></i>&nbsp;&nbsp;목록</button>
													</div>
												</div>
											</div>
										</div>
					                </div>
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
	
    <!-- Custom and plugin javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/inspinia.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pace/pace.min.js"></script>
	
	<!-- Page-Level Scripts -->
    <script type="text/javascript">
		$(document).ready(function() {
			
			// sidebar li & ul 클래스 active
			$('.communityLI').addClass("active");
			$('.communityLI > ul').addClass("in");
			$('.noticeLI').addClass("active");
			
			// 타입별 라벨 클래스명 & 텍스트 변경
			if($('#typeLabel').text() == 'A'){
				$('#typeLabel').attr("class","label label-primary");
				$('#typeLabel').html("공지사항");
			}
			else if($('#typeLabel').text() == 'B'){
				$('#typeLabel').attr("class","label label-danger");
				$('#typeLabel').html("보도자료");
			}
			
			// 파일명 호버 효과
			$(".fileName").hover( function () { 
				$(this).css('text-decoration', 'underline');
			}, function () { 
				$(this).css('text-decoration', 'none');
			} );

		    
		});
		
		// Notice action 함수
		function action(type, no) {
			switch (type) {
			case 'V':
				// Notice 디테일
			    location.href = '${ pageContext.request.contextPath}/community/subway/noticeDetail.do?no=' + no;
				break;
			case 'E':
				// Notice 수정
				location.href = '${ pageContext.request.contextPath}/community/subway/noticeEditForm.do?no=' + no;
				break;
			case 'D':
				// Notice 삭제
				deleteNotice(no);
				break;
			case 'L':
				// Notice 리스트
				location.href = '${ pageContext.request.contextPath}/community/subway/noticeList.do';
				break;
			case 'F':
				// File 다운로드
				location.href = '${ pageContext.request.contextPath}/community/subway/downloadFile.do?no=' + no;
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
	</script>
    </body>
</html>
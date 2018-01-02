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
	.fileImg {
		padding: 10px;
		max-width: 200px;
		max-height: 200px;
	}
	.plusIcon {
		position:absolute;
		margin: 30px;
		top:15px;
		left:30px;
		z-index:100;
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
                <h2>1:1문의 관리</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                    </li>
                    <li>
                        <a>커뮤니티 관리</a>
                    </li>
                    <li class="active">
                        <strong>1:1문의 관리</strong>
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
						    <li class=""><a href="${ pageContext.request.contextPath}/community/claim/claimList.do"><i class="fa fa-list"></i>리스트</a></li>
						    <li class="active"><a data-toggle="tab" href="#tab-3"><i class="fa fa-search"></i>보기</a></li>
						</ul>
                        <div class="tab-content">
							<!-- 첫번째 Tab : 1:1문의 리스트 -->
                            <div id="tab-1" class="tab-pane">
                                <div class="panel-body">
                                </div>
                            </div>
                            <!-- 두번째 Tab : 1:1문의 등록 -->
                            <div id="tab-2" class="tab-pane">
                                <div class="panel-body">
                                </div>
                            </div>
                            <!-- 세번째 Tab : 1:1문의 보기 -->
                            <div id="tab-3" class="tab-pane active">
                                <div class="panel-body">
			                    	<div class="ibox">
				                    	<h2>1:1문의 보기</h2>
										<div class="ibox-content">
		                                	<div class="col-lg-10 col-lg-offset-1">
												<div class="text-center">
													<span class="label label-primary" id="typeLabel">${ claimVO.type }</span>
												</div>
												<div class="text-center article-title">
													<h3>${ claimVO.title }</h3>
												</div>
												<div class="row">
													<div class="col-md-12">
														<span class="text-muted"><i class="fa fa-user-circle"></i>
															${ claimVO.writer }
														</span>
														<span class="text-muted float-right"><i class="fa fa-eye"></i>
															${ claimVO.viewCnt } views
														</span>
														<span class="text-muted float-right"><i class="fa fa-clock-o"></i>
															${ claimVO.regDate }&nbsp;&nbsp;&nbsp;
														</span>
													</div>
												</div>
												<hr>
												<!-- 방문일 / 방문매장명 -->
												<c:choose>
													<c:when test="${ not empty claimVO.visitDate && not empty claimVO.visitStore }">
													<table class="text-center table table-bordered">
														<tr id="totalImg">
															<th colspan="4" style="background-color: #eee">1:1문의 정보</th>
														</tr>
														<tr id="totalImg">
															<td colspan="4">
																<table class="table table-bordered text-center" style="margin-bottom: 0px">
																	<tr>
																		<th width="130px"><i class="fa fa-building"></i> 방문매장</th>
																		<td>${ claimVO.visitStore }점</td>
																		<th width="130px"><i class="fa fa-calendar-o"></i> 방문일</th>
																		<td>${ claimVO.visitDate }</td>
																	</tr>
																	<tr>
																		<th><i class="fa fa-send"></i> 답변 메일</th>
																		<td colspan="3">${ claimVO.emailID }@${ claimVO.emailDomain }</td>
																	</tr>
																	<tr>
																		<th><i class="fa fa-phone"></i> 연락처</th>
																		<td colspan="3">${ claimVO.phone1 }-${ claimVO.phone2 }-${ claimVO.phone3 }</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
													</c:when>
													<c:otherwise>
													<table class="text-center table table-bordered">
														<tr id="totalImg">
															<th colspan="4" style="background-color: #eee">1:1문의 정보</th>
														</tr>
														<tr id="totalImg">
															<td colspan="4">
																<table class="table table-bordered text-center" style="margin-bottom: 0px">
																	<tr>
																		<th><i class="fa fa-calendar-o"></i> 답변 메일</th>
																		<td colspan="3">${ claimVO.emailID }@${ claimVO.emailDomain }</td>
																	</tr>
																	<tr>
																		<th><i class="fa fa-calendar-o"></i> 연락처</th>
																		<td colspan="3">${ claimVO.phone1 }-${ claimVO.phone2 }-${ claimVO.phone3 }</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
													</c:otherwise>
												</c:choose>
												<p class="content list-group-item-text">
													<!-- 자동 단락 나누기 (jstl - fn) -->
													${ fn:replace(claimVO.content, cn, br) }
												</p>
												<!-- 첨부파일 -->
												<c:if test="${ not empty fileList }">
												<table class="text-center table table-bordered">
													<tr id="totalImg">
														<th colspan="5" style="background-color: #eee">첨부파일</th>
													</tr>
													<tr>
														<c:forEach items="${ fileList }" var="file">
														<th>
															<div class="col-md-12 text-left">
																<i class="fa fa-file"></i>&nbsp;
																<a onclick="action('F', ${ file.no })">
																	<span class="text-muted fileName">${ file.fileOriName }</span>
																</a>
																	<span class="text-muted"> (${ file.fileSize }KB)</span>
															</div>
														</th>
														</c:forEach>
													</tr>
													<tr>
														<c:forEach items="${ fileList }" var="file">
														<td>
															<div class="col-md-12">
																<a href="${ pageContext.request.contextPath}/upload/${ file.filePath }" target="_blank">
																	<img class="text-center fileImg" alt="첨부파일" src="${ pageContext.request.contextPath}/upload/${ file.filePath }">
																	<img class="plusIcon" src="${ pageContext.request.contextPath}/resources/img/icons/round-add-button.png">
																</a>
															</div>
														</td>
														</c:forEach>
													</tr>
												</table>
												</c:if>
												<hr>
												<div class="col-md-12">
													<div class="pull-right">
														<button class="btn btn-default" type="button" onclick="action('E', ${ claimVO.no })"><i class="fa fa-edit"></i>&nbsp;&nbsp;답변</button>
														<button class="btn btn-default" type="button" onclick="action('D', ${ claimVO.no })"><i class="fa fa-trash"></i>&nbsp;&nbsp;삭제</button>
														<button class="btn btn-default" type="button" onclick="action('L', ${ claimVO.no })"><i class="fa fa-list"></i>&nbsp;&nbsp;목록</button>
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
			$('.claimLI').addClass("active");
			
			// Claim 타입별 라벨 클래스명 & 텍스트 변경
			if($('#typeLabel').text() == 'I'){
				$('#typeLabel').attr("class","label label-primary");
				$('#typeLabel').html("문의");
			}
			else if($('#typeLabel').text() == 'P'){
				$('#typeLabel').attr("class","label label-danger");
				$('#typeLabel').html("칭찬");
			}
			else if($('#typeLabel').text() == 'S'){
				$('#typeLabel').attr("class","label label-warning");
				$('#typeLabel').html("제안");
			}
			else if($('#typeLabel').text() == 'C'){
				$('#typeLabel').attr("class","label label-success");
				$('#typeLabel').html("불만");
			}
			else if($('#typeLabel').text() == 'X'){
				$('#typeLabel').attr("class","label label-plain");
				$('#typeLabel').html("기타");
			}
			
			// 파일명 호버 효과
			$(".fileName").hover( function () { 
				$(this).css('text-decoration', 'underline');
			}, function () { 
				$(this).css('text-decoration', 'none');
			} );
			
			// 이미지 호버 효과
			$('.plusIcon').hide();
			$(".fileImg").each(function () {
				$(this).hover( function () { 
					$(this).siblings('.plusIcon').show();
				}, function () { 
					$(this).siblings('.plusIcon').hide();
				} );
			});

		    
		});
		
		// Claim action 함수
		function action(type, no) {
			switch (type) {
			case 'V':
				// Claim 디테일
			    location.href = '${ pageContext.request.contextPath}/community/claim/claimDetail.do?no=' + no;
				break;
			case 'E':
				// Claim 수정
				location.href = '${ pageContext.request.contextPath}/community/claim/claimEditForm.do?no=' + no;
				break;
			case 'D':
				// Claim 삭제
				deleteNotice(no);
				break;
			case 'L':
				// Claim 리스트
				location.href = '${ pageContext.request.contextPath}/community/claim/claimList.do';
				break;
			case 'F':
				// File 다운로드
				location.href = '${ pageContext.request.contextPath}/community/claim/downloadFile.do?no=' + no;
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
		        	location.href = '${ pageContext.request.contextPath}/community/claim/claimDelete.do?no=' + no;
				});
		    });
		}

	</script>
    </body>
</html>
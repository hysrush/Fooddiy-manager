<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
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
	<!-- easydropdown -->
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/plugins/easydropdown/easydropdown.css"/>
	<!-- summernote -->
	<link href="${ pageContext.request.contextPath }/resources/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
	<!-- sweetalert js & css -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> 
	<link rel="stylesheet" href="https://wfolly.firebaseapp.com/node_modules/sweetalert/dist/sweetalert.css">
	
    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
<style type="text/css">
	.easydropdown ul{
	    -webkit-padding-start: 0px;
	}
	.easydropdown .selected, .easydropdown li {
		font-size: 14px;
		color: gray;
	}
	.btn-default {
		background-color: #EAE8E8;
	}
	.label-primary {
		background-color: #7aa93c;
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
						    <li class=""><a href="${ pageContext.request.contextPath}/community/subway/noticeList.do"><i class="fa fa-list"></i>리스트</a></li>
						    <li class="active"><a data-toggle="tab" href="#tab-2"><i class="fa fa-save"></i>등록</a></li>
						    <!-- <li class=""><a href="#"><i class="fa fa-edit"></i>수정</a></li> -->
						</ul>
                        <div class="tab-content">
							<!-- 첫번째 Tab : 서브웨이소식 리스트 -->
                            <div id="tab-1" class="tab-pane">
                                <div class="panel-body">
                                </div>
                            </div>
                            <!-- 두번째 Tab : 서브웨이소식 등록 -->
                            <div id="tab-2" class="tab-pane active">
                                <div class="panel-body">
                                	<form:form commandName="noticeVO" method="POST" id="noticeForm">
										<fieldset class="form-horizontal" aria-hidden="false">
                            				<h2>Subway소식 등록</h2>
											<div class="ibox-content">
												<div class="form-group">
													<div class="col-sm-10">
														<label class="control-label" for="type">타입 *</label>
														<form:select path="type" name="type" id="type" class="easydropdown form-control">
															<form:option value="A">공지사항</form:option>
															<form:option value="B">보도자료</form:option>
														</form:select>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-10">
														<label class="control-label" for="title">제목 *</label>
														<form:input path="title" type="text" id="title" class="form-control" 
																	placeholder="제목" name="title" required="required"/>
														<form:errors path="title" class="form-control"></form:errors>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-10">
														<label class="control-label" for="content">내용 *</label>
															<%-- <form:textarea path="content" id="content" class="form-control" 
																		rows="5" placeholder="내용" name="content" required="required"/>  --%>
	                                                    <div class="summernote" style="width: 300px;">
                                               			</div>
                                               			<form:hidden path="content" id="content"/>
														<form:errors path="content" class="form-control"></form:errors>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-5 col-sm-offset-2">
														<button type="button" class="btn btn-default" id="eraser"><i class="fa fa-eraser"></i> 지우기</button>
														<button type="submit" class="btn btn-primary" id="qnaSubmit"><i class="fa fa-check"></i> 등록</button>
													</div>
												</div>
											</div>
                                   			<form:hidden path="writer" id="writer" value="로그인id"/>
										</fieldset>
									</form:form>
                                </div>
                            </div>
                            <!-- 세번째 Tab : 서브웨이소식 수정 -->
                            <!-- <div id="tab-3" class="tab-pane">
                                <div class="panel-body">
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 페이지 footer -->
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
	
    <!-- Custom and plugin javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/inspinia.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pace/pace.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>
    
    <!-- easydropdown -->
	<script src="${ pageContext.request.contextPath }/resources/js/plugins/easydropdown/jquery.easydropdown.js"></script> 
	
    <!-- FooTable -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/footable/footable.all.min.js"></script>
    
    <!-- Jquery Validate -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/validate/jquery.validate.min.js"></script>

    <!-- SUMMERNOTE -->
	<script src="${ pageContext.request.contextPath }/resources/js/plugins/summernote/summernote.min.js"></script>
	<!-- summernote-ko-KR -->
	<script src="${ pageContext.request.contextPath }/resources/js/plugins/summernote/summernote-ko-KR.js"></script>
    
    <!-- Page-Level Scripts -->
    <script type="text/javascript">
		$(document).ready(function() {
			
			// sidebar li & ul 클래스 active
			$('.communityLI').addClass("active");
			$('.communityLI > ul').addClass("in");
			$('.noticeLI').addClass("active");
			
			// easydropdown 라벨화 작업
			var noticeType  = $('.easydropdown').find('.selected');
			// 초기값
			noticeType.css("color","white");
			noticeType.css("width","100px");
			noticeType.attr("class","selected label label-primary");
			// option selected 변경 시,
			$('.easydropdown li').click(function () {
				if (noticeType.text() == '공지사항') {
					noticeType.attr("class","selected label label-primary");
					noticeType.css("color","white");
				} else if (noticeType.text() == '보도자료') {
					noticeType.attr("class","selected label label-danger");
					noticeType.css("color","white");
				}
			});
			
			// summernote 시작
			 $('.summernote').summernote({
				height : 300, // 에디터의 높이 
				minHeight : null,
				maxHeight : null,
				focus : true,
				lang: 'ko-KR' // default: 'en-US'
			 });
			 $(".note-editable").keyup(function () {
				var note = $(".note-editable").html();
				alert(note);				
				$("#content").val(note);
				alert($("#content").val());				
			});
			 
			// Form 유효성 검사 작업
			$("#noticeForm").validate({
				// 규칙
				rules: {
					title: {
                        required: true,
                        maxlength: 33
                    },
                    content: {
                        required: true,
                        maxlength: 300
                    }
                },
              	//규칙체크 실패 시, 출력될 메시지
                messages : {
                	title: {
                        required : "제목을 입력해주세요!",
                        maxlength : "{0}글자 이하로 작성하세요!",
                    },
                    content: {
                    	 required : "내용을 입력해주세요!",
                         maxlength : "{0}글자 이하로 작성하세요!",
                    }
                },
				//규칙체크 실패 시, 실행될 이벤트
                invalidHandler: function (form, validator) {
                    var errors = validator.numberOfInvalids();
                    if (errors) {
                    	validator.errorList[0].element.focus();
                    	swal({
        	   				title: "Error!",
        	   				text: validator.errorList[0].message,
        	                type: "error"
        	       	 	});
                    }
                },
				//규칙체크 성공 시, 실행될 이벤트
                submitHandler: function(form) {
                	swal({
    	   				title: "등록 완료!",
    	                type: "success"
    	       	 	}, function () {
    			        // OK 누르면 Submit 실행
    			        form.submit();
    			        //$('#noticeForm').submit();
    			    });
                }
            });
			
			// 폼 초기화
			$('#eraser').click(function () {
				$('#noticeForm input[type="text"], textarea').val(""); 
			});
			
		});
	</script>
	</body>
</html>
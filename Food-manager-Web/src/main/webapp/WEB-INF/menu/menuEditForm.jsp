<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>| Fooddiy-Order Admin+ |</title>	

    <link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath }/resources/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    
	<link href="${ pageContext.request.contextPath }/resources/css/plugins/steps/jquery.steps.css" rel="stylesheet">	
    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">    
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/dropzone/dropzone.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/codemirror/codemirror.css" rel="stylesheet">



</head>

<body>

<div id="wrapper">
	<!-- sidebar -->
    <jsp:include page="/resources/include/sidebar.jsp"/>
    
    <div id="page-wrapper" class="gray-bg">
    	<!-- topbar -->
	    <jsp:include page="/resources/include/topbar.jsp"/>
        
        <!-- 헤더 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>메뉴 수정</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a href="${ pageContext.request.contextPath }/menu/menuBoard.do">메뉴관리</a>
                    </li>
                    <li class="active">
                        <strong>메뉴 수정</strong>
                    </li>
                </ol>
            </div>
        </div>
        
        
		<!-- body -->
        <div class="wrapper wrapper-content animated fadeInRight ecommerce">
        
        
	        <div class="row">
	                <div class="col-lg-12">
	                    <div class="ibox">
	                        <div class="ibox-title">
	                            <h5>메뉴 수정</h5>	                            
	                        </div>
	                        <div class="ibox-content">
	                            <!-- <h2>메뉴 입력</h2> -->
	                            <p>입력형식에 유의해 주세요.</p>
	                            <p>조건을 만족해야 다음 단계로 넘어갑니다.</p>
	
	                            <form:form commandName="menuVO" method="POST" role="form" id="form" enctype="multipart/form-data">
	                                <h1>기본</h1>
	                                <fieldset>
	                                    <h2>기본 정보</h2>
	                                    <div class="row">
	                                        <div class="col-lg-12">
	                                            <div class="form-group">
	                                                <label>메뉴이름 *</label>
	                                                <form:input path="name" name="name" type="text" value="${ menuVO.name }" placeholder="15자 이내로 입력해주세요" class="form-control required"/>
	                                            </div>
	                                            <div class="form-group">
	                                                <label>주 재료 *</label>
	                                                <form:input path="mainmenu" name="mainmenu" type="text" value="${ menuVO.mainmenu }" placeholder="30자 이내로 입력해주세요" class="form-control required"/>
	                                            </div>
	                                            <div class="form-group">
	                                                <label>타입 *</label>
	                                                <select class="form-control required" name="type" id="selectBox">
                                                        <option value="" selected>타입을 선택해주세요</option>
                                                        <option value="R">추천메뉴</option>
                                                        <option value="P">프리미엄</option>
                                                        <option value="B">베스트</option>
                                                        <option value="C">클래식</option>
                                                        <option value="M">아침식사</option>
                                                        <option value="S">샐러드</option>
                                                        <option value="N">추가메뉴</option>
                                                        <option value="D">음료</option>
                                                    </select>
                                                    <input type="hidden" value="${ menuVO.type }" id="hiddenType"/>                                                
	                                            </div>
	                                            <div class="form-group">
	                                                <label>가격(15cm) *</label>
	                                                <form:input path="price" name="price" type="text" value="${ menuVO.price }" placeholder="숫자만 입력해주세요 (단위 : 원)" class="form-control required"/>
	                                            </div>
	                                            <div class="form-group">
	                                                <label>메뉴 상세내용 *</label>
	                                                <form:input path="detail" name="detail" type="text" value="${ menuVO.detail }" placeholder="300자 이내로 입력해주세요" class="form-control required"/>
	                                            </div>
	                                        </div>	                                        
	                                    </div>
	
	                                </fieldset>
	                                <h1>추가</h1>
	                                <fieldset>
	                                    <h2>추가 정보</h2>
	                                    <div class="row">
	                                        <div class="col-lg-6">
	                                            <div class="form-group">
	                                                <label>제공량 *</label>
	                                                <form:input path="serviceSize" name="serviceSize" type="text" value="${ menuVO.serviceSize }" placeholder="가나다라" class="form-control required"/>
	                                            </div>
	                                            <div class="form-group">
	                                                <label>칼로리 *</label>
	                                                <form:input path="calorie" name="calorie" type="text" value="${ menuVO.calorie }" class="form-control required"/>
	                                            </div>
	                                            <div class="form-group">
	                                                <label>단백질 *</label>
	                                                <form:input path="protein" name="protein" type="text" value="${ menuVO.protein }" class="form-control required"/>
	                                            </div>	                                            
	                                        </div>
	                                        <div class="col-lg-6">
	                                            <div class="form-group">
	                                                <label>나트륨 *</label>
	                                                <form:input path="natrium" name="natrium" type="text" value="${ menuVO.natrium }" class="form-control required"/>
	                                            </div>
	                                            <div class="form-group">
	                                                <label>당 *</label>
	                                                <form:input path="sugar" name="sugar" type="text" value="${ menuVO.sugar }" class="form-control required"/>
	                                            </div>
	                                            <div class="form-group">
	                                                <label>지방 *</label>
	                                                <form:input path="fat" name="fat" type="text" value="${ menuVO.fat }" class="form-control required"/>
	                                            </div>	                                            
	                                        </div>
	                                        <div class="col-lg-12">
	                                        	<div class="form-group">
	                                                <label>알르레기 *</label>
	                                                <form:input path="allergy" name="allergy" type="text" value="${ menuVO.allergy }" placeholder="30자 이내로 입력해주세요" class="form-control"/>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </fieldset>	
	                                <h1>이미지</h1>
	                                <fieldset>
	                                    <h2>이미지 첨부</h2>
	                                    <p>파일이름이 30자를 넘을 수 없습니다. (영문은 90자)&nbsp;&nbsp;//&nbsp;&nbsp;사이즈는 594 x 334 입니다.</p><p>기존 파일이름은 ${ menuVO.imgFileName } 입니다.</p>
	                                    <p id="errmsg">이미지를 다시 넣어주세요!</p>
	                                    <div class="fileinput fileinput-new input-group" data-provides="fileinput">
										    <div class="form-control" data-trigger="fileinput">
										        <i class="glyphicon glyphicon-file fileinput-exists"></i>
										    <span class="fileinput-filename"></span>										    
										    </div>
										    <span class="input-group-addon btn btn-default btn-file">
										        <span class="fileinput-new">이미지 선택</span>
										        <span class="fileinput-exists">변경</span>
										        <form:input path="imgFileName" type="file" name="imgFileName" id="img" class="required"/>										        
										    </span>
										    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">삭제</a>
										</div>
	                                </fieldset>
	                                <h1>완료</h1>
	                                <fieldset>
	                                    <div class="col-lg-8">
	                                    	<center><h2 style="font-size:25px; font-weight: 700; color: #2F4050"><br><br><br>메뉴를 수정할 준비가 되었습니다 :)</h2></center>
	                                    </div>
	                                    <div class="col-lg-4">
                                            <div class="text-center">
                                                <div style="margin-top: 20px">
                                                    <i class="fa fa-pencil-square-o" style="font-size: 180px;color: #999b9b "></i>
                                                </div>
                                            </div>
                                        </div>	                                    
	                                </fieldset>
	                        	</form:form>
	                        </div>
	                        
	                        <div style="text-align: center;">
		                        <a href="${ pageContext.request.contextPath }/menu/menuBoard.do"><button class="btn btn-danger" type="button"><i class="fa fa-times"></i><span class="bold">&nbsp;취소</span></button></a>
	                        </div>
	                        
	                    </div>
	                    </div>
	
	                </div>
        
        </div>
        
        
                
        <div class="footer">
            <div class="pull-right">
                10GB of <strong>250GB</strong> Free.
            </div>
            <div>
                <strong>Copyright</strong> Example Company &copy; 2014-2017
            </div>
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
<script src="${ pageContext.request.contextPath }/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- SUMMERNOTE -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins/summernote/summernote.min.js"></script>

<!-- Data picker -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<!-- Jasny -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins/jasny/jasny-bootstrap.min.js"></script>
<!-- DROPZONE -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins/dropzone/dropzone.js"></script>
<!-- Steps -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins/steps/jquery.steps.min.js"></script>
<!-- CodeMirror -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins/codemirror/codemirror.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/plugins/codemirror/mode/xml/xml.js"></script>
<!-- Jquery Validate -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins/validate/jquery.validate.min.js"></script>
<!-- Sweet alert -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    $(document).ready(function(){
    	
    	// sidebar li & ul 클래스 active
		$('.menuLI').addClass("active");
		$('.menuLI > ul').addClass("in");		

        $('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        }); 
        
        
        //STEP
        $("#wizard").steps();
        $("#form").steps({
            bodyTag: "fieldset",
            onStepChanging: function (event, currentIndex, newIndex)
            {
                // 현재 단계에 잘못된 필드가 있어도 항상 뒤로 이동하는 것을 허용
                if (currentIndex > newIndex)
                {
                    return true;
                }
				// 입력값 이외의 유효성 검사 후 STOP
                if (newIndex === 3 && Number($("#age").val()) < 18)
                {
                    return false;
                }

                var form = $(this);
                
                // 사용자가 이전 버전으로 이동 한 경우 정리
                if (currentIndex < newIndex)
                {
                    // To remove error styles
                    $(".body:eq(" + newIndex + ") label.error", form).remove();
                    $(".body:eq(" + newIndex + ") .error", form).removeClass("error");
                }

                // 비활성화되거나 숨겨진 필드에 대한 유효성 검사를 비활성화
                form.validate().settings.ignore = ":disabled,:hidden";
                
                // 이미지파일 이름 30자 까지인지 검사
                if (currentIndex === 2 && $('.fileinput-filename').text().length > 30)
                {                	
                	swal({
                        title: "",
                        text: "이미지 파일 이름이 너무 길어요 :("
                    });
                	return false;
                }
                /* if (currentIndex === 2 && $('#img').val() == "")
                {
                	var next = $(this);
	                next.click(function(){
	                	swal({
	                        title: "",
	                        text: "이미지가 없습니다!"
	                    });
	                });
	               	return false;   				
                } */
                
                
                // 유효성 검사를 시작. 거짓 일 경우 STOP
                return form.valid();
                
            },
            onStepChanged: function (event, currentIndex, priorIndex)
            {
                
            },
            onFinishing: function (event, currentIndex)
            {
                var form = $(this);
				// 비활성 필드 유효성 검사
                form.validate().settings.ignore = ":disabled";				
                
                return form.valid();               
                
            },
            onFinished: function (event, currentIndex)
            {
                var last = $(this);

                last.click(function(){
                    swal({
                        title: "완료!",
                        text: "메뉴가 수정되었습니다 :)",
                        type: "success"
                    });
                    $('.confirm').click(function () {                    	
                    	form.submit();
    				});
                });
            }
        }).validate({
                    errorPlacement: function (error, element)
                    {
                        element.before(error);
                    },
                    rules: {
                    	name: {
                            maxlength: 15
                        },
                    	mainmenu: {
                            maxlength: 30
                        },
                    	price: {
                            number: true,
                            maxlength: 7
                        },
                    	detail: {
                            maxlength: 300
                        },
                        serviceSize: {
                            number: true,
                            maxlength: 7
                        },
                    	calorie: {
                            number: true,
                            maxlength: 7
                        },
                    	protein: {
                            number: true,
                            maxlength: 7
                        },
                    	natrium: {
                            number: true,
                            maxlength: 7
                        },
                    	sugar: {
                            number: true,
                            maxlength: 7
                        },
                    	fat: {
                            number: true,
                            maxlength: 7
                        },
                    	allergy: {
                            maxlength: 30
                        }                    	
                    },
                    messages: {
                    	name: {
                    		required: "입력값이 없습니다!",
                    		maxlength: "15자 이내로 입력해주세요",
                    	},
                    	mainmenu: {
                    		required: "입력값이 없습니다!",
                    		maxlength: "30자 이내로 입력해주세요",
                    	},
                    	type: {
                    		required: "입력값이 없습니다!"
                    	},
                    	price: {
                    		required: "입력값이 없습니다!",
                    		number: "숫자를 입력해주세요",
                    		maxlength: "7자리 이내로 입력해주세요",
                    	},
                    	detail: {
                    		required: "입력값이 없습니다!",
                    		maxlength: "300자 이내로 입력해주세요",
                    	},
                    	serviceSize: {
                    		required: "입력값이 없습니다!",
                    		number: "숫자를 입력해주세요",
                    		maxlength: "5자리 이내로 입력해주세요",
                    	},
                    	calorie: {
                    		required: "입력값이 없습니다!",
                    		number: "숫자를 입력해주세요",
                    		maxlength: "5자리 이내로 입력해주세요",
                    	},
                    	protein: {
                    		required: "입력값이 없습니다!",
                    		number: "숫자를 입력해주세요",
                    		maxlength: "5자리 이내로 입력해주세요",
                    	},
                    	natrium: {
                    		required: "입력값이 없습니다!",
                    		number: "숫자를 입력해주세요",
                    		maxlength: "5자리 이내로 입력해주세요",
                    	},
                    	sugar: {
                    		required: "입력값이 없습니다!",
                    		number: "숫자를 입력해주세요",
                    		maxlength: "5자리 이내로 입력해주세요",
                    	},
                    	fat: {
                    		required: "입력값이 없습니다!",
                    		number: "숫자를 입력해주세요",
                    		maxlength: "5자리 이내로 입력해주세요",
                    	},
                    	allergy: {
                    		required: "입력값이 없습니다!",
                    		maxlength: "30자 이내로 입력해주세요",
                    	},
                    	imgFileName: {
                    		required: "이미지가 없습니다!"
                    	}
                    }
               	});                	
        
        
		// 유효성체크 문장 위치 변경		
		$(document).on('click', 'a', function(){
			$('#img-error').appendTo('#errmsg');
		});
		$(document).on('click', '.btn-file', function(){
			$('#img-error').appendTo('#errmsg');
		});
		
		// 기존 이미지 파일이름 불러오기
		/* $('.input-group').removeClass('fileinput-new');
		$('.input-group').addClass('fileinput-exists');
		$('#img').removeClass('required'); */
		
		
		
		
		
     	// 기존 type값 가져와서 selected 설정해놓기
		// (실행되는데 문법오류떠서 제일 마지막에 두기)
		var type = $('#hiddenType').val();
		$('#selectBox option[value=' + type + ']').prop("selected", true);		
		
    });        
    
    // 이미지 변경 없어도 유효성검사 넘어가도록
    /* function onReq() {
    	$('#img').addClass('required');
    }   */      
   	
   	
</script>

</body>

</html>


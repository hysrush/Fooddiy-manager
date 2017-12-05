<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | E-commerce</title>

    <link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath }/resources/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath }/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
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
        
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>메뉴 입력</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a>메뉴관리</a>
                    </li>
                    <li class="active">
                        <strong>메뉴 입력</strong>
                    </li>
                </ol>
            </div>
        </div>
        
        

        <div class="wrapper wrapper-content animated fadeInRight ecommerce">

            <div class="row">
                <div class="col-lg-12">
                <form:form commandName="menuVO" method="POST" role="form" id="form" enctype="multipart/form-data">
                    <div class="tabs-container">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#tab-1"> 메뉴 입력</a></li>
                                <li class=""><a data-toggle="tab" href="#tab-2"> 추가 입력</a></li>
                                <li class=""><a data-toggle="tab" href="#tab-4"> 이미지</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane active">
                                    <div class="panel-body">

                                        <fieldset class="form-horizontal">
                                            <div class="form-group"><label class="col-sm-2 control-label">메뉴 이름:</label>
                                                <div class="col-sm-10"><form:input path="name" type="text" class="form-control" placeholder="Menu name" name="max"/></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">주 재료:</label>
                                                <div class="col-sm-10"><form:input path="mainmenu" type="text" class="form-control" placeholder="Main ingredients"/></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">타입:</label>
                                                <div class="col-sm-10">
                                                    <select class="form-control" name="type">
                                                        <option value="" selected>타입을 선택하세요</option>
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
                                            <div class="form-group"><label class="col-sm-2 control-label">가격:</label>
                                                <div class="col-sm-10"><form:input path="price" type="text" class="form-control" placeholder="Price"/></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">메뉴 상세내용:</label>
                                                <div class="col-sm-10">                                                    
                                                	<form:input path="detail" type="text" class="form-control" placeholder="내용을 입력해 주세요."/>
                                                	<br>
                                                </div>
                                            </div>                                            
                                        </fieldset>

                                    </div>
                                </div>
                                <div id="tab-2" class="tab-pane">
                                    <div class="panel-body">

                                        <fieldset class="form-horizontal">
                                            <div class="form-group"><label class="col-sm-2 control-label">제공량:</label>
                                                <div class="col-sm-10"><form:input path="serviceSize" type="text" class="form-control" placeholder="Service size"/></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">칼로리:</label>
                                                <div class="col-sm-10"><form:input path="calorie" type="text" class="form-control" placeholder="Calorie"/></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">단백질:</label>
                                                <div class="col-sm-10"><form:input path="protein" type="text" class="form-control" placeholder="Protein"/></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">나트륨:</label>
                                                <div class="col-sm-10"><form:input path="natrium" type="text" class="form-control" placeholder="Natrium"/></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">당:</label>
                                                <div class="col-sm-10"><form:input path="sugar" type="text" class="form-control" placeholder="Sugar"/></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">지방:</label>
                                                <div class="col-sm-10"><form:input path="fat" type="text" class="form-control" placeholder="Fat"/></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">알레르기:</label>
                                                <div class="col-sm-10"><form:input path="allergy" type="text" class="form-control" placeholder="Allergy"/></div>
                                            </div>                                            
                                        </fieldset>


                                    </div>
                                </div>                                
                                <div id="tab-4" class="tab-pane">
                                    <div class="panel-body">
                                    
                                    	<div class="fileinput fileinput-new input-group" data-provides="fileinput">
										    <div class="form-control" data-trigger="fileinput">
										        <i class="glyphicon glyphicon-file fileinput-exists"></i>
										    <span class="fileinput-filename"></span>
										    </div>
										    <span class="input-group-addon btn btn-default btn-file">
										        <span class="fileinput-new">Select file</span>
										        <span class="fileinput-exists">Change</span>
										        <form:input path="imgFileName" type="file" name="..."/>
										    </span>
										    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
										</div>
										
									</div>
                                </div>
                            </div>
                    </div>
			        <center><div style="margin-top:40px">
			        <button type="submit" class="btn btn-success btn-sm demo2">확인</button>
			        </div></center>
                    </form:form>
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
<!-- CodeMirror -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins/codemirror/codemirror.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/plugins/codemirror/mode/xml/xml.js"></script>
<!-- Jquery Validate -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins/validate/jquery.validate.min.js"></script>
<script>
    $(document).ready(function(){
		
        $('.summernote').summernote();

        $('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        });        
        
        
        //확인버튼
        $('.demo2').click(function(){
            swal({
                title: "Good job!",
                text: "You clicked the button!",
                type: "success"
            });
        });
        
        
        //유효성검사
        $("#form").validate({
            rules: {
                password: {
                    required: true,
                    minlength: 3
                },
                url: {
                    required: true,
                    url: true
                },
                number: {
                    required: true,
                    number: true
                },
                min: {
                    required: true,
                    minlength: 6
                },
                max: {
                    required: true,
                    maxlength: 4
                }
            }
        });

    });    
</script>

</body>

</html>



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
	
	<!-- sweetalert js & css -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> 
	<link rel="stylesheet" href="https://wfolly.firebaseapp.com/node_modules/sweetalert/dist/sweetalert.css">
	
    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
<style type="text/css">
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
                <h2>이벤트 관리</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                    </li>
                    <li>
                        <a>이벤트 관리</a>
                    </li>
                    <li class="active">
                        <strong>이벤트 등록 </strong>
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
						    <li class=""><a href="${ pageContext.request.contextPath}/event/eventPage.do"><i class="fa fa-list"></i>리스트</a></li>
						    <li class="active"><a data-toggle="tab" href="#tab-2"><i class="fa fa-save"></i>등록</a></li>
						    <li class=""><a href="#"><i class="fa fa-edit"></i>수정</a></li>
						</ul>
                        <div class="tab-content">
							<!-- 첫번째 Tab : 자주묻는질문 리스트 -->
                            <div id="tab-1" class="tab-pane">
                                <div class="panel-body">
                                </div>
                            </div>
                            <!-- 두번째 Tab : 자주묻는질문 등록 -->
                            <div id="tab-2" class="tab-pane active">
                                <div class="panel-body">
                                	<form:form commandName="eventVO" method="POST" enctype="multipart/form-data" id="eventForm"> 
			<div style="max-width: 800px;">
				<%-- <div class="form-group" align="left">
				   매장명은 db에서 불러와서 선택할 수 있도록   
				 	<label for="type">매장명</label>
					<form:select path="type" class="form-control" id="type">
						<form:option value="F">푸디오더</form:option>
						<form:option value="P">포인트</form:option>
						<form:option value="O">단체주문</form:option>
						<form:option value="M">회원정보</form:option>
						<form:option value="X">기타</form:option>
					</form:select> 
			
					
					<form:errors path="type" class="form-control"></form:errors>
				</div> --%>
				<div class="form-group" align="left">
					<label for="storeName">매장이름</label>
					<form:input path="storeName" type="text" class="form-control" id="storeName" placeholder="매장이름"/>
					<form:errors path="storeName" class="form-control"></form:errors>
				</div>
								
				
				<div class="form-group" align="left">
					<label for="title">이벤트 제목</label>
					<form:input path="title" type="text" class="form-control" id="title" placeholder="제목"/>
					<form:errors path="title" class="form-control"></form:errors>
				</div>
				 <div class="form-group" align="left">
					<label for="imgFileName">이벤트 첨부 파일</label>
					<form:input path="imgFileName" type="file" class="form-control" id="imgFileName" placeholder="첨부파일"/>
					<form:errors path="imgFileName" class="form-control"></form:errors>
				</div>
				  
				
				<div class="form-group" align="left">
					<label for="content">이벤트 내용</label>
					<form:textarea path="content" class="form-control" rows="5" id="content" placeholder="내용"/>
					<form:errors path="content" class="form-control"></form:errors>
				</div>
				<div class="form-group" align="left">
					<label for="startDate">이벤트 시작일</label>
					<form:input path="startDate" type="date" class="form-control" id="startDate" placeholder="시작일"/>
					<form:errors path="startDate" class="form-control"></form:errors>
				</div>
				<div class="form-group" align="left">
					<label for="endDate">이벤트 종료일</label>
					<form:input path="endDate" type="date" class="form-control" id="endDate" placeholder="종료일"/>
					<form:errors path="endDate" class="form-control"></form:errors>
				</div>
				
				<div class="form-group">
					<div class="col-sm-5 col-sm-offset-2">
						<button type="button" class="btn btn-white">취소</button>
						<button type="button" class="btn btn-primary" id="eventSubmit">등록</button>
					</div>
				</div>
			</div>
		</form:form>
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
	
    <!-- FooTable -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/footable/footable.all.min.js"></script>
    
    <!-- Page-Level Scripts -->
    <script type="text/javascript">
		$(document).ready(function() {
			
			// sidebar li & ul 클래스 active
			$('.eventLI').addClass("active");
			$('.eventLI > ul').addClass("in");
			$('.eventLI2').addClass("active");
			
			// 서밋버튼 이벤트
	       	$('#eventSubmit').click(function () {
	       		swal({
	   				title: "등록 완료!",
	                type: "success"
	       	 	}, function () {
			        // OK 누르면 Submit 실행
			        $('#eventForm').submit();
			    });
			});
		});
	</script>
	</body>
</html>
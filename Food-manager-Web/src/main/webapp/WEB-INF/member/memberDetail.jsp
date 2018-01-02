<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

 	<title>| Fooddiy-Order Admin+ |</title>	

    <link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">

</head>

<body>
    <!-- -------------------------------------------------------------------------------------------------------------------------  -->  
				<div style="padding:15px; " class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">회원 정보</h4>
				</div>
			  <div style="padding: 20px 10px 5px" class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-md-12">
                <div style="padding:0px " class="contact-box">
                    <div class="col-md-7">
                        <div class="text-center">
							<c:choose>
								<c:when test="${ user.file ne null }">
									<img style="margin-left:50px; height:200px; width: 200px; margin-top:12px; max-width: 150%" alt="image" class="img-circle m-t-xs img-responsive" src="../upload/${ user.file }">
                            		<div style="font-size: 15px" class="m-t-xs font-bold"><h2><strong>${ user.id }</strong></h2></div>
								</c:when>
								<c:otherwise>
									<img style="margin-left:50px; height:200px; width: 200px; margin-top:12px; max-width: 150%" alt="image" class="img-circle m-t-xs img-responsive" src="${ pageContext.request.contextPath }/resources/img/parallax-2.jpg">
									<div style=" font-size: 15px" class="m-t-xs font-bold"><h2><strong>${ user.id }</strong></h2></div>
								</c:otherwise>
							</c:choose>
                        </div>
                        
                    </div>
                    <div style="width:40%; text-align: center; margin-top: 30px; font-size: 20px" class="col-md-5">
                         <h2><strong>${ user.name }</strong></h2>
                        <address>
                            <span>${ user.sex }</span><br>
                            <span>${ user.grade }</span><br>
                            <span>${ user.birth }</span><br>
                            <span>${ user.phone }</span><br>
                            <span>${ user.email }</span><br>
                        </address>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
      </div>
				<div style="padding-bottom: 6px; padding-top: 4px" class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
				</div>

     
    <!-- -------------------------------------------------------------------------------------------------------------------------  -->  

    <!-- Mainly scripts -->
    <script src="${ pageContext.request.contextPath }/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/inspinia.js"></script>

</body>
</html>

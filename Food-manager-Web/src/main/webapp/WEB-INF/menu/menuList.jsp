<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>MenuList</title>

    <link href="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="${ pageContext.request.contextPath}/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    

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
                <h2>메뉴 리스트</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                    </li>
                    <li>
                        <a>메뉴 관리</a>
                    </li>
                    <li class="active">
                        <strong>메뉴 리스트</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
            
            	<c:forEach items="${ menuList }" var="menu">
	                <div class="col-md-3">
	                    <div class="ibox">
	                        <div class="ibox-content product-box">
								<div class = "menuType" style = "display: none">${ menu.type }</div>
	                            <div class="product-imitation">
	                                <img src="${ pageContext.request.contextPath }/upload/menu/${ menu.imgFileName }" style="width: 100%;">
	                            </div>
	                            <div class="product-desc" style="max-height: 180px">
	                                <span class="product-price">
	                                    ${ menu.price }원
	                                </span>
	                                <small class="text-muted">Category</small>
	                                <a href="${ pageContext.request.contextPath}/menu/menuDetail.do?no=${menu.no}" class="product-name">${ menu.name }</a>
	
	
	
	                                <!-- <div class="small m-t-xs">
	                                    Many desktop publishing packages and web page editors now.
	                                </div> -->
	                                <div class="m-t text-righ">
	
	                                    <a href="${ pageContext.request.contextPath}/menu/menuDetail.do?no=${menu.no}" class="btn btn-xs btn-outline btn-primary">Info <i class="fa fa-long-arrow-right"></i> </a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
               	</c:forEach>

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
<script src="${ pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${ pageContext.request.contextPath}/resources/js/inspinia.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/plugins/pace/pace.min.js"></script>
    <script>
    	$(document).ready(function() {

    		
    		for(var i = 0; i < $('.product-box').length; ++i) {
    			
    			var product  = $('.product-box').eq(i);
    			
    			
	    		if( product.find('.menuType').text() == 'R'){
	    			product.find('.text-muted').html("추천메뉴");}
	    		else if(product.find('.menuType').text() == 'P'){
	    			product.find('.text-muted').html("프리미엄");}
	    		else if(product.find('.menuType').text() == 'B'){
	    			product.find('.text-muted').html("베스트");}
	    		else if(product.find('.menuType').text() == 'C'){
	    			product.find('.text-muted').html("클래식");}
	    		else if(product.find('.menuType').text() == 'M'){
	    			product.find('.text-muted').html("아침식사");}
	    		else if(product.find('.menuType').text() == 'S'){
	    			product.find('.text-muted').html("샐러드");}
	    		else if(product.find('.menuType').text() == 'N'){
	    			product.find('.text-muted').html("추가메뉴");}
	    		else if(product.find('.menuType').text() == 'D'){
	    			product.find('.text-muted').html("음료");}
    		}
    		
    		
    	});
    </script>
</body>
</html>
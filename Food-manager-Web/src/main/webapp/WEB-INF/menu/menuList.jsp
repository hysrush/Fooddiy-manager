<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>| Fooddiy-Order Admin+ |</title>	

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
                        <a href="${ pageContext.request.contextPath }/menu/menuBoard.do">메뉴 관리</a>
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
	
		    	<div style="margin-left: 20px; margin-right: 20px">
			    	<h3 style="width: 80%;float: left">${map.count}개의 메뉴가 있습니다.</h3>
		    		<a class="btn btn-default" tabindex="0" aria-controls="DataTables_Table_0" href="${ pageContext.request.contextPath }/menu/menuBoard.do" style="float: right;">
		    			<span><i class="fa fa-th-list" aria-hidden="true"> 텍스트로 보기</i></span>
		    		</a>
		    	</div>        
        
		        <table>
			        <c:forEach items="${ menuList }" var="menu">
			        <div class="col-md-3">
			            <div class="ibox">
			                 <div class="ibox-content product-box" onclick="location.href='${ pageContext.request.contextPath}/menu/menuDetail.do?no=${menu.no}'">
								<div class = "menuType" style = "display: none">${ menu.type }</div>
			                     <div class="product-imitation">
			                         <img src="${ pageContext.request.contextPath }/upload/menu/${ menu.imgFileName }" style="width: 100%;">
			                     </div>
			                     <div class="product-desc" style="max-height: 180px">
			                         <span class="product-price">
			                             ${ menu.price }원
			                         </span>
			                         <small class="text-muted">Category</small>
			                         <a href="${ pageContext.request.contextPath}/menu/menuDetail.do?no=${menu.no}" class="product-name" style="margin-top: 15px">${ menu.name }</a>		                                
			                         <div class="m-t text-righ">		
			                             <a href="${ pageContext.request.contextPath}/menu/menuDetail.do?no=${menu.no}" class="btn btn-xs btn-outline btn-primary">Info <i class="fa fa-long-arrow-right"></i></a>
			                         </div>
			                     </div>
			                 </div>
			            </div>
			        </div>
			      	</c:forEach>		
				</table>		
            </div>
            
            <div class="hr-line-dashed"></div>            
            <div style="width: 100%; text-align: center;">
	        	<div style="display: inline-block;">
					<c:if test="${map.boardPager.curBlock > 1}">
	                    <a href="javascript:list('1')"><button type="button" class="btn btn-white"><i class="fa fa-angle-double-left"></i></button></a>
	                </c:if>
	                
	                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
	                <c:if test="${map.boardPager.curBlock > 1}">
	                    <a href="javascript:list('${map.boardPager.prevPage}')"><button type="button" class="btn btn-white"><i class="fa fa-angle-left"></i></button></a>
	                </c:if>
	                
	                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
	                <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
	                    <!-- **현재페이지이면 하이퍼링크 제거 -->
	                    <c:choose>
	                        <c:when test="${num == map.boardPager.curPage}">
	                        	<button class="btn btn-white active">${num}</button>
	                        </c:when>
	                        <c:otherwise>
	                            <a href="javascript:list('${num}')"><button class="btn btn-white">${num}</button></a>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                
	                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
	                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
	                    <a href="javascript:list('${map.boardPager.nextPage}')"><button type="button" class="btn btn-white"><i class="fa fa-angle-right"></i></button></a>
	                </c:if>
	                
	                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
	                <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
	                    <a href="javascript:list('${map.boardPager.totPage}')"><button type="button" class="btn btn-white"><i class="fa fa-angle-double-right"></i></button></a>
	                </c:if>
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
<script src="${ pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${ pageContext.request.contextPath}/resources/js/inspinia.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/plugins/pace/pace.min.js"></script>
    <script>
    	$(document).ready(function() {
    		
    		// sidebar li & ul 클래스 active
			$('.menuLI').addClass("active");
			$('.menuLI > ul').addClass("in");
			$('.menuAll').addClass("active");
    		

    		
    		for(var i = 0; i < $('.product-box').length; ++i) {
    			
    			var product  = $('.product-box').eq(i);    			
    			
	    		if( product.find('.menuType').text() == 'R'){
	    			product.find('.text-muted').html('<span class="label label-danger">추천메뉴</span>');}
	    		else if(product.find('.menuType').text() == 'P'){
	    			product.find('.text-muted').html('<span class="label label-success">프리미엄</span>');}
	    		else if(product.find('.menuType').text() == 'B'){
	    			product.find('.text-muted').html('<span class="label label-primary">베스트</span>');}
	    		else if(product.find('.menuType').text() == 'C'){
	    			product.find('.text-muted').html('<span class="label label-default">클래식</span>');}
	    		else if(product.find('.menuType').text() == 'M'){
	    			product.find('.text-muted').html('<span class="label label-warning">아침식사</span>');}
	    		else if(product.find('.menuType').text() == 'S'){
	    			product.find('.text-muted').html('<span class="label label-info">샐러드</span>');}
	    		else if(product.find('.menuType').text() == 'N'){
	    			product.find('.text-muted').html('<span class="label label-default">추가메뉴</span>');}
	    		else if(product.find('.menuType').text() == 'D'){
	    			product.find('.text-muted').html('<span class="label label-default">음료</span>');}
    		}    		
    		
    		
    		

        });
        
        // 리스트로 이동
        function changeList() {
        	location.href = "${ pageContext.request.contextPath }/menu/menuBoard.do";
        }    		
    		
        
        // **원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
        function list(page){
            location.href="${ pageContext.request.contextPath}/menu/list.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
        }
    		
    		
    		
    		
    </script>
</body>
</html>
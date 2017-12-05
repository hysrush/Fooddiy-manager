<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | E-commerce</title>

    <link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- FooTable -->
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/footable/footable.core.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
	

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
                    <h2>메뉴 관리</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                        </li>
                        <li>
                            <a>메뉴관리</a>
                        </li>
                        <li class="active">
                            <strong>메뉴 관리</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>

        <div class="wrapper wrapper-content animated fadeInRight ecommerce">


            <div class="ibox-content m-b-sm border-bottom">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="product_name">Product Name</label>
                            <input type="text" id="product_name" name="product_name" value="" placeholder="Product Name" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="price">Price</label>
                            <input type="text" id="price" name="price" value="" placeholder="Price" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="quantity">Quantity</label>
                            <input type="text" id="quantity" name="quantity" value="" placeholder="Quantity" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="status">Status</label>
                            <select name="status" id="status" class="form-control">
                                <option value="1" selected>Enabled</option>
                                <option value="0">Disabled</option>
                            </select>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content">

                            <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="15">
                                <thead>
                                <tr>

                                    <th data-toggle="true">메뉴 이름</th>
                                    <th data-hide="phone">타입</th>
                                    <th data-hide="all">설명</th>
                                    <th data-hide="phone">가격</th>
                                    <!-- <th data-hide="phone,tablet" >Quantity</th> -->
                                    <th data-hide="phone">상태</th>
                                    <th class="text-right" data-sort-ignore="true">Action</th>

                                </tr>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${ menuList }" var="menu">
                                
                                <tr class="boardList">
                                    <td>
                                       ${ menu.name }
                                    </td>
                                    <td class="convType">
                                       TYPE
                                    </td>
                                    <td>
                                        ${ menu.detail }
                                    </td>
                                    <td>
                                        ${ menu.price }원
                                    </td>
                                    <!-- <td>
                                        1000
                                    </td> -->
                                    <td>
                                        <span class="label label-primary">Enable</span>
                                        <!-- <span class="label label-danger">Disabled</span>
                                        <span class="label label-warning">Low stock</span> -->
                                    </td>
                                    <td class="text-right">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs" id="view" onclick="btnClick(${menu.no})">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                        <div class = "menuType" style = "display: none">${ menu.type }</div>
                                    </td>
                                </tr>
                                
								</c:forEach>

                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <ul class="pagination pull-right"></ul>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>

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

    <!-- FooTable -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/footable/footable.all.min.js"></script>

    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function() {

            $('.footable').footable();
            
            
			for(var i = 0; i < $('.boardList').length; ++i) {    			
    			var product  = $('.boardList').eq(i);
	    		if( product.find('.menuType').text() == 'R'){
	    			product.find('.convType').html("추천메뉴");}
	    		else if(product.find('.menuType').text() == 'P'){
	    			product.find('.convType').html("프리미엄");}
	    		else if(product.find('.menuType').text() == 'B'){
	    			product.find('.convType').html("베스트");}
	    		else if(product.find('.menuType').text() == 'C'){
	    			product.find('.convType').html("클래식");}
	    		else if(product.find('.menuType').text() == 'M'){
	    			product.find('.convType').html("아침식사");}
	    		else if(product.find('.menuType').text() == 'S'){
	    			product.find('.convType').html("샐러드");}
	    		else if(product.find('.menuType').text() == 'N'){
	    			product.find('.convType').html("추가메뉴");}
	    		else if(product.find('.menuType').text() == 'D'){
	    			product.find('.convType').html("음료");}
    		}
			

        });
        
        function btnClick(no) {
        	location.href = '${ pageContext.request.contextPath}/menu/menuDetail.do?no=' + no;
        } 
	    	

    </script>

</body>

</html>

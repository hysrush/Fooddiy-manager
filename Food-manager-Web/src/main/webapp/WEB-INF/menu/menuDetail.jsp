<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>MenuDetail</title>

    <link href="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath}/resources/css/plugins/slick/slick.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/css/plugins/slick/slick-theme.css" rel="stylesheet">

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
                <h2>메뉴 상세내용</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                    </li>
                    <li>
                        <a>메뉴관리</a>
                    </li>
                    <li class="active">
                        <strong>메뉴 상세내용</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            
            <div class="row">
                <div class="col-lg-12">

                    <div class="ibox product-detail">
                        <div class="ibox-content">

                            <div class="row">
                                <div class="col-md-5">


                                    <div class="product-images">

                                        <div>
                                            <div class="image-imitation">
                                                <img alt="" class="img-responsive img-rounded"
													src="${ pageContext.request.contextPath }/upload/menu/${ menuDetailVO.imgFileName }">
                                            </div>
                                        </div>
                                        <!-- <div>
                                            <div class="image-imitation">
                                                [IMAGE 2]
                                            </div>
                                        </div>
                                        <div>
                                            <div class="image-imitation">
                                                [IMAGE 3]
                                            </div>
                                        </div> -->


                                    </div>

                                </div>
                                <div class="col-md-7">

                                    <h2 class="font-bold m-b-xs">
                                        ${ menuDetailVO.name }
                                    </h2>
                                    <small>${ menuDetailVO.mainmenu }</small>
                                    <hr>
                                    <div>
                                        <button class="btn btn-primary pull-right">Edit</button>
                                        <h1 class="product-main-price">${ menuDetailVO.price }원<small class="text-muted">15cm</small></h1>
                                    </div>
                                    <hr>
                                    <h4>메뉴 설명</h4>

                                    <div class="small text-muted">
                                        ${ menuDetailVO.detail }
                                        <br/>
                                        <br/>                                        
                                    </div>
                                    <dl class="dl-horizontal m-t-md small">
                                        <dt>알르레기 유발성분</dt>
                                        <dd>${ menuDetailVO.allergy }</dd>
                                        <dt>Serving Size(g)</dt>
                                        <dd>${ menuDetailVO.serviceSize }</dd>
                                        <dt>칼로리</dt>
                                        <dd>${ menuDetailVO.calorie }</dd>
                                        <dt>단백질(g)</dt>
                                        <dd>${ menuDetailVO.protein }</dd>
                                        <dt>나트륨(mg)</dt>
                                        <dd>${ menuDetailVO.natrium }</dd>
                                        <dt>당류(g)</dt>
                                        <dd>${ menuDetailVO.sugar }</dd>
                                        <dt>포화지방(g)</dt>
                                        <dd>${ menuDetailVO.fat }</dd>
                                    </dl>
                                    <div class="text-right">
                                        <div class="btn-group">
                                            <button class="btn btn-white btn-sm"><i class="fa fa-star"></i> Add to wishlist </button>
                                            <button class="btn btn-white btn-sm"><i class="fa fa-envelope"></i> Contact with author </button>
                                        </div>
                                    </div>


                                </div>
                            </div>

                        </div>
                        <div class="ibox-footer">
                            <span class="pull-right">
                                Full stock - <i class="fa fa-clock-o"></i> 14.04.2016 10:04 pm
                            </span>
                            The generated Lorem Ipsum is therefore always free
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
<script src="${ pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${ pageContext.request.contextPath}/resources/js/inspinia.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/plugins/pace/pace.min.js"></script>

<!-- slick carousel-->
<script src="${ pageContext.request.contextPath}/resources/js/plugins/slick/slick.min.js"></script>

<script>
    $(document).ready(function(){


        $('.product-images').slick({
            dots: true
        });

    });

</script>

</body>

</html>

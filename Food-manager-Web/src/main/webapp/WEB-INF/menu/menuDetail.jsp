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
    
    <link rel="stylesheet" href="https://wfolly.firebaseapp.com/node_modules/sweetalert/dist/sweetalert.css">    
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
                                        
                                    </div>

                                </div>
                                <div class="col-md-7">

                                    <h1 class="font-bold m-b-xs">
                                        ${ menuDetailVO.name }
                                    </h1>
                                    <small style="font-size: 15px">${ menuDetailVO.mainmenu }</small>
                                    <hr>
                                    <div>
                                        
                                        <h1 class="product-main-price" id="15">${ menuDetailVO.price }원<small class="text-muted" style="font-size: 20px">-15cm</small></h1>
                                        <h1 class="product-main-price" id="30"></h1>
                                    </div>
                                    <hr>
                                    <h3>메뉴 설명</h3>

                                    <div class="small text-muted" style="font-size: 17px">
                                        ${ menuDetailVO.detail }
                                        <br/>
                                        <br/>                                        
                                    </div>
                                    <dl class="dl-horizontal m-t-md small" style="font-size: 15px">
                                        <dt style="text-align: left">Serving Size(g)</dt>
                                        <dd>${ menuDetailVO.serviceSize }</dd>
                                        <dt style="text-align: left">칼로리</dt>
                                        <dd>${ menuDetailVO.calorie }</dd>
                                        <dt style="text-align: left">단백질(g)</dt>
                                        <dd>${ menuDetailVO.protein }</dd>
                                        <dt style="text-align: left">나트륨(mg)</dt>
                                        <dd>${ menuDetailVO.natrium }</dd>
                                        <dt style="text-align: left">당류(g)</dt>
                                        <dd>${ menuDetailVO.sugar }</dd>
                                        <dt style="text-align: left">포화지방(g)</dt>
                                        <dd>${ menuDetailVO.fat }</dd>
                                        <dt style="text-align: left">알르레기 유발성분</dt>
                                        <dd>${ menuDetailVO.allergy }</dd>                                        
                                    </dl><br><br>
                                    <div class="text-right" style="text-align: center">
                                        <!-- <div class="btn-group"> -->
                                      		<button class="btn btn-info list">목록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      		<button class="btn btn-primary">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-danger demo4" onclick="del(${ menuDetailVO.no })">삭제</button>
                                        <!-- </div> -->
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

<!-- sweetalert js & css -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> 



<script>

    $(document).ready(function(){

        $('.product-images').slick({
            dots: true
        });
        
        
        // 30cm 가격 표시
        $(function() {
     	   if(${ menuDetailVO.type == 'R' }){
     		   var price = '8700원<small class="text-muted" id="cm" style="font-size: 20px">-30cm</small>';
			   $("#30").html(price);
		   }
		   if(${ menuDetailVO.type == 'P' }){
			   var price = '9800원<small class="text-muted" id="cm" style="font-size: 20px">-30cm</small>';
			   $("#30").html(price);
		   }
		   if(${ menuDetailVO.type == 'B' }){
			   var price = '9200원<small class="text-muted" id="cm" style="font-size: 20px">-30cm</small>';
			   $("#30").html(price);
		   }
		   if(${ menuDetailVO.type == 'C' }){
			   var price = '8200원<small class="text-muted" id="cm" style="font-size: 20px">-30cm</small>';
			   $("#30").html(price);
		   }
        });        
        
        
        // 삭제 확인 sweet alert
        $('.demo4').click(function () {
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
		        	location.href = '${ pageContext.request.contextPath}/menu/menuDelete.do?no=' + ${ menuDetailVO.no};
				});
		    });
		});
        
        
        // 이전 목록으로 돌아가기
        $('.list').click(function() {
        	var url = '${url}';        	
        	location.href = '${ pageContext.request.contextPath}/' + url + '.do';
        	
        });
        
        
    });

	
</script>

</body>

</html>

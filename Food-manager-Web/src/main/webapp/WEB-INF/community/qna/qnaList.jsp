<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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

    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
<style type="text/css">
	.convType > span {
		width: 60px;
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
        
       	<!-- 페이지 헤더 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>자주묻는질문 관리</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
                    </li>
                    <li>
                        <a>커뮤니티 관리</a>
                    </li>
                    <li class="active">
                        <strong>자주묻는질문 관리</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        
		<!-- 페이지 컨텐츠 -->
        <div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<!-- Search box -->
            <div class="ibox-content m-b-sm border-bottom">
                <div class="row">
                	<div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="type">타입</label>
                            <select name="type" id="type" class="form-control">
                                <option value="F" selected>푸디오더</option>
                                <option value="P">포인트</option>
                                <option value="O">주문</option>
                                <option value="M">회원정보</option>
                                <option value="X">기타</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="question">Q</label>
                            <input type="text" id="question" name="question" value="" placeholder="질문" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="answer">A</label>
                            <input type="text" id="answer" name="answer" value="" placeholder="답변" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="regDate">등록일</label>
                            <input type="date" id="regDate" name="regDate" value="" placeholder="regDate" class="form-control">
                        </div>
                    </div>
                </div>
            </div>
			<!-- 자주묻는질문 List -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content">
                        	<div class="table-responsive">
	                            <table class="footable table table-stripped toggle-arrow-tiny dataTables-example" data-page-size="25">
	                                <thead>
		                                <tr>
		                                    <th data-hide="phone" data-sort-ignore="true">타입</th>
		                                    <th data-toggle="true" data-sort-ignore="true">Q</th>
		                                    <th data-hide="all" data-sort-ignore="true">A</th>
		                                    <th data-hide="phone" data-sort-ignore="true">등록일</th>
		                                    <th class="text-right" data-sort-ignore="true">Action</th>
		                                </tr>
	                                </thead>
	                                <tbody>
	                                <c:forEach items="${ qnaList }" var="qna">
		                                <tr class="qnaList">
		                                    <td class="convType" width="100px;">
			                                    <span class="label label-primary">type</span>
		                                        <div class="qnaType" style = "display: none">${ qna.type }</div>
		                                    </td>
		                                    <td>
		                                        ${ qna.question }
		                                    </td>
		                                    <td style="word-break:keep-all;">
		                                        ${ qna.answer }
		                                    </td>
		                                    <td width="10%" nowrap>
		                                        ${ qna.regDate }
		                                    </td>
		                                    <td class="text-right">
		                                        <div class="btn-group" width="10%" nowrap>
		                                            <button class="btn-white btn btn-xs" id="view" onclick="btnClick(${qna.no})"><i class="fa fa-search"></i></button>
		                                            <button class="btn-white btn btn-xs"><i class="fa fa-edit"></i></button>
		                                            <button class="btn-white btn btn-xs"><i class="fa fa-trash"></i></button>
		                                        </div>
		                                    </td>
		                                </tr>
									</c:forEach>
	                                </tbody>
	                            </table>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer -->
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
			
		    $('.footable').footable();
		    
			$('.dataTables_empty').html("해당 단어로 검색한 결과가 없습니다.");

			for(var i = 0; i < $('.qnaList').length; ++i) {    	
				
				var qnaType  = $('.qnaList').eq(i);
				
				// 타입별 클래스명 & 텍스트 변경
				if(qnaType.find('.qnaType').text() == 'F'){
					qnaType.find('.label').attr("class","label label-primary");
					qnaType.find('.label').html("푸디오더");
				}
				else if(qnaType.find('.qnaType').text() == 'P'){
					qnaType.find('.label').attr("class","label label-danger");
					qnaType.find('.label').html("포인트");
				}
				else if(qnaType.find('.qnaType').text() == 'O'){
					qnaType.find('.label').attr("class","label label-warning");
					qnaType.find('.label').html("주문");
				}
				else if(qnaType.find('.qnaType').text() == 'M'){
					qnaType.find('.label').attr("class","label label-success");
					qnaType.find('.label').html("회원정보");
				}
				else if(qnaType.find('.qnaType').text() == 'X'){
					qnaType.find('.label').attr("class","label label-plain");
					qnaType.find('.label').html("기타");
				}
			}
			
			// 데이터테이블 생성
			$('.footable').css("width","100%");
			$('.dataTables-example').DataTable({
                pageLength: 25,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    {extend: 'copy'},
                    {extend: 'csv'},
                    {extend: 'excel', title: 'ExampleFile'},
                    {extend: 'pdf', title: 'ExampleFile'},
                    {extend: 'print',
                     customize: function (win){
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');
                            $(win.document.body).find('table').addClass('compact').css('font-size', 'inherit');
                    	}
                    }
                ]
            });
		});
	
		function btnClick(no) {
			location.href = '${ pageContext.request.contextPath}/community/qna/qnaDetail.do?no=' + no;
		} 
		
		function submit() {
			document.getElementById("dForm").submit();
		}
	
	</script>
	</body>
</html>

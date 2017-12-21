<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>| Fooddiy-Order Admin+ |</title>

<link
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<!-- dataTables -->
<link
	href="${ pageContext.request.contextPath }/resources/css/plugins/dataTables/datatables.min.css"
	rel="stylesheet">
<!-- FooTable -->
<link
	href="${ pageContext.request.contextPath }/resources/css/plugins/footable/footable.core.css"
	rel="stylesheet">

<!-- sweetalert js & css -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://wfolly.firebaseapp.com/node_modules/sweetalert/dist/sweetalert.css">

<link
	href="${ pageContext.request.contextPath }/resources/css/animate.css"
	rel="stylesheet">
<link
	href="${ pageContext.request.contextPath }/resources/css/style.css"
	rel="stylesheet">

<style type="text/css">
.pace-done {
	padding-right: 0 !important;
}

.convType>span {
	width: 60px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<!-- sidebar -->
		<jsp:include page="/resources/include/sidebar.jsp" />

		<div id="page-wrapper" class="gray-bg">
			<!-- topbar -->
			<jsp:include page="/resources/include/topbar.jsp" />

			<!-- 페이지 header -->
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>SNS 관리</h2>
					<ol class="breadcrumb">
						<li><a
							href="${ pageContext.request.contextPath}/FirstPage.jsp">Home</a>
						</li>
						<li><a>SNS관리</a></li>
						<li class="active"><strong>SNS 관리</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<div class="col-md-9">
				<table class="table" align="center">
					<thead>
						<tr>

							<th><strong>${snsVO.title}</strong></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span>좋아요 : ${snsVO.like }</span></td>

						</tr>
						<tr>
							<td><img src="${pageContext.request.contextPath}/upload/SNS/${ snsVO.fileName }"></td>
						<tr>
							<td>
								<h4>내용 :  ${snsVO.content }</h4>
								<hr/>
							</td>
						</tr>
						<tr>
							<td>
								<h4> 메뉴 이름 : ${snsVO.name }</h4><br/>
								<h4> 빵 : ${snsVO.bread }</h4><br/>
								<h4> 치즈 : ${snsVO.cheese }</h4><br/>	
								<h4> 토핑 : ${snsVO.topping }</h4><br/>
								<h4> 야채 : ${snsVO.vegetable }</h4><br/>
								<h4> 소스 : ${snsVO.sauce }</h4><br/>
							</td>

						</tr>

					</tbody>
				</table>
			</div>
			<br />
			<br />
			<div class="row" align="center">

				<div class="col-md-12">
					<input type="button" onclick="doAction('D')" value="삭제 " />&nbsp;&nbsp;

					<input type="button" onclick="doAction('L')" value="목록">

				</div>
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
    
    <script type="text/javascript">
		$(document).ready(function() {
			
			// sidebar li & ul 클래스 active
			$('.communityLI').addClass("active");
			$('.communityLI > ul').addClass("in");
			$('.snsLI').addClass("active");
		    
		});
	</script>

	<script type="text/javascript">
		function doAction(type) {
			switch (type) {
			case 'D':
				if (confirm("삭제 하시겠습니까?")) {
					location.href = "${ pageContext.request.contextPath}/community/sns/deleteSns.do?no="+ ${snsVO.no};
				}
				break;
			case 'L':
				if (confirm("목록으로 돌아가시겠습니까?")) {
					location.href = "${ pageContext.request.contextPath}/community/sns/snsPage.do";
				}
				break;
			}
		}
		
	
		
	</script>




</body>
</html>
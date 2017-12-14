<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="${ pageContext.request.contextPath}/resources/js/custom.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>INSPINIA | E-commerce</title>

<link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
<!-- dataTables -->
<link href="${ pageContext.request.contextPath }/resources/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
<!-- FooTable -->
<link href="${ pageContext.request.contextPath }/resources/css/plugins/footable/footable.core.css" rel="stylesheet">

<link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">

<!-- sweetalert js & css -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> 
<link rel="stylesheet" href="https://wfolly.firebaseapp.com/node_modules/sweetalert/dist/sweetalert.css">
<style type="text/css">
	.convType > span {
		width: 60px;
	}
</style>

</head>

<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">
			<span aria-hidden="true">×</span><span class="sr-only">Close</span>
		</button>
		<i class="fa fa-list-alt modal-icon"></i>
		<h4 class="modal-title">주문 상세</h4>
	</div>
	<div class="modal-body" style="max-height:500px;overflow: auto;">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th style="text-align: center" colspan="2">주문 결제정보</th>
				</tr>
			</thead>
			<tbody>
				<tr >
					<th width = "30%">주문번호</td>
					<td>${ orderVO.no }</td>
				</tr>
				<tr>
					<th>주문시간</td>
					<td>${ orderVO.regDate }</td>
				</tr>
				<tr>
					<th>결제방법</td>
					<td>${ orderVO.payment }</td>
				</tr>
				<tr>
					<th>결제금액</td>
					<td class = "commaN">${ orderVO.final_price }원</td>
				</tr>
			</tbody>
		</table>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>메뉴</th>
						<th>주문옵션</th>
						<th>수량</th>
						<th>합계금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ orderVO.detailOrderList }" var="oneMenu">
						<tr >
							<td>
								${ oneMenu.name} <br>
								${ oneMenu.size} <br>
								<div class = "commaN">${ oneMenu.price}원</div>	
							</td>
							<td>
								${ oneMenu.bread}	<br>
								${ oneMenu.cheese}	<br>
								${ oneMenu.topping}	<br>
								${ oneMenu.vegetable}	<br>
								${ oneMenu.sauce}	<br>
								${ oneMenu.requirement}
							</td>
							<td>${ oneMenu.qty}</td>
							<td class = "commaN">${ oneMenu.total_price }원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
	</div>
</body>

<script>
	$(document).ready(function(){ 
		//숫자표기
		for(var i = 0; i < $('.commaN').length; ++i) {
			$('.commaN').eq(i).text(comma($('.commaN').eq(i).text()));
		}
	});
</script>
</html>
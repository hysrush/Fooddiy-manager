<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>| Fooddiy-Order Admin+ |</title>	
<script>
</script>
</head>
<body>
<div class="stamp modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="largeModalLabel">쿠폰북</h4>
	</div>

	<div class="modal-body shop" style="max-height:500px;overflow: auto;">
		<!-- 모달 속 상세내용 -->
		<div class="modal-body ">
			<table >
				<tr>
					<td><img style="width: 100%"
						src="${ pageContext.request.contextPath }/resources/img/stamp/${ stamp }.jpg">
					</td>
				</tr>
			</table>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
		</div>
	</div>
</body>
</html>



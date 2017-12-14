<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	#typeLabel {
		font-size: 10pt;
	}
	.close {
		font-size: 40px;
	}
	.label-primary {
		background-color: #7aa93c;
	}
</style>

<!-- 모달창 시작 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">
		<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
	</button>
	<span class="label label-primary" id="typeLabel">${ qnaVO.type }</span>
	<hr>
	<h4 class="modal-title">Q. ${ qnaVO.question }</h4>
	<small><i class="fa fa-clock-o"></i> ${ qnaVO.regDate }</small>
</div>
<div class="modal-body">
	<p>
		<!-- 자동 단락 나누기 (jstl - fn) -->
		<strong>A.</strong> ${ fn:replace(qnaVO.answer, cn, br) }
	</p>
</div>
<div class="modal-footer">
	<button class="btn btn-default" type="button" onclick="action('E', ${ qnaVO.no })"><i class="fa fa-edit"></i>&nbsp;&nbsp;수정</button>
	<button class="btn btn-default" type="button" onclick="action('D', ${ qnaVO.no })"><i class="fa fa-trash"></i>&nbsp;&nbsp;삭제</button>
</div>

<!-- Page-Level Scripts -->
<script type="text/javascript">
	$(document).ready(function() {
		
		// 타입별 라벨 클래스명 & 텍스트 변경
		if($('#typeLabel').text() == 'F'){
			$('#typeLabel').attr("class","label label-primary");
			$('#typeLabel').html("푸디오더");
		}
		else if($('#typeLabel').text() == 'P'){
			$('#typeLabel').attr("class","label label-danger");
			$('#typeLabel').html("포인트");
		}
		else if($('#typeLabel').text() == 'O'){
			$('#typeLabel').attr("class","label label-warning");
			$('#typeLabel').html("주문");
		}
		else if($('#typeLabel').text() == 'M'){
			$('#typeLabel').attr("class","label label-success");
			$('#typeLabel').html("회원정보");
		}
		else if($('#typeLabel').text() == 'X'){
			$('#typeLabel').attr("class","label label-plain");
			$('#typeLabel').html("기타");
		}
		
		// 모달창 크기별 font & width 크기 조절
		var Qlength =  ${ qnaLength };
		//alert("질문 길이 : " + Qlength);
		if (Qlength < 26) {
			$('.modal-title').css("font-size","26px");
			$('.modal-dialog').css("width","600px");
		} else if (Qlength > 25 && Qlength < 31) {
			$('.modal-title').css("font-size","24px");
			$('.modal-dialog').css("width","600px");
		} else if (Qlength > 30 && Qlength < 39) {
			$('.modal-title').css("font-size","22px");
			$('.modal-dialog').css("width","750px");
		} else {
			$('.modal-title').css("font-size","20px");
			$('.modal-dialog').css("width","750px");
		}
		
	});
	
</script>
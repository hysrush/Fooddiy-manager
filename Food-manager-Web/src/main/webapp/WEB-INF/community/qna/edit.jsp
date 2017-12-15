<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- easydropdown -->
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/plugins/easydropdown/easydropdown.css"/>

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
	.easydropdown ul{
	    -webkit-padding-start: 0px;
	}
	.easydropdown .selected, .easydropdown li {
		font-size: 14px;
		color: gray;
	}
	.btn-default {
		background-color: #EAE8E8;
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
	<div class="panel-body">
		<form:form commandName="qnaVO" method="POST"  id="qnaForm">
			<fieldset class="form-horizontal" aria-hidden="false">
				<h2>Q&A 수정</h2>
				<div class="ibox-content">
					<div class="form-group">
						<div class="col-sm-2">
							<label class="control-label" for="type">타입 *</label>
								<form:select path="type" name="type" id="type"
												class="easydropdown form-control required" aria-required="true">
									<form:option value="F">푸디오더</form:option>
									<form:option value="P">포인트</form:option>
									<form:option value="O">주문</form:option>
									<form:option value="M">회원정보</form:option>
									<form:option value="X">기타</form:option>
								</form:select>
								<input type="hidden" value="${ qnaVO.type }" id="hiddenType"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<label class="control-label" for="question">Q *</label>
							<form:input path="question" type="text" id="question" class="form-control" 
										value="${ qnaVO.question }"	placeholder="질문" name="question" required="required"/>
							<form:errors path="question" class="form-control"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<label class="control-label" for="answer">A *</label>
							<form:textarea path="answer" id="answer" class="form-control" rows="5" 
											value="${ qnaVO.answer }" placeholder="대답" name="answer" required="required"/>
							<form:errors path="answer" class="form-control"></form:errors>
						</div>
					</div>
				</div>
				<form:input path="regDate" type="hidden" id="regDate"/>
			</fieldset>
		</form:form>
     </div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" id="erase">지우기</button>
	<button type="submit" class="btn btn-primary" id="qnaUpdate">수정</button>
</div>

<!-- easydropdown -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins/easydropdown/jquery.easydropdown.js"></script> 
<!-- Jquery Validate -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins/validate/jquery.validate.min.js"></script>

<!-- Page-Level Scripts -->
<script type="text/javascript">
	$(document).ready(function() {
		
		// easydropdown 라벨화 작업
		var qnaType  = $('.easydropdown').find('.selected');
		// 초기값
		qnaType.css("width","100px");
		if (qnaType.text() == '푸디오더') {
			qnaType.attr("class","selected label label-primary");
			qnaType.css("color","white");
		} else if (qnaType.text() == '포인트') {
			qnaType.attr("class","selected label label-danger");
			qnaType.css("color","white");
		} else if (qnaType.text() == '주문') {
			qnaType.attr("class","selected label label-warning");
			qnaType.css("color","white");
		} else if (qnaType.text() == '회원정보') {
			qnaType.attr("class","selected label label-success");
			qnaType.css("color","white");
		} else if (qnaType.text() == '기타') {
			qnaType.attr("class","selected label label-plain");
			qnaType.css("color","#5e5e5e");
		}
		// option selected 변경 시,
		$('.easydropdown li').click(function () {
			if (qnaType.text() == '푸디오더') {
				qnaType.attr("class","selected label label-primary");
				qnaType.css("color","white");
			} else if (qnaType.text() == '포인트') {
				qnaType.attr("class","selected label label-danger");
				qnaType.css("color","white");
			} else if (qnaType.text() == '주문') {
				qnaType.attr("class","selected label label-warning");
				qnaType.css("color","white");
			} else if (qnaType.text() == '회원정보') {
				qnaType.attr("class","selected label label-success");
				qnaType.css("color","white");
			} else if (qnaType.text() == '기타') {
				qnaType.attr("class","selected label label-plain");
				qnaType.css("color","#5e5e5e");
			}
		});
		
		// 수정된 날짜(오늘날짜)로 값 넣기
       	var today = new Date();
       	today = getFormatDate(today);
		$('#regDate').val(today);
		
		// 기존 type값 가져와서 selected 설정해놓기
		var type = $('#hiddenType').val();
		$("#type").val(type).prop("selected", true);
		
		// Form 유효성 검사 작업
		$("#qnaForm").validate({
			// 규칙
			rules: {
            	question: {
                    required: true,
                    maxlength: 40
                },
                answer: {
                    required: true,
                    maxlength: 320
                }
            },
          	//규칙체크 실패 시, 출력될 메시지
            messages : {
            	question: {
                    required : "질문을 입력해주세요!",
                    maxlength : "{0}글자 이하로 작성하세요!",
                },
                answer: {
                	 required : "대답을 입력해주세요!",
                     maxlength : "{0}글자 이하로 작성하세요!",
                }
            },
			//규칙체크 실패 시, 실행될 이벤트
            invalidHandler: function (form, validator) {
                var errors = validator.numberOfInvalids();
                if (errors) {
                	validator.errorList[0].element.focus();
                	swal({
    	   				title: "Error!",
    	   				text: validator.errorList[0].message,
    	                type: "error"
    	       	 	});
                }
            },
			//규칙체크 성공 시, 실행될 이벤트
            submitHandler: function(form) {
            	swal({
	   				title: "수정 완료!",
	                type: "success"
	       	 	}, function () {
			        // OK 누르면 Submit 실행
			        form.submit();
			        //$('#qnaForm').submit();
			    });
            }
        });
		
		// 폼 초기화
		$('#erase').click(function () {
			$('#qnaForm input[type="text"], textarea').val(""); 
		});
		
	});
	
	// 날짜 yyyy-MM-dd 포맷 변환 함수
   	function getFormatDate(date){
   		var year = date.getFullYear();					// yyyy
   		var month = (1 + date.getMonth());				// M
   		month = month >= 10 ? month : '0' + month;		// month 두자리로 저장
   		var day = date.getDate();						// d
   		day = day >= 10 ? day : '0' + day;				// day 두자리로 저장
   		return  year + '/' + month + '/' + day;
   	}
	
</script>
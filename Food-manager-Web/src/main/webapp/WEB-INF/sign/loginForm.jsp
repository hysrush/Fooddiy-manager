<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Fooddiy-Order Admin+ | Dashboard</title>

    <link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="${ pageContext.request.contextPath }/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <!-- Gritter -->
    <link href="${ pageContext.request.contextPath }/resources/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
	 
	 <!-- Mainly scripts -->
    <script src="${ pageContext.request.contextPath }/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"> </script>
    
    <script>window.name="main"</script>
<style type="text/css">
	#logo {
		font-size: 100px;
	}
	.swal-text {
    color: #797979;
    /* font-size: 16px; */
    text-align: center;
    font-weight: 300;
    position: relative;
    text-align: inherit;
    float: none;
    margin: 0;
    padding: 0;
    line-height: normal;
    }
    .form-control{
  		border: 1px solid #fff;
		background-color : #1ab39426;
	}
	a {
  		color: #1ab394;
  		text-decoration: none;
	}
</style>
<script>
$(document).ready(function(){
	
	$("#lostpw").click(function(){
		window.opener.name = "main"; // 부모창의 이름 설정
    	document.lostForm.target = opener.window.name; // 타켓을 부모창으로 설정
   		self.close();
	});
	
	if("${msg}"){
		swal({
			text: "${msg}"
		});
	}

	 // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});

	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}


</script>
</head>
<body class="gray-bg">
	<div class="middle-box loginscreen animated fadeInDown">
            <div class="text-center">
                <h1 class="logo-name" id="logo">Fooddiy Order Admin+</h1><br/>
            <h3>Welcome to Fooddiy-Order Admin+</h3>
            </div>
            <form class="m-t" role="form" action="${ pageContext.request.contextPath }/sign/login" method="post">
                <div class="form-group">
                    <input type="email" name="id" class="form-control" placeholder="Username" required="required">
                </div>
                <div class="form-group" style="text-align: right;">
					<a href="#" data-toggle="modal" data-target="#myModal6"><small>Forgot password?</small></a>
                    <input type="password" name="pw" class="form-control" placeholder="Password" required="required">
                </div>
                <span class="remember-box checkbox">
					<label for="idSaveCheck"><input type="checkbox" id="idSaveCheck" name="rememberid"/>아이디 저장</label>
				</span>
                <button type="submit" class="btn btn-primary block full-width m-b">Login</button>

                <p class="text-muted text-center"><small>관리자 등록을 하셨습니까?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="${ pageContext.request.contextPath }/sign/signUp">관리자 등록</a>
            </form>
            <p class="m-t"> <small>Fooddiy-Order Admin+ &copy; 2017</small> </p>
    </div>
<!-- modal -->
	<div style="position: absolute; top: 100px; right: 100px"
		class="modal inmodal" id="myModal6" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated fadeIn">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h2 class="font-bold" style="text-align: center">비밀번호 찾기</h2>
				</div>
				<div class="wrapper wrapper-content animated fadeInRight">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<form class="m-t" role="form" name="lostForm" action="${ pageContext.request.contextPath }/sign/lostpw" method="post">
								<div class="form-group">
									<label>이름*</label><input type="text" name="name" class="form-control" placeholder="Username" required="required">
								</div>
								<div class="form-group">
									<label>ID*</label><input type="email" name="id" class="form-control" placeholder="email" required="required">
								</div>
								<input type="submit" id="lostpw" class="btn btn-primary block full-width m-b" value="확인" />
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
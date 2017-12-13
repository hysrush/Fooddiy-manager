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
});
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
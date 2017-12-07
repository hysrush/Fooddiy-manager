<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title> | 관리자 가입 | </title>

    <link href="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>
            	<span style="text-align: center; font-size: 15px;">Fooddiy-Order Admin+</span>
            	 <h1 class="logo-name" id="logo">Fooddiy-Order Admin+</h1>
            </div>
            <h3>관리자 가입</h3>
            <p>Create account to see it in action.</p>
            <form class="m-t" role="form" action="${ pageContext.request.contextPath }/sign/signUp">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Name" required="required">
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" placeholder="kkk@naver.com" required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" required="required">
                </div>
                <div class="form-group">
                    <select class="form-control" style="text-align: center" required="required">
                    	<option> - 지점 선택 - </option>
                    	<option value="강남 1호점">강남 1호점</option>
                    	<option value="강남 2호점">강남 2호점</option>
                    	<option value="서초 1호점">서초 1호점</option>
                    	<option value="교대 1호점">교대 1호점</option>
                    	<option value="교대 2호점">교대 2호점</option>
                    </select>
                </div>
                <div class="form-group">
                        <div class="checkbox i-checks"><label> <input type="checkbox"><i></i> Agree the terms and policy </label></div>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">Register</button>

                <p class="text-muted text-center"><small>Already have an account?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="${ pageContext.request.contextPath }/login.jsp">Login</a>
            </form>
            <p class="m-t"> <small>Inspinia we app framework base on Bootstrap 3 &copy; 2014</small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="${ pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="${ pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
</body>

</html>



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
	
<style type="text/css">
	#logo {
		font-size: 100px;
	}
</style>
</head>
<body class="gray-bg">
	
    <div class="middle-box text-center loginscreen animated fadeInDown">
            <div>
                <h1 class="logo-name" id="logo">Fooddiy-Order Admin+</h1>
            </div>
            <h3>Welcome to Fooddiy-Order Admin+</h3>
            <p>Perfectly designed and precisely prepared admin theme with over 50 pages with extra new web app views.
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
            </p>
            <p>Login in. To see it in action.</p>
            <form class="m-t" role="form" action="${ pageContext.request.contextPath }/manager/login" method="post">
                <div class="form-group">
                    <input type="email" name="id" class="form-control" placeholder="Username" required="required">
                </div>
                <div class="form-group">
                    <input type="password" name="pw" class="form-control" placeholder="Password" required="required">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">Login</button>

                <a href="#"><small>Forgot password?</small></a>
                <p class="text-muted text-center"><small>Do not have an account?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="${ pageContext.request.contextPath }/manager/signUp">Create an account</a>
            </form>
            <p class="m-t"> <small>Inspinia we app framework base on Bootstrap 3 &copy; 2014</small> </p>
    </div>


    <!-- Mainly scripts -->
    <script src="${ pageContext.request.contextPath }/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>

</body>

</html>
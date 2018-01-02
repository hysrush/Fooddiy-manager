<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <title>| Fooddiy-Order Admin+ |</title>	

    <link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
	<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.1.1.min.js"></script>
<script>
	$(document).ready(function(){
		
		$("#lostpw").click(function(){
			
			var name = document.lostForm.name.value; 
			var id = document.lostForm.id.value;
			
			$.ajax({
				url : "${pageContext.request.contextPath}/sign/lostpw",
				type : "post",
				data : {
					'name' : name,
					'id' : id
				},
				success : function(result){
					
					window.opener.location.href="${pageContext.request.contextPath}/sign/login";
					window.close();
				},
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }
			});
		});
	});

</script>
</head>
<body class="gray-bg">
    <div class="loginColumns animated fadeInDown">
    	<div class="row">
    		<div class="col-md-6">
                <h2 class="font-bold" style="text-align: center">비밀번호 찾기</h2>
            </div>
    	</div>
    </div>
        <div class="row">
            <div class="col-md-6">
                <div class="ibox-content">
                    <form class="m-t" role="form" name="lostForm">
                        <div class="form-group">
                            <input type="text" name="name" class="form-control" placeholder="Username" required="required">
                        </div>
                        <div class="form-group">
                            <input type="email" name="id" class="form-control" placeholder="email" required="required">
                        </div>
                        <input type="button" id="lostpw" class="btn btn-primary block full-width m-b" value="확인"/>
                    </form>
                </div>
            </div>
        </div>

</body>
</html>
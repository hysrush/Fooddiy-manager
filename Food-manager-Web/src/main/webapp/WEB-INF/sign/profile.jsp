<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title> | Profile | </title>

    <link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
     <!-- Mainly scripts -->
    <script src="${ pageContext.request.contextPath }/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/inspinia.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pace/pace.min.js"></script>

    <!-- Password meter -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pwstrength/pwstrength-bootstrap.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pwstrength/zxcvbn.js"></script>
   
    <!-- alert창 -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"> </script>
    <script>window.name="main"</script>
<script>
$(document).ready(function(){
	
	$("#updatePw").click(function(){
    	document.updatepw.target = "main";
   		self.close();
	});
	
	if("${msg}"){
		swal({
			text: "${msg}"
		});
	}
	
	 // 비밀번호가 맞는지 확인
    var options2 = {};
    options2.ui = {
        container: "#pwd-container2",
        showStatus: true,
        showProgressBar: false,
        viewports: {
            verdict: ".pwstrength_viewport_verdict"
        }
    };
    $('.example2').pwstrength(options2);

});	

	var check = "${ loginVO.pw }";
	
	// 현재 비밀번호 맞는지 확인
	function checkpw(){
		
		var input = $("#oriPw").val();
		
		if(input == check){
			$("#oriPw").css("border-color", "#1ab394");
			$("#checkbox").css("visibility", "visible");
			$("#checkbox").css("color", "#1ab394").text("비밀번호가 일치합니다.");
			$("#checkbox").css("visibility", "visible");
			$("#pw").focus();
			
		}else{ // 비밀번호 일치X
			$("#oriPw").css("border-color", "#ed5565");
			$("#checkbox").text("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
			$("#checkbox").css("visibility", "visible");
		}
}

</script>
</head>
<body>

    <div id="wrapper">
		<jsp:include page="/resources/include/sidebar.jsp"/>

        <div id="page-wrapper" class="gray-bg">
			<jsp:include page="/resources/include/topbar.jsp"/>
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Profile</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="${ pageContext.request.contextPath }/FirstPage.jsp">Home</a>
                        </li>
                        <li class="active">
                            <strong>Profile</strong>
                        </li>
                    </ol>
                </div>
            </div>
        <div class="wrapper wrapper-content">
            <div class="row animated fadeInRight">
            	<div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Profile Detail</h5>
                        </div>
                        <div>
                            <div class="ibox-content border-left-right">
                                <img alt="image" style="width: 250px;" class="img-responsive" border=1 align=left vspace=0 hspace=30 src="${ pageContext.request.contextPath }/resources/img/profile_big.jpg">
                                <h4><strong> ${ loginVO.name } 매니저</strong></h4>
                                <p><i class="fa fa-map-marker"></i> ${ loginVO.branch }</p>
                                <p><i class="fa fa-envelope"></i> ${ loginVO.id }</p>
                               <!--  <div class="row m-t-lg">
                                    <div class="col-md-4">
                                        <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
                                        <h5><strong>169</strong> Posts</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <span class="line">5,3,9,6,5,9,7,3,5,2</span>
                                        <h5><strong>28</strong> Following</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <span class="bar">5,3,2,-1,-3,-2,2,3,5,2</span>
                                        <h5><strong>240</strong> Followers</h5>
                                    </div>
                                </div> -->
                               <div class="user-button">
									<div class="col-md-8"></div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <button type="button" data-toggle="modal" data-target="#myModal6" class="btn btn-primary btn-sm btn-block"><i class="fa fa-pencil"></i> 비밀번호 변경</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    	</div>
                	</div>
				</div>
            </div>
        </div>
        <div class="footer">
            <jsp:include page="/resources/include/bottom.jsp"/>
        </div>
	</div>
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
					<h2 class="font-bold" style="text-align: center">비밀번호 변경</h2>
				</div>
				<div class="wrapper wrapper-content animated fadeInRight">
					<div class="row" id="pwd-container2">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<form class="m-t" role="form" name="updatepw" action="${ pageContext.request.contextPath }/sign/updatePw" method="post">
								<div class="form-group">
									<label>현재 비밀번호</label><input type="password" id="oriPw" class="form-control" required="required" oninput="checkpw()">
								</div>
									<span id="checkbox" style="visibility: hidden; color: #ed5565; font-size: 12px;"></span><br/><br/>
								<div class="form-group has-undefined has-error">
									<label>변경할 비밀번호</label><input type="password" name="pw" id="pw" class="form-control example2" required="required">
								</div>
								<div class="form-group">
									<div class="pwstrength_viewport_verdict">
										<span class="password-verdict"></span>
									</div>
								</div>
								<input type="submit" id="updatePw" class="btn btn-primary block full-width m-b" value="확인" />
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
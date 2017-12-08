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
    
    <script src="${ pageContext.request.contextPath }/userResources/js/jquery-3.2.1.min.js"></script>
    <!-- 지도 -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <!-- 하이픈 추가 -->
    <script src="${ pageContext.request.contextPath }/userResources/js/sign/autoHypen.js"></script>
<style>
.form-control{
  border: 1px solid;
}
.addr{
	width: 20%;
  	display: block;
  	padding: 6px 12px;
  	position: relative;
  	float: left;
  	margin-right: 5px;
}
.click{
	width: 40%;
	display: block;
  	padding: 6px 12px;
  	position: relative;
  	float: left;
  	margin-left: 5px;
}
.slash{
	width: 10%;
  	display: block;
  	padding: 6px 12px;
  	position: relative;
  	float: left;
  	margin-right: 10px;
  	margin-left: 5px;
  	border: none;
  	background-color: #f3f3f4 !important;
}
</style>
<script>
function openDaumPostcode() {
    var width = 500; //팝업창이 실행될때 위치지정
    var height = 600; //팝업창이 실행될때 위치지정
    new daum.Postcode({
        width : width, //팝업창이 실행될때 위치지정
        height : height, //팝업창이 실행될때 위치지정
        oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
            // 법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
             
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("post1").value = data.postcode1;
            document.getElementById("post2").value = data.postcode2;
            document.getElementById("addr1").value = fullRoadAddr;
            document.getElementById("addr2").value = data.jibunAddress;
 
            document.getElementById('addr2').focus();
        }
    }).open({
       /*  left : (window.screen.width / 2) - (width / 2), //팝업창이 실행될때 위치지정
        top : (window.screen.height / 2) - (height / 2) //팝업창이 실행될때 위치지정 */
    });
}

	$(document).ready(function(){
		
		var cellPhone = document.getElementById('phone');
		// 하이픈 추가
		cellPhone.onkeyup = function(event){
			event = event || window.event;
			var _val = this.value.trim();
			this.value = autoHypenPhone(_val);
			
		}
	});
</script>

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
            <form class="m-t" role="form" action="${ pageContext.request.contextPath }/sign/signUp" method="post">
                <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="Name" required="required">
                </div>
                <div class="form-group">
                    <input type="email" name="id" class="form-control" placeholder="kkk@naver.com"required="required">
                </div>
                <div class="form-group">
                    <input type="password" name="pw" class="form-control" placeholder="Password" required="required">
                </div>
                <div class="form-group">
                    <input type="tel" name="phone" id="phone" class="form-control" placeholder="전화번호 (-빼고 입력)" maxlength="13"  required="required">
                </div>
                <div class="form-group">
                	<input id="post1" class="form-control addr" readonly="readonly" size="5" name="post1">
                	<input readonly="readonly" class="form-control slash" placeholder="-" />
                	<input id="post2" class="form-control addr" readonly="readonly" size="5" name="post2">
                	<!-- 우편 찾기 클릭 -->
					<input onclick="openDaumPostcode()" class="form-control click" type="button" value="우편번호찾기"><br/><br/><br/>
					<input id="addr1" class="form-control" readonly="readonly" size="40" name="addr1" placeholder="도로명주소"><br/>
					<input id="addr2" class="form-control" size="40" name="addr2" placeholder="지번주소">
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



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <title>| Fooddiy-Order Admin+ |</title>	

    <link href="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    
    <!-- 지도 -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <!-- 하이픈 추가 -->
    <script src="${ pageContext.request.contextPath }/userResources/js/sign/autoHypen.js"></script>
    
     <!-- Mainly scripts -->
    <script src="${ pageContext.request.contextPath }/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/iCheck/icheck.min.js"></script>
    <!-- modal -->
   	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"> </script>
	
	 <!-- Mainly scripts -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/inspinia.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pace/pace.min.js"></script>
	
	<!-- Password meter -->
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pwstrength/pwstrength-bootstrap.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins/pwstrength/zxcvbn.js"></script>
   

<style>
.form-control{
  border: 1px solid #fff;
  background-color : #1ab39426;
}
.addr{
	width: 20%;
  	display: block;
  	padding: 6px 12px;
  	position: relative;
  	float: left;
  	margin-right: 5px;
}
.num{
	width: 55%;
  	display: block;
  	padding: 6px 12px;
  	position: relative;
  	float: left;
  	margin-right : 8px;
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
#logo {
		font-size: 100px;
	}
	
.btn-success {
  background-color: #1ab394;
  border-color: #1ab394;
  color: #FFFFFF;
}
</style>
<script>
	$(document).ready(function(){

		$("#numCheck").attr('disabled', true);
		
		var cellPhone = document.getElementById('phone');
		// 하이픈 추가
		cellPhone.onkeyup = function(event){
			event = event || window.event;
			var _val = this.value.trim();
			this.value = autoHypenPhone(_val);
			
		}
		
		var code = "";
		
		// 인증 코드 받을 때
		$("#managerCheck").click(function(){
			
			var id =document.managerForm.id.value;
			
			if(id == ""){
				alert("아이디를 입력해 주세요.");
				document.managerForm.id.focus();
				return;
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/sign/signForm",
				type : 'post',
				data : {
					"id" : id
				},
				success : function(result){
					var r = JSON.parse(result);
					code = r[0];
					alert(r[1]);
					$("#numCheck").attr('disabled', false);
				}
			});
		});
		
		$("#numCheck").click(function(){
			
			var num = $("#num").val();
			
			if(num == code){
				alert("인증 완료");
				$("#numCheck").attr('disabled', true);
				$("#pw").focus();
				
			}else{
				$("#num").focus();
				alert("인증 코드를 올바르게 입력해 주세요.");
			}
		});
		
		 $('.i-checks').iCheck({
             checkboxClass: 'icheckbox_square-green',
             radioClass: 'iradio_square-green',
         });
		 
		// 비밀번호 유효성 확인
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
		    
		    
			// 시 선택 => 구/군 정보 불러오기
			$("#sido").change(function(){
				
				// 1. Parameter setting
				var sido = $("#sido").val();
				console.log( "선택된 값1 : " + $("#sido").val() );
	       		
				// 2. ajax call
				$.ajax({
		              url : "${pageContext.request.contextPath}/sign/county",
		              type: "post",
		              data : { "sido" : sido },
		              success : function(responseData){
							var data = JSON.parse(responseData);
							
							$('#gugun').empty();
							$('#gugun').append('<option value="" selected="selected">구,군 을 선택해주세요 </option>');
							
							for(var i = 0 ; i < data.length ; i++){
								$('#gugun').append('<option value="'+ data[i].LOC_NO + '">' + data[i].LOC_NAME + '</option>');	
							} 	
						}
		          });
			});
			
			// 군/구 선택 후 매장 선택 ajax
			$("#gugun").change(function(){
				
				var gugun = $("#gugun").val();
				console.log( " 구군 값 : " + $("#gugun").val());
				
				$.ajax({
					url : "${pageContext.request.contextPath}/sign/city",
					type : "post",
					data : {"gugun" : gugun},
					success : function(responseData){
						
						var data = JSON.parse(responseData);
						
						console.log(data);
						$('#storeList').empty();

						$('#storeList').css("max-height","250px");
						$('#storeList').css("overflow","auto");
						$('#storeList').css("max-width","1000px");
							
							// 검색완료 시, 구군 이름 표시
							$("#searchInfo").text('"' + data.locationName + '"(으)로 검색');
							
						 	for(var i = 0 ; i < data.storeList.length; i++){
								var contents = '';
								contents += '<tr>';
								contents +=		'<td style = "width: 30%" nowrap>';
								contents +=			'<i class="fa fa-map-marker" style="color:green;"></i>&nbsp;&nbsp;';
								contents +=			'<strong class="storeName" value="'+ data.storeList[i].storeName +'" >'+ data.storeList[i].storeName + '</strong>';
								contents +=			'<div class="storePhone post-meta">' + data.storeList[i].storePhone +'</div>';
								contents +=		'</td>';
								contents +=		'<td class="storeAddr" style = "width: 65%">'+ data.storeList[i].storeAddr +'</td>';
								contents +=		'<td style = "width: 5%" align ="right"><input class="btn btn-success btn-sm" type="button" name="storeChoice"';
								contents += 				'onclick="brachCheck(\''+data.storeList[i].storeAddr+'\')" value="선택" required="required" /></td>';
								contents += '</tr>';
							
								$('#storeList').append(contents);
						 	}
					}
				});
	
			});
		    
		    
		    
		
	});
	
	// id중복
	function checkId(){
		
		var input = $("#id").val();
		
		$.ajax({
			type : "get",
	        url : "${ pageContext.request.contextPath }/sign/signForm",
	     	data : {
	        id : input
	        },
	        success : function(data) {
	        	if(data == 'O'){
	        		$("#id").css("border-color", "#1ab394");
	    			$("#checkbox").css("visibility", "hidden");
	    			
	        	}else{
	        		
	        		$("#id").css("border-color", "#ed5565");
	    			$("#checkbox").css("color", "#ed5565").text("아이디가 중복됩니다.");
	    			$("#checkbox").css("visibility", "visible");
	        	}
			}
		});
	}
	
	 // 매장명으로 주소 가져오기 
	function brachCheck(storeAddr){
			//alert('storeAddr = ' + storeAddr);
			
			var btn = this;
			var store = storeAddr;
			
			$.ajax({
				url : "${pageContext.request.contextPath}/sign/storeCheck",
				type : "post",
				data : {"store" : store},
				success : function(responseData){
					var data = JSON.parse(responseData);
					console.log(data);
					if(data.storeAddr == null){
						alert("이미 등록된 지점입니다. 본인의 지점을 선택해 주세요.");
						$("#signUp").attr('disabled', true);
						
						return;
					}
					
						
						
						
						var addr = data.storeAddr;
						var name = data.storeName;
						var phone = data.storePhone;
						
						$("#addr").val(addr);
						$("#branch").val(name);
						$("#tel").val(phone);
						$("#signUp").attr('disabled', false);
					
					
				}
			});

		}

	
	/* 
	// 지도
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
	        left : (window.screen.width / 2) - (width / 2), //팝업창이 실행될때 위치지정
	        top : (window.screen.height / 2) - (height / 2) //팝업창이 실행될때 위치지정
	    });
	}*/
	 
	
	
</script>
</head>
<body class="gray-bg">
    <div class="middle-box loginscreen animated fadeInDown">
        <div id="pwd-container2">
            <div class="text-center">
            	 <h1 class="logo-name" id="logo">Fooddiy-Order Admin+</h1>
            </div>
            <div class="text-center">
            	<h3>관리자 가입</h3>
            	<p>Create account to see it in action.</p>
            </div>
            <form class="m-t" role="form" name="managerForm" action="${ pageContext.request.contextPath }/sign/signUp" method="post">
                <div class="form-group">
                <label>이름</label>
                    <input type="text" name="name" class="form-control" placeholder="Name" required="required">
                </div>
                <!-- 메일 인증 --><label>ID(이메일 형식)</label>
                <div class="form-group">
                     <input type="email" name="id" id="id" class="form-control num" placeholder="kkk@naver.com" required="required" oninput="checkId()">
                    <button id="managerCheck" class="form-control click" type="button">인증</button>
                </div><br/>
                <div style="text-align: left;">
					<strong id="checkbox" style="visibility: hidden; color: #ed5565; font-size: 12px;"></strong><br/>
               	</div>
                <div class="form-group">
                	<input id="num" type="text"class="form-control num" placeholder="인증 코드" required="required">
                	<input id="numCheck" class="form-control click" type="button" value="확인">
                </div><br/><br/>
                <div class="form-group has-undefined has-error">
                	<label>비밀번호</label>
                    <input type="password" name="pw" id="pw" class="form-control example2" placeholder="Password" required="required">
                </div>
				<div class="form-group">
					<div class="pwstrength_viewport_verdict"></div>
				</div>
                <div class="form-group">
                	<label>전화번호(-빼고 입력)</label>
                    <input type="tel" name="phone" id="phone" class="form-control" placeholder="전화번호 (-빼고 입력)" maxlength="13"  required="required">
                </div>
                <label>지점 주소(시,도->군,구->지점 선택)</label>
                 <div class="form-group">
					<select class="form-control" id ="sido" required="required">
						<option value="" selected="selected" disabled= "disabled">시,도 를 선택해주세요 </option>
							<c:forEach var="city" items="${ city }">
								<option value="${city.cityNo}">${ city.cityName }</option>																		    
							</c:forEach>
					</select>
					<br/>
					<select class="form-control" id= "gugun" required="required">
						<option value="" selected="selected" >구,군 을 선택해주세요 </option>
					</select>
                </div>
                <div class="form-group">
               		<h4 class="mt-xlg mb-none text-uppercase">
               			<strong id="searchInfo" ></strong>
               		</h4>
					<br>
					<div>
						<table>
							<tbody id ="storeList">
							<!-- 매장 리스트 -->
							</tbody>
						</table>
					</div>
				</div>
				<!-- 브런치 정보 -->
				<div class="form-group">
					<label>지점</label> <input class="form-control" type="text" id="branch" name="branch" readonly="readonly"/>
					<input type="hidden" id="addr" name="addr"/>
					<input type="hidden" id="tel" name="tel"/>
				</div>
              <!--   <div class="form-group">
                	<input id="post1" class="form-control addr" readonly="readonly" size="5" name="post1">
                	<input readonly="readonly" class="form-control slash" placeholder="-" />
                	<input id="post2" class="form-control addr" readonly="readonly" size="5" name="post2">
                	우편 찾기 클릭
					<input onclick="openDaumPostcode()" class="form-control click" type="button" value="우편번호찾기"><br/><br/><br/>
					<input id="addr1" class="form-control" readonly="readonly" size="40" name="addr1" placeholder="도로명주소"><br/>
					<input id="addr2" class="form-control" size="40" name="addr2" placeholder="지번주소">
                </div> -->
                <!-- <div class="form-group">
                        <div class="checkbox i-checks"><label> <input type="checkbox"><i></i> Agree the terms and policy </label></div>
                </div> -->
                <button type="submit" id="signUp" class="btn btn-primary block full-width m-b">등록</button>

                <p class="text-muted text-center"><small>이미 가입하셨습니까?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="${ pageContext.request.contextPath }/sign/login">Login</a>
            </form>
            <p class="m-t"> <small>Fooddiy-Order Admin+ &copy; 2017</small> </p>
        </div>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> | 자주묻는질문 등록폼 | </title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"> 

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</head>
<body>
	<div align="center" >
		<h2>자주묻는질문 등록폼</h2>
		<form:form commandName="qnaVO" method="POST" >
			<div style="max-width: 800px;">
				<div class="form-group" align="left">
					<label for="type">T > 타입</label>
					<form:select path="type" class="form-control" id="type">
						<form:option value="F">푸디오더</form:option>
						<form:option value="P">포인트</form:option>
						<form:option value="O">단체주문</form:option>
						<form:option value="M">회원정보</form:option>
						<form:option value="X">기타</form:option>
					</form:select>
					<form:errors path="type" class="form-control"></form:errors>
				</div>
				<div class="form-group" align="left">
					<label for="question">Q > 질문</label>
					<form:input path="question" type="text" class="form-control" id="question" placeholder="질문"/>
					<form:errors path="question" class="form-control"></form:errors>
				</div>
				<div class="form-group" align="left">
					<label for="answer">A > 대답</label>
					<form:textarea path="answer" class="form-control" rows="5" id="answer" placeholder="대답"/>
					<form:errors path="answer" class="form-control"></form:errors>
				</div>
				<button type="submit" class="btn btn-default">등록</button>
			</div>
		</form:form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	 <div align="center" >
		<h2>글등록 페이지</h2>
		<form:form commandName="eventVO" method="POST" enctype="multipart/form-data">
			<div style="max-width: 800px;">
				<%-- <div class="form-group" align="left">
				   매장명은 db에서 불러와서 선택할 수 있도록   
				 	<label for="type">매장명</label>
					<form:select path="type" class="form-control" id="type">
						<form:option value="F">푸디오더</form:option>
						<form:option value="P">포인트</form:option>
						<form:option value="O">단체주문</form:option>
						<form:option value="M">회원정보</form:option>
						<form:option value="X">기타</form:option>
					</form:select> 
			
					
					<form:errors path="type" class="form-control"></form:errors>
				</div> --%>
				<div class="form-group" align="left">
					<label for="storeName">매장이름</label>
					<form:input path="storeName" type="text" class="form-control" id="storeName" placeholder="매장이름"/>
					<form:errors path="storeName" class="form-control"></form:errors>
				</div>
								
				
				<div class="form-group" align="left">
					<label for="title">이벤트 제목</label>
					<form:input path="title" type="text" class="form-control" id="title" placeholder="제목"/>
					<form:errors path="title" class="form-control"></form:errors>
				</div>
				 <div class="form-group" align="left">
					<label for="imgFileName">이벤트 첨부 파일</label>
					<form:input path="imgFileName" type="file" class="form-control" id="imgFileName" placeholder="첨부파일"/>
					<form:errors path="imgFileName" class="form-control"></form:errors>
				</div>
				  
				
				<div class="form-group" align="left">
					<label for="content">이벤트 내용</label>
					<form:textarea path="content" class="form-control" rows="5" id="content" placeholder="내용"/>
					<form:errors path="content" class="form-control"></form:errors>
				</div>
				<div class="form-group" align="left">
					<label for="startDate">이벤트 시작일</label>
					<form:input path="startDate" type="date" class="form-control" id="startDate" placeholder="시작일"/>
					<form:errors path="startDate" class="form-control"></form:errors>
				</div>
				<div class="form-group" align="left">
					<label for="endDate">이벤트 종료일</label>
					<form:input path="endDate" type="date" class="form-control" id="endDate" placeholder="종료일"/>
					<form:errors path="endDate" class="form-control"></form:errors>
				</div>
				
				<button type="submit" class="btn btn-default">등록</button>
			</div>
		</form:form>
	</div>








</body>
</html>
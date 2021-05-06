<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>

<style type="text/css">
	.r1 {
		color: red;
	}
	
	.r2 {
		color: blue;
	}

#div_main {
	position:absolute;
	 left:50%;
	width: 30%;
	min-height:100px;
	margin-left: -15%;
	text-align: left;

}
	

#div_footer {
	width: 100%;
	height:10%;
	bottom:0;

}

#div_page{
		width:100%;
		min-height:700px;

}

	
</style>
</head>

<body>
<c:import url="../template/body.jsp"></c:import>
	<div id="div_page" class="container" style="text-align: center;">
		

		<h2 class="mt-4">Member Join Page</h2>
			<div id="div_main" class="container mt-2">
		<form id="frm" action="./memberJoin" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="id">아이디</label> 
				<input type="text" class="form-control"	id="id" name="id" style="width:70%; height:40px;">
				<h4 id="idResult"></h4>
				<h4 id="idCheckResult"></h4>
				<!-- ID 는 6글자 이상 -->
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label> 
				<input type="password"	class="form-control" id="pw" name="pw">
				<h4 id="pwResult"></h4>
				<!-- PW는 8글자 이상 -->
			</div>
			<div class="form-group">
				<label for="pw2">비밀번호 확인</label> <input type="password"
					class="form-control" id="pw2" name="pw2">
					<h4 id="pw2Result"></h4>
				<!-- PW 두개는 일치 -->	
			</div>			
			<div class="form-group">
				<label for="name">이름</label> 
				<input type="text" class="form-control etc"	id="name" name="name">
				<!-- 비어 있으면 X -->
			</div>	
			
			<div class="form-group">
				<label for="email">Email</label> 
				<input type="text" class="form-control etc"	id="email" name="email">
				<!-- 비어 있으면 X -->
			</div>
			<div class="form-group">
				<label for="phonenum">전화번호</label> 
				<input type="text" class="form-control etc"	id="phonenum" name="phonenum">
				<!-- 비어 있으면 X -->
			</div>		
			
		
			
			<input type="submit" id="btn" value="JOIN" class="btn btn-primary">
			
		</form>
		</div>
	</div>
<script type="text/javascript" src="../resources/js/member/memberJoin.js"></script>	
<div id="div_footer">
<c:import url="../template/footer.jsp"></c:import>
</div>
</body>




</html>

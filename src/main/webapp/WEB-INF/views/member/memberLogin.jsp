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
#div_footer {
	width: 100%;
	height: 10%;
	bottom: 0px;	
}

#div_main {
	width: 100%;
	height: 90%;
	text-align: center;
	
}

#div_page{
		width:100%;
		height:700px;
}
</style>
</head>

<body>
<c:import url="../template/body.jsp"></c:import>
	
<div id="div_page">
	<div id="div_main">
		<h3>&nbsp;</h3>
		<h1>&nbsp;</h1>
		<h1>&nbsp;</h1>

		<h1>Login Page</h1>
		<h3>&nbsp;</h3>
		<h1>&nbsp;</h1>
		<form action="./memberLogin" method="post">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="아이디를 입력하시오."
					id="id" name="id" style="width: 300px; height:50px; margin: 0 auto; ">
			</div>
			<div class="form-group">
				<input type="password" class="form-control"
					placeholder="비밀번호를 입력하시오." id="pw" name="pw"
					style="width: 300px; height:50px; margin: 0 auto">
			</div>
			<div class="form-group form-check">
				
			</div>
			<button type="submit" class="btn btn-primary" style="width: 300px; height:50px" >Login</button>
		</form>
		<a class="btn btn-link" href="./memberFindID">아이디찾기</a> <a
			class="btn btn-link" href="./memberFindPW">비밀번호찾기</a>
	</div>
	</div>
	<div id=div_footer>
	<c:import url="../template/footer.jsp"></c:import>
</div>
</body>

</html>
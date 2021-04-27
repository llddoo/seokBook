<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>

</head>

<body>
<c:import url="../template/body.jsp"></c:import>
	<h3>&nbsp;</h3>
	<h1>&nbsp;</h1>
	<h1>Login Page</h1>
	<form action="./memberLogin" method="post">
		<div class="form-group">
			<label for="id">ID 입력:</label>
			<input type="text" class="form-control" placeholder="아이디를 입력하시오." id="id" name="id">
		</div>
		<div class="form-group">
			<label for="pw">Password:</label> <input type="password"
				class="form-control" placeholder="비밀번호를 입력하시오." id="pw" name="pw">
		</div>
		<div class="form-group form-check">
			<label class="form-check-label"> <input
				class="form-check-input" type="checkbox"> Remember me
			</label>
		</div>
		<button type="submit" class="btn btn-primary">Login</button>
	</form>
	<a class="btn btn-link" href="./memberFindID">아이디찾기</a>
	<a class="btn btn-link" href="./memberFindPW">비밀번호찾기</a>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
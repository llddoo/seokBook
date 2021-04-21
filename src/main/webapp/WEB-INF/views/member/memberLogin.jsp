<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>
<c:import url="../template/body.jsp"></c:import>
</head>

<body>
	<h3>&nbsp</h3>
	<h1>&nbsp</h1>
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
</body>
</html>
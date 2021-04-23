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
	<h3>&nbsp;</h3>
	<h1>&nbsp;</h1>
	<h1>아이디 찾기</h1>

<label for="text">email을 입력하시오</label>
<input type="text" class="form-control" id="email" name ="email">
<button class="btn btn-primary" id="idBtn">아이디 찾기</button>
	<script type="text/javascript" src="../resources/js/member/memberFind.js">
	</script>
</body>
</html>


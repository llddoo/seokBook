<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="template/header.jsp"></c:import>
<style type="text/css">
	.container{
		margin-top: 8%;
		margin-left: 30%;
	}
</style>
</head>
<body>
<c:import url="template/body.jsp"></c:import>
	<div class="container">
		<h2>원하시는 페이지를 찾을 수가 없습니다.</h2><br><br><br><br>
		<p>서비스 이용에 불편을 드려 죄송합니다.<br>찾으시려는 페이지는 주소를 잘못 입력하였거나 <br>
		페이지 주소의 변경 또는 삭제등의 이유로 페이지를 찾을 수 없습니다.</p>
		<p>입력하신 페이지의 주소와 경로가 정확한지 한번 더 확인해 주시기 바랍니다.</p> 
	</div>
<c:import url="template/footer.jsp"></c:import>
</body>
</html>
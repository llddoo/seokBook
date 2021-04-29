<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/header.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/body.jsp"/>
	<div class="container">
		<p>${user.name}님 결제가 성공적으로 완료되었습니다.<br>저희 인터넷 서점을 이용해주셔서 감사합니다.</p><br>
		<a href="../">메인화면으로 돌아가기</a>
	</div>
<c:import url="../template/footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>관리자 전용 페이지</h1>
	
	<h3>지점명 : ${dto.branchName}</h3>
	<h3>지점연락처 : ${dto.branchCall}</h3>
	
	<a href="./branch/branchInsert?branchNum=${dto.branchNum}">지점 추가</a>
	
	<c:catch >
		<c:if test=${member.id eq admin}>
			<a href="./branchDelete?branchNum=${dto.bracnhNum}">Delete</a>
			<a href="./branchUpdate?branchNum=${dto.branchNum}">Update</a>
		</c:if>
	</c:catch>
</body>
</html>
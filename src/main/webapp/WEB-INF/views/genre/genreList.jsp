<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
</head>
<body>
<c:import url="../template/body.jsp"></c:import>

<h1>Genre List Page</h1>

<c:forEach items="${list}" var="dto">
	<ul class="ul">
		<a href="./genreSelect?gNumber=${dto.gNumber}"><c:out value="${dto.gName}"/></a>
	</ul>
	<style>
	ul{
    list-style: none;
    padding-left: 0px;
	}
	</style>

</c:forEach>








<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
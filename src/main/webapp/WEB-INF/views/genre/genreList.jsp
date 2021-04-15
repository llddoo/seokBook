<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/bookNGenre/genre.css">
</head>
<body>
<c:import url="../template/body.jsp"></c:import>

<br><br><br>

<ul class="ul">
	<c:forEach items="${list}" var="dto">
		<li>
		<a href="./genreSelect?gNumber=${dto.gnumber}"><c:out value="${dto.gname}"/></a>
		</li>
	</c:forEach>
</ul>



	




<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
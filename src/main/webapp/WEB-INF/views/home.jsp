<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello dddddworld!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<a href="${pageContext.request.contextPath}/member/getSelect">아이디 조회</a> 

<a href="${pageContext.request.contextPath}/member/memberLogin">로그인</a> 
<a href="${pageContext.request.contextPath}/member/memberJoinCheck">아이디생성</a>


</body>
</html>

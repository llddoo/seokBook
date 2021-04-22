<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
window.history.forward();
function noBack(){
	window.history.forward();
}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<h1>만료된 페이지 입니다.</h1>
<form action="./boardList" method="get" id="justgo">
	<input type="hidden" readonly="readonly" name="boardsp" value="${boardsp}">
</form>
<script type="text/javascript">
const justgo = document.getElementById("justgo");
window.onload=function(){
    justgo.submit();
}
</script>
</body>
</html>
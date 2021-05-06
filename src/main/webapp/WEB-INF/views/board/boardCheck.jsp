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
<script type="text/javascript">
window.history.forward();
function noBack(){
	window.history.forward();
	const justgo = document.getElementById("justgo");
	if($("#boardsp").val()=='qna'){
		$("#justgo").append($("#fortransfer").html());
	}
	justgo.submit();
}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<c:import url="../template/body.jsp"></c:import>
<h1>만료된 페이지 입니다.</h1>
<div id="fortransfer">
	<input type="hidden" readonly="readonly" name="kind" value="id">
	<input type="hidden" readonly="readonly" name="search" value="${id}">
</div>
<form action="./boardList" method="get" id="justgo">
	<input type="hidden" readonly="readonly" name="boardsp" id="boardsp" value="${boardsp}">
</form>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
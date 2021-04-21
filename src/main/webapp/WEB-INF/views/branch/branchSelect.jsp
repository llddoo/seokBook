<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>
</head>
<body>

<div class="container">
	<h1>관리자 전용 페이지</h1><br>
	
	<h3>지점명 : ${dto.branchName}</h3>
	<h3>지점연락처 : ${dto.branchCall}</h3>
<a href="./${branch}Update?branchNum=${dto.branchNum}" class="btn btn-danger">수정</a>
<a href="#" id="del" class="btn btn-info">삭제</a>

<form action="./${branch}Delete" id="frm" method="get">
	<input type="hidden" name="branchNum" value="${dto.branchNum}">
</form>

</div>

<script type="text/javascript">
	const del = document.getElementById("del");
	const frm = document.getElementById("frm");
	
	del.addEventListener("click", function(){
		let result = confirm("삭제하시겠습니까?");
		
		if(result){
			//frm.method="post";
			frm.setAttribute("method", "post");
			frm.submit();
			//location.href="./${branch}Delete?branchNum=${dto.branchNum}"; //get방식임
		}
	});
	
</script>
</body>
</html>
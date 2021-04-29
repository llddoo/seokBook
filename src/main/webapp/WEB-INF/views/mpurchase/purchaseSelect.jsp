<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<c:import url="../template/header.jsp"></c:import>
</head>
<body>
<c:import url="../template/body.jsp"></c:import>
<div class="container">
	<h2 style="padding: 0px 10px 1px; 
	margin: 10px 0px 5px; 
	border-left-width: 5px; 
	border-left-style: solid; 
	border-left-color: rgb(255, 165, 0); 
	font-size: 14pt; color: rgb(51, 51, 51); 
	font-family: '맑은 고딕', 'Noto Sans Korean'; 
	border-bottom-color: rgb(211, 211, 211); 
	border-bottom-width: 1px; 
	border-bottom-style: solid; 
	letter-spacing: -0.07em; 
	line-height: 35px; 
	background-color: rgb(250, 250, 250);">주문 내역</h2><br>
	
	<h3>주문번호 : ${dto.ordernum}</h3>
	<h3>ISBN : ${dto.isbn}</h3>
	<h3>가격 : ${dto.price}</h3>
	<h3>주문수량 : ${dto.purcount}</h3>
	<h3>ID : ${dto.id}</h3>
<a href="./purchaseUpdate?purnum=${dto.purnum}" class="btn btn-danger">수정</a>
<a href="#" id="del" class="btn btn-info">삭제</a>

<form action="./purchaseDelete" id="frm" method="get">
	<input type="hidden" name="purnum" value="${dto.purnum}">
</form>

</div>

<script type="text/javascript">
	const del = document.getElementById("del");
	const frm = document.getElementById("frm");
	
	del.addEventListener("click", function(){
		let result = confirm("삭제하시겠습니까?");
		
		if(result){
			frm.setAttribute("method", "post");
			frm.submit();
			
		}
	});
	
</script>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
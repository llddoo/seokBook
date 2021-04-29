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
<div class="container">
	<h2 style="padding: 0px 10px 1px; 
	margin: 10px 0px 5px; 
	border-left-width: 5px; 
	border-left-style: solid; 
	border-left-color: rgb(0, 206, 209); 
	font-size: 14pt; color: rgb(51, 51, 51); 
	font-family: '맑은 고딕', 'Noto Sans Korean'; 
	border-bottom-color: rgb(211, 211, 211); 
	border-bottom-width: 1px; 
	border-bottom-style: solid; 
	letter-spacing: -0.07em; 
	line-height: 35px; 
	background-color: rgb(250, 250, 250);">구매 내역 입력</h2>
	<form id="frm" action="./purchaseInsert" method="post">
	
			<div class="form-group">
				<label for="ordernum">주문번호</label> <input type="text"
					class="form-control myCheck" id="ordernum" name="ordernum">
			</div>
			
			<div class="form-group">
				<label for="isbn">ISBN</label> <input type="text"
					class="form-control myCheck" id="isbn" name="isbn">
			</div>
			
			<div class="form-group">
				<label for="price">가격</label> <input type="text"
					class="form-control myCheck" id="price" name="price">
			</div>
			
			<div class="form-group">
				<label for="purcount">구매수량</label> <input type="text"
					class="form-control myCheck" id="purcount" name="purcount">
			</div>
			
			<div class="form-group">
				<label for="id">ID</label> <input type="text"
					class="form-control myCheck" id="id" name="id">
			</div>
			
			<input type="button" id="btn" value="입력" class="btn-btn-primary">
	</form>

</div>

<script type="text/javascript" src="../resources/js/branch/branchInsert.js"></script>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
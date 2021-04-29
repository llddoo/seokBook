<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 내역 수정</title>
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
	background-color: rgb(250, 250, 250);">구매 내역 수정</h2>
	
	<form id="frm" action="./purchaseUpdate" method="post">
	<input type="hidden" name="purnum" value="${param.purnum}">
	
	<div class="form-group">
      <label for="isbn">ISBN</label>
      <input type="text" class="form-control" id="isbn" name="isbn" value="${dto.isbn}">
    </div>
    
    <div class="form-group">
      <label for="id">ID</label>
      <input type="text" class="form-control" id="id" name="id" value="${dto.id}">
    </div>
    
    <div class="form-group">
      <label for="price">가격</label>
      <input type="text" class="form-control" id="price" name="price" value="${dto.price}">
    </div>
    
    <div class="form-group">
      <label for="purcount">구매수량</label>
      <input type="text" class="form-control" id="purcount" name="purcount" value="${dto.purcount}">
    </div>
    
       <div class="form-group">
      <label for="ordernum">주문번호</label>
      <input type="text" class="form-control" id="ordernum" name="ordernum" value="${dto.ordernum}">
    </div>
    
    <input type="submit" id="btn" value="수정" class="btn btn-primary">
	
	</form>
		
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
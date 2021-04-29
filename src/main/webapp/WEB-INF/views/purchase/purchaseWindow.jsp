<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- jquery modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<style type="text/css">
	.modal{
		height:80%
	}
	#floatforpurchasing{
		width: 15%;
		padding-top: 5%;
		position: fixed;left: 75%;
		display: inline-block;
	}
	.containmain{
		display:inline-block;
		padding-left: 18%;
		width: 70%
	}
	#pointandprice{
		border-bottom-style:solid;
		border-bottom-width:2px; 
		border-bottom-color:back;
	}
</style>
</head>
<body>
<c:import url="../template/body.jsp"></c:import>
<div class="containmain">
	<input type="hidden" readonly="readonly" id="getUserInfo" class="trans-chk" value="${user.id}">
	<input type="hidden" readonly="readonly" id="purchasename" value="${purchasename}">
	<input type="hidden" readonly="readonly" id="allpricesum" value="${pricesum}">
	<div id="userInfo"></div>
	<label for="typingpoint">포인트 사용하기</label><br>
	<input type="number" min="0" max="${user.point}" value="0" step="100" id="typingpoint">
	<button id="applyPoint" onclick="applyPoint()">포인트 적용하기</button><br>
	<p>현재 보유중인 표인트 : ${user.point}</p>
	
	<div id="useraddresslist"></div>
	
  	<div id="useritems">
  		<table class="table">
		    <thead>
		      <tr>
		        <th>상품정보</th>
		        <th>판매가</th>
		      </tr>
		    </thead>
		    <c:forEach items="${booklist}" var="book">
		    <tbody>
		    	<tr>
		    		<td>
		    			<img alt="${book.bookListDTO.bookImg}" 
		    				src="${pageContext.request.contextPath}/resources/uploaded/bookList/${book.bookListDTO.bookImg}">
		    				<input type="hidden" readonly="readonly" class="isbnlist" value="${book.isbn}">
		    				<input type="hidden" readonly="readonly" class="countlist" value="${book.bookcount}">
		    			${book.bookListDTO.bookName}
		    		</td>
		    		<td>총 ${book.bookListDTO.price * book.bookcount*9/10}원 | 수량 ${book.bookcount}개
		    			<br><del>권당 ${book.bookListDTO.price}원</del>
		    			<br>권당 ${book.bookListDTO.price*9/10}원
		    		</td>
		    	</tr>
		    </tbody>
		    </c:forEach>
		 </table>
  	</div>
</div>
 <div id="floatforpurchasing"></div>
<c:import url="../template/footer.jsp"></c:import>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/purchase/purchaseWindow.js"></script>
</body>
</html>
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
<style type="text/css">
	.modal{
		height:80%
	}
</style>
</head>
<body>
<c:import url="../template/body.jsp"></c:import>
<p>주문자 정보 띄우기</p>
<p>배송 위치 불러와서 어디로 배달 시킬건지 먼저 리스트를 보여 주어야 한다.</p>
<p>선택 형식이라면 어느 리스트를 사용할 것인지 선택하도록 해당 페이지로 넘어가는 버튼을 만든다.</p>
<p>주문한 내역들을 보여주는 테이블이 필요하다.(상품정보, 판매가(개수))</p>
<p>할인 내역과 적립 내역을 보여준다.</p>
<p>어떤 방식으로 결제를 할 것인지 선택하고 결제창으로 이동시킨다.</p>
<div class="container">
	<input type="hidden" readonly="readonly" id="getUserInfo" value="${user.id}">
	<input type="hidden" readonly="readonly" id="forCartList" value="${user.isbn}">
	<input type="hidden" readonly="readonly" id="purchasename" value="${purchasename}">
	<input type="hidden" readonly="readonly" id="allpricesum" value="${pricesum}">
	<div id="userInfo"></div>
	
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
		    			${book.bookListDTO.bookName}
		    		</td>
		    		<td>총 ${book.bookListDTO.price * book.bookcount}원 | 수량 ${book.bookcount}개
		    			<br>권당 ${book.bookListDTO.price}원
		    		</td>
		    	</tr>
		    </tbody>
		    </c:forEach>
		 </table>
  	</div>
  	<p>포인트를 사용할 칸과 결제를 위한 칸이 나와야 한다.</p>
  	<button id="payment">결제하기</button>
</div>
<c:import url="../template/footer.jsp"></c:import>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/purchase/purchaseWindow.js"></script>
</body>
</html>
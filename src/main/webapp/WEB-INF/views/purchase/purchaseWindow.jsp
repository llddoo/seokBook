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
	#floatforpurchasing{
		width: 18%;
		position: fixed;left: 75%;
		display: inline-block;
		margin-top: 5%;
		padding:2% 0;
		border: 2px black solid;
		text-align: center;
	}
</style>
</head>
<body>
<c:import url="../template/body.jsp"></c:import>


<div class="containmain" style="display:inline-block; padding-left: 18%; width: 70%;">
	<h1 style="text-align: center; margin-top:3%;">
		<span style="background-color: #42a5f5; display:inline-block;border-radius: 10px">&emsp;&emsp;주문/결제&emsp;&emsp;</span>
	</h1>
	<!-- 사이드 바에 나타내고, 결제를 하기 위한 임시저장용 input 태그 -->
	<input type="hidden" readonly="readonly" id="getUserInfo" class="trans-chk" value="${user.id}">
	<input type="hidden" readonly="readonly" id="purchasename" value="${purchasename}">
	<input type="hidden" readonly="readonly" id="allpricesum" value="${pricesum}">
	<input type="hidden" readonly="readonly" id="willgetpoint" value="${willgetpoint}">
	
	<!-- 유저 정보 불러오는 창 -->
	<div id="userInfo" style="margin:5% 0 5% 10%;"></div>
	
	<!-- 포인트 적용과 주소 적용을 위한 칸 -->
	<div style="border:2px black solid; vertical-align: middle;">
		<div style="margin-left:10%; display:inline-block;margin-top:1%">
			<span>포인트 사용</span><br>
			<input type="number" min="0" max="${user.point}" value="0" step="100" id="typingpoint">
			<button id="applyPoint" onclick="applyPoint()">포인트 적용하기</button><br>
			<p>현재 보유중인 표인트 : ${user.point}</p>
		</div>
	
		<div id="useraddresslist" style="display:inline-block; margin-left:10%;"></div>
	</div><br><br>
	
	<!-- 선택한 책 목록들을 볼수 있게 해줌 -->
  	<div id="useritems">
  		<table class="table">
		    <thead>
		      <tr>
		        <th style="text-align: center;border-right:1px solid gray;" colspan="2">상품정보</th>
		        <th style="text-align: center;">판매가</th>
		      </tr>
		    </thead>
		    <c:forEach items="${booklist}" var="book">
		    <tbody>
		    	<tr>
		    		<td>
		    			<img alt="${book.bookListDTO.bookImg}" 
		    				src="${pageContext.request.contextPath}/resources/uploaded/bookList/${book.bookListDTO.bookImg}">
		    			<input type="hidden" readonly="readonly" class="isbnlist" value="${book.bookListDTO.isbn}">
		    			<input type="hidden" readonly="readonly" class="countlist" value="${book.bookcount}">
		    			<input type="hidden" readonly="readonly" class="pricelist" value="${book.bookListDTO.price}">
		    		</td>
		    		<td style="vertical-align: middle;border-right:1px solid gray;">${book.bookListDTO.bookName}</td>
		    		<td style="text-align: center; vertical-align: middle;">
		    			총 ${book.bookListDTO.price * book.bookcount*9/10}원 | 수량 ${book.bookcount}개
		    			<br><del>권당 ${book.bookListDTO.price}원</del>
		    			<br>권당 ${book.bookListDTO.price*9/10}원
		    			<br>획득 가능 포인트 : ${book.bookListDTO.bPoint} 포인트
		    		</td>
		    	</tr>
		    </tbody>
		    </c:forEach>
		 </table>
  	</div>
</div>

<!-- 결제 금액과 얻을 포인트, 사용할포인트, 약관등을 나타내주는 side bar -->
 <div id="floatforpurchasing">
 
	 <div id="paymentclause">
		<button id="demobutton" data-toggle="collapse" data-target="#demo" style="zoom:.7;display:inline-block;">
			<i class="fas fa-chevron-down"></i>
		</button>
		<label for="checkboxChecking">결제 조항에 동의합니다.</label>
		<input type="checkbox" id="checkboxChecking" style="margin-top:2%;zoom:1.3;margin-left:0;">
	</div>
	<div id="demo" class="collapse">
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">주문시 입력하신 배송정보는 배송을 위한 목적으로 사용됩니다.</li>
		  <li class="list-group-item">주문할 상품의 상품명, 가격, 배송정보 등을 최종 확인하였으며, 구매에 동의하십니까?<br>
			(전자상거래법 제 8조 2항)</li>
		</ul>
	</div><br>
	<div id="purchaseaccept"><button type="button" id="payment">결제하기</button></div>
</div>

 
 <!-- 모달용 div -->
 <div class="modal container" id="forCheckingModal" style="height:85% !important; overflow-y: scroll;">
	<div class="tab-content">
		<h2>주소 관리 및 추가</h2>
	  <!-- Nav tabs -->
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" data-toggle="tab" href="#menu1">주소 목록</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-toggle="tab" href="#menu2">주소 추가하기</a>
		  </li>
		</ul>
		
		<!-- Tab panes -->
	  	<div class="tab-pane container active" id="menu1" style="overflow-y:scroll;">
	  	
	  	</div>
		<div class="tab-pane container fade" id="menu2">
			<input type='text' id='sample6_postcode' class="frm-chk" placeholder='우편번호'>
			<input type='button' onclick='sample6_execDaumPostcode()' value='우편번호 찾기'><br>
			<input type='text' id='sample6_address' class="frm-chk" placeholder='주소'><br>
			<input type='text' id='sample6_detailAddress' class="frm-chk" placeholder='상세주소'>
			<input type='text' id='sample6_extraAddress' class="frm-chk" placeholder='참고항목'>
			<input type='text' id='sample6_name' class="frm-chk" placeholder='받는사람 이름'>
			<input type='text' id='sample6_phonenum' class="frm-chk" placeholder='받는사람 전화번호'>
			<br><br>
			<input type="hidden" readonly="readonly" class="frm-chk" value="${user.id}">
			<button id="addressInsert">우편번호 등록</button>
		</div>   
	</div>     
 </div>
 <br><br>
<c:import url="../template/footer.jsp"></c:import>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/purchase/purchaseWindow.js?ver=5"></script>
</body>
</html>
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
		width: 18%;
		padding-top: 8%;
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
	<input type="hidden" readonly="readonly" id="willgetpoint" value="${willgetpoint}">
	
	<!-- 유저 정보 불러오는 창 -->
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
		    				<input type="hidden" readonly="readonly" class="isbnlist" value="${book.bookListDTO.isbn}">
		    				<input type="hidden" readonly="readonly" class="countlist" value="${book.bookcount}">
		    				<input type="hidden" readonly="readonly" class="pricelist" value="${book.bookListDTO.price}">
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
 
 <div class="modal container" id="forCheckingModal">
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
	  	<div class="tab-pane container active" id="menu1">
	  	
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
<c:import url="../template/footer.jsp"></c:import>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/purchase/purchaseWindow.js?ver=1"></script>
</body>
</html>
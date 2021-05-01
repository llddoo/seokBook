<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<div id="pointandprice">상품금액 : ${itemsprice}<br>사용포인트 : ${point}</div>
	<input type="hidden" readonly="readonly" id="usingpoint" value="${point}">
	<div>결제금액 : ${itemsprice-point}<br>획득예정 포인트: ${willgetpoint}</div>
	<div>
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
	<div><button type="button" id="payment">결제하기</button></div>
</div>
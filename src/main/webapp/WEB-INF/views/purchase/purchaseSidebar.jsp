<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="sidebarajaxdelete">
	<div id="pointandprice" style="border-bottom:2px black solid;">상품금액 : ${itemsprice}<br>사용포인트 : ${point}</div>
	<input type="hidden" readonly="readonly" id="usingpoint" value="${point}">
	<div id="getpointandlosepay" style="border-bottom:2px black solid;">결제금액 : ${itemsprice-point}<br>획득예정 포인트: ${willgetpoint}</div>
</div>

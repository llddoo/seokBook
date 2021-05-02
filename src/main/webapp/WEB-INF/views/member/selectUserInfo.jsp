<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row" style="text-align: center; border-style:solid; border-width:2px; border-color:black; width:90%">
	<div class="col-4" style="border-right-style: solid; border-right-width:2px;border-right-color:black;">주문자</div>
	<div class="col-8">
		<span style="border-right-style: solid; border-right-width:1px;border-right-color:black;">${user.name}&nbsp;&nbsp;</span>
		<span style="border-right-style: solid; border-right-width:1px;border-right-color:black;">&nbsp;${user.phonenum}&nbsp;&nbsp;</span>
		<span>&nbsp;${user.email}</span>
	</div>
	<input type="hidden" readonly="readonly" id="getUserName" value="${user.name}">
	<input type="hidden" readonly="readonly" id="getUserPhonenum" value="${user.phonenum}">
	<input type="hidden" readonly="readonly" id="getUserEmail" value="${user.email}">
</div>
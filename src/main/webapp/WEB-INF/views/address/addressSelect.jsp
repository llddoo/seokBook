<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${address eq null}"><a href="#forCheckingModal" rel="modal:open" id="manual-ajax">배송지 찾기</a></c:if>
<c:if test="${address ne null}">${address.postcode} <a href="#forCheckingModal" rel="modal:open" id="manual-ajax">배송지 변경</a>
<br>${address.address}<br>${address.name} | ${address.phonenum}
<input type="hidden" readonly="readonly" id="getterpostcode" class="trans-chk" value="${address.postcode}">
<input type="hidden" readonly="readonly" id="getteraddress" class="trans-chk" value="${address.address}">
<input type="hidden" readonly="readonly" id="gettername" class="trans-chk" value="${address.name}">
<input type="hidden" readonly="readonly" id="getterphonenum" class="trans-chk" value="${address.phonenum}"></c:if>
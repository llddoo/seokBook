<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${address eq null}"><a href="../address/addressInsertform" id="manual-ajax">배송지 입력</a></c:if>
<c:if test="${address ne null}">${address.postcode} <a href="../address/addressList" id="manual-ajax">배송지 변경</a>
<br>${address.address}<br>${address.name} | ${address.phonenum}
<input type="hidden" readonly="readonly" id="getterpostcode" value="${address.postcode}">
<input type="hidden" readonly="readonly" id="getteraddress" value="${address.address}">
<input type="hidden" readonly="readonly" id="gettername" value="${address.name}">
<input type="hidden" readonly="readonly" id="getterphonenum" value="${address.phonenum}"></c:if>
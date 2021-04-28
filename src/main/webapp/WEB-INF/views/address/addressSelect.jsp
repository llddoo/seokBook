<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
${address.postcode} <a href="../address/addressList" id="manual-ajax">배송지 변경</a><br>${address.address}<br>${address.name} | ${address.phonenum}
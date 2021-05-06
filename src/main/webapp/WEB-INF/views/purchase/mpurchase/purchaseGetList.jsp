<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${list}" var="DTO">
<input type="hidden" readonly="readonly" class="namelist" value="${DTO.gname}">
<input type="hidden" readonly="readonly" class="countlist" value="${DTO.price}">
</c:forEach>

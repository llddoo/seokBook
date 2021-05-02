<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-hover" id="addresslisttable">
	<thead>
	</thead>
	<c:if test="${listsize gt 0}">
	<c:forEach items="${addressList}" var="item">
		<tbody>
			<tr>
		    	<td>${item.postcode}</td>
		        	<td>
		        		<button class="selectThisAddress">현재 주소 선택하기</button>
		        		<button class="selectRemoveAddress">삭제</button>
		        		<input type="hidden" readonly="readonly" class="selectedAddressNumber" value="${item.adrnum}">
		        		<input type="hidden" readonly="readonly" class="selectedAddressID" value="${item.id}">
		        	</td>
		      	</tr>
		      	<tr>
		      		<td colspan="2">${item.address}</td>
		      	</tr>
		      	<tr>
		      		<td>받는사람 : ${item.name}</td>
		      		<td>전화번호 : ${item.phonenum}</td>
		      	</tr>
	      	</tbody>
	     </c:forEach>
	 </c:if>
	 
	 <c:if test="${listsize eq 0}">
	   	<p>등록된 주소가 없습니다..</p>
	 </c:if>
</table>
	        
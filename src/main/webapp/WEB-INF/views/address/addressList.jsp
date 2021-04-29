<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
  <h2>Hover Rows</h2>
  <p>주소목록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../address/addressInsertform" id="insert-ajax">주소 추가하기</a></p>            
  <table class="table table-hover">
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
  </table>
</div>
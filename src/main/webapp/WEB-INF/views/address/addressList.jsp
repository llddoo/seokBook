<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal container">
  <h2>Hover Rows</h2>
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
	<div class="tab-content">
	  <div class="tab-pane container active" id="menu1">
	  	<table class="table table-hover" style="overflow: scroll;">
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
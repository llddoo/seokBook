<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	  <table class="table">
	    <tbody>
	    	<c:forEach items="${commentList}" var="select">
	    	<tr>
	    		<td>${select.id}</td>
	    		<td>${select.regdate}</td>
	    		<c:if test="${member.id eq select.id}">
	    		<td>
	    			<input type="hidden" readonly="readonly" value="${select.resnum}">
	    			<button class="commentupdate btn btn-secondary">수정</button>
	    			<button class="commentdelete btn btn-danger">삭제</button>
	    		</td>
	    		</c:if>
	    	</tr>
	    	<tr>
	    		<td colspan="3">${select.content}</td>
	    	</tr>
	    	
	    	</c:forEach>
	    </tbody>
	  </table>
  </div>
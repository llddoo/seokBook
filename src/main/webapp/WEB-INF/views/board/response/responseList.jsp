<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	  <table class="table">
	  <c:forEach items="${commentList}" var="select">
	    <tbody>
	    	<tr>
	    		<td><c:forEach begin="1" end="${select.depth}">&emsp;</c:forEach>${select.id}&emsp;${select.regdate}</td>
	    		<td>
	    			<input class="selectresnum" type="hidden" readonly="readonly" value="${select.resnum}">
	    			<input class="selectstep" type="hidden" readonly="readonly" value="${select.step}">
	    			<input class="selectdepth" type="hidden" readonly="readonly" value="${select.depth}">
		    		<button class="commentreply btn">답글</button>
		    		<c:if test="${member.id eq select.id}">	
		    			<button class="commentupdate btn btn-secondary">수정</button>
		    			<button class="commentdelete btn btn-danger">삭제</button>
		    		</c:if>
		    	</td>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<div class="forpacking">
	    				<c:forEach begin="1" end="${select.depth}">&emsp;</c:forEach><div class="commentcontent">${select.content}</div>
	    			</div>
	    		</td>
	    	</tr>
	    </tbody>
	    </c:forEach>
	  </table>
  </div>
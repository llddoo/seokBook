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
	    			<c:if test="(boardsp=='중고책 판매' || boardsp=='중고책 판매 완료')">
		    			<button class="commentreply btn">답글</button>
		    		</c:if>
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
	  <input type="hidden" readonly="readonly" id="currentPage" value="${pager.curPage}">
	  <input type="hidden" readonly="readonly" id="curBlock" value="${pager.curBlock}">
	  <input type="hidden" readonly="readonly" id="preavail" value="${pager.pre}">
	  <input type="hidden" readonly="readonly" id="nextavail" value="${pager.next}">
	  <c:if test="${listsize ne 0}">
		<ul class="pagination pagination-sm justify-content-center" id="pagerList">
		  <li class="page-item" id="prebutton"><button class="page-link">Previous</button></li>
		  <c:forEach begin="${pager.startBlock}" end="${pager.endBlock}" var="i">
		  	<li class="page-item"><button class="page-link pagesetting" value="${i}">${i}</button></li>
		  </c:forEach>
		  <li class="page-item" id="nextbutton"><button class="page-link">Next</button></li>
		</ul>
	</c:if>
  </div>
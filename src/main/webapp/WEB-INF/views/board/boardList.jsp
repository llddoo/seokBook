<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
<style>
	#searchingform{
		width: 85%
	}
	#searchbar{
		width: 35%
	}
	#searchselectbar{
		width: 13%
	}
</style>
</head>
<body>
<c:import url="../template/body.jsp"></c:import>
	<div class="container">
	  <h2 id="boardsp">${pager.boardsp}</h2>
	  <table class="table">
	    <thead class="thead-dark">
	      <tr>
	        <th>글제목</th>
	        <th>작성자</th>
	        <th>쓴날짜</th>
	        <th>조회수</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${list}" var="select">
		      <tr>
		        <td><a href="./boardSelect?subnum=${select.subnum}&boardsp=${select.boardsp}">${select.subname}</a></td>
		        <td>${select.id}</td>
		        <td>${select.regdate}</td>
		        <td>${select.visitcount}</td>
		      </tr>
	      </c:forEach>
	    </tbody>
	  </table>
	  <c:if test="${listsize ne 0}">
		<ul class="pagination justify-content-center" id="pagerList">
		  <li class="page-item" id="prebutton"><button class="page-link">Previous</button></li>
		  <c:forEach begin="${pager.startBlock}" end="${pager.endBlock}" var="i">
		  	<li class="page-item"><button class="page-link pagesetting" value="${i}">${i}</button></li>
		  </c:forEach>
		  <li class="page-item" id="nextbutton"><button class="page-link">Next</button></li>
		</ul>
		</c:if>
	<div>
	 	<a class="btn btn-primary" href="./boardInsert?boardsp=${pager.boardsp}">글쓰기</a>
	 	<form class="float-right" method="get" action="./boardList" id="searchingform">
	 		<input type="hidden" readonly="readonly" name="boardsp" value="${pager.boardsp}">
		 	<button class="btn btn-success float-right" id="searchingButton">Search</button>
			<input type="text" class="form-control float-right" placeholder="Search" id="searchbar" name="search">
			<select name="cars" class="custom-select float-right" id="searchselectbar" name="kind">
				<option value="subname" selected>제목</option>
				<option value="content">내용</option>
				<option value="id">작성자</option>
			</select>
		</form>
	</div>
	  <form action="./boardList" id="getListSearching">
	  	<input type="hidden" readonly="readonly" id="boardsp" name="boardsp" value="${pager.boardsp}">
		<input type="hidden" readonly="readonly" id="currentPage" name="curPage" value="${pager.curPage}">
		<input type="hidden" readonly="readonly" id="curBlock" name="curBlock" value="${pager.curBlock}">
		<input type="hidden" readonly="readonly" id="preavail" value="${pager.pre}">
		<input type="hidden" readonly="readonly" id="nextavail" value="${pager.next}">
	  </form>
  </div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/board/boardPager.js"></script>
</body>
</html>
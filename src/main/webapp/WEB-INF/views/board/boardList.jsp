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
	#nametag{
		margin: 30px;
	}
	h2{
		font-size: 2.5rem !important;
	}
	.boardcol1{
		width:64%;
		text-align: center;
	}
	.boardcol2{
		text-align: center;
		width:12%;
	}
</style>
</head>
<body>
<c:import url="../template/body.jsp"></c:import>
	<div class="container">
	<div id="nametag">
	<c:choose>
		<c:when test="${pager.boardsp eq 'notice'}">
			<h2 id="boardsp">공지사항</h2>
		</c:when>
		<c:when test="${pager.boardsp eq 'event'}">
			<h2 id="boardsp">이벤트</h2>
		</c:when>
		<c:when test="${pager.boardsp eq 'oldbooksale'}">
			<h2 id="boardsp">중고 서적 판매</h2>
		</c:when>
		<c:when test="${pager.boardsp eq 'saleend'}">
			<h2 id="boardsp">중고 서적 판매 완료</h2>
		</c:when>
		<c:when test="${pager.boardsp eq 'oldbooklist'}">
			<h2 id="boardsp">중고 서적 전체 게시판</h2>
		</c:when>
		<c:otherwise>
			<h2 id="boardsp">QNA</h2>
		</c:otherwise>
	</c:choose>
	</div>
	  <table class="table table-hover">
	    <thead class="thead-dark">
	      <tr>
	        <th class="boardcol1">글제목</th>
	        <th class="boardcol2">작성자</th>
	        <th class="boardcol2">쓴날짜</th>
	        <th class="boardcol2">조회수</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${list}" var="select">
		      <tr>
		        <td>¤&nbsp;
		        	<a href="./boardSelect?subnum=${select.subnum}&boardsp=${select.boardsp}">
		        		<c:if test="${boardsp eq 'saleend'}">[판매완료]</c:if>${select.subname}
		        	</a>
		        </td>
		        <td class="boardcol2">${select.id}</td>
		        <td class="boardcol2">${select.regdate}</td>
		        <td class="boardcol2">${select.visitcount}</td>
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
		</c:if><br><br>
	<div>
		<c:if test="${(pager.boardsp ne 'event' && pager.boardsp ne 'notice')|| member.id eq 'admin'}">
	 		<a class="btn btn-primary" href="./boardInsert?boardsp=${pager.boardsp}">글쓰기</a>
	 	</c:if>
	 	<form class="float-right" method="get" action="./boardList" id="searchingform">
	 		<input type="hidden" readonly="readonly" name="boardsp" value="${pager.boardsp}">
	 		<c:if test="${boardsp ne 'qna'}">
			 	<button class="btn btn-success float-right" id="searchingButton">Search</button>
				<input type="text" class="form-control float-right" placeholder="Search" id="searchbar" name="search">
				<select class="custom-select float-right" id="searchselectbar" name="kind">
					<c:if test="${pager.boardsp eq 'oldbooklist'}">
						<option value="all">제목+내용+작성자</option>
					</c:if>
					<option value="subname" selected>제목</option>
					<option value="content">내용</option>
					<option value="id">작성자</option>
				</select>
			</c:if>
		</form>
	</div>
	  <form action="./boardList" id="getListSearching">
	  	<input type="hidden" readonly="readonly" id="boardsp" name="boardsp" value="${pager.boardsp}">
		<input type="hidden" readonly="readonly" id="currentPage" name="curPage" value="${pager.curPage}">
		<input type="hidden" readonly="readonly" id="curBlock" name="curBlock" value="${pager.curBlock}">
		<input type="hidden" readonly="readonly" id="preavail" value="${pager.pre}">
		<input type="hidden" readonly="readonly" id="nextavail" value="${pager.next}">
		<c:if test="${boardsp eq 'qna'}">
			<input type="hidden" readonly="readonly" name="kind" value="id">
			<input type="hidden" readonly="readonly" name="search" value="${member.id}">
		</c:if>
	  </form>
  </div>
  <br><br>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/board/boardPager.js"></script>
</body>
</html>
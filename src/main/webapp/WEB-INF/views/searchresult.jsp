<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="template/header.jsp"></c:import>
<style type="text/css">
	.searchcontainer{
    	padding: 1.5% 0 0 30%;
    }
      
    #searchbar{
      	width : 70% !important;
    }
      
    #searchbar input{
      	width : 70%;
    }
    
    .nosearchelement{
    	font-size: 2.5rem;
    	padding-left: 25%;
    }
    
    .bookcol1{
    	width:15%;
    }
    
    .bookcol2{
    	width:55%;
    }
    
    .bookcol2 span{
    	padding-left: 60%;
    }
    
    .bookcol3{
    	width: 12%;
    	text-align: center;
    }
    
    .bookcol4{
    	width: 64%;
    }
    
    .thead-light{
    	text-align: center;
    }
</style>
</head>
<body>
<c:import url="template/body.jsp"></c:import>
<div class="input-group mb-3 searchcontainer">
	<form class="form-inline mt-2 mt-md-0" id="searchbar" action="${pageContext.request.contextPath}/searchresult" method="get">
		<span>통합검색&nbsp;&nbsp;</span>
    	<input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" name="mainsearch" value="${mainsearch}">
    	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
</div>
<div class="container">
  <h2>책 검색 결과</h2>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th class="bookcol1"></th>
        <th class="bookcol2"><span>검색결과</span></th>
        <th class="bookcol1"></th>
       	<th class="bookcol1"></th>
      </tr>
    </thead>
    <tbody>
    <c:if test="${empty bookSearchList}">
    	<td colspan="4"><span class="nosearchelement">검색결과가 존재하지 않습니다.</span></td>
    </c:if>
    <c:forEach items="${bookSearchList}" var="bookdto">
      <tr class="likeBookButton">
        <td>
        	<img alt="${bookdto.bookImg}" src="${pageContext.request.contextPath}/resources/upload/bookList/${bookdto.bookImg}">
        </td>
        <td>
        	<a href="./bookList/bookListSelect?isbn=${bookdto.isbn}">${bookdto.bookName}</a><br>
        	<p>작가 : ${bookdto.author}</p><p>출판사 : ${bookdto.bookPub}</p><p>출판일 : ${bookdto.bookPubDate}</p><br>
        	<p>책설명 : ${bookdto.bookEx}</p>
        </td>
        <td>${bookdto.price}원<br>평점 : ${bookdto.bookScore}</td>
        <td>
	        <select>
	        	<option selected="selected">1</option>
	        	<c:forEach begin="2" end="10" var="i">
	        		<option>${i}</option>
	        	</c:forEach>
	        </select>	
        	<button class="getCart">장바구니</button>
        	<button class="getPurchase">구매하기</button>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <br>
  <br>
  <h2>중고서적 검색 결과</h2>
  <table class="table">
    <thead class="thead-light">
      <tr>
        <th class="bookcol4">글제목</th>
        <th class="bookcol3">작성자</th>
        <th class="bookcol3">작성일</th>
        <th class="bookcol3">조회수</th>
      </tr>
    </thead>
    <tbody>
    <c:if test="${empty oldbookSearchList}">
    	<td colspan="4"><span class="nosearchelement">검색결과가 존재하지 않습니다.</span></td>
    </c:if>
    <c:forEach items="${oldbookSearchList}" var="oldbook">
      <tr class="likeoldBookButton">
        <td>¤
        	<a href="./board/boardSelect?boardsp=${oldbook.boardsp}&subnum=${oldbook.subnum}">
        		&nbsp;
        		<c:if test="${oldbook.boardsp eq 'saleend'}">[판매완료]</c:if>
        		${oldbook.subname}
        	</a>
        </td>
        <td class="bookcol3">${oldbook.id}</td>
        <td class="bookcol3">${oldbook.regdate}</td>
        <td class="bookcol3">${oldbook.visitcount}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<c:import url="template/footer.jsp"></c:import>
<script type="text/javascript">
	$(".getCart").click(function(){
		moveBook();
	});
	
	$("#getPurchase").click(function(){
		moveBook();
		location.href="./";
	});
	
	function moveBook(){
		
	}
	
</script>
</body>
</html>
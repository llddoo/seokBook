<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="template/header.jsp"></c:import>
</head>
<body>
<c:import url="template/body.jsp"></c:import>
<div class="container">
  <h2>책 검색 결과</h2>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th></th>
        <th>검색결과</th>
        <th></th>
       	<th></th>
      </tr>
    </thead>
    <tbody>
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
  
  <h2>중고서적 검색 결과</h2>
  <table class="table">
    <thead class="thead-light">
      <tr>
        <th>글제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${oldbookSearchList}" var="oldbook">
      <tr class="likeoldBookButton">
        <td>¤
        	<a href="./board/boardSelect?boardsp=${oldbook.boardsp}&subnum=${oldbook.subnum}">
        		&nbsp;
        		<c:if test="${oldbook.boardsp eq 'saleend'}">[판매완료]</c:if>
        		${oldbook.subname}
        	</a>
        </td>
        <td>${oldbook.id}</td>
        <td>${oldbook.regdate}</td>
        <td>${oldbook.visitcount}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<c:import url="template/footer.jsp"></c:import>
<script type="text/javascript">

	$('.likeBookButton').mouseover(function(){
		$(this).css({"background-color":"rgba(191,218,255,0.5)"});
	});
	
	$('.likeBookButton').mouseout(function(){
		$(this).css("background-color", "transparent");
	});
	
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
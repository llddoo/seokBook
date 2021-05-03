<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="template/header.jsp"></c:import>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search/searchresult.css">
</head>
<body>
<c:import url="template/body.jsp"></c:import>
<div class="input-group mb-3 searchcontainer">
	<form class="form-inline mt-2 mt-md-0" id="searchbar" action="${pageContext.request.contextPath}/searchresult" method="get">
		<span>통합검색&nbsp;&nbsp;</span>
    	<input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" name="mainsearch" value="${mainsearch}">
    	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
</div><br><br>
<div class="container">
  <h2 style="text-align: center;">책 검색 결과</h2><br>
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
        <td class="imgalign" style="vertical-align: middle;">
        	<img alt="${bookdto.bookImg}" src="${pageContext.request.contextPath}/resources/uploaded/bookList/${bookdto.bookImg}">
        </td>
        <td style="vertical-align: middle; line-height: 1.5rem"><p>
        	<a href="./bookList/bookListSelect?isbn=${bookdto.isbn}" class="bookselect">${bookdto.bookName}</a>
        	<br>
        	<b>작가</b> : ${bookdto.author}&nbsp;&nbsp;<b>출판사</b> : ${bookdto.bookPub}&nbsp;&nbsp;
        	<b>출판일</b> : ${bookdto.bookPubDate}<br>
        	<b>책설명</b> : ${bookdto.bookContent}</p>
        </td>
        <td class="fornextline">
        	<del>${bookdto.price}원</del>
        	<br>${bookdto.price*9/10}원
        	<br>포인트 : ${bookdto.bPoint}
        	<br>평점 : ${bookdto.bookScore/bookdto.scoreCount*100}
        </td>
        <td class="fornextline">
        	<input type="hidden" readonly="readonly" name="isbn" value="${bookdto.isbn}">
        	<input type="hidden" readonly="readonly" name="id" value="${member.id}">
		    <select class="custom-select-sm" name="bookcount">
		    	<option selected="selected" value="1">1</option>
		       	<c:forEach begin="2" end="10" var="i">
		       		<option value="${i}">${i}</option>
		       	</c:forEach>
		    </select><br>
        	<button class="getCart btn-sm btn-info">장바구니</button><br>
        	<button class="getPurchase btn-sm btn-primary">구매하기</button>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <c:if test="${!empty bookSearchList}">
  	<a href="./bookList/bookList?boardsp=oldbooklist&kind=all&search=${mainsearch}" class="btn btnonright">
  		더 검색해 보기
  	</a>
  </c:if>
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
  <c:if test="${!empty oldbookSearchList}">
  	<a href="./board/boardList?boardsp=oldbooklist&kind=all&search=${mainsearch}" class="btn btnonright">
  		중고서적 더 검색해 보기
  	</a>
  </c:if>
  <br>
  <br>
</div>
<c:import url="template/footer.jsp"></c:import>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/searchresult.js"></script>
</body>
</html>
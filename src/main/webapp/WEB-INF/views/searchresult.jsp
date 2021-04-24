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
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${bookSearchList}" var="bookdto">
      <tr class="likeBookButton">
        <td><img alt="" src=""></td><!-- 이미지 이름을 넣어주고 src에는 경로를 넣어주면 될 것이다. -->
        <td>
        	<form action="./booklist/bookListSelect" method="get" class="bookform">
        		<input type="hidden" readonly="readonly" name="isbn" value="${bookdto.isbn}">
        	</form>
        </td><!-- 상세 내역을 적을 태그 -->
        <td></td><!-- 버튼 세개가 들어갈 td태그 : 수량이 들어갈 버튼, 구매버튼, 장바구니에 추가 버튼 -->
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
      <tr>
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
	
</script>
</body>
</html>
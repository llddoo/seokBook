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
      <tr>
        <td><img></td>
        <td></td><!-- 상세 내역을 적을 태그 -->
        <td></td><!-- 버튼 세개가 들어갈 td태그 -->
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <h2>중고서적 검색 결과</h2>
  <table class="table">
    <thead class="thead-light">
      <tr>
        <th>글제목</th>
        <th></th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${oldbookSearchList}" var="oldbook">
      <tr class="likeButton">
        <td class="subname">${oldbook.subname}</td>
        <td>
        	<form action="./board/boardSelect" method="get">
        		<input type="hidden" value="${oldbook.boardsp}" class="transferboardsp">
        		<input type="hidden" value="${oldbook.subnum}" class="transfersubnum">
        	</form>
        </td>
        <td class="writer">${oldbook.id}</td>
        <td class="regdate">${oldbook.regdate}</td>
        <td class="visitcount">${oldbook.visitcount}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<c:import url="template/footer.jsp"></c:import>
</body>
</html>
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
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="bookList" var="bookdto">
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
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
  
  <h3>공지사항 검색 결과</h3>
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
      <c:forEach items="${noticeSearchList}" var="notice">
      <tr class="likeButton">
        <td class="subname">${notice.subname}</td>
        <td>
        	<form action="./board/boardSelect" method="get">
        		<input type="hidden" value="${notice.boardsp}" class="transferboardsp">
        		<input type="hidden" value="${notice.subnum}" class="transfersubnum">
        	</form>
        </td>
        <td class="writer">${notice.id}</td>
        <td class="regdate">${notice.regdate}</td>
        <td class="visitcount">${notice.visitcount}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  	
	<h3>이벤트 검색 결과</h3>
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
      <c:forEach items="${eventSearchList}" var="event">
      <tr class="likeButton">
        <td class="subname">${event.subname}</td>
        <td>
        	<form action="./board/boardSelect" method="get">
        		<input type="hidden" value="${event.boardsp}" class="transferboardsp">
        		<input type="hidden" value="${event.subnum}" class="transfersubnum">
        	</form>
        </td>
        <td class="writer">${event.id}</td>
        <td class="regdate">${event.regdate}</td>
        <td class="visitcount">${event.visitcount}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<c:import url="template/footer.jsp"></c:import>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
</head>
<body>
<c:import url="../template/body.jsp"></c:import>
	<div class="container">
	  <h2>${list[0].boardsp}</h2>
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
	  <a class="btn btn-primary" href="./boardInsert?boardsp=${list[0].boardsp}">글쓰기</a>
  </div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
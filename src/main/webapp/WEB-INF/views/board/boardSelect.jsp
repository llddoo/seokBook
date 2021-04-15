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
	  <table class="table">
	    <thead class="thead-dark">
	      <tr>
	        <th>글제목 : ${select.subname}</th>
	        <th>작성자 :${select.id}</th>
	        <th>작성일자 : ${select.regdate}</th>
	        <th>조회수 : ${select.visitcount}</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<tr>
	    	<td colspan="4">${select.content}</td>
	    	</tr>
	    </tbody>
	  </table>
	  <c:if test="${select.id eq member.id}">
		  <a class="btn btn-primary" href="./boardUpdate?boardsp=${select.boardsp}&subnum=${select.subnum}">글 수정</a>
  	 	 <a class="btn btn-danger" href="./boardDelete?subnum=${select.subnum}">글 삭제</a>
  	  </c:if>
  </div>
  
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
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
	        <th>${select.subname}</th>
	        <th>${select.id}</th>
	        <th>${select.regdate}</th>
	        <th>${select.visitcount}</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<tr>
	    	<td colspan="4">${select.content}</td>
	    	</tr>
	    </tbody>
	  </table>
  </div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
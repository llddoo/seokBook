<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../template/bootStrap.jsp"></c:import>
<c:import url="../../template/body.jsp"></c:import>

<style type="text/css">
#div_root{
margin:auto;
width:800px;
margin-top:80px;
}
</style>

</head>
<body>
<div id="div_root">
	<h2>장바구니</h2>
	<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>ICBN</th>
					<th>책이름</th>
					<th>책내용</th>
					<th>가격</th>
					<th>ebook</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${list}" var="dto" >
				<tr>
					<td>${ICBN}</td>
					<td><a href="./$bookListSelect?num=${ICBN}">
					
					<c:catch>
					<c:forEach begin="1" end="${ICBN.depth}">--</c:forEach>
					</c:catch>
					${bookName}
					</a></td>
					<td>${bookContent}</td>
					<td>${price}</td>
					<td>${ebook}</td>
				</tr>
			</c:forEach>
			</tbody>
		
		</table>
	
</div>
</body>
</html>
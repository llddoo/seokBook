<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="${pageContext.request.contextPath}/template/header.jsp"></c:import>

<style type="text/css">
	.cartcol1{
		text-align: center;
		width:15%;
	}
	.cartcol2{
		text-align: center;
		width:55%;
	}
</style>

</head>
<body>
<c:import url="${pageContext.request.contextPath}/template/bootStrap.jsp"></c:import>
	<div id="container">
		<h2>장바구니</h2>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th class="cartcol1"></th>
					<th class="cartcol2">장바구니 목록</th>
					<th class="cartcol1"></th>
					<th class="cartcol1"></th>
				</tr>
			</thead>
			
			<c:forEach items="${list}" var="dto" >
				<tbody>
					<tr>
						<td>
							<img alt="${bookdto.bookImg}" src="${pageContext.request.contextPath}/resources/upload/bookList/${bookdto.bookImg}">
						</td>
						<td>
							<a href="">
								
							</a>
						</td>
						<td class="cartcol1"></td>
						<td class="cartcol1"></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	<c:import url="${pageContext.request.contextPath}/template/footer.jsp"></c:import>
</body>
</html>
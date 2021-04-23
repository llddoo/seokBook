<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
<style>
#searchingform {
	width: 85%
}

#searchbar {
	width: 35%
}

#searchselectbar {
	width: 13%
}
</style>
</head>
<body>
	<c:import url="../template/body.jsp"></c:import>

	<div class="container">
		<h2 id="boardsp">${pager.boardsp}</h2>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>책제목</th>
					<th>작가</th>
					<th>출판사</th>
					<th>출판일</th>
					<th>가격</th>
					<th>내용</th>
					<th>평점</th>
				</tr>
			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td><a href="./bookListSelect?isbn=${dto.isbn}">${dto.bookName}</a></td>
						<td>${dto.author}</td>
						<td>${dto.bookPub}</td>
						<td>${dto.bookPubDate}</td>
						<td>${dto.price}</td>
						<td>${dto.bookContent}</td>
						<td>${dto.bookScore}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${listsize ne 0}">
			<ul class="pagination justify-content-center" id="pagerList">
				<li class="page-item" id="prebutton"><button class="page-link">Previous</button></li>
				<c:forEach begin="${pager.startBlock}" end="${pager.endBlock}"
					var="i">
					<li class="page-item"><button class="page-link pagesetting"
							value="${i}">${i}</button></li>
				</c:forEach>
				<li class="page-item" id="nextbutton"><button class="page-link">Next</button></li>
			</ul>
		</c:if>
</div>





		<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
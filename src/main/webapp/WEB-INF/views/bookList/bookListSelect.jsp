<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
</head>
<body>
	<c:import url="../template/body.jsp"></c:import>

	<h2>상품 정보</h2>
	<table>
		<tr>
			<td><img src="${path}/images/${dto.bookImg}" width="300px" height="300px"></td>
			<td align="center">
				<table>

					<tr>
						<td>상품명</td>
						<td>${dto.bookName}</td>
					</tr>

					<tr>
						<td>가격</td>
						<td>${dto.price}</td>
					</tr>

					<tr>
						<td>작가</td>
						<td>${dto.author}</td>
					</tr>

					<tr>
						<td>출판사</td>
						<td>${dto.bookPub}</td>
					</tr>

					<tr>
						<td>출판일</td>
						<td>${dto.bookPubDate}</td>
					</tr>

					<tr>
						<td>평점</td>
						<td>${dto.bookScore}</td>
					</tr>


					<tr>
						<td colspan="2">
							<form name="form1" method="post" action="${path}/">
								<input type="hidden" name="isbn" value="${dto.isbn}">
								<select name="amount">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>&nbsp;개 <input type="submit" value="장바구니에 담기">
							</form> <a href="${path}/shop/product/list.do">상품목록</a>
						</td>
					</tr>
				</table>
	</table>

	<hr>
	<table>
		<tr>
			<td>&nbsp;</td>
			<td>${dto.bookContent}</td>
			<!-- 상품 설명을 가져옴 -->
		</tr>
	</table>




	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
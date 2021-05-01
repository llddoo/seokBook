<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../template/header.jsp"></c:import>

<style type="text/css">
	.fornextline{
    	line-height: 2rem;
    }
    .booknametitle{
    	font-size: 1.3rem;
    }
    .getCart{
    	margin-top: 0.5rem;
    }
    .getDelete{
    	margin-top: 0.5rem;
    }
    .foralign{
    	text-align: center;
    	vertical-align: middle !important;
    }
    #emptycart{
    	text-align: center;
    }
    .form-check-input{
    	margin-left:0rem !important;
    	zoom:2 !important;
    	margin-top:0rem !important;
    }
</style>

</head>
<body>
<c:import url="../../template/body.jsp"></c:import>
	<div class="container">
		<h2>장바구니</h2>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>합계</th>
					<th>선택</th>
				</tr>
			</thead>
			
			<c:forEach items="${booklist}" var="bookdto" >
				<tbody>
					<tr>
						<td class="textforline">
							<div style="display:inline-block;">
								<input type="checkbox" class="form-check-input forpurchaselist">
							</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" readonly="readonly" name="cartNumlist" value="${bookdto.cartNum}">
							<input type="hidden" readonly="readonly" name="isbnlist" value="${bookdto.isbn}">
							<input type="hidden" readonly="readonly" name="countlist" value="${bookdto.bookcount}">
							<img alt="${bookdto.bookListDTO.bookImg}" src="${pageContext.request.contextPath}/resources/uploaded/bookList/${bookdto.bookListDTO.bookImg}">
							<a href="./bookList/bookListSelect?isbn=${bookdto.isbn}" class="bookselect">
				        		<span class="booknametitle">${bookdto.bookListDTO.bookName}</span>
				        	</a>
						</td>
						 <td class="fornextline"><p>
				        	${bookdto.bookListDTO.price}원<br>
				        	${bookdto.bookListDTO.price/20}Point
				        </td>
				        <td>
				        	<input type="hidden" readonly="readonly" value="${bookdto.isbn}" name="isbn">
					    	<input type="hidden" readonly="readonly" value="${bookdto.bookcount}" class="forchecklist">
							<select class="custom-select-sm selectedbookcount" name="countlist">
								<c:forEach begin="1" end="10" var="i">
								   	<option value="${i}">${i}</option>
								</c:forEach>
							</select>
							<button class="btn changebookcount">변경</button>
					    </td>
				        <td class="foralign">${bookdto.bookListDTO.price * bookdto.bookcount}원</td>
				        <td class="foralign">
				        	<form action="../../purchase/purchaseWindow" method="post">
				        		<input type="hidden" readonly="readonly" name="isbnlist" value="${bookdto.isbn}">
				        		<input type="hidden" readonly="readonly" name="countlist" value="${bookdto.bookcount}">
				        	</form>
					        <button class="getPurchase btn-sm btn-info">바로구매</button>
					        <input type="hidden" readonly="readonly" value="${bookdto.isbn}" class="fordelete">
				        	<button class="getDelete btn-sm btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;삭제&nbsp;&nbsp;&nbsp;</button>
				        </td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<c:if test="${listsize eq 0}">
			<br>
			<h2 id="emptycart">장바구니가 비어있습니다.</h2>
		</c:if>
		<br>
		<p>선택된 항목의 개수, 선택된 항목들의 전체 권수, 선택된 모든 책들의 가격합산</p>
		<div style="display:inline-block;">
			<input type="checkbox" class="form-check-input" id="allpurchaselist">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label for="allpurchaselist">전체선택</label>
		</div>
		&nbsp;&nbsp;&nbsp;
		<input type="hidden" readonly="readonly" name="id" id="forallcheck" value="${pager.id}">
		<button id="allpurchase" class="btn btn-primary">주문하기</button>
		<button id="allcartdelete" class="btn btn-danger">선택삭제</button>
	</div>
	<br>
	<c:import url="../../template/footer.jsp"></c:import>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/membercartList.js"></script>
</body>
</html>
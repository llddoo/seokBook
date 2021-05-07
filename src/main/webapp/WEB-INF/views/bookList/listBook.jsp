<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

	<input type="hidden" readonly="readonly" id="selectorcheck" value="${pager.gnumber}">
	<input type="hidden" readonly="readonly" id="bookisbn" name="isbn" value="${dto.isbn}">
	<input type="hidden" readonly="readonly" id="getmemberid" name="id" value="${member.id}"> 
	
	<div class="container">
	<h2>장르 > </h2>
		<select id="genreList" name="genreList">
		<c:forEach items="${glist}" var="glist">
				<option value="${glist.gnumber}">${glist.gname}</option>
		</c:forEach>
		</select>
	
		<h2 id="boardsp">${pager.boardsp}</h2>
		<table class="table">
			<thead class="thead-dark">
				<c:forEach items="${list}" var="dto">
					<tr class="likeBookButton">
						<td class="imgalign"><img alt="${dto.bookImg}"
							src="${pageContext.request.contextPath}/resources/uploaded/bookList/${dto.bookImg}">
						</td>
						<td>
							<a href="./bookListSelect?isbn=${dto.isbn}" class="bookselect">${dto.bookName}</a><br>
							<div class="author">
								<span class="name"><a>${dto.author}</a></span>지음 <span
									class="line">|</span> <span class="name" title="출판사"><a>${dto.bookPub}</a></span>
								<span class="line">|</span> <span class="name" title="출간일"><a>${dto.bookPubDate}</a> 출간</span>
							</div> <br>
							<span class="sell_price" title="판매가"><strong>${dto.price*90/100}</strong>원</span>
							<span class="dc_rate">[<strong>10</strong>% 할인]</span>
							<span class="line">|</span>
							<span class="earn_point"><strong>${dto.price*5/100}</strong>P 적립 [ <strong>5</strong> % 적립]</span><br>
							${dto.bookContent}...
							<a href="./bookListSelect?isbn=${dto.isbn}" class=bookselectclick>[더보기]</a><br>
							<div class="review">평점 : <em>${dto.bookScore}</em></div>
							
							
							
						</td>
						
						<td class="fornextline">

								<select class="custom-select-sm" id="amount">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>
							<div class="button_set">
								<button class="getCart btn-sm btn-info" id="getCart">장바구니</button><br>
     						   	<button class="getPurchase btn-sm btn-primary" id="getPurchase">구매하기</button>
							</div>
								
							
						</td>
					</tr>
				</c:forEach>

				
			</tbody>
		</table>
		<c:if test="${listsize ne 0}">
			<ul class="pagination justify-content-center" id="pagerList">
				<li class="page-item" id="prebutton"><button class="page-link">Previous</button></li>
				<c:forEach begin="${pager.startBlock}" end="${pager.endBlock}" var="i">
					<li class="page-item"><button class="page-link pagesetting"
							value="${i}">${i}</button></li>
				</c:forEach>
				<li class="page-item" id="nextbutton"><button class="page-link">Next</button></li>
			</ul>
		</c:if>
	</div>





	<c:import url="../template/footer.jsp"></c:import>
<script>
	const gnumber = $("#selectorcheck").val();
	const isbn = $("#bookisbn").val();
	$(document).ready(function(){
		$("#genreList").val(gnumber);
	});
	$("#genreList").change(function(){
		if(gnumber!=$(this).val()){
			location.href="./listBook?gnumber="+$(this).val();
		}
	});
	
	
	$("#getCart").click(function(){
		const bookcount = Number($("#amount").find("option:selected").val());
		const id = $("#getmemberid").val();
		$.ajax({
			type:"post",
			url:"../member/membercart/membercartInsert",
			data:{
				isbn:isbn,
				id:id,
				bookcount:bookcount
			},
			success:function(result){
				result = Number(result.trim());
				if(result>0){
					alert("장바구니에 담았습니다.");
				}else{
					alert("이미 장바구니에 담았습니다.");
				}
			}
		});
	});
	
	$("#getPurchase").click(function(){
		const thisis = $(this);
		const id = thisis.siblings("input[name='id']").val();
		const isbn = thisis.siblings("input[name='isbn']").val();
		const bookcount = thisis.siblings("select").val();
		if(id==''){
			alert('로그인을 하셔야 이용할 수 있습니다.');
			return;
		}
		let check = confirm('이 책을 바로 구입하시겠습니까?');
		if(check){
			thisis.parent().append("<form id='purchaseOption' method='post' action='./purchase/purchaseWindow'></form>");
			$("#purchaseOption").append("<input type='hidden' readonly='readonly' name='isbnlist' value="+isbn+">");
			$("#purchaseOption").append("<input type='hidden' readonly='readonly' name='countlist' value="+bookcount+">");
			$("#purchaseOption").submit();
		}
	});
</script>
</body>
</html>
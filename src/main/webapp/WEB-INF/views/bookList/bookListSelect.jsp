<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/bookNGenre/book.css">
</head>
<body>
	<c:import url="../template/body.jsp"></c:import>

	<div class=content_middle>
		<div class="box_detail_point">
			<h1 class="title">
				<strong>${dto.bookName}</strong> <span class="back"><strong>${dto.author}
						${dto.gNumber}</strong></span>
			</h1>
			<div class="author">
				<span class="name"><a>${dto.author}</a></span>"지음" <span
					class="line">|</span> <span class="name" title="출판사"><a>${dto.bookPub}</a></span>
				<span class="line">|</span> <span class="name" title="출간일"><a>${dto.bookPubDate}</a>"출간"</span>
			</div>
			<div class="review">
				"평점"<em>${dto.bookScore}</em>
			</div>

			<div class="box_detail_info">
				<div class="cover">
					<img
						src="http://image.kyobobook.co.kr/images/book/large/741/l9788932907741.jpg"
						onerror="this.style.display='none';" alt="${dto.bookName}">
				</div>
				<div class="box_detail_version">
					<h2>이 책의 다른 상품 정보</h2>
					<ul>
						<li><a
							href="http://digital.kyobobook.co.kr/digital/ebook/ebookDetail.ink?barcode=4808932907741&amp;orderClick=JAX">eBook:
								${dto.eBookPrice}원</a></li>
					</ul>
				</div>
			</div>

			<div class="box_detail_order">
				<script type="text/javascript">
					//레이어팝업
					function popOpen(obj) {
						var ele = document.getElementById(obj);
						if (ele.style.display == "none") {
							ele.style.display = "block";
						} else {
							ele.style.display = "none";
						}
					}
				</script>
				<div class="box_detail_price">
					<h2 class="hidden">가격정보</h2>
					<ul class="list_detail_price">
						<li>" 정가 : "<span class="org_price">${dto.price}원 </span> <br>
							" 판매가 : "<span class="sell_price" title="판매가"><strong>${dto.price*90/100}</strong>"원"</span>
							<span class="dc_rate">"["<strong>10</strong>"%↓" <strong>${dto.price*10/100}</strong>"원
								할인]"
						</span>
						</li>
						<li>
							<div id="inkPoint" class="inkPoint">
								<span class="tit_inkPoint">혜택 :</span>
								<div class="info_inkPoint">
									<span class="earn_point"> "[기본적립]" <strong>${dto.price*5/100}</strong>
										"원 적립 [" <strong>5</strong> "% 적립] "
									</span>
								</div>
							</div>
						</li>
					</ul>
				</div>

				<div class="box_detail_delivery">
					<h2 class="hidden">배송정보</h2>
					<ul class="list_detail_delivery">
						<li>"배송비 : 무료"</li>
						<li><span class="indent">배송일정 :</span> <span class="indent">"서울특별시
								종로구 세종대로 기준" <br> <span id="basic_sendinfo_area">
									"지금 주문하면"<em>내일 도착 예정</em>
							</span> <span id="basic_sendinfo_area_split" style="display: none"></span>
						</span></li>
					</ul>
				</div>

				<div class="box_detail_button">
					<label for="proForm_qty">주문수량</label> <input type="hidden"
						name="isbn" value="${dto.isbn}"> <select name="amount">
						<c:forEach begin="1" end="10" var="i">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>&nbsp;개
				</div>

				<div class="button_set">
					<a href="" class="btn_xlarge btn_blue">장바구니 담기</a>
				</div>




				<div class="content_middle">
					<div class="content_left">

						<!-- *** s:상세정보 *** -->


						<ul class="tab_detail_content" id="book_info">
							<li class="on"><a href="#book_info">상품정보</a></li>
							<li><a href="#review">회원리뷰 <span>(${dto.scoreCount})</span></a></li>
							<li><a href="#guide">교환/반품/품절</a></li>
						</ul>


						<!-- *** s:도서 제품 정보 테이블 *** -->
						<table class="table_simple2 table_opened margin_top10"
							summary="이 상품의 상세정보">
							<caption class="caption_hidden">상품상세정보</caption>
							<colgroup>
								<col width="18%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">ISBN</th>
									<td><span title="ISBN-13">${dto.isbn}</span></td>
								</tr>
								<tr>
									<th scope="row">장르</th>
									<td>${dto.gName}</td>
								</tr>
							</tbody>
						</table>



						<h2 class="title_detail_basic">책소개</h2>

						<div class="box_detail_article">${dto.bookContent}</div>


						<h2 class="title_detail_basic">목차</h2>
						<div class="box_detail_article">${dto.bookIdx}</div>







					</div>
				</div>

			</div>

		</div>






		<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
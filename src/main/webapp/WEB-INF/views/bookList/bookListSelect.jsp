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
<link rel="stylesheet" href="../resources/css/starrate.css">
<script type="text/javascript" src="../resources/js/starrate.js"></script>
</head>
<body>
	<c:import url="../template/body.jsp"></c:import>

	<div id="container">

		<div class=content_middle>
			<div class="box_detail_info">
				<div class="cover">
					<img alt="${dto.bookImg}"
						src="${pageContext.request.contextPath}/resources/uploaded/bookList/${dto.bookImg}"
						onerror="this.style.display='none';">
				</div>
				<div class="box_detail_version">
					<h2>이 책의 다른 상품 정보</h2>
					<ul>
						<li><a href="">eBook : ${dto.eBookPrice}원</a></li>
					</ul>
				</div>
			</div>
			<div class="box_detail_point">
				<h1 class="title">
					<strong>${dto.bookName}</strong> <span class="back"><strong>${dto.author}
							| ${dto.gName}</strong></span>
				</h1>
				<div class="author">
					<span class="name"><a>${dto.author}</a></span> 지음 <span
						class="line">|</span> <span class="name" title="출판사"><a>${dto.bookPub}</a></span>
					<span class="line">|</span> <span class="name" title="출간일"><a>${dto.bookPubDate}</a>
						출간</span>
				</div>
				<div class="review">
					평점 : <em>${dto.bookScore}</em>
				</div>
			</div>


			<div class="box_detail_order">

				<div class="box_detail_price">
					<h2 class="hidden">가격정보</h2>
					<ul class="list_detail_price">
						<li>정가 : <span class="org_price">${dto.price}원 </span> <br>
							판매가 : <span class="sell_price" title="판매가"><strong>${dto.price*90/100}</strong>원</span>
							<span class="dc_rate">[<strong>10</strong>%↓ <strong>${dto.price*10/100}</strong>원
								할인]
						</span>
						</li>
						<li>
							<div id="inkPoint" class="inkPoint">
								<span class="tit_inkPoint">혜택 :</span>
								<div class="info_inkPoint">
									<span class="earn_point"> [기본적립] <strong>${dto.price*5/100}</strong>
										원 적립 [ <strong>5</strong> % 적립]
									</span>
								</div>
							</div>
						</li>
					</ul>
				</div>

				<div class="box_detail_delivery">
					<h2 class="hidden">배송정보</h2>
					<ul class="list_detail_delivery">
						<li>배송비 : 무료</li>
						<li><span class="indent">배송일정 :</span> <span class="indent">서울특별시
								종로구 세종대로 기준 <br> <span id="basic_sendinfo_area"> 지금
									주문하면<em> 내일 도착 예정</em>
							</span>
						</span></li>
					</ul>
				</div>

				<div class="box_detail_button">
					<label for="proForm_qty">주문수량</label> <input type="hidden"
						id="bookisbn" name="isbn" value="${dto.isbn}"> <select
						name="amount">
						<c:forEach begin="1" end="10" var="i">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>&nbsp;개
					<div class="button_set">
						<a href="" class="btn_xlarge btn_blue">장바구니 담기</a>
					</div>
				</div>
			</div>

		</div>

		<!-- *** s:상세정보 *** -->

		<div class="content_middle">
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
						<td><span title="ISBN-13">&nbsp ${dto.isbn}</span></td>
					</tr>
					<tr>
						<th scope="row">장르</th>
						<td>&nbsp ${dto.gName}</td>
					</tr>
				</tbody>
			</table>



			<h2 class="title_detail_basic">책소개</h2>

			<div class="box_detail_article">${dto.bookContent}</div>


			<h2 class="title_detail_basic">목차</h2>
			<input type="hidden" readonly="readonly" id="index"
				value="${dto.bookIdx}">
			<div class="box_detail_article" id="insertindex">${dto.bookIdx}</div>









			<!-- 리뷰,별점 -->
			<ul class="tab_detail_content" id="review">
				<li><a href="#book_info">상품정보</a></li>
				<li class="on"><a href="#review">회원리뷰 <span>(${dto.scoreCount})</span></a></li>
				<li><a href="#guide">교환/반품/품절</a></li>
			</ul>

			<div class="wrap">
				<h2>리뷰</h2>
				<form name="reviewform" class="reviewform" method="post"
					action="/save">
					<input type="hidden" name="rate" id="rate" value="0" />

					<div class="review_rating">
						<div class="warning_msg">별점을 선택해 주세요.</div>
						<div class="rating">
							<!-- 별점 클릭시 해당 별과 왼쪽의 모든 별의 체크박스에 checked 적용 -->
							<input type="checkbox" name="rating" id="rating1" value="1"
								class="rate_radio" title="1점"> <label for="rating1"></label>
							<input type="checkbox" name="rating" id="rating2" value="2"
								class="rate_radio" title="2점"> <label for="rating2"></label>
							<input type="checkbox" name="rating" id="rating3" value="3"
								class="rate_radio" title="3점"> <label for="rating3"></label>
							<input type="checkbox" name="rating" id="rating4" value="4"
								class="rate_radio" title="4점"> <label for="rating4"></label>
							<input type="checkbox" name="rating" id="rating5" value="5"
								class="rate_radio" title="5점"> <label for="rating5"></label>
						</div>
					</div>


					<div class="review_contents">
						<div class="warning_msg">5자 이상으로 작성해 주세요.</div>
						<textarea rows="10" class="review_textarea"></textarea>
					</div>
					<div class="cmd">
						<input type="button" name="save" id="save" value="등록">
					</div>
				</form>
			</div>

			<!--리뷰 페이지  -->
			<div id="reviewpage"></div>




			<!-- 교환/반품/품절 안내  -->
			<ul class="tab_detail_content" id="guide">
				<li><a href="#book_info">상품정보</a></li>
				<li><a href="#review">회원리뷰 <span>(${dto.scoreCount})</span></a></li>
				<li class="on"><a href="#guide">교환/반품/품절</a></li>
			</ul>

			<div class="box_detail_content">
				<h2 class="title_detail_basic">교환/반품/품절안내</h2>
				<p class="margin_top20">※ 상품 설명에 반품/교환 관련한 안내가 있는 경우 그 내용을 우선으로
					합니다. (업체 사정에 따라 달라질 수 있습니다.)</p>
				<table class="table_simple2 table_detail_guide margin_top10"
					summary="교환/반품/품절안내 상세테이블로 목록으로 반품/교환방법, 반품/교환가능 기간, 반품/교환비용, 반품/교환 불가 사유, 상품 품절, 소비자 피해보상 환불지연에 따른 배상">
					<caption class="caption_hidden">교환/반품/품절안내</caption>
					<colgroup>
						<col width="22%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">반품/교환방법</th>
							<td><strong>마이페이지 &gt; 주문관리 &gt; 주문/배송내역 &gt; 주문조회
									&gt; <a href="../board/boardInsert/boardsp=qna">반품/교환신청</a> 또는
									고객센터 (1544-1900)
							</strong></td>
						</tr>
						<tr>
							<th scope="row">반품/교환가능 기간</th>
							<td>변심반품의 경우 수령 후 7일 이내,<br> 상품의 결함 및 계약내용과 다를 경우 문제점
								발견 후 30일 이내
							</td>
						</tr>
						<tr>
							<th scope="row">반품/교환비용</th>
							<td>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</td>
						</tr>
						<tr>
							<th scope="row">반품/교환 불가 사유</th>
							<td>
								<ul class="list_normal">
									<li>소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br> (단지 확인을 위한
										포장 훼손은 제외)
									</li>
									<li>소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br> 예)
										화장품, 식품, 가전제품(악세서리 포함) 등
									</li>
									<li>복제가 가능한 상품 등의 포장을 훼손한 경우<br> 예) 음반/DVD/비디오,
										소프트웨어, 만화책, 잡지, 영상 화보집
									</li>
									<li>소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)</li>
									<li>디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우</li>
									<li>시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우</li>
									<li>전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에<br>
										해당되는 경우
									</li>
								</ul> (1) 해외주문도서 : 이용자의 요청에 의한 개인주문상품으로 단순변심 및 착오로 인한 취소/교환/반품 시
								‘해외주문 반품/취소 수수료’ 고객 부담 (해외주문 반품/취소 수수료 : ①서양도서-판매정가의 12%,
								②일본도서-판매정가의 7%를 적용)

							</td>
						</tr>
						<tr>
							<th scope="row">상품 품절</th>
							<td>공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는<br>
								이메일과 문자로 안내드리겠습니다.
							</td>
						</tr>
						<tr>
							<th scope="row">소비자 피해보상<br> 환불지연에 따른 배상
							</th>
							<td>
								<ul class="list_normal">
									<li>상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은<br>
										소비자분쟁해결 기준 (공정거래위원회 고시)에 준하여 처리됨
									</li>
									<li>대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의<br>
										소비자 보호에 관한 법률에 따라 처리함
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>




		</div>

	</div>



	<c:import url="../template/footer.jsp"></c:import>
	<script src="//code.jquery.com/jquery-3.3.1.min.js">
		function getList(){
			const bookisbn = $("#bookisbn").val();
			$.ajax({
				type: 'post',
				url : '../review/reviewGetList',
				data:{
					isbn:bookisbn
				},
				success:function(result){
					result=result.trim();
					$("#reviewpage").append(result);
				}
			});
		}	
		
		$(document).ready(function() {
			const index = $("#index").val();
			$("insertindex").append(index);
			getList();
		});
	</script>

</body>
</html>
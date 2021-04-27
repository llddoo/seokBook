<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	




			<!-- *** s:상품정보 스크립트 *** -->
			<script type="text/javascript">
				(function($) {
					$('table .btn_tr_more a').click(function(e) {
						e.preventDefault();
						$(this).closest('table').find('tr.overflow').toggle();
						$(this).text($(this).text() == '더보기' ? '닫기' : '더보기');
					});
					$('.box_detail_series')
							.each(
									function() {
										$(this)
												.find('.btn_check_all')
												.click(
														function(e) {
															e.preventDefault();
															if ($(this).text() == '선택해제') {
																$(this)
																		.text(
																				'전체선택')
																		.closest(
																				'.box_detail_series')
																		.find(
																				'input:checkbox')
																		.attr(
																				'checked',
																				false);
															} else {
																$(this)
																		.text(
																				'선택해제')
																		.closest(
																				'.box_detail_series')
																		.find(
																				'input:checkbox')
																		.attr(
																				'checked',
																				true);
															}
														});
										$(this)
												.find('input:checkbox')
												.click(
														function() {
															$(this)
																	.closest(
																			'.box_detail_series')
																	.find(
																			'.btn_check_all')
																	.text(
																			$(
																					this)
																					.closest(
																							'.box_detail_series')
																					.find(
																							'input:checkbox:not(:checked)')
																					.size() ? '전체선택'
																					: '선택해제');
														});
									});
					$('.box_detail_article .btn_more')
							.click(
									function(e) {
										e.preventDefault();
										var $boxes = $(this).closest(
												'.box_detail_article').find(
												'.content');
										var isFirst = $boxes.first().is(
												':visible');
										var speed = isFirst ? 300 : 0;
										$('body, html')
												.animate(
														{
															scrollTop : $(this)
																	.closest(
																			'.box_detail_article')
																	.offset().top - 30 - 50
														}, speed);
										$boxes.eq(isFirst ? 0 : 1).hide();
										$boxes.eq(isFirst ? 1 : 0).show();
									});
				})(jQuery);
			</script>
			<!-- *** //e:상품정보 스크립트 *** -->
			<!-- *** //e:Contents - 상품정보 *** -->




			<!-- *** s:.tab_detail_content - 회원리뷰 *** -->
			<ul class="tab_detail_content" id="review">
				<li><a href="#book_info">상품정보</a></li>
				<li class="on"><a href="#review">회원리뷰 <span>(${dto.scoreCount})</span></a></li>
				<li><a href="#guide">교환/반품/품절</a></li>
			</ul>
			<!-- *** //e:.tab_detail_content - 회원리뷰 *** -->

			<!-- *** s:Contents - 회원리뷰 *** -->








			<!-- *** s:.box_detail_content - 회원리뷰 *** -->
			<div class="box_detail_content">
				<!-- *** s:간단리뷰 영역 *** -->

				<div id="review_simple"></div>







				<!-- *** s:klover 리뷰 상세 *** -->


				<!-- 16-07-28 Klover 간단리뷰/평점 -->
				<!-- Klover 간단리뷰/평점 -->
				<h2 class="title_detail_basic">
					Klover 리뷰 <span class="kloverTotal" id="kloverTotal">(0)</span>
				</h2>
				<!-- 리뷰작성 -->
				<form id="reviewFrm" name="reviewFrm" method="post" enctype=""
					encoding="" action="">
					<input type="hidden" name="barcode" value="9788932907741">
					<input type="hidden" name="ejkGb" value="KOR"> <input
						type="hidden" name="bookNm" value="파피용(양장본 HardCover)"> <input
						type="hidden" name="num" value=""> <input type="hidden"
						name="seq" value=""> <input type="hidden" name="regType"
						value=""> <input type="hidden" name="subReview" value="">
					<input type="hidden" name="sortType" value=""> <input
						type="hidden" name="orderType" value=""> <input
						type="hidden" name="gb" value="klover"> <input
						type="hidden" name="perPage" value="15"> <input
						type="hidden" name="pageNumber" value="1">

					<div class="box_detail_review" id="box_detail_review"></div>
				</form>
				<!-- *** s:간단리뷰 script *** -->
				<script type="text/javascript">
					(function($) {
						$('.list_share #cmt_share').hover(function() {
							$(this).find('#shareSocial').show();
						}, function() {
							$(this).find('#shareSocial').hide();
						}).find('a').focus(
								function() {
									$(this).addClass('focus');
									$(this).closest('#cmt_share').find(
											'#shareSocial').stop().show();
								}).blur(
								function() {
									$(this).removeClass('focus');
									if (!$(this).closest('#cmt_share').find(
											'.focus').size())
										$(this).closest('#cmt_share').find(
												'#shareSocial').fadeOut(10);
								});

						$('.comment_wrap .image>a').click(function(e) {
							e.preventDefault();
							$(this).parent().toggleClass('on');
						});
					})(jQuery);

					// 간단리뷰를 cmd단에서 불러오지 않고 ajax로 호출(상세페이지 오류 리스크 줄이기)
					var barcode = "9788932907741";
					var ejkGb = "KOR";
					var mallGb = "KOR";
					var pageNumber = jQuery(
							"#reviewFrm input[name='pageNumber']").val();
					//var pageNumber = 1;
					if (pageNumber == undefined || pageNumber == "") {
						pageNumber = 1;
					}

					(function($) {
						$(window)
								.scroll(
										function() {
											if ($('#box_detail_review').size()
													&& $('#box_detail_review')
															.is(':empty')
													&& $('#box_detail_review')
															.data('loading') != 1) {
												if ($('#box_detail_review')
														.offset().top < $(this)
														.scrollTop()
														+ $(this).height()
														&& $(
																'#box_detail_review')
																.offset().top > $(
																this)
																.scrollTop()) {
													$('#box_detail_review')
															.data('loading', 1);

													// 구매평점 갯수 조회
													var paymentCount = 0;

													jQuery
															.ajax({
																url : "/product/checkPayCnt.laf?gb=klover&barcode="
																		+ barcode
																		+ "&ejkGb="
																		+ ejkGb
																		+ "&mallGb="
																		+ mallGb
																		+ "&sortType=like"
																		+ "&pageNumber="
																		+ pageNumber
																		+ "&orderType=order",
																type : "POST",
																dataType : "json",
																data : null,
																jsonp : "callback",
																success : function(
																		data) {
																	paymentCount = data.result;
																	// 해당 도서의 구매평점이 0개인 경우
																	if (paymentCount == 0) {
																		jQuery(
																				"#box_detail_review")
																				.load(
																						"/product/productSimpleReviewSort.laf?gb=klover&barcode="
																								+ barcode
																								+ "&ejkGb="
																								+ ejkGb
																								+ "&mallGb="
																								+ mallGb
																								+ "&sortType=like"
																								+ "&pageNumber="
																								+ pageNumber
																								+ "&orderType=all");
																	}
																	// 해당 도서의 구매평점이 0개가 아닌 경우
																	else {
																		jQuery(
																				"#box_detail_review")
																				.load(
																						"/product/productSimpleReviewSort.laf?gb=klover&barcode="
																								+ barcode
																								+ "&ejkGb="
																								+ ejkGb
																								+ "&mallGb="
																								+ mallGb
																								+ "&sortType=like"
																								+ "&pageNumber="
																								+ pageNumber
																								+ "&orderType=order");
																	}
																},
																error : function(
																		data) {
																	jQuery(
																			"#box_detail_review")
																			.load(
																					"/product/productSimpleReviewSort.laf?gb=klover&barcode="
																							+ barcode
																							+ "&ejkGb="
																							+ ejkGb
																							+ "&mallGb="
																							+ mallGb
																							+ "&sortType=like"
																							+ "&pageNumber="
																							+ pageNumber
																							+ "&orderType=order");
																}

															});
												}
											}

											/* 성수기시 ajax 로드 참고
											if( $('#list_detail_booklog').size() && $('#list_detail_booklog').is(':empty') ){
												if( $('#list_detail_booklog').offset().top < $(this).scrollTop() + $(this).height() ){
													jQuery("#list_detail_booklog").load("/product/detailViewAreaLoad.laf?loadMode=booklogReview&barcode="+barcode+"&ejkGb="+ejkGb+"&mallGb="+mallGb+"&booklogCnt=" + booklogCnt);
												}
											}
											 */
										});
					})(jQuery);
				</script>
				

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
										&gt; <a href="http://www.kyobobook.co.kr/myroom/orderList.laf">반품/교환신청</a> 또는 고객센터 (1544-1900)
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
</body>
</html>
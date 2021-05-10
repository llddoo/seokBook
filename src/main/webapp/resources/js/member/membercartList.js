
$(document).ready(function(){
	//장바구니에 넣어둔 책 개수 표현
	$(".selectedbookcount").each(function(){
		const bookcount = $(this).siblings("input.forchecklist").val();
		$(this).val(bookcount);
	});
	
	//전체 체크 설정
	$("#allpurchaselist").prop("checked", true);
	$(".forpurchaselist").each(function(){
		$(this).prop("checked", true);
	});
	
	//페이지 시작하자마자 총 구매액 같은거 세팅
	const bookspcount = $("#listsize").val();
	let bookcountsum = 0;
	let bookpricesum = 0;
	$(".getPurchase").each(function(){
		bookcountsum += Number($(this).siblings("form").find("input[name='countlist']").val());
		bookpricesum += ($(this).siblings("form").find("input[name='countlist']").val()
						*$(this).siblings("input[name='price']").val());
	});
	$("#bookspcount").append(bookspcount);
	$("#bookcountsum").append(bookcountsum);
	$("#bookpricesum").append(bookpricesum);
});

//체크박스 관련(전체선택 버튼 눌렸을때)
$("#allpurchaselist").click(function(){
	const check = $(this).prop("checked");
	
	$(".forpurchaselist").each(function(){
		$(this).prop("checked", check);
	});
});

//체크박스 관련(개별선택 버튼 눌렸을때)
$(".forpurchaselist").click(function(){
	let value = true;
	$(".forpurchaselist").each(function(){
		if(!$(this).prop("checked")){
			value=false;
		}
	});
	$("#allpurchaselist").prop("checked", value);
});

//체크박스 관련(체크를 눌렀을때 전체 내역들 변경)
$(".check-click").click(function(){
	let checkedcount = 0;
	let bookcountsum = 0;
	let bookpricesum = 0;
	$(".forpurchaselist").each(function(){
		const thisis = $(this);
		if(thisis.prop("checked")){
			checkedcount++;
			const forcounting = Number(thisis.parent().siblings("input[name='countlist']").val());
			bookcountsum += forcounting;
			const forbookprice = Number(thisis.parent().siblings("input[name='price']").val());
			bookpricesum += (forcounting*forbookprice);
		}
	});
	$("#bookspcount").empty();
	$("#bookspcount").append(checkedcount);
	$("#bookcountsum").empty();
	$("#bookcountsum").append(bookcountsum);
	$("#bookpricesum").empty();
	$("#bookpricesum").append(bookpricesum);
});

const id = $("#forallcheck").val();

//장바구니에서 해당 항목을 제거
 $(".getDelete").click(function(){
	const isbn = $(this).siblings("form").find("input[name='isbnlist']").val();
	
	let check = confirm('장바구니에서 제거하시겠습니까?');
	if(check){
		$.ajax({
			type:"post",
			url:"./membercartDelete",
			data:{
				id:id,
				isbn:isbn
			},
			success:function(result){
				if(Number(result.trim())>0){
					alert('제거되었습니다.');
				}else{
					alert('이미 제거되었거나, 제거할 수 없습니다.');
				}
			}
		});
		location.href="./membercartList?id="+id;
	}
});	

//장바구니에서 하나만 구매하기 위함
$(".getPurchase").click(function(){
	const thisform = $(this).siblings("form");
	let check = confirm('이 책을 바로 구입하시겠습니까?');
	if(check){
		thisform.submit();
	}
});

//장바구니에서 구매하고 싶은 책의 개수를 지정
$(".changebookcount").click(function(){
	const bookcount = $(this).siblings("select[name='countlist']").val();
	const isbn = $(this).siblings("input[name='isbn']").val();
	$.ajax({
		type:"post",
		url:"./membercartUpdate",
		data:{
			bookcount:bookcount,
			isbn:isbn
		}
	});
	location.href="./membercartList?id="+id;
});

//장바구니에서 선택된 모든 항목을 전송
$("#allpurchase").click(function(){
	let isbnlist = new Array();
	let countlist = new Array();
	$(".forpurchaselist").each(function(){
		const isbn = $(this).parent().siblings("input[name='isbnlist']").val();
		const count = $(this).parent().siblings("input[name='countlist']").val();
		if($(this).prop("checked")==true){
			isbnlist.push(isbn);
			countlist.push(count);
		}
	});
	if(isbnlist.length>0){
		$("#allpurchase").parent().append("<form id='allpurchasetransform' method='post' action='../../purchase/purchaseWindow'></form>");
		for(let inputisbn of isbnlist){
			$("#allpurchasetransform").append("<input type='hidden' readonly='readonly' name='isbnlist' value='"+inputisbn+"'>");
		}
		for(let inputcount of countlist){
			$("#allpurchasetransform").append("<input type='hidden' readonly='readonly' name='countlist' value='"+inputcount+"'>");
		}
		$("#allpurchasetransform").submit();
	}else{
		alert("한 품목 이상 선택 되어야 합니다.")
	}
});

//장바구니에서 선택한 모든 항목을 지움
$("#allcartdelete").click(function(){
	let answer = confirm("선택된 품목들을 장바구니에서 지우시겠습니까?");
	if(answer){
		let cartNumlist = new Array();
		$(".forpurchaselist").each(function(){
			const cartNum = $(this).parent().siblings("input[name='cartNumlist']").val();
			if($(this).prop("checked")){
				cartNumlist.push(Number(cartNum));
			}
		});
		if(cartNumlist.length>0){
			$.ajax({
				type:"post",
				url:"./membercartDeleteList",
				traditional:true,
				data:{
					cartNumlist:cartNumlist
				}
			});
			location.href="./membercartList?id="+id;
		}else{
			alert("한 품목 이상 선택되어야 합니다.")
		}
	}
});
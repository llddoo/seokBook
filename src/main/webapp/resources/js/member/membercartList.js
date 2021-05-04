
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
});

//체크박스 관련
$("#allpurchaselist").click(function(){
	const check = $(this).prop("checked");
	
	$(".forpurchaselist").each(function(){
		$(this).prop("checked", check);
	});
});

$(".forpurchaselist").click(function(){
	let value = true;
	$(".forpurchaselist").each(function(){
		if(!$(this).prop("checked")){
			value=false;
		}
	});
	$("#allpurchaselist").prop("checked", value);
});

 const id = $("#forallcheck").val();

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

$(".getPurchase").click(function(){
	const thisform = $(this).siblings("form");
	let check = confirm('이 책을 바로 구입하시겠습니까?');
	if(check){
		thisform.submit();
	}
});

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
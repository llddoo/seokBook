
 $(".getCart").click(function(){
	const id = $(this).siblings("input[name='id']").val();
	const isbn = $(this).siblings("input[name='isbn']").val();
	const bookcount = $(this).siblings("select").val();
	if(id==''){
		alert('로그인을 하셔야 이용할 수 있습니다.');
		return;
	}
	$.ajax({
		type:"post",
		url:"./member/membercart/membercartInsert",
		data:{
			id : id,
			isbn : isbn,
			bookcount : bookcount
		},
		success:function(result){
			if(Number(result.trim())==0){
				alert('이미 장바구니에 담겨있거나 추가할수 없습니다.');
			}else{
				alert('장바구니에 추가되었습니다.');
			}
		}
	});
	return;
});
	
$(".getPurchase").click(function(){
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
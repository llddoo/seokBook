/**
 * 
 */
 $(".getCart").click(function(){
	const id = $(this).siblings("input[name='id']").val();
	const isbn = $(this).siblings("input[name='isbn']").val();
	const bookcount = $(this).siblings("select").val();
	moveBook(id, isbn, bookcount);
});
	
$(".getPurchase").click(function(){
	const id = $(this).siblings("input[name='id']").val();
	const isbn = $(this).siblings("input[name='isbn']").val();
	const bookcount = $(this).siblings("select").val();
	let list = [{"id":id, "isbn":isbn, "bookcount":bookcount}];
	let check = confirm('이 책을 바로 구입하시겠습니까?');
	if(check){
		$(this).parent().append("<form id='purchasethisitem'></form>");
		let purchasethisitem = $("form[id='#purchasethisitem']");
		purchasethisitem.append("<input name='id' value="+id+"><input name='isbn' value="+isbn+">");
		purchasethisitem.append("<input name='bookcount' value="+bookcount+">");
	}
});
	
function moveBook(id, isbn, bookcount){
	if(id==''){
		alert('로그인을 하셔야 이용할 수 있습니다.');
		return false;
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
	return true;
}
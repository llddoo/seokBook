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
	let check = moveBook(id, isbn, bookcount);
	if(check){
		location.href="./";
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
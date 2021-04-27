/**
 * 
 */
 $(".getDelete").click(function(){
	const id = $(this).siblings("form").find("input[name='id']").val();
	const isbn = $(this).siblings("form").find("input[name='isbn']").val();
	
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
/**
 * 
 */

 $(document).ready(function(){
	const pagerpre = $("#pagerpre").val();
	const pagernext = $("#pagernext").val();
	
	if(pagerpre=='false'){
		$("#prebutton").attr("class","page-item disabled");
		$("#prebutton").find("a").attr("href", "#");
	}
	if(pagernext=='false'){
		$("#nextbutton").attr("class","page-item disabled");
		$("#nextbutton").find("a").attr("href", "#");
	}
});
 const id = $("#forallcheck").val();

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

$("#allpurchase").click(function(){
	
});

$("#allcartdelete").click(function(){
	$.ajax({
		url:"./membercartDelete",
		type:"post",
		data:{
			id:id
		},
		success:function(result){
			if(Number(result.trim())==0){
				alert("장바구니를 비우는 도중 문제가 발생했습니다.");
			}
		}
	});
	location.href="./membercartList?id="+id;
});
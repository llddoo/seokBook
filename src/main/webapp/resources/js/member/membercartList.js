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
	
	$(".selectedbookcount").each(function(){
		const bookcount = $(this).siblings("input.forchecklist").val();
		$(this).val(bookcount);
	});
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
				alert("장바구니가 이미 비어있습니다.");
			}
		}
	});
	location.href="./membercartList?id="+id;
});
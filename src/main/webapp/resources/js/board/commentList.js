/**
 * 
 */
 const subnum = $("#subnum").val();
	getList();


$("#comment").on("click", "#remove", function(){
	const ar = [];
	$(".del").each(function(){
		let ch = $(this).prop("checked");
		if(ch){
			ar.push($(this).val());
		}
	});
	
	$.ajax({
		type: "POST",
		url: "./response/responseDelete",
		traditional: true,
		data:{commentNum:ar},
		success:function(data){
			alert(data);
		}
	});
	
});


function getList(){
	$.get("./response/responseList?subnum="+subnum, function(data){
		$("#comment").html(data.trim());
	});
}

$("#write").click(function(){
	let id = $("#id").val();
	let content = $("#content").val();
	
	$.post("./response/responseInsert", 
	{
		subnum:subnum,
		id:id,
		content:content
	}, 
	function(data){
		data = data.trim();
		if(data==1){
			alert('등록 성공');
			$("#id").val('');
			$("#content").val('');
			getList();
		}else {
			alert('등록 실패');
		}
	});
	
});
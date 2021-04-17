/**
 * 
 */
 const subnum=$("#subnum").val();
$(document).ready(getList());

$("#comment").on("click", ".commentdelete",function(){
	const resnum = $(this).siblings("input").val();
	$.ajax({
		type: "get",
		url: "./response/responseDelete",
		data:{resnum:resnum},
		success:function(){
			getList();
		}
	});
});
$(".commentdelete").click(function(){
	alert("확인");
});


function getList(){
	$.get("./response/responseList?subnum="+subnum, function(data){
		$("#comment").html(data.trim());
	});
};

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
			$("#content").val('');
			$('#content').summernote('reset');
			getList();
		}else {
			alert('등록 실패');
		}
	});
});

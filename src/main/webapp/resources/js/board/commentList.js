/**
 * 
 */
 const subnum=$("#subnum").val();
let resnum;
$(document).ready(getList());



$("#comment").on("click", ".commentdelete",function(){
	resnum = $(this).siblings("input").val();
	$.ajax({
		type: "get",
		url: "./response/responseDelete",
		data:{resnum:resnum, subnum:subnum},
		success:function(){
			getList();
		}
	});
});

$("#comment").on("click", ".commentupdate",function(){
	resnum = $(this).siblings("input").val();
	const content = $(this).parents("tr").siblings("tr").find("td");
	let comment = content.html();
	content.append("<input type=\"hidden\" readonly=\"readonly\" id=\"\"><textarea id=\"rewrite\"></textarea>");
	$("#rewrite").val(comment);
	content.append("<br><button id=\"transrewrite\">작성</button>");
});

$("#transrewrite").click(function(){
	$.ajax({
		type: "post",
		url: "./response/responseUpdate",
		data:{resnum:resnum, subnum:subnum},
		success:function(){
			getList();
		}
	});
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

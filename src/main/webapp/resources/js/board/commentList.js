/**
 * 
 */
 let updatenum=-1;
 const subnum=$("#subnum").val();
 $(document).ready(function(){
	$('#content').summernote({
			lang:"ko-KR",
			height: 200,
			mingheight: 200,
			maxheight: 200,
			disableResizeEditor: true,
			placeholder: '글 작성',
	});
	$('.note-statusbar').hide();
	$('.note-toolbar').hide();
	getList();
});


$("#comment").on("click", ".commentdelete",function(){
	const resnum = $(this).siblings("input.selectresnum").val();
	const step = $(this).siblings("input.selectstep").val();
	const depth = $(this).siblings("input.selectdepth").val();
	$.ajax({
		type: "get",
		url: "./response/responseDelete",
		data:{resnum:resnum, subnum:subnum, step:step, depth:depth},
		success:function(result){
			result=result.trim();
			if(result>0){
				getList();
			}else{
				alert('이미 삭제된 글이거나, 삭제할 수 없습니다.');
				getList();
			}
		}
	});
});

$("#comment").on("click", ".commentupdate",function(){
	if(updatenum!=-1){
		const preupdate = $("input[value='"+updatenum+"']").parents("td[colspan='4']");
		const reservetext = preupdate.find("div.commentcontent").html();
		preupdate.empty();
		preupdate.append("<div class=\"commentcontent\">"+reservetext+"</div>");
	}
	const resnum = $(this).siblings("input.selectresnum").val();
	const content = $(this).parents("tr").siblings("tr").find("td");
	const comment = content.html();
	content.append("<br><input id=\"forupdate\" type=\"hidden\" readonly=\"readonly\" value=\""+resnum+"\">");
	content.append("<textarea id=\"rewrite\"></textarea>");
	$("#rewrite").summernote();
	$('.note-statusbar').hide();
	$('.note-toolbar').hide();
	$("#rewrite").summernote('code',comment);
	$('#rewrite').val(comment);
	content.append("<br><button id=\"transrewrite\" class=\"btn btn-danger\">작성</button>");
	updatenum=resnum;
});

$("#comment").on("click", "#transrewrite",function(){
	const resnum = parseInt($("#forupdate").val());
	const content = $("#rewrite").val();
	if(content.trim()==""){
		alert("입력할 수 없습니다.");
		return;
	}
	$.ajax({
		type: "post",
		url: "./response/responseUpdate",
		data:{
			resnum:resnum, 
			content:content
			},
		success:function(result){
			result=result.trim();
			if(result>0){
				getList();
			}else{
				alert("글을 수정할 수 없습니다.");
			}
		}
	});
});

$("#comment").on("click", ".commentreply", function(){
	if(updatenum!=-1){
		const preupdate = $("input[value='"+updatenum+"']").parents("td[colspan='4']");
		const reservetext = preupdate.find("div.commentcontent").html();
		preupdate.empty();
		preupdate.append("<div class=\"commentcontent\">"+reservetext+"</div>");
	}
	const resnum = $(this).siblings("input.selectresnum").val();
	const content = $(this).parents("tr").siblings("tr").find("td");
	const step = $(this).siblings("input.selectstep").val();
	const depth = $(this).siblings("input.selectdepth").val();
	content.append("<br><input id=\"forinsert\" type=\"hidden\" readonly=\"readonly\" value=\""+resnum+"\">");
	content.append("<textarea id=\"rewrite\"></textarea>");
	content.append("<input id=\"replystep\" type=\"hidden\" readonly=\"readonly\" value=\""+step+"\">");
	content.append("<input id=\"replydepth\" type=\"hidden\" readonly=\"readonly\" value=\""+depth+"\">");
	$("#rewrite").summernote();
	$('.note-statusbar').hide();
	$('.note-toolbar').hide();
	content.append("<br><button id=\"transreply\" class=\"btn btn-danger\">작성</button>");
	updatenum=resnum;
});

$("#comment").on("click", "#transreply", function(){
	const id = $("#id").val();
	const content = $("#rewrite").val();
	const step = $("#replystep").val();
	const depth = $("#replydepth").val();
	if(content.trim()==""){
		alert("입력할 수 없습니다.");
		return;
	}
	$.ajax({
		method: "post",
		url:"./response/responseInsert",
		data:{
			id:id,
			content:content,
			subnum:subnum,
			step:step+1,
			depth:depth+1
		},
		success:function(result){
			result=result.trim();
			if(result==1){
				getList();
			}else{
				alert('등록 실패');
			}
		}
	});
});

function getList(){
	$.get("./response/responseList?subnum="+subnum, function(data){
		$("#comment").html(data.trim());
	});
};

$("#write").click(function(){
	const id = $("#id").val();
	let content = $("#content").val();
	if(content.trim()==""){
		alert("입력할 수 없습니다.");
		return;
	}
	$.post("./response/responseInsert", 
	{
		subnum:subnum,
		id:id,
		content:content,
		depth:0
	}, 
	function(result){
		result = result.trim();
		if(result==1){
			$("#content").val('');
			$('#content').summernote('reset');
			getList();
		}else {
			alert('등록 실패');
		}
	});
});

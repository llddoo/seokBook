
let updatenum=-1;
const subnum=$("#subnum").val();
 
function getList(){
	const curPage = $("#currentPage").val();
	const curBlock = $("#curBlock").val();
	const boardsp = $("#boardsp").val();
	$.ajax({
		type:"get",
		url:"./response/responseList",
		data:{
			subnum:subnum,
			boardsp:boardsp,
			curPage:curPage,
			curBlock:curBlock,
			perPage:10,
			perBlock:5
		},
		success:function(data){
			$("#comment").html(data.trim());
			$(".commentcontent").each(function(){
				$(this).css("display","inline-block");
			});
			const preavail = $("#preavail").val();
			const nextavail = $("#nextavail").val();
			if(preavail==='false'){
				$("#prebutton").attr("class","page-item disabled");
			}
			if(nextavail==='false'){
				$("#nextbutton").attr("class","page-item disabled");
			}
			$(".regdateloca").css("width", '20%');
			$(".buttonloca").css("width", '25%');
			if($("#boardsp").val()=='oldbooksale'||$("#boardsp").val()=='saleend'){
				$(".commentreply").each(function(){
					$(this).remove();
				});
			}
		}
	});
};
 
 $(document).ready(function(){
	$('#content').summernote({
			height: 200,
			mingheight: 200,
			maxheight: 200,
			disableResizeEditor: true,
			disableDragAndDrop:true,
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
	const content = $(this).parents("tr").siblings("tr").find("td[colspan='3']");
	const resnum = $(this).siblings("input.selectresnum").val();
	const temp = content.find("input[value='"+updatenum+"']").attr("id");
	if(updatenum==resnum&&temp=="forupdate"){
		getList();
		return;
	}else if(updatenum!=-1){
		const preupdate = $("input[value='"+updatenum+"']").parents("td[colspan='3']");
		const reservetext = preupdate.find("div.forpacking").html();
		preupdate.empty();
		preupdate.append("<div class=\"forpacking\">"+reservetext+"</div>");
	}
	const comment = content.find("div.commentcontent").html();
	content.append("<br><input id=\"forupdate\" type=\"hidden\" readonly=\"readonly\" value=\""+resnum+"\">");
	content.append("<textarea id=\"rewrite\"></textarea>");
	$('#rewrite').summernote({
  		disableDragAndDrop: true
	});
	$('#rewrite').summernote('code', comment);
	$('.note-statusbar').hide();
	$('.note-toolbar').hide();
	
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
	const resnum = $(this).siblings("input.selectresnum").val();
	const content = $(this).parents("tr").siblings("tr").find("td[colspan='3']");
	const temp = content.find("input[value='"+updatenum+"']").attr("id");
	if(updatenum==resnum&&temp=="forinsert"){
		getList();
		return;
	}else if(updatenum!=-1){
		const preupdate = $("input[value='"+updatenum+"']").parents("td[colspan='3']");
		const reservetext = preupdate.find("div.forpacking").html();
		preupdate.empty();
		preupdate.append("<div class=\"forpacking\">"+reservetext+"</div>");
	}
	const step = $(this).siblings("input.selectstep").val();
	const depth = $(this).siblings("input.selectdepth").val();
	content.append("<br><input id=\"forinsert\" type=\"hidden\" readonly=\"readonly\" value=\""+resnum+"\">");
	content.append("<textarea id=\"rewrite\"></textarea>");
	content.append("<input id=\"replystep\" type=\"hidden\" readonly=\"readonly\" value=\""+step+"\">");
	content.append("<input id=\"replydepth\" type=\"hidden\" readonly=\"readonly\" value=\""+depth+"\">");
	$('#rewrite').summernote({
			disableResizeEditor: true,
			disableDragAndDrop:true,
			placeholder: '글 작성',
	});
	$('.note-statusbar').hide();
	$('.note-toolbar').hide();
	content.append("<br><button id=\"transreply\" class=\"btn btn-danger\">작성</button>");
	updatenum=resnum;
});

$("#comment").on("click", "#transreply", function(){
	const resnum = $("#forinsert").val();
	const id = $("#id").val();
	const content = $("#rewrite").val();
	const step = Number($("#replystep").val())+1;
	const depth = Number($("#replydepth").val())+1;
	if(content.trim()==""){
		alert("입력할 수 없습니다.");
		return;
	}
	$.ajax({
		method: "post",
		url:"./response/responseInsert",
		data:{
			resnum:resnum,
			id:id,
			content:content,
			subnum:subnum,
			step:step,
			depth:depth
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

$("#comment").on("click", ".pagesetting", function(){
	$("#currentPage").val($(this).val());
	getList();
});

$("#comment").on("click", "#prebutton", function(){
	if($("#prebutton").attr("class")==="page-item disabled"){
		return;
	}
	const curBlock = $("#curBlock").val();
	$("#curBlock").val(Number(curBlock)-1);
	getList();
});

$("#comment").on("click", "#nextbutton", function(){
	if($("#nextbutton").attr("class")==="page-item disabled"){
		return;
	}
	const curBlock = $("#curBlock").val();
	$("#curBlock").val(Number(curBlock)+1);
	getList();
});
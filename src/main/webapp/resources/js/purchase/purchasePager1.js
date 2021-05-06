/**
 * 
 */


const preavail = $("#preavail").val();
const nextavail = $("#nextavail").val();
const curBlock = $("#curBlock").val();

$(document).ready(function(){
	if(preavail==='false'){
		$("#prebutton").attr("class","page-item disabled");
	}
	if(nextavail==='false'){
		$("#nextbutton").attr("class","page-item disabled");
	}
});

$("#prebutton").click(function(){
	if(preavail==='false'){
		return;
	}
	$("#curBlock").val(Number(curBlock)-1);
	$("#getListSearching").submit();
});

$("#nextbutton").click(function(){
	if(nextavail==='false'){
		return;
	}
	$("#curBlock").val(Number(curBlock)+1);
	$("#getListSearching").submit();
});

$(".pagesetting").click(function(){
	const curPage = $(this).val();
	$("#curPage").val(Number(curPage));
	$("#getListSearching").submit();
});
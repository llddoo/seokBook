
//board의 종류를 저장하고 있음
const boardsp = $("#boardsp").text();
//pager에서 이전 블록이 존재하는지 여부
const preavail = $("#preavail").val();
//pager에서 이후 블록이 존재하는지 여부
const nextavail = $("#nextavail").val();
//현재 블럭이 몇번째 블럭인지 저장
const curBlock = $("#curBlock").val();

//페이저가 시작할 때 next, pre 존재여부 판단 후 비활성화작업
$(document).ready(function(){
	if(preavail==='false'){
		$("#prebutton").attr("class","page-item disabled");
	}
	if(nextavail==='false'){
		$("#nextbutton").attr("class","page-item disabled");
	}
});

//pre버튼을 눌렀을때 현재페이지는 그대로 있어도 블럭은 교체
$("#prebutton").click(function(){
	if(preavail==='false'){
		return;
	}
	$("#curBlock").val(Number(curBlock)-1);
	$("#getListSearching").submit();
});

//next버튼을 눌렀을때 현재페이지는 그대로 있어도 블럭은 교체
$("#nextbutton").click(function(){
	if(nextavail==='false'){
		return;
	}
	$("#curBlock").val(Number(curBlock)+1);
	$("#getListSearching").submit();
});

//페이지를 눌렀을 때, 해당 페이지의 목록을 불러올 수 있게 세팅
$(".pagesetting").click(function(){
	const curPage = $(this).val();
	$("#curPage").val(Number(curPage));
	$("#getListSearching").submit();
});
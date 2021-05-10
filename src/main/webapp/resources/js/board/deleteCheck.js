/**
 * 
 */
 const deleteCheck = document.getElementById("deleteCheck");
 deleteCheck.addEventListener("click", function(){
	const boardsp = $("#boardsp").val();
	const subnum = $("#subnum").val();
	
	let result = confirm("삭제하시겠습니까?");
	
	
	if(result){
		$.get("./boardDelete?boardsp="+boardsp+"&subnum="+subnum);	
	}
});
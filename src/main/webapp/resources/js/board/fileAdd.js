/**
 * 
 */
 
 let count=$("#files").attr("title");
$("#add").click(function(){
	if(count < 5){
		let contents = $("#sample").html();
		$("#files").append(contents);
		count++;
	}else {
		alert("5개 제한");
	}
});

$("#del").click(function(){
	$("#files").empty();
});

$("#files").on("click", ".delete", function(){
	$(this).parent().remove();
	count--;
});
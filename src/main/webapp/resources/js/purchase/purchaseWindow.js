
$(document).ready(function(){
	const id = $("#getUserInfo").val();
	$.ajax({
		type:"get",
		url:"../member/selectUserInfo",
		data:{
			id:id
		},
		success:function(result){
			result=result.trim();
			$("#userInfo").append(result);
		}
	});
	
});
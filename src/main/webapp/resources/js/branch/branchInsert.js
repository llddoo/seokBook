/**
 * 
 */

$("#btn").click(function(){
	let result =true;
	
	$(".myCheck").each(function(s1, s2){
		console.log(s1);
		console.log($(s2).val());
		console.log($(this).val());
		if($(this).val()==""){
			result = false;
		}
	});
	
	if(result) {
		$("#frm").submit();
	}else {
		alert("정보가 입력되지 않았습니다");
	}
});
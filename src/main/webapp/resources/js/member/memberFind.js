/**
 * 
 */

$("#idBtn").on("click", function(){
	const email = $("#email").val();
	$.ajax({
		method:"get",
		//컨트롤러에 보낼 주소 , 컨트롤러에서 jsp로 보낼주소
		url:"./memberSearchId",
		data:{
			
	//보낼데이터  이름   //실제 데이터이름
			email:email
		},
		success:function(result){
			result=result.trim();
			if(result==='null'){
				alert("일치하는 아이디가 없습니다.");
			}else {
				alert("아이디는:"+result);
			}
		}
	});
	
	
});


$("#pwBtn").on("click", function(){
	const id = $("#id").val();
	const email = $("#email").val();
	$.ajax({
		method:"get",
		//컨트롤러에 보낼 주소 , 컨트롤러에서 jsp로 보낼주소
		url:"./memberSearchPw",
		data:{
			
	//보낼데이터  이름   //실제 데이터이름
			id:id,
			email:email
		},
		success:function(result){
			result=result.trim();
			if(result==='null'){
				alert("일치하는 아이디가 없습니다.");
			}else {
				alert("비밀번호:"+result);
			}
		}
	});
	
	
});
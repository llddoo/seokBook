/**
 * 
 */

$("#pointUp").on("click", function(){
	$.ajax({
		method:"get",
		//컨트롤러에 보낼 주소 , 컨트롤러에서 jsp로 보낼주소
		url:"./memberPoint",
		data:{
			
	//보낼데이터  이름   //실제 데이터이름
			id:session.getId()
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

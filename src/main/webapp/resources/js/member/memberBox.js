/**
 * 
 */
$("#boxBtn").on("click", function(){
	const purnum = $("#purnum").val();
	$.ajax({
		method:"get",
		//컨트롤러에 보낼 주소 , 컨트롤러에서 jsp로 보낼주소
		url:"./memberBox",
		data:{
			
	//보낼데이터  이름   //실제 데이터이름
			purnum:purnum,

		},
		success:function(DTO){
			DTO=DTO.trim();

				alert(DTO+"배송조회중");
			
		}
	});
	
	
});
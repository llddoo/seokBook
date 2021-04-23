/**
 * 
 */
let email = document.getElementById("email");

btn.addEventListener("click", function(){
	for(let e of etc){
		if(e.value == ""){
			etcResult=false;
			break;
		}
	}
	
	//조건이 만족하면
	if(idCheckResult && pwCheckResult && pwEqualResult && etcResult){
		let find = document.getElementById("find");
		//frm.submit();
		alert("11111111111");
	}else {
		alert("일치하는 아이디가 없습니다.");
	}
});
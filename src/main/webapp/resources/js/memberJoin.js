/**
 * 
 */
let id = document.getElementById("id");
let pw = document.getElementById("pw");
let pw2 = document.getElementById("pw2");
let btn = document.getElementById("btn");
let etc = document.getElementsByClassName("etc");
let idResult = document.getElementById("idResult");
	
let idCheckResult = false; // id check 결과
let pwCheckResult = false; // pw check 결과
let pwEqualResult = false; // pw equal 결과
let etcResult=true		   // name, email, phone 결과


// ID Check *********************************
id.addEventListener("blur", function(){
	let message = "6글자 미만입니다";
	let c = "r1"
	if(id.value.length>5){
		message = "6글자 이상 입니다";
		c = "r2";
		idCheckResult=true;
	}else {
		idCheckResult=false;
	}
	
	idResult.innerHTML=message;
	idResult.setAttribute("class", c);
	
});

$("#id").blur(function(){
	id=$("id").val();
	$get("./memerIdCheck?id="+id,function(result){
		result = result.trim();
		let str="사용 가능한 ID 입니다"
		if(result='0'){
			str="중복 ID입니다"
			
		}

	})
})



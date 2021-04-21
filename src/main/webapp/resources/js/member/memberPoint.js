/**
 * 
 */
$('.memberPoint').click(function() {


$.ajax({

    url: "/member/memberFile/memberPage", // 클라이언트가 요청을 보낼 서버의 URL 주소
 	type: "POST",     // HTTP 요청 방식(GET, POST)

    data: { memberDTO:
			 },                // HTTP 요청과 함께 서버로 보낼 데이터

                           
	})
})
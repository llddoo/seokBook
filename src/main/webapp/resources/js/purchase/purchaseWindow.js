

$(document).ready(function(){
	var IMP = window.IMP;
	IMP.init("iamport");
	
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

$('#manual-ajax').click(function(event) {
	event.preventDefault();
	this.blur();
	const id = $("#getUserInfo").val();
	const location = this.href;
	$.post(location, {id:id},function(html){
		$(html).appendTo('body').modal();
	});
	if(location==="../address/addressInsertform"){
		
	}else{
		
	}
});

$("#addressInsert").click(function(){
	$(".frm-chk").each(function(){
		const thisform = $(this);
		if(thisfor.attr(id)!='sample6_detailAddress'){
			if(thisform.val()===''){
				alert('비어있는 항목이 존재합니다.');
				return;
			}
		}
	});
	const id = $("#getUserInfo").val();
	const postcode = $("#sample6_postcode").val();
	const address = $("#sample6_address").val()+' '+$("#sample6_detailAddress").val()+' '+$("#sample6_extraAddress").val();
	const name = $("#sample6_name").val();
	const phonecall = $("#sample6_phonecall").val();
	$.post({
		url:"../address/addressInsert",
		data:{
			id:id,
			postcode:postcode,
			address:address,
			name:name,
			phonenum:phonecall
		},
		success:function(result){
			result=Number(result.trim());
			if(result>0){
				$.modal.close();
				$("#useraddresslist").empty();
				
			}else{
				alert('전송에 실패하였습니다. 다시 시도해 주세요.');
			}
		}
	});
});

$("#payment").click(function(){
	IMP.request_pay({
	    pg: "html5_inicis",
	    pay_method: "card",
	    merchant_uid: "ORD20340132-0012311",
	    name: "노르",
	    amount: 64900,
	    buyer_email: "gildong@gmail.com",
	    buyer_name: "홍길동",
	    buyer_tel: "010-4242-4242",
	    buyer_addr: "서울특별시 강남구 신사동",
	    buyer_postcode: "01181"
  	},
  	function(rsp) {
		if ( rsp.success || resp.error_msg==='' ) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
	});
});
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
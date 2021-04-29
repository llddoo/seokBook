const id = $("#getUserInfo").val();
const allitemprice = $("#allpricesum").val();

$(document).ready(function(){
	//결제관련 api를 사용하기 위한 조건
	var IMP = window.IMP;
	IMP.init("iamport");
	
	//유저 정보 불러오기
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
	
	//유저 최근에 사용한 주소 불러오기
	$.ajax({
		type:"post",
		url:"../address/addressSelect",
		data:{
			id:id
		},
		success:function(result){
			result=result.trim();
			$("#useraddresslist").append(result);
		}
	});
	
	//결제관련 side 창 불러오기
	$.post({
		url:"./purchaseSidebar",
		data:{
			itemsprice:allitemprice,
			point:0
		},
		success:function(result){
			result=result.trim();
			$("#floatforpurchasing").append(result);
		}
	});
});

//모달창 띄우는 알고리즘
$("body").on("click", '#manual-ajax', function(event) {
	event.preventDefault();
	this.blur();
	const location = this.href;
	$.post(location, {id:id},function(html){
		$(html).appendTo('body').modal();
	});
});

//addressList에서 addressInsert를 누르면 넘어갈 수 있게 하기 위한 코드
$("body").on("click", '#insert-ajax', function(event) {
	event.preventDefault();
	this.blur();
	const location = this.href;
	$.post(location, {id:id},function(html){
		$(html).appendTo('body').modal();
	});
});

//주소 리스트에서 주소 선택
$("body").on("click", '.selectThisAddress', function() {
	const adrnum = $(this).siblings(".selectedAddressNumber").val();
	$.post({
		url:"../address/addressSelect",
		data:{
			id:id,
			adrnum:adrnum
		},
		success:function(result){
			result=result.trim();
			$.modal.close();
			$("#useraddresslist").empty();
			$("#useraddresslist").append(result);
		}
	});
});

//주소 리스트에서 주소를 지우는 알고리즘
$("body").on("click", '.selectRemoveAddress', function() {
	const adrnum = $(this).siblings(".selectedAddressNumber").val();
	let removeCheck = confirm('선택한 주소를 지우시겠습니까?');
	if(removeCheck){
		$.post({
			url:"../address/addressDelete",
			data:{
				id:id,
				adrnum:adrnum
			},
			success:function(result){
				result=Number(result.trim());
				if(result>0){
					alert('해당 주소를 지웠습니다.');
				}else{
					alert('해당 주소를 지우는 중 에러가 발생했습니다.');
				}
			}
		});
		$.modal.close();
		$.ajax({
			type:"post",
			url:"../address/addressSelect",
			data:{
				id:id
			},
			success:function(result){
				result=result.trim();
				$("#useraddresslist").empty();
				$("#useraddresslist").append(result);
			}
		});
	}
});

//모달창에서 주소 추가하는 알고리즘
$("body").on("click", "#addressInsert", function(){
	let frmchk = true;
	$(".frm-chk").each(function(){
		const thisform = $(this);
		if(thisform.attr('id')!='sample6_detailAddress'){
			if(thisform.val().trim()===''){
				alert('비어있는 항목이 존재합니다.');
				frmchk=false;
				return;
			}
		}
	});
	if(!frmchk){
		return;
	}
	const postcode = $("#sample6_postcode").val().trim();
	const address = $("#sample6_address").val().trim()+' '
					+$("#sample6_detailAddress").val().trim()+' '
					+$("#sample6_extraAddress").val().trim();
	const name = $("#sample6_name").val().trim();
	const phonenum = $("#sample6_phonenum").val().trim();
	$.post({
		url:"../address/addressInsert",
		data:{
			id:id,
			postcode:postcode,
			address:address,
			name:name,
			phonenum:phonenum
		},
		success:function(result){
			result=Number(result.trim());
			if(result>0){
				$.modal.close();
				$("#useraddresslist").empty();
				
				//배송주소를 입력했기 때문에 modal창을 종료하고 입력한 내용을 집어넣는다.
				$.post({
					url:"../address/addressSelect",
					data:{
						id:id
					},
					success:function(result){
						result = result.trim();
						if(result===''){
							alert('오류가 발생했습니다. 다시 실행해 주세요');
						}else{
							$("#useraddresslist").append(result);
						}
					}
				});
				
			}else{
				alert('전송에 실패하였습니다. 다시 시도해 주세요.');
			}
		}
	});
});
	
//다음 주소 찾기
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

function applyPoint(){
	const pointToUse = $("#typingpoint").val();
	if(pointToUse>$("#typingpoint").attr("max")){
		alert('가지고 있는 포인트보다 높게 적으셨습니다.');
		$("#typingpoint").val($("#typingpoint").attr("max"));
		return;
	}
	$.post({
		url:"./purchaseSidebar",
		data:{
			point:pointToUse,
			itemsprice:allitemprice
		},
		success:function(result){
			result=result.trim();
			$("#floatforpurchasing").empty();
			$("#floatforpurchasing").append(result);
		}
	});
}

$("#floatforpurchasing").on("click", "#demobutton", function(){
	if($(this).find("i").attr("class")=='fas fa-chevron-down'){
		$(this).find("i").attr("class","fas fa-chevron-up");
	}else{
		$(this).find("i").attr("class","fas fa-chevron-down");
	}
});

//결제버튼
$("#floatforpurchasing").on("click", "#payment", function(){
	if(!$("#checkboxChecking").val()){
		alert('약관에 동의하셔야 합니다.');
		return;
	}
	
	const buyer_name = $("#getUserName").val();
	const buyer_email = $("#getUserEmail").val();
	const buyer_tel = $("#getUserPhonenum").val();
	const buyer_postcode = $("#getterpostcode").val();
	const buyer_addr = $("#getteraddress").val();
	const name = $("#purchasename").val();
	const amount = $("#allpricesum").val();
	const date = new Date();
	const merchant_uid = "BS-"+date.getTime()+"-"+id+"-"+date.getFullYear()+date.getMonth()
							+date.getDay()+date.getHours()+date.getMinutes()+date.getSeconds();
	IMP.request_pay({
	    pg: "html5_inicis",
	    pay_method: "card",
	    merchant_uid: merchant_uid,
	    name: name,
	    amount: amount,
	    buyer_email: buyer_email,
	    buyer_name: buyer_name,
	    buyer_tel: buyer_tel,
	    buyer_addr: buyer_addr,
	    buyer_postcode: buyer_postcode
  	},
  	function(rsp) {
		if ( rsp.success ) {
			var msg = '결제가 완료되었습니다.\n';
			msg += '고유ID : ' + rsp.imp_uid+'\n';
			msg += '상점 거래ID : ' + rsp.merchant_uid+'\n';
			msg += '결제 금액 : ' + rsp.paid_amount+'\n';
			msg += '카드 승인번호 : ' + rsp.apply_num+'\n';
			alert(msg);
			
			$.post({//각자의 책에 대한 값만 지정해 주면 된다.//적혀있는 책들을 보고 장바구니에 있는 것들은 장바구니에서 제거해주고, 장바구니에 없다면 그냥 둔다.
				
			});
			$("body").append("<form id='purchaseComplete' action='./purchaseComplete' method='post'></form>");
			$("#purchaseComplete").append('<input type="hidden" readonly="readonly" name="id" value="'+id+'">');
			$("#purchaseComplete").submit();
		}else{
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
	});
});
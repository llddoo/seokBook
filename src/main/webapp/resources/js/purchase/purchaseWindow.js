
const id = $("#getUserInfo").val();
const allitemprice = $("#allpricesum").val();
const willgetpoint = $("#willgetpoint").val();

var clickHandler = true;

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
	
	//modal용 주소창 불러오기
	$.post({
		url:"../address/addressList",
		data:{
			id:id
		},
		success:function(result){
			result=result.trim();
			$("#menu1").append(result);
		}
	});
	
	//결제관련 side 창 불러오기
	$.post({
		url:"./purchaseSidebar",
		data:{
			itemsprice:allitemprice,
			point:0,
			willgetpoint:willgetpoint
		},
		success:function(result){
			result=result.trim();
			$("#floatforpurchasing").prepend(result);
		}
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
					swal('해당 주소를 지웠습니다.');
					$.post({
						url:"../address/addressList",
						data:{
							id:id
						},
						success:function(result){
							result=result.trim();
							$("#menu1").empty();
							$("#menu1").append(result);
						}
					});
				}else{
					swal('해당 주소를 지우는 중 에러가 발생했습니다.',"에러사유 : 서버오류","error");
				}
			}
		});
	}
});

//모달창에서 주소 추가하는 알고리즘
$("body").on("click", "#addressInsert", function(){
	let frmchk = true;
	$(".frm-chk").each(function(){
		const thisform = $(this);
		if(thisform.attr("id")!='sample6_extraAddress'&&thisform.val().trim()===''){
			swal("입력에러",'비어있는 항목이 존재합니다.',"error");
			frmchk=false;
			return false;
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
				$.post({
					url:"../address/addressSelect",
					data:{
						id:id
					},
					success:function(result){
						result = result.trim();
						if(result===''){
							swal('오류가 발생했습니다.', '에러 : 서버오류','error');
						}else{
							$.modal.close();
							$("#useraddresslist").empty();
							$("#useraddresslist").append(result);
							
							$.post({
								url:"../address/addressList",
								data:{
									id:id
								},
								success:function(result){
									result=result.trim();
									$("#menu1").empty();
									$("#menu1").append(result);
									$(".frm-chk").each(function(){
										const thisinputs = $(this);
										if(thisinputs.attr("type")!='hidden'){
											thisinputs.val('');
										}
									});
								}
							});
						}
					}
				});
				
			}else{
				swal('에러발생, 다시 실행해주세요', '에러 : 전송불가', 'error');
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

//purchase바의 약관동의 아이콘 변경 딜레이
$("#floatforpurchasing").on("click", "#demobutton", function(){
	if(clickHandler){
		clickHandler = false;
		if($("#floatforpurchasing").find("i").attr("class")=='fas fa-chevron-down'){
			$("#floatforpurchasing").find("i").attr("class","fas fa-chevron-up");
		}else{
			$("#floatforpurchasing").find("i").attr("class","fas fa-chevron-down");
		}
		setTimeout(function(){clickHandler=true}, 380);
	}
});

//포인트 적용.(제한사항 적용)
function applyPoint(){
	const pointToUse = Number($("#typingpoint").val());
	if(pointToUse>Number($("#typingpoint").attr("max"))){
		swal("입력에러",'가지고 있는 포인트보다 높게 적으셨습니다.',"error");
		$("#typingpoint").val(Number($("#typingpoint").attr("max")));
		return;
	}else if(pointToUse>allitemprice){
		swal("입력에러",'결제 금액보다 더 많이 입력할 수 없습니다.',"error");
		$("#typingpoint").val(allitemprice);
		return;	
	}
	$.post({
		url:"./purchaseSidebar",
		data:{
			point:pointToUse,
			itemsprice:allitemprice,
			willgetpoint:willgetpoint
		},
		success:function(result){
			result=result.trim();
			$("#sidebarajaxdelete").remove();
			$("#floatforpurchasing").prepend(result);
		}
	});
}

//결제버튼
$("#floatforpurchasing").on("click", "#payment", function(){
	if($("#checkboxChecking").prop("checked")==false){
		swal('결제 실패',"약관에 동의하셔야 합니다.","error");
		return;
	}
	let checkingcount = 0;
	let checkingboolean = true;
	$(".trans-chk").each(function(){
		checkingcount++;
		if($(this).val()==''){
			checkingboolean=false;
		}
	});
	if(checkingcount<5 || !checkingboolean){
		swal("입력 에러",'기입되지 않은 부분이 존재합니다. 모두 기입해 주세요.',"error");
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
							
	const spendpoint = $("#usingpoint").val();
	let countlist = new Array();
	let isbnlist = new Array();
	let pricelist = new Array();
			
	$(".isbnlist").each(function(){
		const isbn = $(this).val();
		isbnlist.push(isbn);
	});
	$(".countlist").each(function(){
		const count = $(this).val();
		countlist.push(count);
	});
	$(".pricelist").each(function(){
		const price = $(this).val();
		pricelist.push(price);
	});
	
	IMP.request_pay({
	    pg: "html5_inicis",
	    pay_method: "card",
	    merchant_uid: merchant_uid,
	    name: name,
	    amount: Number(amount)-Number(spendpoint),
	    buyer_email: buyer_email,
	    buyer_name: buyer_name,
	    buyer_tel: buyer_tel,
	    buyer_addr: buyer_addr,
	    buyer_postcode: buyer_postcode
  	},
  	function(rsp) {
		if ( rsp.success ) {
			var	msg = '고유ID : ' + rsp.imp_uid+'\n';
			msg += '상점 거래ID : ' + rsp.merchant_uid+'\n';
			msg += '결제 금액 : ' + rsp.paid_amount+'\n';
			msg += '카드 승인번호 : ' + rsp.apply_num+'\n';
			
			$.post({
				url:"./purchaseSequence",
				traditional:true,
				data:{
					isbnlist:isbnlist,
					countlist:countlist,
					pricelist:pricelist,
					id:id,
					spendpoint:spendpoint,
					getpoint:willgetpoint,
					ordernumber:merchant_uid,
					amount:amount
				},
				success:function(result){
					result = result.trim();
					if(result>0){
						$("body").append("<form id='purchaseComplete' action='./purchaseComplete' method='post'></form>");
						$("#purchaseComplete").append('<input type="hidden" readonly="readonly" name="id" value="'+id+'">');
						$("#purchaseComplete").append('<input type="hidden" readonly="readonly" name="msg" value="'+msg+'"');
						$("#purchaseComplete").append('<input type="hidden" readonly="readonly" name="amount" value="'+amount+'">');
						$("#purchaseComplete").append('<input type="hidden" readonly="readonly" name="ordernumber" value="'+merchant_uid+'">');
						$("#purchaseComplete").append('<input type="hidden" readonly="readonly" name="purchasename" value="'+name+'">');
						$("#purchaseComplete").append('<input type="hidden" readonly="readonly" name="getpoint" value="'+willgetpoint+'">');
						$("#purchaseComplete").submit();
					}else{
						swal('에러가 발생했습니다.',"에러내용: 서버문제","error");
					}
				}
			});
		}else{
			var msg = '결제에 실패하였습니다.';
			swal(msg, '에러내용 : ' + rsp.error_msg,"error");
		}
	});
});
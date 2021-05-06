<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<script>
var sessionId = '${member.id}';
var purchaseList = [];
<c:forEach items="${list}" var="item1">
purchaseList.push({
	bookName : "${item1.bookName}",
	purnum :"${item1.purnum}",
	isbn : "${item1.isbn}",
	purdate : "${item1.purdate}",
	price : "${item1.price}",
	purcount : "${item1.purcount}"
});
</c:forEach>
// $("#dtoImport").on("click", function(){
// 	const purNum = $("#dtoImport").text();
// 	const datas = {
// 			purNum : purNum
// 	}

// 	$.ajax({
// 		method:"get",
// 		//컨트롤러에 보낼 주소 , 컨트롤러에서 jsp로 보낼주소
// 		url:"./userPurchase",
// 		data: datas,
// 		success:function(result){
// 			result=result.trim();
// 			if(result==='null'){
// 				alert("일치하는 아이디가 없습니다.");
// 			}else {
// 				alert("아이디는:"+result);
// 			}
// 		}
// 	});
	
	
// });

function openDetailModal(el){
 	var purchaseNum = $(el).text();
 	var detail = '';
 	var innerHtml = '';
 	purchaseList.forEach(function(row){
 		if(purchaseNum == row.purnum){
 			detail = row;
 		}
 	});
 	
	innerHtml +='<tr>';
	innerHtml += '<td>'+detail.purnum+'</td>';
	innerHtml += '<td>'+detail.bookName+'</td>';
	innerHtml += '<td>'+detail.isbn+'</td>';
	innerHtml += '<td>'+detail.purcount+'</td>';
	innerHtml +='</tr>';
		 	
 	$('#purDetail').html(innerHtml);
	$('#purchaseDetail').modal(); 	
	
	
}
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>

<style type="text/css">

#div_root{
width:1500px;
min-height:100%;
}

#div_top{

width:100%;

height:10%;
margin-top:5%;
text-align:center;


}

#div_con{

width:100%;
margin-top:2%;
min-height:450px;

}

#div_menu{
width:10%;
margin-top:5%;
float:left;
text-align:reft;
margin-left:10%;


}
#div_main{
width:900px;
height:450px;
 margin:0 auto; 

text-align:center;

}

#div_footer {
	width: 100%;
	height:10%;
	bottom:0;

}



#rcorners2 {
  border-radius: 25px;
  border: 2px solid black;
  padding: 20px;
  width: 600px;
  height:150px;
text-align:center;
 margin:0 auto; 
}


#img_size{
  width: 100px;
  height: 95px;
  object-fit: fill;
}

#img_size2{
  width: 80px;
  height: 80px;
  object-fit: fill;
}


#div_size{
	width:25%;
	height:100%;
	float: left;
}

#div_view{
	border: 2px solid gray;
	width:800px;
	height:400px;
	text-align:center;
	margin-top:2%;
 	margin-left:25%;
 	margin-bottom:2%;

}
#div_view2{

	width:200px;
	float:left;
		text-align:left;
	margin-left:5%;

}


</style>
</head>

<body>
	<c:import url="../template/body.jsp"></c:import>
	<div id="div_root">
		<div id="div_top">

			<h1>상품 정보</h1>
		</div>
		<div id="div_menu">
			<h3>카테고리</h3>


			<ul class="nav nav-pillsflex-column">
				<li class="nav-item"><a class="btn btn-link" href="../member/membercart/membercartList?id=${member.id}">장바구니</a></li>
					
	
			</ul>
		</div>

		<div id="div_con">
			
			<div id="rcorners2">



				<div id="div_size">
					<a href="./userPurchase"> <img id="img_size"
						src="../resources/image/member/box.png" alt="상품">
						<p>상품</p>
					</a>
				</div>
				<div id="div_size">
					<a href="../member/memberFile/memberProfile"> <img id="img_size2"
						src="../resources/image/member/profile.png" alt="프로필">
						<p></p>
						<p>내 정보</p>
					</a>
				</div>
				<div id="div_size">
					<a href="../member/memberFile/memberPoint"> <img id="img_size2"
						src="../resources/image/member/point.png" alt="포인트">
						<p></p>
						<p>포인트</p>
					</a>
				</div>
				<div id="div_size">
					<a  href=" ../board/boardList?boardsp=qna&kind=id&search=${member.id}"> <img id="img_size"
						src="../resources/image/member/qna.jpg" alt="Q&A">
						<p>Q&A</p>
					</a>
					
				</div>
						
			</div>
	 <div id="div_view">
<label>구매내역</label>
            <table class="table">
               <thead class="thead-dark">
                  <tr>
                     <th>날짜</th>
                     <th>구매번호</th>
                     <th>가격</th>
                     <th>배송조회</th>
                  </tr>

               </thead>
               <tbody>
                  <c:forEach items="${list}" var="dto" >
                     <tr>
                        <td>${dto.purdate}</td>
                        <td><a class="btn btn-link" onclick="openDetailModal(this)">${dto.purnum}</a></td>
                        <td>${dto.price}</td>
                        <td><a class="btn btn-link"href="https://tracker.delivery/#/kr.epost/:${dto.purnum}" target="_blank">배송조회</a></td>
                     </tr>

                  </c:forEach>

               </tbody>
            </table>
            
            <br><br>
         </div>
         <ul class="pagination justify-content-center" id="pagerList">
		  <li class="page-item" id="prebutton"><button class="page-link">Previous</button></li>
		  <c:forEach begin="${pager.startBlock}" end="${pager.endBlock}" var="i">
		  	<li class="page-item"><button class="page-link pagesetting" value="${i}">${i}</button></li>
		  </c:forEach>
		  <li class="page-item" id="nextbutton"><button class="page-link">Next</button></li>
		</ul>
      </div>

   </div>
         

	<form action="./userPurchase" id="getListSearching">
		<input type="hidden" readonly="readonly" id="currentPage" name="curPage" value="${pager.curPage}">
		<input type="hidden" readonly="readonly" id="curBlock" name="curBlock" value="${pager.curBlock}">
		<input type="hidden" readonly="readonly" id="preavail" value="${pager.pre}">
		<input type="hidden" readonly="readonly" id="nextavail" value="${pager.next}">
		</form>


<div class="modal fade" id="purchaseDetail"  style="z-index:1050;"  role="dialog" aria-labelledby="purchaseDetail" aria-hidden="true">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>   
            <h4 class="modal-title" id="myModalLabel">상세 정보 조회</h4>         
         </div>
         <div class="modal-body">
               <table class="table">
                  <colgroup >
                     <col style="width: 30%;"></col>
                     <col style="width: 30%;"></col>
                     <col style="width: 30%;"></col>
                     <col style="width: 10%;"></col>
                  </colgroup>
                  <thead>
                     <tr>
                        <th colspan="1">구매번호</th>
                        <th colspan="1">책이름</th>
                        <th colspan="1">ISBN번호</th>
                        <th colspan="1">갯수</th>
                     </tr>
                  </thead>
                  <tbody id ="purDetail">                                                                                                                                                                      
                  </tbody>
               </table>
            <div class="modal-footer">
            </div>                              
         </div>      
      </div>
         
   </div>
</div>





<script type="text/javascript" src="../resources/js/purchase/purchasePager1.js"></script>
</body>
<div id="div_footer">
	<c:import url="../template/footer.jsp"></c:import>
</div>


</html>


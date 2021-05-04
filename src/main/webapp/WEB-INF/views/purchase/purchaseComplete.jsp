<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/header.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/body.jsp"/>
	<input type="hidden" readonly="readonly" id="msg" value="${msg}">
	<input type="hidden" readonly="readonly" id="amount" >
	<div class="container" style="margin-top:5%">
		<div style="text-align: center;">
			<h2><strong>결제완료</strong></h2><br><br>
			<p>${user.name}님 결제가 성공적으로 완료되었습니다.<br>저희 인터넷 서점을 이용해주셔서 감사합니다.</p>
		</div><br><br>
		<table class="table" style="text-align: center;">
			<thead class="table-dark">
				<tr>
					<th>주문번호</th>
					<th>구매내역</th>
					<th>금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${ordernumber}</td>
					<td>${purchasename}</td>
					<td>사용금액 : ${amount}원<br><br>획득 포인트 : ${getpoint}</td>
				</tr>
			</tbody>
		</table><br>
		<div style="text-align: right;">
			<a href="../">홈으로 돌아가기</a>
		</div>
	</div><br><br>
<c:import url="../template/footer.jsp"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	swal("결제완료",$("#msg").val(),"success");
});
</script>
</body>
</html>
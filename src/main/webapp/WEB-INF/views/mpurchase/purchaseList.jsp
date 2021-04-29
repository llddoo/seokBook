<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 구매내역 확인</title>
<c:import url="../template/header.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/mpurchase/test1.css">
</head>
<body>
<c:import url="../template/body.jsp"></c:import>
<div class="container">
	<h2 style="padding: 0px 10px 1px; 
	margin: 10px 0px 5px; 
	border-left-width: 5px; 
	border-left-style: solid; 
	border-left-color: rgb(216, 60, 60); 
	font-size: 14pt; color: rgb(51, 51, 51); 
	font-family: '맑은 고딕', 'Noto Sans Korean'; 
	border-bottom-color: rgb(211, 211, 211); 
	border-bottom-width: 1px; 
	border-bottom-style: solid; 
	letter-spacing: -0.07em; 
	line-height: 35px; 
	background-color: rgb(250, 250, 250);">구매 내역</h2>

	<!-- 도넛 차트 -->	
	<div id="piechart_3d" style="width: 900px; height: 500px;"></div>

	
    <div id="Line_Controls_Chart">
      <!-- 라인 차트 생성할 영역 -->
  		<div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
      <!-- 컨트롤바를 생성할 영역 -->
  		<div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
		</div>
	
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>구매번호</th>
				<th>주문번호</th>
				<th>ISBN</th>
				<th>ID</th>
				<th>가격</th>
				<th>구매수량</th>
				<th>구매날짜</th>
				<th>유지기간</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.purnum}</td>
				<td>${dto.ordernum}</td>
				<td><a href="./purchaseSelect?purnum=${dto.purnum}">${dto.isbn}</a></td>
				<td>${dto.id}</td>
				<td>${dto.price}</td>
				<td>${dto.purcount}</td>
				<td>${dto.purdate}</td>
				<td>${dto.remdate}</td>
			</tr>
			</c:forEach>
		</tbody>
		
	</table>
	</div>
	
	<div class="container">
		<ul class="pagination">
		
		<c:if test="${branchPager.pre}">
			<li class="page-item"><a class="page-link p" href="#" isbn="${branchPager.startBlock-1}">이전</a></li>
		</c:if>
		
		<c:forEach begin="${branchPager.startBlock}" end="${branchPager.endBlock}" var="i">
		 	<li class="page-item"><a class="page-link p" href="#" isbn="${i}">${i}</a></li>
		</c:forEach>
		
		<c:if test="${branchPager.next}">
			<li class="page-item"><a class="page-link p" href="#" isbn="${branchPager.endBlock+1}">다음</a></li>
		</c:if>
		</ul>
		
		<div class="input-group mt-3 mb-3">
		
		<form id="frm" action="./purchaseList" class="form-inline">
			<input type="hidden" name="curPage" value="1" id="curPage">
			<div class="input-group-append">
				<select class="form=control" name="kind" id="kind">
					<option class="sel">ISBN</option>
					<option class="sel">ID</option>
					<option class="sel">가격</option>
					<option class="sel">구매날짜</option>
				</select>
			</div>
			<input type="text" class="form-control" name="search" id="search" value="${branchPager.search}" placeholder="Search">
			<div class="input-group-append">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</div>
		</form>
		</div>
		
		<a href="./purchaseInsert" class="btn btn-outline-primary" role="button">Add</a>
		
		<script type="text/javascript" src="../resources/js/purchase/test1.js"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
			let kind = '${branchPager.kind}';
			$(".sel").each(function(){
				let t = $(this).text();
				if(t == kind){
					$(this).prop("selected", true);
				}
			});
			
			$(".p").click(function(){
				let curPage = $(this).attr("isbn");
				$("#curPage").val(curPage);
				let search = "${branchPager.search}";
				$("#frm").submit();
			});
		</script>
		<script type="text/javascript">
		  google.charts.load("current", {packages:["corechart"]});
	      google.charts.setOnLoadCallback(drawChart);
	      function drawChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['Task', 'Hours per Day'],
	          ['호러', 600],
	          ['멜로', 500],
	          ['판타지', 600],
	          ['코미디', 500],
	          ['과학', 412],
	          ['유아', 442],
	          ['호러', 447]
	        ]);

	        var options = {
	          title: '구매 현황',
	          is3D: true,
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
	        chart.draw(data, options);
	      }
		</script>
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 목록</title>
<c:import url="../template/bootStrap.jsp"></c:import>
</head>
<body>

<div class="container">
	<h2>구매 목록</h2>
	
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>구매번호</th>
				<th>주문번호</th>
				<th>구매날짜</th>
				<th>ICBN</th>
				<th>유지기간</th>
				<th>ID</th>
				<th>가격</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.purnum}</td>
				<td>${dto.purdate}</td>
				<td><a href="./purchaseSelect?purnum=${dto.purnum}">${dto.isbn}</a></td>
				<td>${dto.remdate}</td>
				<td>${dto.id}</td>
				<td>${dto.price}</td>
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
		
			<div class="input-group-append">
				<button class="btn btn-success" type="submit">구매내역검색</button>
			</div>
		</form>
		</div>
		
		<a href="./purchaseInsert" class="btn btn-primary" role="button">구매내역추가</a>
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
				let search = "${pager.search}";
				$("#frm").submit();
			});
		</script>
	</div>
</body>
</html>
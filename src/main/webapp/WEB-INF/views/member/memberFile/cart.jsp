<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../template/bootStrap.jsp"></c:import>
<c:import url="../../template/body.jsp"></c:import>

<style type="text/css">
#div_root{

width:800px;
margin-top:80px;
}
</style>

</head>
<body>
<h1>1111111111</h1>
<div id="div_root">
	<h2>장바구니</h2>
	<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>ICBN</th>
					<th>책이름11</th>
					<th>책내용</th>
					<th>가격</th>
					<th>구매확정</th>
				</tr>
			</thead>
			
			<tbody>
	    
			</tbody>
		
		</table>
		<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" ./cartlist?curPage=${i}&kind=${memberpager.kind}&search=${memberpager.search}">${i}</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
		
		

		
	
</div>
</body>
</html>
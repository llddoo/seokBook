<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>
</head>
<body>

<div class="container">
	<h2>구매내역입력</h2>
	<form id="frm" action="./purchaseInsert" method="post">
		<div class="form-group">
				<label for="isbn">ICBN:</label> <input type="text"
					class="form-control myCheck" id="isbn" name="isbn">
			</div>
			
			<div class="form-group">
				<label for="title">연락처:</label> <input type="text"
					class="form-control myCheck" id="branchCall" name="branchCall">
			</div>
			<input type="button" id="btn" value="입력" class="btn-btn-primary">
	</form>

 

</div>


<script type="text/javascript" src="../resources/jquery/branchInsert.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
</head>
<body>
<c:import url="../template/body.jsp"></c:import>
<div class="container">
	<h2>지점 입력</h2>
	<form id="frm" action="./${branch}Insert" method="post">
		<div class="form-group">
				<label for="branchName">지점명:</label> <input type="text"
					class="form-control myCheck" id="branchName" name="branchName">
			</div>
			
			<div class="form-group">
				<label for="branchCall">연락처:</label> <input type="text"
					class="form-control myCheck" id="branchCall" name="branchCall">
			</div>
			<input type="button" id="btn" value="입력" class="btn-btn-primary">
	</form>

 

</div>

<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/branch/branchInsert.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 정보 수정</title>
<c:import url="../template/header.jsp"></c:import>
</head>
<body>
<c:import url="../template/body.jsp"></c:import>
	<div class="container">
	<h2>지점 정보 수정</h2>
	
	<form id="frm" action="./${branch}Update" method="post">
	<input type="hidden" name="branchNum" value="${param.branchNum}">
	
	<div class="form-group">
      <label for="branchName">지점명:</label>
      <input type="text" class="form-control" id="branchName" name="branchName" value="${dto.branchName}">
    </div>
    <div class="form-group">
      <label for="branchCall">지점연락처:</label>
      <input type="text" class="form-control" id="branchCall" name="branchCall" value="${dto.branchCall}">
    </div>
    
    <input type="submit" id="btn" value="수정" class="btn btn-primary">
	
	</form>
		
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
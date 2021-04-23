<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>
</head>

<body>
<c:import url="../template/body.jsp"></c:import>
	<div class="container">
		<h2>&nbsp</h2>
		<h1>&nbsp</h1>
		<h1>약관동의</h1>
		
		<div class="form-check">
			<label class="form-check-label"> <input type="checkbox"
				value="1" name ="c1" id="all">전체동의
			</label>
		</div>
		
		
		
		<div class="form-check">
			<label class="form-check-label"> <input type="checkbox"
				 value="1" name="c1" class="check">동의
			</label>
		</div>
		<div class="jumbotron">
			<h1>Bootstrap Tutorial</h1>
			<p>Bootstrap is the most popular HTML, CSS...</p>
		</div>
		
		
		<div class="form-check">
			<label class="form-check-label"> <input type="checkbox"
				 value="1" name="c1" class="check">동의
			</label>
		</div>
		<div class="jumbotron">
			<h1>Bootstrap Tutorial</h1>
			<p>Bootstrap is the most popular HTML, CSS...</p>
		</div>
		
		
		<div class="form-check">
			<label class="form-check-label"> <input type="checkbox"
				 value="1" name="c1" class="check">동의
			</label>
		</div>
		<div class="jumbotron">
			<h1>Bootstrap Tutorial</h1>
			<p>Bootstrap is the most popular HTML, CSS...</p>
		</div>
		
		
		<div class="form-check">
			<label class="form-check-label"> <input type="checkbox"
				 value="1" name="c1" class="check">동의
			</label>
		</div>
		<div class="jumbotron">
			<h1>Bootstrap Tutorial</h1>
			<p>Bootstrap is the most popular HTML, CSS...</p>
		</div>
		
		<button class="btn btn-dange" id="btn">JOIN</button>
		<script type="text/javascript" src="../resources/js/member/memberJoinCheck.js"></script>
		
	</div>

</body>
</html>
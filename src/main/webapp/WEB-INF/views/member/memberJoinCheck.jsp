<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>

<style type="text/css">

#wrap {
    height:100%;
}

#div_main {
	position: absolute;
	left: 50%;
	width: 50%;
	height: 80%;
	margin-left: -25%;
	text-align: left;
}



#div_footer {
	width: 100%;
	bottom: 0%;
	height: 50px;
}

#div_page{
		width:100%;
		height:1400px;
}
</style>


</head>

<body>
	<c:import url="../template/body.jsp"></c:import>

		<div id="div_page" class="container mt-2" style="text-align: center">

			<h2>&nbsp;</h2>
			<h1>&nbsp;</h1>
			<h1>약관동의</h1>
			<div id="div_main" class="container">

				<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						value="1" name="c1" id="all">전체동의
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

				<button class="btn btn-danger" id="btn">JOIN</button>
				<script type="text/javascript"
					src="../resources/js/member/memberJoinCheck.js"></script>
				
				
			</div>

			
		</div>
		
	<div id="div_footer">

				<c:import url="../template/footer.jsp"></c:import>
			</div>
</body>


</html>
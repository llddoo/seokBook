<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../template/header.jsp"></c:import>

<style type="text/css">
#div_root {
	margin: auto;
	width: 1200px;
	margin-top: 5%
}

#div_top {
	width: 100%;
	text-align: center;
}

#div_menu {
	width: 12%;
	margin-top: 5%;
	float: left;
	text-align: reft;
}

#div_con {
	width: 88%;
	height: 10%;
	margin-top: 2%;
	float: right;
	text-align: center;
}

#div_footer {
	width: 100%;
	position: absolute;
	bottom: 0px;
}

#rcorners2 {
	border-radius: 25px;
	border: 2px solid black;
	padding: 20px;
	width: 600px;
	height: 150px;
	margin-left: 15%;
}

#img_size {
	width: 100px;
	height: 95px;
	object-fit: fill;
}

#img_size2 {
	width: 80px;
	height: 80px;
	object-fit: fill;
}

#div_size {
	width: 25%;
	height: 100%;
	float: left;
}

#div_view {
	border: 2px solid gray;
	width: 600px;
	height: 250px;
	margin-top: 5%;
	margin-left: 15%;
}

#div_view2 {
	width: 200px;
	float: left;
	text-align: left;
}
</style>
</head>

<body>
	<c:import url="../../template/body.jsp"></c:import>
	<div id="div_root">
		<div id="div_top">

			<h1>상품 정보</h1>
		</div>
		<div id="div_menu">
			<h3>카테고리</h3>


			<ul class="nav nav-pillsflex-column">
				<li class="nav-item"><a class="btn btn-link"
					href="./memberlist">구매내역</a></li>
<<<<<<< HEAD
				<li class="nav-item"><a class="btn btn-link" href="../membercart/membercartList">장바구니</a></li>
=======
				<li class="nav-item"><a class="btn btn-link" href="./cart">장바구니</a></li>
>>>>>>> parent of dd91d8e (Merge branch 'min_3' into main)
				<li class="nav-item"><a class="btn btn-link" href="./memberBoxList">배송조회</a></li>
				<li class="nav-item"><a class="btn btn-link"
					href="https://tracker.delivery/#/:${DTO.purnum}"
					target="_blank">배송조회</a></li>
					
					<button class="btn btn-primary" id="boxBtn">왜안대ㅐㅐㅐ</button>
					
	
			</ul>
		</div>

		<div id="div_con">

			<div id="rcorners2">



				<div id="div_size">
					<a href="./memberBox"> <img id="img_size"
						src="../../resources/image/member/box.png" alt="상품">
						<p>상품</p>
					</a>
				</div>
				<div id="div_size">
					<a href="./memberProfile"> <img id="img_size2"
						src="../../resources/image/member/profile.png" alt="프로필">
						<p></p>
						<p>내 정보</p>
					</a>
				</div>
				<div id="div_size">
					<a href="./memberPoint"> <img id="img_size2"
						src="../../resources/image/member/point.png" alt="포인트">
						<p></p>
						<p>포인트</p>
					</a>
				</div>
				<div id="div_size">
					<a href="./?????Q&A"> <img id="img_size"
						src="../../resources/image/member/qna.jpg" alt="Q&A">
						<p>Q&A</p>
					</a>
				</div>
			</div>
			////
			
			

		</div>
	</div>

<script type="text/javascript" src="../resources/js/member/memberBox.js"></script>	
</body>
<div id="div_footer">
	<c:import url="../../template/footer.jsp"></c:import>
</div>


</html>
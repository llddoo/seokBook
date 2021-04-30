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

#div_root{
margin:auto;
width:800px;
margin-top:80px;
}

#div_top{
width:100%;
height:100px;
text-align:center;
}

#div_menu{
width:20%;
height:300px;
float:left;
text-align:reft;
}
#div_con{
width:80%;
height:300px;
float:left;
text-align:center;
}


</style>

</head>

<body>
<c:import url="../../template/body.jsp"></c:import>
<div id="div_root">
	<div id="div_top" >

	<h1>Member Page1</h1>
</div>
	<div id="div_menu">
		<h3>My Page</h3>
		<p>??????????????????????</p>

			<ul class ="nav nav-pillsflex-column">
				<li class="nav-item"><a class="btn btn-link"
					href="../membercart/membercartList?id=${member.id}">장바구니</a></li>
				<li class="nav-item"><a class="btn btn-link"
					href="../../board/boardList?boardsp=qna">문의내역</a></li>
				<li class="nav-item"><a class="btn btn-link"
					href="./memberUpdate">회원정보 수정</a></li>
				<li class="nav-item"><a class="btn btn-link"
					href="./memberDelete"
					onclick="if(!confirm('회원 탈퇴 하시겠습니까?')){return false;}">회원 탈퇴</a></li>

			</ul>
</div>

<div id = "div_con">
		<h1>오른쪽가라고</h1>
		<h1>회원등급 ${member.grade}</h1>
		<h1>${member.totalmoney}</h1>
		<h1>${member.point}</h1>
<form action="../memberPoint" method="post">
    <input value="id" name="id">
    <input value="point" name="point">
</form>




	
</div>
</div>

<c:import url="../../template/footer.jsp"></c:import>
</body>
</html>
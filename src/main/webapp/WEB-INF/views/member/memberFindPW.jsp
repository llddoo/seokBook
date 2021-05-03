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

#div_footer{
	width:100%;
	position: absolute;
    bottom: 0px;
	
}

#div_main {
	width: 100%;
	text-align: center;
	
}

#div_main2 {
	position:absolute;
	 left:50%;
	width: 30%; height:100;
	margin-left: -15%;
	text-align: left;
}


</style>

</head>

<body>
<c:import url="../template/body.jsp"></c:import>
<div id=div_main>
	<h3>&nbsp;</h3>
	<h1>&nbsp;</h1>
	<h1>&nbsp;</h1>
	<h1>비밀번호 찾기</h1>
	<h1>&nbsp;</h1>
<div id=div_main2>

<input type="text" class="form-control" id="id" name ="id"  placeholder="아이디를 입력하시오." style="height:50px;">
<p></p>
<input type="text" class="form-control" id="email" name ="email"  placeholder="비밀번호를 입력하시오." style="height:50px;">
<p></p>
<button class="btn btn-primary" id="pwBtn">비밀번호 찾기</button>
<a  href="javascript:history.back();"  class="btn btn-danger">취소</a>
	<script type="text/javascript" src="../resources/js/member/memberFind.js">
	</script>
	
	</div>
	</div>
</body>
<div id=div_footer>
<c:import url="../template/footer.jsp"></c:import>
</div>
</html>


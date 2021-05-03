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


#div_view{
	border: 2px solid gray;
	width:600px;
	height:450px;

	margin-top:5%;
 	margin-left:25%;

}


#div_view1{
	width:200px;
	float:left;
		text-align:left;
	margin-left:5%;
	margin-top:5px;


}

#div_view2{
	width:200px;
	float:left;
		text-align:left;


}
#h3_st{
width: 300px;
 height:50px; 
 margin-top:10px;


}
	

#div_footer{
	width:100%;
	position: absolute;
    bottom: 0px;
	
}


	
</style>

</head>
<body>
<c:import url="../../template/body.jsp"></c:import>
	<div class="container mt-2" style="text-align: center">
	<h3>&nbsp;</h3>
	<h1>&nbsp;</h1>
<h1> 내 정보수정</h1>
<div id="div_view">

	<div id="div_view1">
	<p></p>
	<h3 id="h3_st">ID:</h3>
	<h3 id="h3_st">PW:</h3>
	<h3 id="h3_st">Name:</h3>
	<h3 id="h3_st">Email:</h3>
	<h3 id="h3_st">Phone:</h3>
	</div>
	<div id="div_view2">
         <form action="memberUpdate" method="post" >
         <input type="text" id="h3_st" name="id" readonly="readonly" value="${member.id}" style="width: 300px; height:50px; margin-top:10px; border:none;"><br>
         <input type="text" id="h3_st" name="pw" value="${member.pw}"><br>
         <input type="text" id="h3_st" name="name" value="${member.name}" ><br>
         <input type="text" id="h3_st" name="email" value="${member.email}" ><br>
         <input type="text" id="h3_st" name="phonenum" value="${member.phonenum}" ><br>
         <p></p>
         <button class="btn btn-primary" onclick="alert('업데이트 되었습니다.')">업데이트</button>
            <a class="btn btn-danger"  
					href="./memberPage">취소</a>
      </form>
   </div>

</div>
</div>
<div id="div_footer">
<c:import url="../../template/footer.jsp"></c:import>
</div>
</body>
</html>
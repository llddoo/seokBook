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
width:1500px;
min-height:100%;
}

#div_top{

width:100%;

height:10%;
margin-top:5%;
text-align:center;


}

#div_con{

width:100%;
margin-top:2%;
min-height:450px;

}

#div_menu{
width:20%;
margin-top:5%;
float:left;
text-align:reft;
margin-left:5%;



}
#div_main{
width:900px;
height:450px;
 margin:0 auto; 

text-align:center;

}

#div_footer {
	width: 100%;
	height:10%;
	bottom:0;
}



#rcorners2 {
  border-radius: 25px;
  border: 2px solid black;
  padding: 20px;
  width: 600px;
  height:150px;

 margin:0 auto; 
}



#img_size{
  width: 100px;
  height: 95px;
  object-fit: fill;
}

#img_size2{
  width: 80px;
  height: 80px;
  object-fit: fill;
}


#div_size{
	width:25%;
	height:100%;
	float: left;
}

</style>

</head>

<body>
<c:import url="../../template/body.jsp"></c:import>
<div id="div_root">
	<div id="div_top" >

	<h1>My Page</h1>
</div>
	
<div id= "div_con">
<div id="div_menu"> <h1></h1></div>
<div id = "div_main">


<div id ="rcorners2">



		<div id="div_size">
		<a  href="../../purchase/userPurchase">
		<img id="img_size" src="../../resources/image/member/box.png"  alt="상품">
		<p>상품</p>
		</a>
		</div>
		<div id="div_size">	
		<a  href="./memberProfile">
		<img id="img_size2" src="../../resources/image/member/profile.png" alt="내정보"  >
		<p></p>
		<p>내 정보</p>
		</a>
		</div>
		<div id="div_size">
		<a  href="./memberPoint">
		<img id="img_size2" src="../../resources/image/member/point.png" alt="포인트"  >
		<p></p>
		<p>포인트</p>
		</a>
		</div>
		<div id="div_size">
		<a  href=" ../../board/boardList?boardsp=qna&kind=id&search=${member.id}">
		<img id="img_size" src="../../resources/image/member/qna.jpg" alt="Q&A"  >
		<p>Q&A</p>
		</a>
		</div>
</div>
</div>
</div>
<div id=div_footer >
<c:import url="../../template/footer.jsp"></c:import>
</div>
</div>
</body>
</html>
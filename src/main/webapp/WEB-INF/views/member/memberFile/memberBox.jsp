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
width:10%;
margin-top:5%;
float:left;
text-align:reft;
margin-left:10%;


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
text-align:center;
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

#div_view{
	border: 2px solid gray;
	width:800px;
	height:300px;
	text-align:center;
	margin-top:2%;
 	margin-left:25%;
 	margin-bottom:2%;

}
#div_view2{

	width:200px;
	float:left;
		text-align:left;
	margin-left:5%;

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
					href="./memberBoxList">구매내역</a></li>
				<li class="nav-item"><a class="btn btn-link" href=../membercart/membercartList?id=${member.id}">장바구니</a></li>
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
	 <div id="div_view">

            <table class="table">
               <thead class="thead-dark">
                  <tr>
                     <th>날짜</th>
                     <th>구매번호</th>
                     <th>ISBN번호</th>
                     <th>책이름</th>
                     <th>구매갯수</th>
                     <th>가격</th>
                     <th>배송조회</th>
                  </tr>

               </thead>
               <tbody>
                  <c:forEach items="${list}" var="dto" >
                     <tr>
                        <td>${dto.purdate}</td>
                        <td>${dto.purnum}</td>
                        <td>${dto.isbn}</td>
						<td>${dto.bookName}</td>
                        <td>${dto.purcount}</td>
                        <td>${dto.price}</td>
                     </tr>

                  </c:forEach>

               </tbody>
            </table>
         </div>
      
			
			

		</div>
	</div>

<script type="text/javascript" src="../resources/js/member/memberBox.js"></script>	
</body>
<div id="div_footer">
	<c:import url="../../template/footer.jsp"></c:import>
</div>


</html>
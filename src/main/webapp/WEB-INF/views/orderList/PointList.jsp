<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>

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
   height: 100px;
   font-color: yellow;
   margin-top: 5%;
   margin-left: 15%;
}

#div_view2 {
   margin-top: 5%;
   width: 200px;
   margin-left: 15%;
   float: left;
   text-align: left;
}
</style>
</head>

<body>
   <c:import url="../template/body.jsp"></c:import>
   <div id="div_root">
      <div id="div_top">

         <h1>Point 사용내역</h1>
      </div>
      <div id="div_menu">
         <h3>카테고리</h3>


         <ul class="nav nav-pillsflex-column">
            <li class="nav-item"><a class="btn btn-link"
               href="../orderList/PointList">포인트 적립내역</a></li>
         </ul>
      </div>

      <div id="div_con">

         <div id="rcorners2">



            <div id="div_size">
               <a href="../member/memberFile/memberBox"> <img id="img_size"
                  src="../resources/image/member/box.png" alt="상품">
                  <p>상품</p>
               </a>
            </div>
            <div id="div_size">
               <a href="../member/memberFile/memberProfile"> <img id="img_size2"
                  src="../resources/image/member/profile.png" alt="프로필">
                  <p></p>
                  <p>내 정보</p>
               </a>
            </div>
            <div id="div_size">
               <a href="../member/memberFile/memberPoint"> <img id="img_size2"
                  src="../resources/image/member/point.png" alt="포인트">
                  <p></p>
                  <p>포인트</p>
               </a>
            </div>
            <div id="div_size">
               <a href="../member/memberFile/?????Q&A"> <img id="img_size"
                  src="../resources/image/member/qna.jpg" alt="Q&A">
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
                     <th>포인트 적립내역</th>
                     <th>포인트 사용내역</th>
                     <th>총포인트</th>
                  </tr>

               </thead>
               <tbody>
                  <c:forEach items="${list}" var="dto">
                     <tr>
                        <td>${dto.purdate}</td>
                        <td>${dto.purnum}</td>
                        <td>${dto.price}</td>
 <!--                     ((dto.lumpsum+spendpoint)*100/90)*0.05   		-->
                        <td>${dto.pointUsage}</td>
                        <td>
                         if ${dto.pointUsage} 
                        ${dto.point}</td>
 <!--                        point = point + ((lumpsum+spendpoint)*100/90)*0.05- poinus    -->
                     </tr>

                  </c:forEach>

               </tbody>
            </table>
         </div>
      </div>

   </div>

</body>
<div id="div_footer">
   <c:import url="../template/footer.jsp"></c:import>
</div>

</html>
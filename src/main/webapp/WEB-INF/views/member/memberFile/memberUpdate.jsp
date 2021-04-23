<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../template/bootStrap.jsp"></c:import>
<c:import url="../../template/body.jsp"></c:import>
</head>
<body>

	<h3>&nbsp</h3>
	<h1>&nbsp</h1>
<h1> 업데이트</h1>

         <form action="memberUpdate" method="post">
         ID <input type="text" name="id" readonly="readonly" value="${member.id}"><br>
         PW <input type="text" name="pw" value="${member.pw}"><br>
         Name <input type="text" name="name" value="${member.name}"><br>
         Email <input type="text" name="email" value="${member.email}"><br>
         Phone <input type="text" name="phonenum" value="${member.phonenum}"><br>
         <button class="btn btn-primary" onclick="alert('업데이트 되었습니다.')">업데이트</button>
      </form>
      <a class="btn btn-danger"  
					href="./memberPage">취소</a>
</body>
</html>
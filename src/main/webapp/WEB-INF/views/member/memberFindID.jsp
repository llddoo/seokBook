<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>${member.id}</h1>>

<form action="./memberFindID" method="post" id="find">
<label for="text">email을 입력하시오</label>
<input type="text" class="form-control" id="email" name ="email">
<button class="btn btn-primary" id=btn>아이디 찾기</button>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <tr>
         <div class="container">
            <h1>${member}SelectPage</h1>
            <h3>ID : ${dto.id}</h3>
            <h3>Email : ${dto.email}</h3>
            <h3>Point : ${dto.point}</h3>
         </div>
      </tr>
</body>
</html>
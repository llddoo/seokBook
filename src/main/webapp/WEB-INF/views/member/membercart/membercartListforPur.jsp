<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${cartList}" var="item">
<tr>
	<td>${item.bookListDTO.bookImg}</td>
    <td>Dooley</td>
    <td></td>
</tr>
</c:forEach>
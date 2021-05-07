<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table">
<c:forEach items="${reviews}" var="item">
  <tbody>
  	<tr>
    	<td>${item.id}</td>
    	<td>${item.regDate}</td>
    	<td>${item.revScore}점</td>
    </tr>
    <tr>
    	<td colspan="3">${item.revContent}</td>
    </tr>
  </tbody>
</c:forEach>
</table>



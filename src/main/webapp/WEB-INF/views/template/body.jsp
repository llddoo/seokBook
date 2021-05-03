<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <html>
 <head>
 </head>
 <body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">서점 홈</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="${pageContext.request.contextPath}/genre/genreList">일반도서</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="${pageContext.request.contextPath}/board/boardList?boardsp=oldbooklist">중고서적</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="${pageContext.request.contextPath}/board/boardList?boardsp=event">이벤트</a>
        </li>
      </ul>
      
       &nbsp;
       <c:if test="${empty member}">
        <a class="nav-link btn btn-outline-primary" href="${pageContext.request.contextPath}/member/memberLogin">로그인</a>
        &nbsp;
        <a class="nav-link btn btn-outline-primary" href="${pageContext.request.contextPath}/member/memberJoinCheck">회원가입</a>
       </c:if>
       <c:if test="${not empty member}">
        <a class="nav-link btn btn-outline-primary" href="${pageContext.request.contextPath}/member/memberFile/memberPage">MyPage</a>
        &nbsp;
        <a class="nav-link btn btn-outline-primary" href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a>
      </c:if>
    </div>
  </nav>
  </body>
 </html>
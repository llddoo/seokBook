<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <html>
 <head>
 <style>
 	#searchbar{
 		width:55%;
 	}
 	#searchbar input[type=text]{
 		width:60% !important;
 	}
 	#labelforsearch{
 		color: white;
 	}
 </style>
 </head>
 <body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">Carousel</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="${pageContext.request.contextPath}/">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <span id="labelforsearch">통합검색&nbsp;&nbsp;</span>
      <form class="form-inline mt-2 mt-md-0" id="searchbar" action="${pageContext.request.contextPath}/searchresult" method="get">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" name="mainsearch">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
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
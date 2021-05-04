<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html lang="en">
  <head>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <title>seokBook</title>

    <link rel="canonical" href="//www.interpark.com/malls/index.html">
    <link rel="shortcut icon" href="//openimage.interpark.com/interpark.ico">

    <!-- Bootstrap core CSS -->
	<link href="${pageContext.request.contextPath}/resources/docs/4.6/dist/css/bootstrap.min.css" rel="stylesheet">



    <!-- Favicons -->
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/docs/4.6/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="${pageContext.request.contextPath}/resources/docs/4.6/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="${pageContext.request.contextPath}/resources/docs/4.6/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="${pageContext.request.contextPath}/resources/docs/4.6/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="${pageContext.request.contextPath}/resources/docs/4.6/assets/img/favicons/safari-pinned-tab.svg">
<link rel="icon" href="${pageContext.request.contextPath}/resources/docs/4.6/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="${pageContext.request.contextPath}/resources/docs/4.6/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      .searchcontainer{
      	padding: 1.5% 0 0 30%;
      }
      
      #searchbar{
      	width : 70% !important;
      }
      
      #searchbar input{
      	width : 70%;
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
  </head>
  
  
  <body>
    
<header>
  
</header>

<main role="main">
<c:import url="./template/body.jsp"></c:import>
	<div class="input-group mb-3 searchcontainer">
	  <form class="form-inline mt-2 mt-md-0" id="searchbar" action="${pageContext.request.contextPath}/searchresult" method="get">
		<span>통합검색&nbsp;&nbsp;</span>
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" name="mainsearch" value="${mainsearch}">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
	</div>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label=" :  " preserveAspectRatio="xMidYMid slice" focusable="false"><title> </title><rect width="100%" height="100%" fill="rgb(238, 205, 246)"/><text x="50%" y="50%" fill="#777" dy=".3em"> </text></svg>

        <div class="container">
          <div class="carousel-caption text-left" >
          
         <div class="event_banner main"><a href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=42118&amp;classGb=KOR&amp;PRE=Y&amp;orderClick=42b" target="_blank"><img src="http://image.kyobobook.co.kr/ink/images/prom/2021/book/210416_bookday/bnH_w01_eecdf6.jpg" width="1000" height="400" alt="책의 날 이벤트"></a></div>
            
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label=" :  " preserveAspectRatio="xMidYMid slice" focusable="false"><title> </title><rect width="100%" height="100%" fill="rgb(255, 242, 148)"/><text x="50%" y="50%" fill="#777" dy=".3em"> </text></svg>

        <div class="container">
          <div class="carousel-caption">
            
            <div class="event_banner main"><a href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=42128&amp;classGb=KOR&amp;PRE=Y&amp;orderClick=42c" target="_blank"><img src="http://image.kyobobook.co.kr/ink/images/prom/2021/book/210415_new/bnF_w01_fff294.jpg" width="1000" height="400" alt="추천새책 애슝북엔"></a></div>
            
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label=" :  " preserveAspectRatio="xMidYMid slice" focusable="false"><title> </title><rect class=d1 width="100%" height="100%" fill="rgb(245, 207, 153)"/><text x="50%" y="50%" fill="#777" dy=".3em"> </text></svg>

        <div class="container">
          <div class="carousel-caption text-right">
          
			<div class="event_banner main"><a href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventId=91268&amp;classGb=KOR&amp;orderClick=42a" target="_blank"><img src="http://image.kyobobook.co.kr/ink/images/prom/2021/book/210428_pokemon/bn/bnE_w01_f5cf99.jpg" width="1000" height="400" alt="5월 포켓몬스"></a></div>
			
          </div>
          
          
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
<!-- 여기까지 상단 메인페이지 -->

  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
		<body marginwidth="0" marginheight="0">
		<a href="http://imac.kyobobook.co.kr/click/INK/ink_wel_2016/ink_wel_2016@wel_05?adsno=104722&amp;ctvno=69080&amp;clkno=69114" target="_blank"><img src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2021/04/30/70245/left.jpg" width="316" height="128" border="0" alt="작은 별이지만 빛나고 있어"></a>
		</body>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
     		<body marginwidth="0" marginheight="0">
			<a href="http://imac.kyobobook.co.kr/click/INK/ink_wel_2016/ink_wel_2016@wel_06?adsno=104315&amp;ctvno=69129&amp;clkno=69163" target="_blank""><img src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2021/04/30/46964/WM.jpg" width="316" height="128" border="0" alt="친애하는 20세기"></a>
			</body>
     		 </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <body marginwidth="0" marginheight="0">
		<a href="http://imac.kyobobook.co.kr/click/INK/ink_wel_2016/ink_wel_2016@wel_07?adsno=104514&amp;ctvno=69065&amp;clkno=69099" target="_blank"><img src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2021/04/30/69970/1.jpg" width="316" height="128" border="0" alt="기린의 심장"></a>
		</body>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
        <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
      </div>
      <div class="col-md-5 order-md-1">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
        <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->

<c:import url="./template/footer.jsp"></c:import>
  
</main>

  </body>
</html>

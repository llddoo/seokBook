<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
<link href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<style>
	#nametag{
		margin: 30px;
	}
	#mainbuttonright{
		width: 30%;
	}
</style>
</head>
<body>
<c:import url="../template/body.jsp"></c:import>
<div class="container">
	<div id="nametag">
		<c:choose>	
			<c:when test="${select.boardsp eq 'notice'}">
				<h2 id="boardsp"><a href="./boardList?boardsp=notice" style="color: black;">공지사항</a></h2>
			</c:when>
			<c:when test="${select.boardsp eq 'event'}">
				<h2 id="boardsp"><a href="./boardList?boardsp=event" style="color: black;">이벤트</a></h2>
			</c:when>
			<c:when test="${select.boardsp eq 'oldbooksale'}">
				<h2 id="boardsp"><a href="./boardList?boardsp=oldbooklist" style="color: black;">중고 서적 판매 게시판</a></h2>
			</c:when>
			<c:when test="${select.boardsp eq 'saleend'}">
				<h2 id="boardsp"><a href="./boardList?boardsp=oldbooklist" style="color: black;">중고 서적 판매 완료 게시판</a></h2>
			</c:when>
			<c:otherwise>
				<h2 id="boardsp"><a href="./boardList?boardsp=qna&kind=id&search=${user.id}" style="color: black;">QNA</a></h2>
			</c:otherwise>
		</c:choose>
	</div>
	<table class="table">
		<thead class="thead-dark">
			<tr style="text-align: center;">
	    		<th>작성자 :${select.id}</th>
	    		<th>작성일자 : ${select.regdate}</th>
	    		<th>조회수 : ${select.visitcount}</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2"><h3>글제목 : ${select.subname}</h3></td>
				<td id="mainbuttonright" style="text-align: center;">
					<form id="forsend" method="post" action="./boardDelete">
		  				<input type="hidden" readonly="readonly" name="boardsp" id="boardsp" value="${select.boardsp}">
		  				<input type="hidden" readonly="readonly" name="subnum" id="subnum" value="${select.subnum}">
		  			</form>
		  			<c:if test="${select.id eq member.id}">
		  				<a class="btn btn-primary" href="./boardUpdate?boardsp=${select.boardsp}&subnum=${select.subnum}&id=${select.id}">글 수정</a>
		  				<button id="deleteCheck" class="btn btn-primary">글 삭제</button>
  	  				</c:if>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td colspan="3" style="padding:3em">${select.content}</td>
	    	</tr>
		</tbody>
	</table>
 	<div id="comment">
		
	</div>
	<div>
		<div class="form-group">
  			<input type="hidden" class="form-control" id="id" value="${member.id}" readonly="readonly">
		</div>
		<c:if test="${(member.id ne null) && ((select.boardsp eq 'oldbooksale') || (select.boardsp eq 'saleend'))}">
			<div class="form-group">
  				<label for="content">Comment:</label>
  				<textarea class="form-control" rows="5" id="content"></textarea>
			</div>
			<button type="button" class="btn btn-success" id="write">글쓰기</button>
		</c:if>
	</div>
</div>
<input type="hidden" readonly="readonly" id="contextpath" value="${pageContext.request.contextPath}">
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/board/commentList.js?ver=2"></script>
<script type="text/javascript">
	//board에서 내용 삭제를 누르면 안에 있는 이미지파일이 지워질 수있게 함
	const forsend = document.getElementById("forsend");
	const contextpath = document.getElementById("contextpath").value;
	$("#deleteCheck").click(function(){
		let check = confirm("삭제하시겠습니까?");
		if(check){
			$(".formoveimg").each(function(){
				const path = $(this).attr("src").replace(contextpath, "/");
				$.ajax({
					type: "post",
					url: "./boardFileDelete", 
					data: {
						path:path
						}, 
					success: function(result){
						result=result.trim();
						if(result==='false'){
							alert('이미 삭제되었거나 삭제할 수 없는 이미지 입니다.');	
						}
					}
				});
			});
			$("#forsend").submit();
		}
	});
</script>
</body>
</html>
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
</head>
<script type="text/javascript">
window.history.forward();
function noBack(){
	window.history.forward();
}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<c:import url="../template/body.jsp"></c:import>
<div class="container">
	  <table class="table">
	    <thead class="thead-dark">
	      <tr>
	        <th>글제목 : ${select.subname}</th>
	        <th>작성자 :${select.id}</th>
	        <th>작성일자 : ${select.regdate}</th>
	        <th>조회수 : ${select.visitcount}</th>
	      </tr>
	    </thead>
	    <tbody>
	    <tr>
	    	<td colspan="4">
	    	<c:if test="${select.id eq member.id}">
		  <form id="forsend" method="get" action="./boardDelete">
		  	<input type="hidden" readonly="readonly" name="boardsp" id="boardsp" value="${select.boardsp}">
		  	<input type="hidden" readonly="readonly" name="subnum" id="subnum" value="${select.subnum}">
		  </form>
		  <a class="btn btn-primary" href="./boardUpdate?boardsp=${select.boardsp}&subnum=${select.subnum}">글 수정</a>
		  <button id="deleteCheck" class="btn btn-primary">글 삭제</button>
  	  </c:if>
	    	</td>
	    </tr>
	    	<tr>
	    	<td colspan="4">${select.content}</td>
	    	</tr>
	    </tbody>
	  </table>
 	<div id="comment">
		
	</div>
	<div>
		<div class="form-group">
  			<input type="hidden" class="form-control" id="id" value="${member.id}" readonly="readonly">
		</div>
	
		<div class="form-group">
  			<label for="comment">Comment:</label>
  			<textarea class="form-control" rows="5" id="content"></textarea>
		</div>
		
		<button type="button" class="btn btn-success" id="write">글쓰기</button>
		
	</div>
	</div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/board/commentList.js"></script>
<script type="text/javascript">
	const forsend = document.getElementById("forsend");
	$("#deleteCheck").click(function(){
		let check = confirm("삭제하시겠습니까?");
		if(check){
			$(".fordeleteimg").each(function(){
				const path = $(this).attr("src").replace("/s1/", "/");
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
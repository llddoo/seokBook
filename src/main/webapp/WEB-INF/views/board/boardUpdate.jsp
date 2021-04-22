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
<style type="text/css">
	#sample{
		display:none;
	}
</style>
</head>
<script type="text/javascript">
window.history.forward();
function noBack(){
	 window.history.forward();
}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<div class="container">
<c:import url="../template/body.jsp"></c:import>
		<h2>${boardDTO.boardsp}작성</h2>
		<form id="frm" action="./boardUpdate" method="post" enctype="multipart/form-data">
			<input type="hidden" readonly="readonly" name="boardsp" value="${boardDTO.boardsp}">
			<input type="hidden" readonly="readonly" name="subnum" value="${boardDTO.subnum}">
			<input type="hidden" readonly="readonly" name="regdate" value="${boardDTO.regdate}">
			<input type="hidden" readonly="readonly" name="visitcount" value="${boardDTO.visitcount}">
			<div class="form-group">
				<label for="writer">Writer:</label> 
				<input type="text" readonly="readonly" value="${member.id}"
						class="form-control frmCheck" id="id" name="id">
			</div>
			<div class="form-group">
				<label for="subname">Title:</label> 
				<c:if test="${pager.boardsp eq 'qna'}">
					<select name="subname" class="frmCheck form-select form-select-sm" aria-label=".form-select-sm example">
						<option value="반품, 교환, 환불">반품, 교환, 환불</option>
						<option value="주문, 결제">주문, 결제</option>
						<option value="중고장터 신고">중고장터 신고</option>
						<option value="서비스, 기타">서비스, 기타</option>
					</select>
				</c:if>
				<c:if test="${pager.boardsp ne 'qna'}">
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text">글 제목</span>
					    </div>
					    <input type="text" class="form-control" name="subname" value="${boardDTO.subname}" placeholder="제목을 입력해 주세요.">
					</div>
				</c:if>
			</div>

			<div class="form-group">
				<label for="content">Contents:</label>
				<textarea class="form-control frmCheck" rows="5" id="content" name="content">${boardDTO.content}</textarea>
			</div>

			<input type="button" id="btn" value="WRITE" class="btn btn-primary">
		</form>
	</div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/summernote.js"></script>
</body>
</html>
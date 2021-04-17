<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
<link href="${pageContext.request.contextPath}/resources/summernote/summernote-bs4.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-bs4.min.js"></script>
<style type="text/css">
	#sample{
		display:none;
	}
</style>
</head>
<body>
<c:import url="../template/body.jsp"></c:import>
	<div class="container">
		<h2>${pager.boardsp}작성</h2>
		<form id="frm" action="./boardInsert" method="post" enctype="multipart/form-data">
			<input type="hidden" readonly="readonly" name="boardsp" value="${pager.boardsp}">
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
					<input type="text" name="subname" class="frmCheck">
				</c:if>
			</div>

			<div class="form-group">
				<label for="content">Contents:</label>
				<textarea class="form-control frmCheck" rows="5" id="content" name="content"></textarea>
			</div>

			<input type="button" id="add" value="ADD" class="btn btn-danger">
			
			<div id="files" title="0"></div>

			<input type="button" id="btn" value="WRITE" class="btn btn-primary">
		</form>
	</div>
	<div id="sample">
		<div class="input-group">
			<div class="custom-file">
				<input type="file"  id="inputGroupFile04"
					class="form-control-file border" name="actdata">
			</div>
			<div class="input-group-append delete">
				<input class="btn btn-outline-secondary" type="button"
					id="inputGroupFileAddon04" value="Delete">
			</div>
		</div>
	</div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/board/insertCheck.js"></script>
<script type="text/javascript" src="../resources/js/board/fileAdd.js"></script>
<script type="text/javascript" src="../resources/js/board/summernote.js"></script>
</body>
</html>
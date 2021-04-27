<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../template/header.jsp"></c:import>

<style type="text/css">
	.cartcol1{
		vertical-align: center;
		text-align: center;
		width:15%;
	}
	.cartcol2{
		text-align: center;
		width:55%;
	}
	.cartcol2 span{
		margin-left: 30%;
	}
	.fornextline{
    	line-height: 2rem;
    }
    .booknametitle{
    	font-size: 1.3rem;
    }
    .getCart{
    	margin-top: 0.5rem;
    }
    .getDelete{
    	margin-top: 0.5rem;
    }
    .foralign{
    	text-align: center;
    	vertical-align: middle !important;
    }
    #emptycart{
    	text-align: center;
    }
</style>

</head>
<body>
<c:import url="../../template/body.jsp"></c:import>
	<div class="container">
		<h2>장바구니</h2>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th class="cartcol1"></th>
					<th class="cartcol2"><span>장바구니 목록</span></th>
					<th class="cartcol1"></th>
					<th class="cartcol1"></th>
				</tr>
			</thead>
			
			<c:forEach items="${booklist}" var="bookdto" >
				<tbody>
					<tr>
						<td class="textforline">
							<img alt="${bookdto.bookListDTO.bookImg}" src="${pageContext.request.contextPath}/resources/uploaded/bookList/${bookdto.bookListDTO.bookImg}">
						</td>
						 <td class="fornextline"><p>
				        	<a href="./bookList/bookListSelect?isbn=${bookdto.bookListDTO.isbn}" class="bookselect">
				        		<span class="booknametitle">${bookdto.bookListDTO.bookName}</span>
				        	</a><br>
				        	<b>작가</b> : ${bookdto.bookListDTO.author}&nbsp;&nbsp;<b>출판사</b> : ${bookdto.bookListDTO.bookPub}&nbsp;&nbsp;
				        	<b>출판일</b> : ${bookdto.bookListDTO.bookPubDate}<br>
				        	<b>책설명</b> : ${bookdto.bookListDTO.bookContent}</p>
				        </td>
				        <td class="foralign">${bookdto.bookListDTO.price}원<br>평점 : ${bookdto.bookListDTO.bookScore}</td>
				        <td class="foralign">
					        <form>
					        	<input type="hidden" readonly="readonly" name="isbn" value="${bookdto.bookListDTO.isbn}">
					        	<input type="hidden" readonly="readonly" name="id" value="${pager.id}">
							    <select class="custom-select-sm" name="bookcount">
							    	<option selected="selected" value="1">1</option>
							       	<c:forEach begin="2" end="10" var="i">
							       		<option value="${i}">${i}</option>
							       	</c:forEach>
							    </select><br>
					        	<button class="getCart btn-sm btn-info">바로구매</button>
					        </form>
					        <input type="hidden" readonly="readonly" value="${bookdto.bookListDTO.isbn}" id="fordelete">
				        	<button class="getDelete btn-sm btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;삭제&nbsp;&nbsp;&nbsp;</button>
				        </td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<input type="hidden" readonly="readonly" id="listsize" value="${listsize}">
		<c:if test="${listsize eq 0}">
			<br>
			<h2 id="emptycart">장바구니가 비어있습니다.</h2>
		</c:if>
		<c:if test="${listsize ne 0}">
			<input type="hidden" readonly="readonly" id="pagerpre" value="${pager.pre}">
			<input type="hidden" readonly="readonly" id="pagernext" value="${pager.next}">
			<ul class="pagination justify-content-center" id="pagerList">
				<li class="page-item" id="prebutton">
					<a href="./membercartList?id=${pager.id}&curPage=${pager.curPage}&curBlock=${pager.curBlock-1}" class="page-link">Previous</a>
				</li>
				<c:forEach begin="${pager.startBlock}" end="${pager.endBlock}" var="i">
				  	<li class="page-item">
				  		<a href="./membercartList?id=${pager.id}&curPage=${i}&curBlock=${pager.curBlock}" class="page-link">${i}</a>
				  	</li>	
				</c:forEach>
				<li class="page-item" id="nextbutton">
					<a href="./membercartList?id=${pager.id}&curPage=${pager.curPage}&curBlock=${pager.curBlock+1}" class="page-link">Next</a>
				</li>
			</ul>
		</c:if>
		<br>
		<input type="hidden" readonly="readonly" name="id" id="forallcheck" value="${pager.id}">
		<button id="allpurchase" class="btn btn-primary">전체 구매</button><br>
		<button id="allcartdelete" class="btn btn-danger">전체 삭제</button>
	</div>
	<br>
	<c:import url="../../template/footer.jsp"></c:import>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/membercartList.js"></script>
</body>
</html>
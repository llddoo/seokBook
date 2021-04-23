<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점목록</title>
<c:import url="../template/bootStrap.jsp"></c:import>
</head>
<body>
	
<div class="container">
	<h2>지점목록</h2>

	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>지점명</th>
				<th>지점연락처</th>
			</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><a href="./${branch}Select?branchNum=${dto.branchNum}">${dto.branchName}</a></td>
					<td>${dto.branchCall}</td>	
				</tr>
			</c:forEach>
			</tbody>
		
	</table>

</div>

 <div class="container">
  <ul class="pagination">
  
  <c:if test="${branchPager.pre}">
  <li class="page-item"><a class="page-link p" href="#" branchName="${branchPager.startBlock-1}">이전</a></li>
  </c:if>
  
  <c:forEach begin="${branchPager.startBlock}" end="${branchPager.endBlock}" var="i">
  
  <li class="page-item"><a class="page-link p" href="#" branchName="${i}">${i}</a></li>
  
  </c:forEach>
  
  <c:if test="${branchPager.next}">
  
  <li class="page-item"><a class="page-link p" href="#" branchName="${branchPager.endBlock+1}">다음</a></li>
  
  </c:if>
  </ul>


  <div class="input-group mt-3 mb-3">
   <form id="frm" action="./${branch}List" class="form-inline">
      <input type="hidden" name="curPage" value="1" id="curPage">
     <div class="input-group-prepend">
      <select class="form-control" name="kind" id="kind" >
       <option class="sel">지점명</option>
       <option class="sel">지점연락처</option>
     </select>
     </div>
     <input type="text" class="form-control" name="search" id="search" value="${branchPager.search}" placeholder="">
       <div class="input-group-append">
       <button class="btn btn-success" type="submit">검색</button>
     </div>
    </form> 
   </div> 
  
  <a href="./${branch}Insert" class="btn btn-primary" role="button">추가</a>
  
<script type="text/javascript">
   let kind= '${branchPager.kind}';
   $(".sel").each(function() {
      let t = $(this).text();
      if(t == kind){
         $(this).prop("selected", true);
      }
   });
   
   $(".p").click(function () {
      let curPage = $(this).attr("branchName");
      $("#curPage").val(curPage);
      let search= '${branchPager.search}';
      $("#frm").submit();   
   });
</script>

</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<c:import url="../../template/header.jsp"></c:import>
</head>
<body>
<c:import url="../../template/body.jsp"></c:import>
<div class="container">
	<h2 style="padding: 0px 10px 1px; 
	margin: 10px 0px 5px; 
	border-left-width: 5px; 
	border-left-style: solid; 
	border-left-color: rgb(216, 60, 60); 
	font-size: 14pt; color: rgb(51, 51, 51); 
	font-family: '맑은 고딕', 'Noto Sans Korean'; 
	border-bottom-color: rgb(211, 211, 211); 
	border-bottom-width: 1px; 
	border-bottom-style: solid; 
	letter-spacing: -0.07em; 
	line-height: 35px; 
	background-color: rgb(250, 250, 250);">구매 현황</h2>

	<!-- 도넛 차트 -->	
	<div id="piechart_3d" style="width: 1300px; height: 900px;"></div>
	
	<a href="../../branch/branchList" class="btn btn-primary">지점관리</a>
	
	
		<div id="getChartList"></div>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		
		<script type="text/javascript">
		$(document).ready(function(){
			google.charts.load("current", {packages:["corechart"]});
		      google.charts.setOnLoadCallback(drawChart);
		      function drawChart() {
		    	  var data = new google.visualization.DataTable();
			      data.addColumn('string', 'gname');
			      data.addColumn('number', 'price');
		    	  $.ajax({
		    		  url:"./purchaseGetList",
		    		  success:function(result){
		    			  
		    			  result = result.trim();
		    			  $("#getChartList").append(result);
		    			  let gnames = new Array();
		    			  let counts = new Array();
		    			  let arr = new Array();
		    			  $(".namelist").each(function(){
		    				 gnames.push($(this).val()); 
		    			  });
		    			  $(".countlist").each(function(){
		    				  counts.push($(this).val());
		    			  });
		    			  
		    			  for(let i = 0 ; i < gnames.length; i++){
		    				  let temp = new Array();
		    				  temp.push(gnames[i]);
		    				  temp.push(Number(counts[i]));
		    				  arr.push(temp);
		    			  }
		    			  
		    			  data.addRows(arr);
		    			  
		    			  
		    			  
		    			  var options = {
		    				         title: '구매 현황'
		    				       };
		    				       var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
		    				       chart.draw(data, options);
		    		  }
		    	  });
		      
		      
		    }
		});
		  
		</script>
	</div>
<c:import url="../../template/footer.jsp"></c:import>
</body>
</html>
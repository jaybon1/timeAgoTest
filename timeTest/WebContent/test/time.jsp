<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>Striped Rows</h2>
		<p>The .table-striped class adds zebra-stripes to a table:</p>
		<input type="hidden" id="count" value="${tables.size() }">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>text</th>
					<th>now-then</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="table" items="${tables }" varStatus="num">
					<input type="hidden" id="${num.count }_input" value="${table.time }">
					<tr>
						<td>내용${num.count }</td>
						<td id="${num.count }_td"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script type="text/javascript">
	
		function getAgo() {
			
			timestamp = new Date().getTime();
			
			var num = Number($("#count").val());
			
			for (var i = 1; i <= num; i++) {
				
				let time1 = Number($("#"+i+"_input").val());
// 				console.log(time1);
				
				timeInterval = timestamp-time1;
				
				if(timeInterval < 3600000){
					var string = parseInt(timeInterval/60000) + "분 전";
					$("#"+i+"_td").text(string);
				} else if(timeInterval < 86400000){
					var string = parseInt(timeInterval/3600000) + "시간 전";
					$("#"+i+"_td").text(string);
				} else if(timeInterval < 2678400000){
					var string = parseInt(timeInterval/86400000) + "일 전";
					$("#"+i+"_td").text(string);
				} else if(timeInterval < 31536000000){
					var string = parseInt(timeInterval/2678400000) + "달 전";
					$("#"+i+"_td").text(string);
				} else {
					var string = parseInt(timeInterval/31536000000) + "년 전";
					$("#"+i+"_td").text(string);
				}
				
				
			}
			
		}
		
		getAgo();
		setInterval(getAgo, 60000);
		
	</script>
	
</body>
</html>

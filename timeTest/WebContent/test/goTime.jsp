<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="button" onclick="fun()" value="시간 테스트">
<script type="text/javascript">
	function fun() {
		location.href = "/timeTest/user?cmd=timeTest";
	}
</script>
</body>
</html>
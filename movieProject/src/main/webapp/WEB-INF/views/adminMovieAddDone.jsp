<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/clapperboard.png">

<title>관리자용 영화추가</title>
</head>
<body onload="myFunction()">

<script>
function myFunction() {
	alert("영화가 등록되었습니다.");
	location.href = "../list";
}
	
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/clapperboard.png">

<title>관리자용 공지사항 등록</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body onload="myFunction()">

<script>
function myFunction() {
	if(${ret>0}){
		alert("글이 등록되었습니다.");
		 location.href = "list";
	} else {
		alert("등록실패");
		 location.href = "add";
	}
}
	
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 등록 확인</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body onload="myFunction()">

<script>
function myFunction() {
	if(${ret>0}){
		alert("글이 등록되었습ㄴ;디.");
		 location.href = "list";
	} else {
		alert("등록실패");
		 location.href = "add";
	}
}
	
</script>

</body>
</html>
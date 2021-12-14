<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body onload="myFunction()">

<script>
function myFunction() {
	alert("${login.name }님 환영합니다.");
	
	// 뒤로 갈 히스토리가 있는 경우 및 우리 시스템에서 링크를 통해 유입된 경우
	/* if (document.referrer && document.referrer.indexOf("main") !== -1) {
		location.reload();    // 뒤로가기
	}
	// 히스토리가 없는 경우 (URL을 직접 입력하여 유입된 경우)
	else {
	    location.href = "main";    // 메인페이지로 
	} */
/* 	history.go(-2);
	location.reload(); */
	
	/*  if (document.referrer && document.referrer.indexOf("main") !== -1) {
		location.reload();    // 뒤로가기
	}
		// 히스토리가 없는 경우 (URL을 직접 입력하여 유입된 경우)
	else {
	    location.href = "main";    // 메인페이지로 
	} */
	if (document.referrer && document.referrer.indexOf("main") !== -1) {
		location.reload();    // 뒤로가기
	}
		// 히스토리가 없는 경우 (URL을 직접 입력하여 유입된 경우)
	else {
	    location.href = "main";    // 메인페이지로 
	}
	
	
}
</script>



</body>
</html>
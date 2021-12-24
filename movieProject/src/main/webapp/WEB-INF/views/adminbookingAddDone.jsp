<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/clapperboard.png">

<title>관리자용 상영정보 관리</title>
</head>
<body onload="myFunction()">

<script>

function myFunction() {
	if(${ret}==0){
		alert("상영정보 등록에 실패했습니다.");
		location.href = "booking/add";
	} else if(${ret>0}) {
		alert("상영정보가 등록되었습니다.");
		location.href = "../main";
	}
}
</script>

</body>
</html>
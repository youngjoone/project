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
<title>로그인 오류</title>

</head>
<body onload="myFunction()">

<script>
function myFunction() {
	var yesno = confirm("로그인 실패\n다시 로그인하시겠습니까?");
	if(yesno == true){
		location.href = "login"
	} else if (yesno == false){
		location.href = "main";
	}
}
</script>

</body>
</html>
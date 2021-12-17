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
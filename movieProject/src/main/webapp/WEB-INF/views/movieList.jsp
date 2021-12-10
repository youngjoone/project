<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- vendor css -->
<link
	href="${pageContext.request.contextPath}/resources/template/lib/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/lib/template/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/lib/template/jqvmap/jqvmap.min.css"
	rel="stylesheet">

<!-- DashForge CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.dashboard.css">
</head>
<header>
<jsp:include page="/WEB-INF/views/header.jsp" />
</header>
<body>

<div class="row pd-t-50 bd-b">
<div class="col-sm"></div>
  <div class="col-sm-8">영화 전체보기</div>
  <div class="col-sm"></div>
</div>
<div class="row">
<div class="col-sm"></div>
  <div class="col-sm-2">
  
  <img src="${pageContext.request.contextPath}/resources/template/images/lalaland.jpg" class="rounded" alt="첫째" height="331" width="230">
 <p>제목<br>별점  예매하기</p>
   
  </div>
  <div class="col-sm-2">
  
  <img src="${pageContext.request.contextPath}/resources/template/images/lalaland.jpg" class="rounded" alt="첫째" height="331" width="230">
 
   
  </div>
  <div class="col-sm-2">
  
  <img src="${pageContext.request.contextPath}/resources/template/images/lalaland.jpg" class="rounded" alt="첫째" height="331" width="230">
 
   
  </div>
  <div class="col-sm-2">
  
  <img src="${pageContext.request.contextPath}/resources/template/images/lalaland.jpg" class="rounded" alt="첫째" height="331" width="230">
 
   
  </div>
  <div class="col-sm"></div>
</div>


</body>
<footer>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</html>
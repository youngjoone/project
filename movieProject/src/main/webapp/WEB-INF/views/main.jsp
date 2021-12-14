<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
	href="${pageContext.request.contextPath}/resources/template/lib/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/lib/jqvmap/jqvmap.min.css"
	rel="stylesheet">

<!-- DashForge CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.dashboard.css">
</head>
<style>
p {
	text-align: center;
}

a:link {
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: black;
}
</style>

<body>
<header>
<jsp:include page="/WEB-INF/views/header.jsp" />
</header>
	<div class="row bd-b pd-t-20">
		<br>
		<br>
		<div class="col-sm"></div>
		<div class="col-sm tx-14 tx-bold tx-gray-700 tx-spacing-5">
			<p>현재 상영작 ${login.name }</p>
		</div>
		<div class="col-sm"></div>
	</div>
	
	<div class="row pd-t-20">
		<div class="col-sm"></div>
		<c:forEach var="movieVO" items="${movieVOList}" end="3">
		<div class="col-sm">
			<div class="card">
				<a href="detail?MID=${movieVO.mid }"><img
					src="${pageContext.request.contextPath}/resources/template/images/${movieVO.poster }"
					class="card-img-top rounded" alt="${movieVO.title }" width="134px" height="350px"></a>
				<button type="button" class="btn btn-secondary btn-block" disabled>
					<a href="">예매하기</a>
				</button>
			</div>
		</div>
		</c:forEach>
		
		<div class="col-sm"></div>

	</div>
	
	<div class="row bd-b pd-t-150">
	<div class="col-sm"></div>
		<div class="col-sm tx-14 tx-bold tx-gray-700 tx-spacing-5">
			<p>공지사항</p>
		</div>
		<div class="col-sm"></div>
	</div>
	
	<div class="row pd-t-50">
	<div class="col-sm"></div>
	<div class="col-sm-8">
	<div><p style="text-align:right" class="pd-r-50"><a href="/movie/notice">더 보기</a></p></div>
	<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col" class="col-md-1">번호</th>
      <th scope="col" class="col-md-1">구분</th>
      <th scope="col" class="col-md-6">제목</th>
      <th scope="col" class="col-md-1">작성일</th>
      
    </tr>
  </thead>
  <tbody>
    <c:forEach var="noticeVO" items="${noticeVOList}" end="5">
	    
	    <tr>
     		<th scope="row">${noticeVO.noticeNO}</th>
     		<td>${noticeVO.category}</td>
      		<td><a href="">${noticeVO.nTitle}</a></td>
      		<td><fmt:formatDate value="${noticeVO.date}" pattern="yyyy/MM/dd"/></td>
  	 	 </tr>
    </c:forEach>
  </tbody>
</table>

	</div>
	<div class="col-sm"></div>
	
</div>

<footer>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</body>

</html>
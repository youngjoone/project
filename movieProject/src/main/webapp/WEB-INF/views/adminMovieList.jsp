<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<style>
p {
	text-align: center;
}

ul {
	list-style-type: none;
	margin: 5px;
}
</style>
</head>
<header>
<jsp:include page="/WEB-INF/views/adminHeader.jsp" />
</header>
<body>

	<div class="row pd-t-50 bd-b">
		<div class="col-sm"></div>
		<div class="col-sm-8 tx-14 tx-bold tx-gray-700 tx-spacing-5">
			<p>영화 전체보기</p>
		</div>
		<div class="col-sm">
			<button type="button" class="btn btn-danger mg-b-10" onclick="location.href='movie/add'">추가하기</button>
		</div>
	</div>

	<c:forEach var="movieVOList" items="${movieVO2DList}">
	
	<div class="row pd-t-20">		
		<div class="col-sm"></div>
		
		<c:forEach var="movieVO" items="${movieVOList}">
		<div class="col-sm">
			<div class="card">
				<a href="detail?MID=${movieVO.mid }"><img
					src="${pageContext.request.contextPath}/resources/template/images/${movieVO.poster }"
					class="card-img-top rounded" alt="${movieVO.title}" height="280px"></a>

				
				<div class="btn-group" role="group" aria-label="Basic example">
					<button type="button" class="btn btn-dark  " disabled>평점 ${movieVO.score }</button>
					<button type="button" class="btn btn-light  " onclick="location.href='../service/booking?mid=${movieVO.mid}'">예매하기</button>
				</div>
			</div>
		</div>
		</c:forEach>
		
		<!-- 마지막 UI 조정-->
		<c:if test="${fn:length(movieVOList) != 4}">
			<c:forEach begin="0" end="4" varStatus="loop">
				<c:if test="${fn:length(movieVOList) < loop.index}">
					<div class="col-sm"></div>
				</c:if>
			</c:forEach>
		</c:if>
		
		<div class="col-sm"></div>
	</div>	
	
	</c:forEach>
	</body>
<footer>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
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
</style>
</head>
<header>
	<jsp:include page="/WEB-INF/views/header.jsp" />
</header>
<body>
<div class="row mg-t-30 bd-b">
	<div class="col-sm tx-14 tx-bold tx-gray-700 tx-spacing-5">
			<p>새 영화 등록</p>
	</div>	
</div>
<div class="row mg-t-30">
	<div class="col-sm-3"></div>
	<div class="col-sm-6">
		<form name="movieAddForm" method="post" action="add">
		
			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">영화 일련번호</label>
   				<input type="text" class="form-control" name="mid" placeholder="영화 일련번호" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">영화 포스터</label>
   				<input type="text" class="form-control" name="poster" placeholder="포스터이름.확장자명" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">예고편 링크</label>
   				<input type="text" class="form-control" name="link" placeholder="링크URL주소" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">영화 제목</label>
   				<input type="text" class="form-control" name="title" placeholder="영화 제목" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">영화 내용</label>
   				<textarea class="form-control" rows="2" placeholder="영화 줄거리" name="content" required></textarea>
 			</div>
 			
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">장르</label>
   				<input type="text" class="form-control" name="genre" placeholder="영화 장르" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">상영시간</label>
   				<input type="number" class="form-control" name="runTime" placeholder="분단위" required>
 			
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">감독</label>
   				<input type="text" class="form-control" name="director" placeholder="감독이름" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">출연진</label>
   				<input type="text" class="form-control" name="cast" placeholder="이름1 , 이름2 , 이름3 ..." required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block" >성인,청소년</label>
   				<select class="custom-select" name="age" required>
					<option selected>연령</option>
					<option value="성인">성인</option>
					<option value="청소년">청소년</option>
				</select>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">상영 타입</label>
   				<input type="text" class="form-control" name="type" placeholder="2D , 3D, 4D">
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">개봉 날짜</label>
   				<input type="text" class="form-control" name="openDate" placeholder="yyyy.mm.dd">
 			</div>
 			<button class="btn btn-primary" type="submit">등록</button>
 			<button class="btn btn-secondary" type="cancel">취소</button>
 		
		</form>
	</div>
	<div class="col-sm-3"></div>

</div>

</body>
<footer>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


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
<link href="${pageContext.request.contextPath}/resources/template/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/template/lib/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/template/lib/jqvmap/jqvmap.min.css"
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
a:link {
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: black;
}

#search{
margin-bottom: 7px;
}
</style>
<script>
window.onload() = function(){ /* 수정하기 클릭시 */
	if(${login}!=null){//로그인 되어있으면
		document.getElementById("logout").style.display = "block";
		document.getElementById("login").style.display = "none";
	}
	return;
}
</script>

	<div class="row">


		<div class="col-sm order-1"></div>
		<div class="col-sm order-2">
			<a href="/movie/main"><p>
					<img src="${pageContext.request.contextPath}/resources/template/images/megabox2.jpg" alt="영화로고"
						width=" 300px" height=" 100px">
				</p></a>
		</div>
		<div class="col-sm order-3" id="login">
			<p class="text-right mg-t-20 mg-r-20">
				<a href="/movie/login">로그인</a>
				<a class="mg-l-20" href="/movie/join">회원가입</a>
			</p>
		</div>
		
		<div class="col-sm order-3" style="display:none" id="logout">
			<p class="text-right mg-t-20 mg-r-20">
				${login.name }님
				<a class="mg-l-20" href="/movie/logout">로그아웃</a>
			</p>
		</div>

	</div>
	<div class="row bd-b">
		<div class="col-sm order-1"></div>
		<div class="col-sm order-2"></div>
		<div class="col-sm order-3"></div>
		<div class="col-sm order-4"></div>
		<div class="col-sm order-5"></div>
		<div class="col-sm order-6">
			<div class="search-form pd-r-35" id="search">
				<input type="search" class="form-control" placeholder="Search">
				<button class="btn" type="button">
					<i data-feather="search"></i>
				</button>

			</div>
		</div>

	</div>


	<!-- navbar-brand -->

	<div class="row bd-b">

		<!-- navbar-menu-header -->
		<div class="col-sm order-1"></div>
		<div class="col-sm order-2">
			<ul class="nav nav-pills nav-fill">
				<li class="nav-item"><a href="/movie/list" class="nav-link"><i
						data-feather="box">영화</i></a></li>
				<li class="nav-item"><a href="/service/booking" class="nav-link"><i
						data-feather="archive">예매</i></a></li>

			</ul>
		</div>

		<div class="col-sm order-3">
			<ul class="nav nav-pills nav-fill">
				<li class="nav-item"><a href="/movie/notice" class="nav-link"><i
						data-feather="archive">공지사항</i></a></li>
				<li class="nav-item"><a href="/service/mypage" class="nav-link"><i
						data-feather="archive">마이페이지</i></a></li>
			</ul>
		</div>

		<div class="col-sm order-4"></div>
	</div>
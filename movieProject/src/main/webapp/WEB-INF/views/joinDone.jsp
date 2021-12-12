<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>

<script>
function main(){
	window.location.href = "main";
}

function login(){
	window.location.href = "login";
}
</script>


    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/template/assets/img/favicon.png">

    <!-- vendor css -->
    <link href="${pageContext.request.contextPath}/resources/template/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/template/lib/ionicons/css/ionicons.min.css" rel="stylesheet">

    <!-- DashForge CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.auth.css">
    
    
</head>
<body>
<div class="content content-fixed content-auth-alt">
      <div class="container ht-100p tx-center">
        <div class="ht-100p d-flex flex-column align-items-center justify-content-center">
          <div class="wd-70p wd-sm-250 wd-lg-300 mg-b-15"><img src="${pageContext.request.contextPath}/resources/img/check.png" class="img-fluid" alt="check" width="100"></div>
          <h1 class="tx-color-01 tx-24 tx-sm-32 tx-lg-36 mg-xl-b-5">회원가입이 <b>완료</b>되었습니다.</h1>
          <h6 class="tx-16 tx-sm-18 tx-lg-20 tx-normal mg-b-20">${name }님의 회원가입을 축하합니다.</h6>
          <div class="mg-b-40"><button onclick="login()" class="btn btn-lg btn-dark bd-2 pd-x-30">로그인</button>
          	<button onclick="main()" class="btn btn-lg btn-white bd-2 pd-x-30">메인페이지</button></div>
        </div>
      </div><!-- container -->
</div>

    <script src="${pageContext.request.contextPath}/resources/template/lib/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/lib/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/template/assets/js/dashforge.js"></script>

    <!-- append theme customizer -->
    <script src="${pageContext.request.contextPath}/resources/template/lib/js-cookie/js.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/dashforge.settings.js"></script>

</body>
</html>
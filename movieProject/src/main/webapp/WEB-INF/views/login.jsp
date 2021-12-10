<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Twitter -->
    <meta name="twitter:site" content="@themepixels">
    <meta name="twitter:creator" content="@themepixels">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="DashForge">
    <meta name="twitter:description" content="Responsive Bootstrap 4 Dashboard Template">
    <meta name="twitter:image" content="http://themepixels.me/dashforge/img/dashforge-social.png">

    <!-- Facebook -->
    <meta property="og:url" content="http://themepixels.me/dashforge">
    <meta property="og:title" content="DashForge">
    <meta property="og:description" content="Responsive Bootstrap 4 Dashboard Template">

    <meta property="og:image" content="http://themepixels.me/dashforge/img/dashforge-social.png">
    <meta property="og:image:secure_url" content="http://themepixels.me/dashforge/img/dashforge-social.png">
    <meta property="og:image:type" content="image/png">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="600">

    <!-- Meta -->
    <meta name="description" content="Responsive Bootstrap 4 Dashboard Template">
    <meta name="author" content="ThemePixels">
    
<title>로그인</title>

<script type="text/javascript">
function sub(form){
	form.submit();
	
	
	
	
	
}
</script>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="../../assets/img/favicon.png">

    <!-- vendor css -->
    <link href=/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="../../lib/ionicons/css/ionicons.min.css" rel="stylesheet">

    <!-- DashForge CSS -->
    <link rel="stylesheet" href="../../assets/css/dashforge.css">
    <link rel="stylesheet" href="../../assets/css/dashforge.auth.css">

</head>
<body>
<form action="/movie/login" method="post">
<div class="container">
        <div class="media align-items-stretch justify-content-center ht-100p pos-relative">
          <div class="media-body align-items-center d-none d-lg-flex">
            <div class="mx-wd-600">
              <img src="https://via.placeholder.com/1260x950" class="img-fluid" alt="">
            </div>
            
          </div><!-- media-body -->
          <div class="sign-wrapper mg-lg-l-50 mg-xl-l-60">
            <div class="wd-100p">
              <h3 class="tx-color-01 mg-b-5">Sign In</h3>
              <p class="tx-color-03 tx-16 mg-b-40">Welcome back! Please sign in to continue.</p>

              <div class="form-group">
                <label>아이디</label>
                <input type="text" name="id" class="form-control" placeholder="">
              </div>
              <div class="form-group">
                <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">비밀번호</label>
                </div>
                <input type="password" name="pw" class="form-control" placeholder="">
              </div>
              <button onclick="sub(this)" class="btn btn-brand-02 btn-block">로그인</button>
              <button class="btn btn-outline-facebook btn-block">회원가입</button>
              <button class="btn btn-outline-twitter btn-block">홈페이지</button>
              <div class="tx-13 mg-t-20 tx-center">Don't have an account? <a href="page-signup.html">Create an Account</a></div>
            </div>
          </div><!-- sign-wrapper -->
        </div><!-- media -->
      </div>
</form>      
      
    <script src="../../lib/jquery/jquery.min.js"></script>
    <script src="../../lib/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../lib/feather-icons/feather.min.js"></script>
    <script src="../../lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>

    <script src="../../assets/js/dashforge.js"></script>

    <!-- append theme customizer -->
    "<c:url value="/resources/js/raphael.min.js" />"
    <script src="../../lib/js-cookie/js.cookie.js"></script>
    <script src="../../assets/js/dashforge.settings.js"></script>
      
</body>
</html>
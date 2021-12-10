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

    <!-- Meta -->
    <meta name="description" content="Responsive Bootstrap 4 Dashboard Template">
    <meta name="author" content="ThemePixels">
    
<title>로그인</title>
<script type="text/javascript">
function sub(form){
	form.submit();
}

function join(){
	window.location.href = "join";
}

function main(){
	window.location.href = "main";
}

</script>

    <!-- vendor css -->
    <link href="${pageContext.request.contextPath}/resources/template/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/template/lib/ionicons/css/ionicons.min.css" rel="stylesheet">

    <!-- DashForge CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.auth.css">

	<link href="${pageContext.request.contextPath}/resources/css/modal.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
	
<style>
#modal.modal-overlay {
    display: none;
}
</style>

</head>
<body>
<form action="/movie/login" method="post">
<div class="container">
        <div class="media align-items-stretch justify-content-center ht-100p pos-relative pd-t-100">
          <div>
            <div class="mx-wd-400">
              <img src="${pageContext.request.contextPath}/resources/img/poster.jpg" class="rounded img-fluid" alt="">
            </div>
            
          </div><!-- media-body -->
          
          <div class="sign-wrapper mg-lg-l-50 mg-xl-l-60">
            <div class="wd-100p">
              <h3 class="tx-color-01 mg-b-5">LOGIN</h3>
              <p class="tx-color-03 tx-16 mg-b-40">Please sign in to continue.</p>

              <div class="form-group">
                <label></label>
                <input type="text" name="id" class="form-control" placeholder="아이디" required>
              </div>
              <div class="form-group">
                <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f"></label>
                </div>
                <input type="password" name="pw" class="form-control" placeholder="비밀번호" required>
              </div>
              
              <br>
              
              <button class="btn btn-secondary btn-block">로그인</button>
              <button class="btn btn-outline-dark btn-block" onclick="join()">회원가입</button>
              <button class="btn btn-outline-dark btn-block" onclick="main()">홈페이지</button>
            </div>
          </div><!-- sign-wrapper -->
        </div><!-- media -->
      </div>    
</form>
      
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
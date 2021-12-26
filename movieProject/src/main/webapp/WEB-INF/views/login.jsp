<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">

    <!-- Meta -->
    <meta name="description" content="Responsive Bootstrap 4 Dashboard Template">
    <meta name="author" content="ThemePixels">
    
    <!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/clapperboard.png">
    
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

//랜덤 포스터
/*const imgArray = new Array();
imgArray[0] = "C:/Users/user/Desktop/개발도구/웹개발사진/MakeUp/jung.gif";
imgArray[1] = "C:/Users/user/Desktop/개발도구/웹개발사진/MakeUp/Login.png";
imgArray[2] = "C:/Users/user/Desktop/개발도구/웹개발사진/MakeUp/사이트전체사진/header-bg.png"
imgArray[3] = "C:/Users/user/Desktop/개발도구/웹개발사진/MakeUp/사이트전체사진/마지막립스틱.jpg"; */

/* for(int i=0; i<${fn:length(movieList)}; i++){
	imgArray[i] = "${pageContext.request.contextPath }/fileDownload?posterName=${movieVO.posterName }&mid=${movieVO.mid }";
}

function showImage(){
	var imgNum = Math.round(Math.random()*${fn:length(movieList)});
	var objImg = document.getElementById("introImg");
	objImg.src = imgArray[imgNum];
} */

</script>

    <!-- vendor css -->
    <link href="${pageContext.request.contextPath}/resources/template/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/template/lib/ionicons/css/ionicons.min.css" rel="stylesheet">

    <!-- DashForge CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.auth.css">

	<link href="${pageContext.request.contextPath}/resources/css/join.css" rel="stylesheet">
	
<style>
#modal.modal-overlay {
    display: none;
}
.media-body{
	padding-top: 100px;
	padding-bottom: 0px;
	padding-left: 0px;
	padding-right: 50px;
	width: 500px;
}
.sign-wrapper{
	margin-left: 0px;
	margin-right: 20px;
}
</style>

</head>
<body ><!-- onload="showImage()" -->

<div class="container">
        <div class="media align-items-stretch justify-content-center ht-100p pos-relative pd-t-50">
          <div class="media-body align-items-stretch d-none d-lg-flex justify-content-center pos-relative">
            <div class="mx-wd-400">
              <img id="poster" width="400" src="${pageContext.request.contextPath}/resources/template/images/spiderman.jpg" class="img-fluid" alt="">
            </div>
            
          </div><!-- media-body -->
          
          <div class="sign-wrapper mg-lg-l-50 mg-xl-l-60">
          
          
            <div class="wd-100p">
            <form action="/movie/login" method="post">
            <div id="logoImage">
            	<img src="${pageContext.request.contextPath}/resources/template/images/megabox.png" alt="로고 이미지" id="megabox">
			</div>
			<div>
			  <label id="login"><b>로그인</b></label><br>
              <div class="form-group">
                <input type="text" name="id" class="form-control" placeholder="아이디" required>
              </div>
              <div class="form-group">
                <input type="password" name="pw" class="form-control" placeholder="비밀번호" required>
              </div>
            </div>
              <br>
              
              <button class="btn btn-secondary btn-block">로그인</button>
            </form>
            <br>
            <button class="btn btn-outline-dark btn-block" onclick="join()">회원가입</button>
		  	<button class="btn btn-outline-dark btn-block" onclick="main()">홈페이지</button>
            </div>
            
            
          </div><!-- sign-wrapper -->
          
        </div><!-- media -->
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
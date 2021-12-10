<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- Meta -->
    <meta name="description" content="Responsive Bootstrap 4 Dashboard Template">
    <meta name="author" content="ThemePixels">

    <!-- vendor css -->
    <link href="${pageContext.request.contextPath}/resources/template/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/template/lib/ionicons/css/ionicons.min.css" rel="stylesheet">

    <!-- DashForge CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.auth.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
    
    <script type="text/javascript">
    var cleaveC = new Cleave('#inputDate', {
    	  date: true,
    	  datePattern: ['Y', 'm', 'd']
    	});
    </script>
    
</head>
<body>

<div class="container">
        <div class="media align-items-stretch justify-content-center ht-100p">
          
          <div class="media-body pd-y-30 pd-lg-x-50 pd-xl-x-60 align-items-center d-none d-lg-flex pos-relative">
            <div class="mx-lg-wd-500 mx-xl-wd-550">
              <img src="https://via.placeholder.com/1280x1225" class="img-fluid" alt="">
            </div>
          </div><!-- media-body -->
          
          <div class="sign-wrapper mg-lg-r-50 mg-xl-r-60">
            <div class="pd-t-20 wd-100p">
              <h4 class="tx-color-01 mg-b-5"><b>회원가입</b></h4>
              
              <br><br>

              <div class="form-group">
                <label>아이디</label>
                <input type="email" class="form-control" placeholder="아이디" required>
              </div>
              <div class="form-group">
                <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">비밀번호</label>
                </div>
                <input type="password" class="form-control" placeholder="비밀번호" required>
              </div>
              <div class="form-group">
                <label>이름</label>
                <input type="text" class="form-control" placeholder="이름">
              </div>
              <div class="form-group">
                <label>생년월일</label>
                <input type="date" class="form-control" placeholder="Enter your lastname">
                <input id="inputDate" type="text" class="form-control" placeholder="YYYY/MM/DD">
              </div>
              <div class="form-group">
                <label>생년월일</label>
                <input type="text" class="form-control" placeholder="Enter your lastname">
              </div>
				
              <button class="btn btn-secondary btn-block">회원가입</button>
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
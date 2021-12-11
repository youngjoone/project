<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- Meta -->
    <meta name="description" content="Responsive Bootstrap 4 Dashboard Template">
    <meta name="author" content="ThemePixels">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
    crossorigin="anonymous"></script>


<script>
$(document).ready(function() {
    $('#button-addon2').click(function() { //id가 userId인 태그의 값이 바뀌면
        $.ajax({
        		async: true;
                type: 'POST', //post방식
                url: 'dupId', //Controller에 작성한 /dupId로
                dataType: "json", //return 하는 dataType (서버에서 주는)
                data: {"id": $('#userId').val()}, // 서버로 보내는 ?id=id
                success: function(data) {
                   // data.server에서 보낸 mapId
                   if(data.id == 'false') { 
                	   $('#checkDup').text("사용가능한 아이디입니다.")
                   }
                   else { 
                      alert('중복임');
                      $('#checkDup').text("이미 존재하는 아이디입니다.")
                      $('#userId').focus(); // focus 를 다시 이동하고
                   }
                }, 
                error: function(request,status,error) { //실행 실패하면
                   alert("에러 :"+error);
                   /* request.responseText */
                }                     //alert에 404뜨는데 웹에서 404뜰때 그 소스 
                //400번대 에러:client오류 500번대 에러 : server오류
         }); //end ajax 
    }); //end on 
}); 



    var cleaveC = new Cleave('#inputDate', {
    	  date: true,
    	  datePattern: ['Y', 'm', 'd']
    	});
    
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
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
    
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
              
            <div class="input-group">
  				<input type="text" name="id" id="userId" class="form-control" placeholder="아이디" aria-label="Recipient's username" aria-describedby="button-addon2">
  				<div class="input-group-append">
    				<button class="btn btn-dark" type="button" id="button-addon2">중복확인</button>
  				</div>
  				<div id="checkDup"></div>
			</div>
              
              <div class="form-group">
                <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f"></label>
                </div>
                <input type="password" name="pw" class="form-control" placeholder="비밀번호" required>
              </div>
              <div class="form-group">
                <label></label>
                <input type="text" name="name" class="form-control" placeholder="이름">
              </div>
              <div class="form-group">
                <label>생년월일</label>
                <input type="date" class="form-control" placeholder="Enter your lastname">
                <input id="inputDate" type="text" class="form-control" placeholder="YYYY/MM/DD">
              </div>
              <div class="form-group">
                <label></label>
                <input type="text" name="tel" class="form-control" placeholder="전화번호">
              </div>
              <div class="form-group">
                <label></label>
                <input type="text" name="email" class="form-control" placeholder="이메일">
              </div>
				
              <button class="btn btn-secondary btn-block">회원가입</button>
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
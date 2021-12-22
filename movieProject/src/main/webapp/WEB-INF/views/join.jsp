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

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


<script>
$(document).ready(function() {
    $('#button-addon2').click(function() {
        $.ajax({
                type: 'POST',
                url: 'dupId',
                dataType: "json", 
                data: {"id": $('#userId').val()}, /* 서버로 보내는 ?id=id */
                success: function(data) {
                   if(data.id == 'false') {  //중복x
                		$('#checkDup').text("사용 가능한 아이디입니다.");
                	   	$("#checkDup").css("color","#7BC379"); 
                	   	if($('#userId').val()==""){
    						$('#checkDup').text("아이디를 입력하세요.");
      						$("#checkDup").css("color","red");
    					}
                   }
                   else {  //중복o
                	  $('#userId').focus();
                	  $('#checkDup').text("이미 존재하는 아이디입니다.");
                	  $("#checkDup").css("color","red");
                   }
                }, 
                error: function(request,status,error) { //실행일 실패하면
                   alert('에러!! : ' + request.responseText + ":"+error);
                }                     //alert에 404뜨는데 웹에서 404뜰때 그 소스 
                //400번대 에러:client오류 500번대 에러 : server오류
         }); //end ajax 
    }); //end on 
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
              <img src="https://via.placeholder.com/1280x1225" id="poster" class="img-fluid" alt="">
            </div>
          </div><!-- media-body -->
          
          <div class="sign-wrapper mg-lg-r-50 mg-xl-r-60">
          
            <div class="pd-t-20 wd-100p">
            <form action="join" method="post">
            	<div id="logoImage">
            		<img src="${pageContext.request.contextPath}/resources/template/images/megabox.png" alt="" id="megabox">
				</div>
              <h4 class="tx-color-01 mg-b-5"><b>회원가입</b></h4>
			<div class="input-group">
  				<input type="text" name="id" id="userId" class="form-control" placeholder="*아이디 (최대 14자 입력가능)" minlength="5" maxlength="14" aria-label="Recipient's username" aria-describedby="button-addon2" required>
  				<div class="input-group-append">
    				<button class="btn btn-outline-secondary" type="button" id="button-addon2">중복확인</button>
  				</div>
			</div>
			<div id="checkDup"></div>
              <div class="form-group">
                <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f"></label>
                </div>
                <input type="password" name="pw" class="form-control" minlength="5" maxlength="20" placeholder="*비밀번호 (최대 20자 입력가능)" required>
              </div>
              <div class="form-group">
                <input type="text" name="name" minlength="1" class="form-control" placeholder="*이름" maxlength="15" required>
              </div>
              <div class="form-group">
                <label></label>
                <input type="date" name="birth" id="birth" value="" class="form-control" placeholder="" required>
	          </div>
              <div class="input-group">
  				<div class="input-group-prepend">
    				<span class="input-group-text">*010</span>
  				</div>
  				<input id="tel" type="text" name="tel" class="form-control" placeholder="휴대폰번호 (숫자 8자리만 입력하세요)" maxlength="8" required>
			</div><br>
              <div class="form-group">
                <label></label>
                <input type="text" name="email" class="form-control" placeholder="이메일">
              </div>
              <br>
              <button class="btn btn-secondary btn-block">회원가입</button>
              </form>
              <p></p>
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
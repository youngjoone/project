<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/clapperboard.png">

<title>관리자용 영화추가</title>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 스윗 알렛 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">

<!-- vendor css -->
<link href="${pageContext.request.contextPath}/resources/template/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/template/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/template/lib/jqvmap/jqvmap.min.css" rel="stylesheet">

<!-- DashForge CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.dashboard.css">
<style>
p {
	text-align: center;
}

</style>
<script>

function thumnail(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			$('#preview').attr('src',e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

</script>
</head>
<header>
<jsp:include page="/WEB-INF/views/adminHeader.jsp" />
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
		<form name="movieAddForm" method="post" action="add" enctype="multipart/form-data">
		
			<div class="form-group">
    			<!-- <label for="formGroupExampleInput" class="d-block">영화 일련번호</label>
   				<input type="text" class="form-control" name="mid" placeholder="영화 일련번호"  id="mid" required> -->
   				<input type="hidden" name="mid" value="M${mid+1 }">
 			</div>
 			
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">영화 제목</label>
   				<input type="text" class="form-control" name="title" placeholder="영화 제목" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">영화 내용</label>
   				<textarea class="form-control" rows="10" placeholder="영화 줄거리" name="content" required></textarea>
 			</div>
 			
 			<div class="form-group">
				<label for="formGroupExampleInput" class="d-block">포스터 업로드</label>
				<div class="row">
					<div class="col-sm-7">
   						<input type="file" name="poster" onchange="thumnail(this)" required>
   					</div>
   					<div class="col-sm-5"><img id="preview" src="" width="200" /></div>
   				</div>
 			</div>
 			
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">예고편 링크</label>
   				<input type="text" class="form-control" name="link" placeholder="링크URL주소" required>
 			</div>
 			
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">장르</label>
   				<input type="text" class="form-control" name="genre" placeholder="영화 장르" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">상영시간</label>
   				<input type="number" class="form-control" name="runTime" placeholder="분단위"  min="0" max="1000" required>
 			
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">감독</label>
   				<input type="text" class="form-control" name="director" placeholder="감독이름" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">출연진</label>
   				<input type="text" class="form-control" name="cast" placeholder="이름1 , 이름2 , 이름3 ...">
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block" >관람가 선택</label>
   				<select class="custom-select" name="age" required>
					<option value="전체관람가" selected>전체관람가</option>
					<option value="12세이상관람가">12세이상관람가</option>
					<option value="15세이상관람가">15세이상관람가</option>
					<option value="청소년관람불가">청소년관람불가</option>
				</select>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">상영 타입</label>
   				<input type="text" class="form-control" name="type" placeholder="2D , 3D, 4D">
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">개봉 날짜</label>
   				<input type="text" id="datepicker" class="form-control" name="openDate" placeholder="yyyy.mm.dd">
 			</div>
 			<button class="btn btn-primary" type="submit">등록</button>
 			<button class="btn btn-secondary" type="button" onclick="cancel()" >취소</button>
 		
		</form>
		
	</div>
	<div class="col-sm-3"></div>

</div>


<footer>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
  $(function(){
      $("#datepicker").datepicker({ dateFormat: 'yy.mm.dd' });
   });
  
  $.datepicker.setDefaults({
      dateFormat: 'yymmdd',
      prevText: '이전 달',
      nextText: '다음 달',
      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      showMonthAfterYear: true,
      yearSuffix: '년'
  });                    

function cancel(){
	history.back();
}
</script>
</body>
</html>
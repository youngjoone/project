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

<title>관리자용 영화관리</title>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

function back(){
	location.href='detail?MID=${movieVO.mid}';
}



function disabled(){
	$('select > option:disabled').attr("disabled",false);
}

</script>
</head>

<body>

<header>
<jsp:include page="/WEB-INF/views/adminHeader.jsp" />
</header>

<div class="row mg-t-30 bd-b">
	<div class="col-sm tx-14 tx-bold tx-gray-700 tx-spacing-5">
			<p>${movieVO.title } 영화 수정</p>
	</div>	
</div>
<div class="row mg-t-30">
	<div class="col-sm-3"></div>
	<div class="col-sm-6">
		<form name="movieAddForm" method="post" action="update" enctype="multipart/form-data">
			<input type="hidden" name="mid" value="${movieVO.mid }">
			
			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">영화 일련번호</label>
   				<input type="text" class="form-control" placeholder="영화 일련번호"  value="${movieVO.mid }" disabled>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">영화 포스터</label>
    			<div class="row">
					<div class="col-sm-7">
						<input type="hidden" name="originalFileName" value="${movieVO.posterName }" />
   						<input type="file" name="poster" onchange="thumnail(this)">
   					</div>
   					<div class="col-sm-5"><img src="${pageContext.request.contextPath }/fileDownload?posterName=${movieVO.posterName }&mid=${movieVO.mid }" id="preview" width="200" /></div>
   				</div>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">예고편 링크</label>
   				<input type="text" class="form-control" name="link" placeholder="링크URL주소" value="${movieVO.link }" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">영화 제목</label>
   				<input type="text" class="form-control" name="title" placeholder="영화 제목" value="${movieVO.title }"  required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">영화 내용</label>
   				<textarea class="form-control" rows="10" placeholder="영화 줄거리" name="content" required>${movieVO.content }</textarea>
 			</div>
 			
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">장르</label>
   				<input type="text" class="form-control" name="genre" placeholder="영화 장르" value="${movieVO.genre }" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">상영시간</label>
   				<input type="number" class="form-control" name="runTime" placeholder="분단위" value="${movieVO.runTime }" min="0" max="1000" required>
 			
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">감독</label>
   				<input type="text" class="form-control" name="director" placeholder="감독이름" value="${movieVO.director }" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">출연진</label>
   				<input type="text" class="form-control" name="cast" placeholder="이름1 , 이름2 , 이름3 ..." value="${movieVO.cast }" required>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block" >등급</label>
   				<select class="custom-select" name="age" required>
					<option value="${movieVO.age }" id="option1" selected>${movieVO.age }</option>
					<option value="전체관람가">전체관람가</option>
					<option value="12세이상관람가">12세이상관람가</option>
					<option value="15세이상관람가">15세이상관람가</option>
					<option value="청소년관람불가">청소년관람불가</option>
				</select>
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">상영 타입</label>
   				<input type="text" class="form-control" name="type" placeholder="2D , 3D, 4D" value="${movieVO.type }">
 			</div>
 			<div class="form-group">
    			<label for="formGroupExampleInput" class="d-block">개봉 날짜</label>
   				<input type="text" class="form-control" name="openDate" placeholder="yyyy.mm.dd" value="${movieVO.openDate }" >
 			</div>
 			<button class="btn btn-primary" onclick="disabled()" style="float: right; margin-left: 5px;">등록</button>
 			</form>
 			<button class="btn btn-secondary" style="float: right;" onclick="back()">취소</button>
	</div>
	<div class="col-sm-3"></div>

</div>


<footer>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</body>
</html>
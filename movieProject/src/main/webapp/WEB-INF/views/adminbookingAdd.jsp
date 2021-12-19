<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<script>
$(document).ready(function(){
    $('input.timepicker').timepicker({ 
    	timeFormat: 'HH:mm:ss',
        interval: 30,
        startTime: '01:00:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true 
    });
});

function dateTime(frm){
	var date = document.getElementById('datepicker4').value;
	var time = document.getElementById('time').value;
	
	var screenTimeInput = document.createElement("input");
	screenTimeInput.setAttribute("type","hidden");
	screenTimeInput.setAttribute("name","screenTime");
	screenTimeInput.setAttribute("value",date+" "+time);
	
	frm.appendChild(screenTimeInput);
}

</script>

</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/adminHeader.jsp" />
</header>

<div class="row bd-b pd-t-20">
	<br> <br>
	<div class="col-sm"></div>
	<div class="col-sm tx-14 tx-bold tx-gray-700 tx-spacing-5">
		<p>상영정보 추가</p>
	</div>
	<div class="col-sm"></div>
</div>

<form name="frm" action="add" method="post">
<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-3 mg-t-30 bd-r">
		<!--현재 상영중인 영화만 나와야함 DB에서 조인 해야할듯? 
			여러가지 영화중에서 하나만 고를수 있어야함 그리고 취소하고 다른영화 고르는법? -->
		<!-- 메인에서 오면 선택 안되어있게, 리스트에서 예매하기 누르면 미리 선택되어 있게 -->
		<div class="tx-14 tx-bold tx-gray-700 tx-spacing-5">영화선택</div>
		<select class="custom-select" size="20" id="movieSelectBox" name="mid" required>
		
			<c:choose>
				<c:when test="${empty movieVOList }">
					<p>등록할 영화가 없습니다.</p>
				</c:when>
				<c:when test="${!empty movieVOList }">
					<c:forEach var="movie" items="${movieVOList }">
						<option value="${movie.mid }">${movie.title }</option>
					</c:forEach>
				</c:when>
			</c:choose>
			
		</select>
	</div>
	<div class="col-sm-5 mg-t-30">
		<!-- 상영관 선택 -->
		<div class="tx-14 tx-bold tx-gray-700 tx-spacing-5"><br>상영관 선택</div>
		<!--ajax로 데이터 받아서 foreach  -->
		<div class="mg-t-20" id="">
			<select class="custom-select" name="screenNO" required>
				<option selected disabled>상영관 선택</option>
				<option value="S01">S01</option>
				<option value="S02">S02</option>
				<option value="S03">S03</option>
			</select>
		</div>
		<br>
		
		<!-- 날짜 선택 -->
		<div class="mg-t-30 bd-t tx-14 tx-bold tx-gray-700 tx-spacing-5">상영날짜 선택</div>
		<div class="mg-t-20" id="">
			<input type="text" class="form-control" placeholder="yyyy-mm-dd" id="datepicker4" required>
		</div>
		<br>
		
		<!-- 시간 선택 -->
		<div class="mg-t-30 bd-t tx-14 tx-bold tx-gray-700 tx-spacing-5"><br>상영시간 선택</div>
		<div class="mg-t-20" id="">
			<input id="time" class="form-control timepicker" required>
			<input type="hidden" name="screenDateNO" value="D${screenDateNo+1 }">
		</div>
		<br>
		
		<button type="submit" onclick="dateTime(frm)" class="btn btn-dark" style="float: right;">등록</button>
		<!-- <div class="mg-t-30 bd-t tx-14 tx-bold tx-gray-700 tx-spacing-5"> -->
	</div>
	<div class="col-sm-2">
		
	</div>
</div>
</form>



<footer>
   <jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
  
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script>
  $(function(){
      $("#datepicker4").datepicker({ dateFormat: 'yy-mm-dd' });
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
</script>
</body>
</html>
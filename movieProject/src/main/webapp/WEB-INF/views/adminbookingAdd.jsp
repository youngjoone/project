<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/clapperboard.png">

<title>관리자용 상영정보 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!-- 스윗 알렛 -->
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

function select(){
	var open = $("#movieSelectBox option:selected").attr('value2');
	$('#date').text('※ 개봉날짜 : '+open);
}

function resetValue(){
		
		$("#screenNO").html('<option selected disabled>상영관 선택</option><option value="S01">S01</option><option value="S02">S02</option><option value="S03">S03</option>');
		$('#datepicker4').val('');
		$('#time').val('');
	
}

$(document).ready(function() {
    $('#chk').click(function() {
    	$.ajax({
            type: 'POST',
            url: 'chkDate',
            dataType: "json", 
            data: {"screenNO": $('#screenNO option:selected').attr('value'), 
        			"date" : $('#datepicker4').val(), 
        			"time" : $('#time').val()}, /* 서버로 보내는 ?id=id */
            success: function(map) {
               if(map.dup == 'false') {  //중복x
            	   alert('해당 시간은 등록이 가능합니다.');
            	   btnDiv();
            	   /* $('#exampleModal').modal('toggle');
            	   $('#exampleModal').modal('show'); */
            	  
               }
               else {  //중복o
            	   alert('해당 시간에 이미 상영영화가 있습니다.');
            	   resetValue();
            	   
               }
            }, 
            error: function(request,status,error) { //실행일 실패하면
               alert('에러!! : ' + request.responseText + ":"+error);
            }                     //alert에 404뜨는데 웹에서 404뜰때 그 소스 
            //400번대 에러:client오류 500번대 에러 : server오류
     	}); //end ajax 
    }); //end on 
}); 
function btnDiv(){
	$("#chk").remove();
	var frmBtn=''; 
	frmBtn +='<button onclick="dateTime(frm)" class="btn btn-dark" style="float: right;">등록</button>';
	$("#btnDiv").append(frmBtn);
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

<form name="frm" id="frm" action="add" method="post">
<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-3 mg-t-30 bd-r">
		<div class="tx-14 tx-bold tx-gray-700 tx-spacing-5">영화선택</div>
		
			<c:choose>
				<c:when test="${empty movieVOList }">
					<p>등록할 영화가 없습니다.</p>
				</c:when>
				<c:when test="${!empty movieVOList }">
					<select class="custom-select" size="20" id="movieSelectBox" name="mid" onchange="select()" required>
						<c:forEach var="movie" items="${movieVOList }" varStatus="movieNum">
							<option value="${movie.mid }" value2="${movie.openDate }" id="movieNum${movieNum.index }">${movie.title }</option>
						</c:forEach>
					</select>
				</c:when>
			</c:choose>
			
	</div>
	<div class="col-sm-5 mg-t-30" >
		<!-- 상영관 선택 -->
		<div class="tx-14 tx-bold tx-gray-700 tx-spacing-5"><br>상영관 선택</div>
		<!--ajax로 데이터 받아서 foreach  -->
		<div class="mg-t-20" id="">
			<select class="custom-select" name="screenNO" id="screenNO" required>
				<option selected disabled>상영관 선택</option>
				<option value="S01">S01</option>
				<option value="S02">S02</option>
				<option value="S03">S03</option>
			</select>
		</div>
		<br>
		
		<!-- 날짜 선택 -->
		<div class="mg-t-30 bd-t tx-14 tx-bold tx-gray-700 tx-spacing-5"><br>상영날짜 선택</div>
		<div class="mg-t-20" id="">
			<p id="date" style="text-align: left;"></p>
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
		<div id="btnDiv">
		
		<button type="button" id="chk" class="btn btn-info " style="float: right; margin-right:5px">상영관 중복체크</button>
		</div>
		
		<!-- <div class="mg-t-30 bd-t tx-14 tx-bold tx-gray-700 tx-spacing-5"> -->
	</div>
	<div class="col-sm-2">
		
	</div>
</div>
</form>

<!-- Modal -->
<!-- 	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상영정보 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">해당 시간은 등록이 가능합니다.<br>등록하시겠습니까?
				</div>
				<div class="modal-footer">
					<button onclick="dateTime(frm)" class="btn btn-dark" style="float: right;">등록</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
				</div>
			</div>
		</div>
	</div> -->



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
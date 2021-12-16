<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- vendor css -->
<link
	href="${pageContext.request.contextPath}/resources/template/lib/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/lib/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/lib/jqvmap/jqvmap.min.css"
	rel="stylesheet">

<!-- DashForge CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/assets/css/dashforge.dashboard.css">
</head>
<header>
<jsp:include page="/WEB-INF/views/header.jsp" />
</header>
<body>
	<div class="row bd-b pd-t-20">
		<br>
		<br>
		<div class="col-sm"></div>
		<div class="col-sm tx-14 tx-bold tx-gray-700 tx-spacing-5">
			<p>영화 예매</p>
		</div>
		<div class="col-sm"></div>
	</div>
	<div class="row">
		<div class="col-sm-2">왼쪽여백</div>

		<div class="col-sm-3 mg-t-30 bd-r">
			<!--현재 상영중인 영화만 나와야함 DB에서 조인 해야할듯? 
				여러가지 영화중에서 하나만 고를수 있어야함 그리고 취소하고 다른영화 고르는법? -->
			<!-- 메인에서 오면 선택 안되어있게, 리스트에서 예매하기 누르면 미리 선택되어 있게 -->
			<div class="tx-14 tx-bold tx-gray-700 tx-spacing-5">영화선택</div>
			<select class="custom-select" size="20" id='movieSelectBox' name="mid" onclick="getMMDD()" multiple>
				<c:forEach var="movieVO" items="${movieVO }">
					<option value="${movieVO.mid }" class="tx-20 tx-bold tx-spacing-2 tx-lato ">${movieVO.title }</option>
				</c:forEach>
			</select>

		</div>
		<div class="col-sm-5 mg-t-30">
		<!-- 선택한 영화와 조인한 후 날짜 나와야함-->
			<div class="tx-14 tx-bold tx-gray-700 tx-spacing-5">날짜 시간 선택</div>
			<!--ajax로 데이터 받아서 foreach  -->
			<div class="mg-t-20" id='selectScreenBox'>
			</div>
			<div class="mg-t-30 bd-t tx-14 tx-bold tx-gray-700 tx-spacing-5"><br>상영관번호+상영관+영화타입(2D)</div>
			<!--ajax로 데이터 받아서 foreach  -->
			<!-- 영화와 위 날짜와 조인해 맞는 상영시간이 나와야함  -->
			<div class="mg-t-20" id="selectHHMM">
				
			</div>
		</div>
		<div class="col-sm-2">오른쪽여백</div>
	</div>
	<input type="hidden" id="selectedMid" value=${selectedMid}>	
</body>
<script type="text/javascript">
	function removeMMDD() {
		$("#selectScreenBox").children().remove();
	}

	function resetSelectScreenBox() {
		$("#selectScreenBox").children().removeClass("active");
		$("#selectScreenBox").children().attr("aria-pressed", "false");
	}
	
	function reselectScreenBox(param) {
		$("#selectScreenBox").children().attr("aria-pressed", "true").removeClass("active");
		$("#selectScreenBox").children().attr("aria-pressed", "false");
		
		// 문자열로 치환
		param = String(param);
		var yy = param.substr(0, 4)
		var mm = param.substr(4, 2)
		var dd = param.substr(6, 2)
		
		console.log(yy, mm, dd);
		// ajax로 상영관 번호, 상영관, 영화타입
		var selectMovie = $("#movieSelectBox option:selected").val();
		
		removeHHMM();
		
		$.ajax({
                type: 'POST',
                url: '/selectMMDD',
                dataType: "json",
                data: {"mid": selectMovie,"yy":yy,"mm":mm,"dd":dd},
                success: function(data) {
                   console.log(data);
                   for( var i =0;i<data.length; i++){
                	   var screenNO = data[i].screenNO
                	   var type = data[i].type
                	   var hhmm = data[i].hour + data[i].minute
                	   
                	   var HHMMHtml =  '<button type="button" class="btn btn-sm btn-outline-dark mg-r-10 mg-t-10" data-toggle="button">'+data[i].hour+'시'+data[i].minute+'분'+'</button>'
                	   $('#selectHHMM').append(HHMMHtml);
                   };
                  
                },
                error: function(request,status,error) {
                   alert('에러!! : ' + request.responseText + ":"+error);
                }
         }); //end ajax
	}
	
	$(document).ready(function(){
	   var selectedMid = $("#selectedMid").val();
	   
	   if (selectedMid) {
		   $('#movieSelectBox').val(selectedMid).attr("selected", "selected");
	   }
	   
	   
	});
	
	function selectMovie() {
		resetSelectScreenBox();
	}
	
	//선택한 영화에 대한 mid를 보내서 DB에서 조인한 후 값을 뿌려주는 ajax 작성
	function getMMDD() {
		// init MMDD
		removeMMDD();
		
		var selectMovie = $("#movieSelectBox option:selected").val();
		
		$.ajax({
                type: 'POST',
                url: '/selectMid',
                dataType: "json",
                data: {"mid": selectMovie},
                success: function(data) {
                   console.log(data);
                   
                   for (var i = 0; i < data.length; i++) {
                	   var yymmdd = data[i].year + data[i].month + data[i].day;
                	   var buttonHtml = '<button type="button" class="btn btn-sm btn-outline-dark mg-r-10 mg-t-10" data-toggle="button" onclick="reselectScreenBox('+ yymmdd+')">';
                	   buttonHtml += data[i].month + '/' + data[i].day+'</button>';					            	   
                	   $('#selectScreenBox').append(buttonHtml);
                   };
                },
                error: function(request,status,error) {
                   alert('에러!! : ' + request.responseText + ":"+error);
                }
         }); //end ajax 	
	}
	function removeHHMM() {
		$("#selectHHMM").children().remove();
	}
	
</script>
<footer>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</html>
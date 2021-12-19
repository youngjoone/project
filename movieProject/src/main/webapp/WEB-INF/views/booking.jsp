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
<!-- 스윗 알렛 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
<style>
button:focus{
	outline:0;

}
</style>
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
			<div class="mg-t-30 bd-t tx-14 tx-bold tx-gray-700 tx-spacing-5" id="HHMMTitle"><br>상영관,시간 날짜 선택</div>
			<!--ajax로 데이터 받아서 foreach  -->
			<!-- 영화와 위 날짜와 조인해 맞는 상영시간이 나와야함  -->
			<div class="mg-t-20" id="selectHHMM">
				<!-- 영화 시간 선택하는곳 -->
			</div>
			
		</div>
		<div class="col-sm-2">오른쪽여백</div>
		
		
	</div>
	<div class="row bd-t">
		<div class="col-sm-2">왼쪽여백</div>
		<div class="col-sm-7"></div>
		<div class="col-sm-1">
			<button type="button" class="btn btn-dark mg-t-10 mg-r-30" data-toggle="modal" onclick="selectSeat()">좌석 선택</button>
		</div>
		<div class="col-sm-2">오른쪽여백</div>
	</div>
	<input type="hidden" id="selectedMid" value=${selectedMid}>
	
	
	<!-- The Modal -->
	<div class="modal fade" id="selectSeat">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">좌석 선택하기</h4>
					<button type="button" class="close"  data-dismiss="modal">×</button>
				</div>
				
				<div class="mg-t-10 mg-b-10">
					<span class="tx-18 tx-spacing-2 mg-l-15 mg-r-10 align-middle">성인</span>
					<div class="btn-group" role="group" aria-label="Basic example">
					
  						<button type="button" class="btn btn-light btn-outline-dark" id="adultMinus" onclick='adultMinus()'>-</button>
 						<button type="button" class="btn btn-light btn-outline-dark" id="adult" value="0">0</button>
  						<button type="button" class="btn btn-light btn-outline-dark" id="adultPlus" onclick="adultPlus()">+</button>
					</div>
				
					<span class="tx-18 tx-spacing-2 mg-l-50 mg-r-10 align-middle">청소년</span> 
					<div class="btn-group" role="group" aria-label="Basic example">
					
  						<button type="button" class="btn btn-light btn-outline-dark" id="teenMinus" onclick='teenMinus()'>-</button>
 						<button type="button" class="btn btn-light btn-outline-dark" id="teen">0</button>
  						<button type="button" class="btn btn-light btn-outline-dark" id="teenPlus" onclick='teenPlus()'>+</button>
					</div>
				</div>
				<!-- Modal body -->
				
				<div class="modal-body bd-t" id="seatModal">
				좌석 선택<br>
				
				
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 성인 ,청소년 버튼 안 value 값 만큼 좌석 선택할수 있게 하기 
		성인 고르면 청소년 안되게 ?
	
		청불영화는 청소년 버튼 막기(나중에 추가 구현)
		
		-- 성인, 청소년 버튼 클릭시 좌석 선택 초기화 -- ok
		-- 전체 수 만큼 버튼 클릭시 선택 비활성화
		-- 성인 수 만큼 버튼 클릭 시 검적색 버튼 ON
		-- 성인 수 다고르면 청소년 예매 버튼 ON (다른색 버튼으로 변경)
		-- 모달 다시 띄우면 좌석 초기화 --ok
		-- 데이터 AXX 로 수정해놓기		--ok
		-- 좌석 선택 마무리하면 일괄로 정보 넘기기 + 컨트롤러
		-- 모달에 영화 정보 추가
		
		-->
	
</body>
<script type="text/javascript">
	//변수 선언
	var kMid = null;
	var kScreenNo = null;
	var kType = null;
	var kYy = null;
	var kMm = null;
	var kDd = null;
	var kHh = null;
	var kMi = null;
	
	//변수 초기화
	function removeVar(){
		
		kScreenNo = null;
		kType = null;
		kYy = null;
		kMm = null;
		kDd = null;
		kHh = null;
		kMi = null;
	}

	
	//성인버튼
	function adultMinus(){
		
		selectSeat();
		
			var count = $("#adult").val()
			if(count>0){
				count --;
				$("#adult").html(count);
				$("#adult").val(count);
			}
			
		}

	function adultPlus(){
		
	
	
			var count = $("#adult").val()
			if(count==6){
				swal('최대 예매 인원수는 6명입니다');
			}else{
				count ++;
				$("#adult").html(count);
				$("#adult").val(count);
			}
			selectSeat();
			
		}
	//청소년버튼
	
	function teenMinus(){
		
		selectSeat();
		
			var count = $("#teen").val()
			if(count>0){
				count --;
				$("#teen").html(count);
				$("#teen").val(count);
			}
			
		}
	
	function teenPlus(){
		
		selectSeat();
		
			var count = $("#teen").val()
			if(count==6){
				swal('최대 예매 인원수는 6명입니다');
			}else{
				count ++;
				$("#teen").html(count);
				$("#teen").val(count);
				
			}
			
		}
	function removeSeatModal(){
		$("#seatModal").children().remove();
		
	}
	
	
	function removeMMDD() {
		$("#selectScreenBox").children().remove();
	}

	function resetSelectScreenBox() {
		$("#selectScreenBox").children().removeClass("active");
		$("#selectScreenBox").children().attr("aria-pressed", "false");
	}
	
	function reselectHHMM(param) {
		//param값 받아오는거 해야함 
		param = String(param);
		console.log(param);
		var screenNo = param.substr(0, 3);
		var type = param.substr(3, 2);
		var hh = param.substr(5, 2);
		var mi = param.substr(7, 2);
		
		kScreenNo = screenNo;
		kType = type;
		kHh = hh;
		kMi = mi;
		
		$("#selectHHMM").children().attr("aria-pressed", "true").removeClass("active");
		$("#selectHHMM").children().attr("aria-pressed", "false");
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
				
		kMid = selectMovie;
		kYy = yy;
		kMm = mm;
		kDd = dd;

		removeHHMM();

		$.ajax({
					type : 'POST',
					url : '/selectMMDD',
					dataType : "json",
					data : {
						"mid" : selectMovie,
						"yy" : yy,
						"mm" : mm,
						"dd" : dd
					},
					success : function(data) {
						console.log(data);
						$('#HHMMTitle').html(
								data[0].screenNO + '상영관' + data[0].type);
						for (var i = 0; i < data.length; i++) {
							var screenNO = data[i].screenNO
							var type = data[i].type
							var hhmm = data[i].hour + data[i].minute
							
							var screenInfo = data[i].screenNO + data[i].type + data[i].hour + data[i].minute 
							
							var HHMMHtml = '<button type="button" class="btn btn-sm btn-outline-dark mg-r-10 mg-t-10" data-toggle="button" onclick="reselectHHMM(\''
									+ screenInfo
									+ '\')">'
									+ data[i].hour
									+ '시'
									+ data[i].minute + '분' + '</button>'
							$('#selectHHMM').append(HHMMHtml);
						}
						;

					},
					error : function(request, status, error) {
						alert('에러!! : ' + request.responseText + ":" + error);
					}
				}); //end ajax
	}

	$(document).ready(function() {
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
		removeHHMM();
		removeVar();
		
		var selectMovie = $("#movieSelectBox option:selected").val();
		if (selectMovie != null) {
			$.ajax({
						type : 'POST',
						url : '/selectMid',
						dataType : "json",
						data : {
							"mid" : selectMovie
						},
						success : function(data) {
							console.log(data);

							for (var i = 0; i < data.length; i++) {
								var yymmdd = data[i].year + data[i].month
										+ data[i].day;
								var buttonHtml = '<button type="button" class="btn btn-sm btn-outline-dark mg-r-10 mg-t-10" data-toggle="button" onclick="reselectScreenBox('
										+ yymmdd + ')">';
								buttonHtml += data[i].month + '/' + data[i].day
										+ '</button>';
								$('#selectScreenBox').append(buttonHtml);
							}
							;
						},
						error : function(request, status, error) {
							alert('에러!! : ' + request.responseText + ":"
									+ error);
						}
					}); //end ajax 
		} else {
			swal('영화를 골라주세요 ');
		}

	}
	
	function removeHHMM() {
		$("#selectHHMM").children().remove();
	}
	
	function selectSeat() {
		console.log('start');
		console.log(kMid, kScreenNo, kYy, kMm, kDd, kHh, kMi);
		removeSeatModal();
		
		$.ajax({
			type : 'POST',
			url : '/selectSeat',
			dataType : "json",
			data : {
				"mid" : kMid,
				"screenNO" : kScreenNo,
				"type": kType,
				"year" : kYy,
				"month" : kMm,
				"day" : kDd,
				"hour" : kHh,
				"minute" : kMi
			},
			success : function(data) {
				console.log(data);
				var seatModal = '';				
				var seatNO= null;
				
				seatModal += '<div class="row">';
				for(var i=0; i < data.length; i++){
					seatNO = data[i].seat;
					
					if (data[i].reserved == 'N') {
						seatModal += '<button type="button" class="btn btn-xs btn-outline-dark" data-toggle="button" onclick="seatCnt()">' + data[i].seat + '</button>';						
					} else {
						seatModal += '<button type="button" class="btn btn-xs btn-danger" data-toggle="button" disabled>' + data[i].seat + '</button>';
					}
					
					if (i%10 == 9) {
						seatModal += '</div>';
						seatModal += '<div class="row">';
					}
				};
				seatModal += '</div>';
				
				$('#seatModal').append(seatModal);
			},
			error : function(request, status, error) {
				alert('에러!! : ' + request.responseText + ":"
						+ error);
			}
		}); //end ajax 
		
		
		$('#selectSeat').modal('show');

	}
	
	//좌석 카운트 
	function seatCnt(){
		
		
		
		
	 	var adultCnt = $("#adult").val();
		var teenCnt = $("#teen").val();
		adultCnt = Number(adultCnt);
		teenCnt = Number(teenCnt);
		allCnt = adultCnt+teenCnt;
		console.log((adultCnt+teenCnt));
		
		var selectedSeat = $("#seatModal > div > button.active");
		var lastSelectedSeat = $("#seatModal > div > button.focus");	//구현해야됨 마지막클릭한좌석 셀렉터
		console.log(selectedSeat);
		var seatCnt = selectedSeat.length;
		if(seatCnt!=0){
			seatCnt++;
			if(seatCnt > allCnt){
				swal('좌선선택수 초과');
				selectedSeat.removeClass("active");
				selectedSeat.attr("aria-pressed", "false");
			}
		}  
		
		
		
	 	/* if((seatCnt+1) > allCnt){
			swal('좌선선택수 초과');
			
			selectedSeat.removeClass("active");
			selectedSeat.attr("aria-pressed", "false");
		} */
	 	/* if((selectedSeat.length+1)>adultCnt){
	 		selectedSeat.attr("class","btn btn-xs btn-outline-success active");
	 	} */
	}
	
	function getAndShowMovieInfo() {
		
		// ajax
		
		// 삽입 전 모달 데이터 삭제
		
		// movie 정보 modal에 삽입
	}
	
</script>
<footer>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</html>
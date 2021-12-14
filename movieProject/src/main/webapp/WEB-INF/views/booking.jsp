<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div class="col-sm-2">왼쪽여벡</div>

		<div class="col-sm-3 mg-t-30 bd-r">
			<div>영화선택</div>
			<select class="custom-select" size="20" multiple>

				<option value="1">영화1</option>
				<option value="2">영화2</option>
				<option value="3">영화3</option>
			</select>

		</div>
		<div class="col-sm-5 mg-t-30">
			<div>날짜 시간 선택</div>
			<div>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
				<button type="button" class="btn btn-sm btn-outline-dark">월/일</button>
			</div>
			<div class="mg-t-30 bd-t"><br>상영관번호+상영관+영화타입(2D)</div>
			<div class="mg-t-20">
				<button type="button" class="btn btn-sm btn-outline-dark">상영시간</button>
				<button type="button" class="btn btn-sm btn-outline-dark">상영시간</button>
				<button type="button" class="btn btn-sm btn-outline-dark">상영시간</button>
				<button type="button" class="btn btn-sm btn-outline-dark">상영시간</button>
				<button type="button" class="btn btn-sm btn-outline-dark">상영시간</button>
				<button type="button" class="btn btn-sm btn-outline-dark">상영시간</button>
				<button type="button" class="btn btn-sm btn-outline-dark">상영시간</button>
				<button type="button" class="btn btn-sm btn-outline-dark">상영시간</button>
			</div>
		</div>
		<div class="col-sm-2">오른쪽여백</div>
	</div>
	<script>
	function(){$('#datepicker1').datepicker();}

	</script>
</body>
<footer>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/clapperboard.png">

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
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">



<title>관리자용 공지사항</title>
<style>
table{ 
	border-top : 1px solid black;
	border-bottom : 1px solid #C8C8C8;	
}

input[type=text] {
  width: 80%;
  padding: 5px 20px;

  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  
}

input[type=button] {
	margin-top: 10px;
}

input[type=submit] {
	margin-top: 10px;
}

select {
	width: 20%;
 	padding: 5px 20px;
  	margin: 8px 10px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}


#container {
	/* background : skyblue; */
	width : 50%;
	margin : 0 auto;
	margin-top : 100px;
}

#text1 {
  	margin: 8px 0;
  	display: inline-block;
  	border: 1px solid #ccc;
  	border-radius: 4px;
  	box-sizing: border-box;
}

#con1 {
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

#show {
	width : 200px;
	height : 200px;
	margin-left: 10px; 
}

.t1 {
	border-top: 1px solid #C8C8C8;
	border-bottom: 1px solid #C8C8C8;
}

#t2 {
	border-bottom: 1px solid #C8C8C8;
}

#wr {
	border: none;
}

figcaption{
	font-size : 25px;
	font-weight: bold;
}

</style>
</head>
<header>
	<jsp:include page="/WEB-INF/views/adminHeader.jsp" />
</header>
<body>

<div id="container">
	<figure>
		<figcaption>
			공지사항 수정
		</figcaption>
	</figure>
	
		<div class="mg-b-35"><strong class="tx-15">등록일 :&nbsp; <fmt:formatDate value="${noticeVO.date}" pattern="yyyy/MM/dd" /></strong>
		
		<input type=button class="btn btn-dark w3-right" value="목록" onclick="location.href='list'" /></div>
		
	
	
	<form name="frmNotice" method="post" action="update" >
			<table>
				<tr height="50">
					<td width="20%"><strong class="tx-15">제목</strong></td>
					<td><input type="text" size="150"  maxlength="500" value="${noticeVO.nTitle }" id="i_nTitle" name="nTitle" disabled /></td>
				</tr>
				
				<tr height="50">
					<td class="t1" ><strong class="tx-15">구분</strong></td>
					<td class="t1"> 
						<select name="category" id="selectBox" onchange="chageLangSelect()" disabled>
							<option value="좌석">좌석</option>
							<option value="극장">극장</option>
							<option value="요금">요금</option>
							<option value="주차">주차</option>
						</select>
				    </td>
				</tr>
				
				<tr>
					<td><strong class="tx-15">내용</strong></td>
					<td><textarea class="mg-t-10 mg-b-5" name="nContent" rows="15" style="width:100%;"  maxlength="4000" id="i_nContent"  disabled >${noticeVO.nContent}</textarea> </td>
				</tr>
			</table>
			<!-- 슬빈씨 버튼색 맘에 안들면 맘에드는걸로 바꾸세여 !  -->
			<div class="col-sm-4">
				<div id="tr_btn_modify" class="customer1_btn" style="display: none">
					<input type="button" class="w3-button w3-indigo w3-round" value="수정하기" onclick="fn_modify_notice(frmNotice)" /> 
					<input type="button" class="w3-button w3-indigo w3-round" value="취소하기" onclick="backToList(this.form)" />
				</div>
				<div class="customer_btn mg-b-70" id="tr_btn">
					<input type="button" class="w3-button w3-indigo w3-round" value="수정" onClick="fn_enable(this.form)" /> 
					<input type="button" class="btn btn-danger" value="삭제" onclick="fn_remove_article(${noticeVO.noticeNO})" />
					
				</div>
			</div>
			<!-- noticeNO hidden  -->
			<input type="hidden" value="${noticeVO.noticeNO }" name="noticeNO" />
			
		</form>		
	</div>



</body>
<script type="text/javascript">
function fn_enable(obj){ /* 수정하기 클릭시 */
	document.getElementById("i_nTitle").disabled = false;
	document.getElementById("i_nContent").disabled = false;
	$("#selectBox").attr("disabled",false);
	
	document.getElementById("tr_btn_modify").style.display = "block";
	document.getElementById("tr_btn").style.display = "none";
}

function fn_modify_notice(obj){ /* 수정반영하기 클릭시 */
	obj.action="update";
	obj.method = "post";
	obj.submit();
}

function fn_remove_article(noticeNO){ /* 삭제하기 */
	/* 진짜 삭제하시겠습니까 -> 묻기 */
	var yesno = confirm("정말 삭제하시겠습니까?");
	/* yesno, trur */
	if(yesno == true){
		location.href = "delete?noticeNO="+noticeNO; 
		
	} else if (yesno == false){
		location.href = "list";	
	}	
}

function backToList(obj){
	obj.action = "list";
	obj.submit();
}



</script> 
<footer>
   <jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</html>
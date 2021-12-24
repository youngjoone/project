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
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>관리자 공지사항</title>
<style>

table{ 
	width : 1000px; 
	border-top : 1px solid black;
	border-bottom : 1px solid #C8C8C8;
	
}

table, th, td{
	border-collapse : collapse;
	padding : 5px;
	border-bottom : 1px solid #C8C8C8;
	margin-bottom: 30px;
}

	
th{
	padding : 5px;
	text-align: center;
}

td{
	text-align : center;
	border-top : 1px solid #EFEFEF;		
}

thead {
    border-bottom : 1px solid black;
}
.bor{
	text-align : center;
	border-bottom: 1px solid #EFEFEF;
	padding: 10px;
}
	
#col1 {
	width: 7%
}

#col2 {
	width: 10%
}

#col3 {
	width: 55%
}

#col4 {
	width: 15%
}

#col5 {
	width: 13%
}

.bor {
	text-align: center;
	border-bottom: 1px solid #EFEFEF;
	padding: 10px;
}

.cls {
	text-align: right;
}

#container {
	width: 55%;
	border-radius: 20px;
	margin: 0 auto;
	
}
input[type=button] {
	text-align:right; 
	margin-top: 30px;
}

.pagination {
  display: inline-block;
  text-align: center;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  text-align: center;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border-radius: 5px;
}

.pagination a:hover:not(.active) {
  background-color: #ddd;
  border-radius: 5px;
}


</style>
<script>
function muldelete() { 
	
	if(document.getElementById("chkbox").checked){
		// form을 넘김.
	   var form = document.getElementsByName("muldelForm");
	   form[0].submit();
	   return true;
	} else {
		alert("삭제할 게시글을 선택해주세요.");
		return;
	}
	
   
}
</script>
</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/adminHeader.jsp" />
</header>
	<div id="container" align="right" style="margin-top:50px;">
	<input type="button" onclick="location.href='add'" class="w3-button w3-dark-grey w3-round w3-padding-small" value="등록">
	
	<input type="button" onclick="return muldelete()" class="w3-button w3-dark-grey w3-round w3-padding-small" value="삭제"><br><br>
	
	</div>
	<form name="muldelForm" action="muldelete">
	<div>
	  <table id="container" style="margin-bottom:120px;">
		<thead >
			<tr>
				<th id="col1" class="bor">선택</th>
				<th id="col1" class="bor">번호</th>
				<th id="col2" class="bor">구분</th>
				<th id="col3" class="bor">제목</th>
				<th id="col4" class="bor">작성일</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${empty noticesList }">
				<tr height="10">
					<td colspan="4">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${!empty noticesList}">
				<c:forEach var="noticeVO" items="${noticesList}" end="9" varStatus="noticeNum">

					<tr align="center">
						
						<td width="5%" class="bor"> <input type="checkbox" name="chkbox" id="chkbox" value="${noticeVO.noticeNO}">
						<td scope="row" class="bor">${noticeNum.count}</td>
						<td scope="row" class="bor">${noticeVO.category}</td>
						<td scope="row" class="bor">
							<a href="update?noticeNO=${noticeVO.noticeNO}">${noticeVO.nTitle}</a>
						</td>
						<td scope="row" class="bor"><fmt:formatDate value="${noticeVO.date}" pattern="yyyy/MM/dd" /></td>
					</tr>
					
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
  </div>
  </form>
<footer>
   <jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
  	
</body>
</html>
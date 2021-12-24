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

<title>공지사항</title>
<style>

thead{
	border-top : 1px solid black;
	border-bottom : 1px solid black;
}

	
th{
	padding : 5px;
	text-align: center;
}

td{
	text-align : center;
}

.bor{
	text-align : center;
	padding: 10px;
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

.cls {
	text-align: right;
}

#container {
	width: 55%;
	border-radius: 20px;
	margin: 0 auto;
	margin-top: 100px;
	margin-bottom: 150px;
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

figcaption{
	font-size : 25px;
	font-weight: bold;
}

#title{
	font-size: 40px;
	color : black;
}
</style>

</head>
<body>
<header>
   <jsp:include page="/WEB-INF/views/header.jsp" />
</header>

	<form>
	<div>

	  <table id="container">
		<thead>
			<tr>
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
						<td scope="row" class="bor">${noticeNum.count}</td>
						<td scope="row" class="bor">${noticeVO.category}</td>
						<td scope="row" class="bor">
							<a href="notice/view?noticeNO=${noticeVO.noticeNO}">${noticeVO.nTitle}</a>
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
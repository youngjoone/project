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
<title>공지사항</title>
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
}
	
th{
	padding : 5px;
	text-align: center;
}

td{
	text-align : center;
	border-top : 1px solid #EFEFEF;		
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
</style>
</head>
<body>
	<div>
	<input class="cls" type="button" onclick="return muldelete()" value="삭제하기">
	  <table id="container">
		<thead>
			<tr>
				<th id="col1" class="bor">선택</td>
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
				<c:forEach var="noticeVO" items="${noticesList}" end="5" varStatus="noticeNum">

					<tr align="center">
						<td width="5%" class="bor"> <input type="checkbox" name="chkbox" value="${article.articleNO}">
						<td scope="row" class="bor">${noticeNum.count}</td>
						<td scope="row" class="bor">${noticeVO.category}</td>
						<td scope="row" class="bor">${noticeVO.nTitle}</td>
						<td scope="row" class="bor"><fmt:formatDate value="${noticeVO.date}" pattern="yyyy/MM/dd" /></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>

	</table>

  </div>	
</body>
</html>
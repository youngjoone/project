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
#col1 {
	width: 7%
}

#col2 {
	width: 7%
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

#container {
	width: 55%;
	border-radius: 20px;
	margin: 0 auto;
}
</style>
</head>
<body>

	<table id="container">
		<thead>
			<tr>
				<td id="col1" class="bor">선택</td>
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
				<c:forEach var="article" items="${noticesList }"
					varStatus="articleNum">
					<tr align="center">
						<td width="5%"><input type="checkbox" name="chkbox" value="${notice.noticeNO}">
						<td width="5%">${noticeNum.count}</td>
						<td width="10%">${notice.ntitle }</td>
						<td align='left' width="35%"><input type='hidden' value="${notice.isDelete}"> <span style="padding-right: 30px"></span></td>
						<td width="10%"><fmt:formatDate value="${notice.date}" /></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>

	</table>
	<input type="button" onclick="return muldelete()" class="cls2" value="삭제하기">



</body>
</html>
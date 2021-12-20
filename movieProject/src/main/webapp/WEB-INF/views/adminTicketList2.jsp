<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="container" align="center"></div>
		<table>
		  <thead>
			  <tr>
			  	<th>상영일자</th>
			  	<th>상영시간</th>
			  	<th>아이디</th>
			  	<th>티켓번호</th>
			  	<th>상영관</th>
			  	<th>좌석번호</th>
			  	<th>연령</th>
			  	<th>영화구별</th>

		  	  </tr>
		  </thead>	
		  
		  <tbody>
		  <c:if test="${not empty ticketList }">
		  	<c:forEach var=ticketList items="${ticketList}">
		  		<tr>
		  			<td>${ticketList.screenDateNo }</td>
		  			<td>${ticketList.id }</td>
		  			<td>${ticketList.ticketNo }</td>
		  			<td>${ticketList.screenNo }</td>
		  			<td>${ticketList.seatNo }</td>
		  			<td>${ticketList.age }</td>
		  			<td>${ticketList.mid }</td>

		  		</tr>
		  	</c:forEach>
		  </c:if>	
		  
		  <c:if test="${empty ticketList }">
		  	<tr>
		  		<td colspan="8">예약이 존재하지 않습니다.</td>
		  	</tr>
		  </c:if>			
		  </tbody>  	  
		</table>
	
</body>
</html>
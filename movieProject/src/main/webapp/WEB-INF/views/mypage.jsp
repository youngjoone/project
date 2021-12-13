<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

#edit{
	text-align: right;
}

#memberInfo {
	padding-top: 80px;
}

</style>

</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/header.jsp" />
</header>

<!-- 모달 : data-toggle="modal" -->

<div class="row" id="memberInfo">
	<div class="col-1"></div>
      <div class="col-4">
      	<h1 class="tx-color-01 tx-24 tx-sm-32 tx-lg-36 mg-xl-b-5">안녕하세요</h1>
      	<h1 class="tx-color-01 tx-24 tx-sm-32 tx-lg-36 mg-xl-b-5">${ memberVO.name}님 반갑습니다!</h1>
	  </div>
      <div class="col-6">
			
			<table class="table table-invoice bd-b rounded-40">
            <tbody>
            <tr></tr>
              <tr>
                <td class="tx-nowrap">아이디</td>
                <td class="tx-nowrap">${memberVO.id }</td>
              </tr>
              <tr>
                <td class="tx-nowrap">이름</td>
                <td class="tx-nowrap">${memberVO.name }</td>
              </tr>
              <tr>
                <td class="tx-nowrap">생년월일</td>
                <td class="tx-nowrap"><fmt:formatDate value="${memberVO.birth }" /></td>
              </tr>
              <tr>
                <td class="tx-nowrap">휴대폰번호</td>
                <td class="tx-nowrap">010-${memberVO.tel }</td>
              </tr>
              <tr>
                <td class="tx-nowrap">이메일</td>
                <td class="tx-nowrap">${memberVO.email }</td>
              </tr>
            </tbody>
          </table>
      </div>
	<div class="col-1"></div>
</div>

<div class="row">
	<div class="col-10"></div>
	<div class="col-1">
			<div class="d-flex">
				<a href="mypage/update"
					class="btn btn-sm btn-white d-flex align-items-center mg-r-5">
				<span class="d-none d-sm-inline mg-l-5"> Edit</span></a>
			</div>
		</div>
	<div class="col-1"></div>
</div>
<br>
<div class="row">
	<div class="col-1"></div>
	<div class="col-10"><hr class="mg-y-20"></div>
	<div class="col-1"></div>
</div>
<br>

<div class="row">
	<div class="col-1"></div>
	<div class="col-10"><br>
		<h4><b>예매확인</b></h4>
		<table class="table table-invoice bd rounded-40" style="text-align: center;">
            <tbody>
            <tr>
            	<td></td>
            	<td>티켓번호</td>
            	<td>후기</td>
            </tr>
            <tr>
            <c:choose>
	  			<c:when test="${empty ticketList }">
	    			<tr><td colspan="3" style="text-align: center;">예매내역이 없습니다.</td></tr>
	  			</c:when>
	  			<c:when test="${!empty ticketList }" >
					<c:forEach var="ticket" items="${ticketList}" varStatus="ticketNum">
							<tr>
								<td class="tx-nowrap">${ticketNum.count}</td>
								<td class="tx-nowrap"><a href="">${ticket.ticketNo}</a></td>
	              				<td class="tx-nowrap"><button class="btn btn-secondary">한줄평</button></td>
	              	  		</tr>
					</c:forEach>
				</c:when>
	  		</c:choose>
            </tbody>
          </table>
	</div>
	<div class="col-1"></div>
</div>
<br>

<footer>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>



</body>
</html>
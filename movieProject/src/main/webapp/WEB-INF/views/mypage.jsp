<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/clapperboard.png">

<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<style type="text/css">

#edit{
	text-align: right;
}

#memberInfo {
	padding-top: 80px;
}

#select{
display: inline;
width: 65px;
}
div.pjm1{
padding:0;
}

</style>

<script>
/* 리뷰작성 */
function review(frm){
	frm.action="mypage/review";
	frm.method="post";
	frm.submit();
}

/* 예매취소 */
function cancle(tno){
	var yesno = confirm("취소하시겠습니까?");
	/* yesno, trur */
	if(yesno == true){
		var form = document.createElement("form");
		form.setAttribute("method","post");
		form.setAttribute("action","mypage");
		var tnoInput = document.createElement("input");
		tnoInput.setAttribute("type","hidden");
		tnoInput.setAttribute("name","ticketNo");
		tnoInput.setAttribute("value",tno);
		form.appendChild(tnoInput);
		document.body.appendChild(form);
		form.submit();
	} else if (yesno == false){
		return;
	}	
}

function noCancle(){
	alert('상영일자가 지나 취소할 수 없습니다.');
}

</script>

</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/header.jsp" />
</header>


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
                <td class="tx-nowrap">
                <c:set var="tel" value="${memberVO.tel}" />
                010-${fn:substring(tel,0,4) }-${fn:substring(tel,4,8) }</td>
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
	<div class="col-2"></div>
	<div class="col-8"><br>
		<h3 style="text-align: center;"><b>예매확인</b></h3><br>
		<table class="table table-invoice bd rounded-40" style="text-align: center;">
            <tbody>
            <tr>
            	<td></td>
            	<td>티켓번호</td>
            	<td></td>
            	<td width="">후기</td>
            </tr>
            <tr>
            <c:choose>
	  			<c:when test="${empty ticketList }">
	    			<tr><td colspan="4">예매내역이 없습니다.</td></tr>
	  			</c:when>
	  			<c:when test="${!empty ticketList }" >
					<c:forEach var="ticket" items="${ticketList}" varStatus="ticketNum">
							<tr>
								<td width="10%" class="tx-center">${ticketNum.count}</td>
								<td width="15%" class="tx-center">${ticket.ticketNo}</td>
								<td width="60%" class="tx-left">
									<a href="" data-toggle="modal" data-target="#Modal${ticketNum.index}" id="tno1" style="text-decoration: underline;">예매정보</a>
								</td>
								<c:if test="${ticket.score ==0 }"> <!-- 리뷰가 없으면 -->
									<td width="15%" class="tx-center"><button class="btn btn-secondary reviewChk" data-toggle="modal" data-target="#review${ticketNum.index}">한줄평</button></td>
								</c:if>
	              				<c:if test="${ticket.score > 0 }"> <!-- 리뷰가 존재하면 -->
									<td width="15%" class="tx-center"><button class="btn btn-secondary reviewChk" data-toggle="modal" data-target="#review${ticketNum.index}" disabled>한줄평</button></td>
								</c:if>
	              	  		</tr>
					</c:forEach>
				</c:when>
	  		</c:choose>
            </tbody>
          </table>
	</div>
	<div class="col-2"></div>
</div>
<br>


<!-- 예매확인 Modal -->
<c:forEach var="book" items="${bookingList}" varStatus="bookNum">
<div class="modal fade" id="Modal${bookNum.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
				<form name="frm">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">
							<b>예매정보</b>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<table class="table table-invoice bd-b">
							<tr>
								<td class="tx-center">티켓번호</td>
								<td class="tx-center">${book.ticketNo }</td>
							</tr>
							<tr>
								<td class="tx-center">영화제목</td>
								<td class="tx-center">${book.title }</td>
							</tr>
							<tr>
								<td class="tx-center">상영날짜</td>
								<td class="tx-center"><fmt:formatDate pattern="yyyy년 MM월 dd일 hh:mm" value="${book.screenTime }"/></td>
							</tr>
							<tr>
								<td class="tx-center">상영관</td>
								<td class="tx-center">${book.screenNo }관 / ${book.seat }석</td>
							</tr>
							<tr>
								<td class="tx-center">가격</td>
								<td class="tx-center">${book.price }</td>
							</tr>
							<tr>
								<td class="tx-center">인원</td>
								<td class="tx-center">${book.age }</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">확인</button>
						
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate var ="today" value="${now }" pattern="yyyyMMddhhmm"/>
						<fmt:formatDate var="screenTime" pattern="yyyyMMddhhmm" value="${book.screenTime }"/>
						<c:if test="${today<screenTime}" >
							<button type="button" class="btn btn-primary" onclick="cancle('${book.ticketNo }')">예매취소</button>
						</c:if>
						<c:if test="${today>screenTime}">
							<button type="button" class="btn btn-primary" onclick="noCancle()">예매취소</button>
						</c:if>
					</div>
				</form>
			</div>
  </div>
</div>
</c:forEach>

<!-- 한줄평 Modal -->
<c:forEach var="book" items="${bookingList}" varStatus="bookNum"> 
<div class="modal fade" id="review${bookNum.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
    <form name="frm${bookNum.index }">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><b>한줄평</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	      <div class="modal-body">
			<div class="row">
				<div class="col-1 pjm1"></div>
				<div class="col-1 pjm1">
					<div class="form-group">
						<select class="custom-select" id="select" name="score" required>
							<option selected disabled>평점</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
				</div>
				<div class="col-9 pjm1">
				<div class="form-group">
						<textarea class="form-control" name="rContent" id="message-text" placeholder="한줄평을 작성해주세요" style="display: inline; width: 600px;" required></textarea>
				</div>
				</div>
				<div class="col-1 pjm1"></div>
			</div>
			<input type="hidden" name="id" id="id" value="${memberVO.id }" />
			<input type="hidden" name="mid" id="mid" value="${book.mid }" />
			<input type="hidden" name="ticketNo" id="ticketNo" value="${book.ticketNo }" />
		</div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" onclick="review(frm${bookNum.index })">등록</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
     </form> 
    </div>
  </div>
</div>
</c:forEach>

<footer>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>

</body>
</html>
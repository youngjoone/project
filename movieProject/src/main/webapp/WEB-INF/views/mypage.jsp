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

#select{
display: inline;
width: 65px;
}
div.pjm1{
padding:0;
}

</style>

<script>
function sub(frm){
	frm.action="mypage/review";
	frm.method="post"
	frm.submit();
	alert("한줄평이 등록되었습니다.");
}

</script>

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
								<td width="90" class="tx-center">${ticketNum.count}</td>
								<td width="100" class="tx-center">
									<a href="" data-toggle="modal" data-target="#Modal1" id="tno1">${ticket.ticketNo}</a>
									<input type="hidden" name="ticketNo" id="tno2" value="${ticket.ticketNo}">
								</td>
								<td width="600"></td>
	              				<td width="100" class="tx-center"><button class="btn btn-secondary" data-toggle="modal" data-target="#Modal2">한줄평</button></td>
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


<!-- 예매확인 Modal -->
<div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
    <form name="frm">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><b>예매정보</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	      <div class="modal-body">
			<table class="table table-invoice bd-b">
              <tr>
                <td class="tx-center">영화제목</td>
                <td class="tx-center"></td>
              </tr>
              <tr>
                <td class="tx-center">상영정보</td>
                <td class="tx-center"></td>
              </tr>
              <tr>
                <td class="tx-center">가격</td>
                <td class="tx-center"></td>
              </tr>
              <tr>
                <td class="tx-center">인원</td>
                <td class="tx-center"></td>
              </tr>
          </table>
		</div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary">확인</button>
        <button type="button" class="btn btn-secondary">예매취소</button>
      </div>
     </form> 
    </div>
  </div>
</div>

<!-- 한줄평 Modal -->
<div class="modal fade" id="Modal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
    <form name="frm">
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
						<select class="custom-select" id="select" name="score">
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
						<textarea class="form-control" name="rContent" id="message-text" placeholder="한줄평을 작성해주세요" style="display: inline; width: 600px;"></textarea>
						<input type="hidden" name="id" value="${memberVO.id }">
						<input type="hidden" name="id" value="${memberVO.id }">
				</div>
				</div>
				<div class="col-1 pjm1"></div>
			</div>
		</div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" onclick="sub(frm)">등록</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
     </form> 
    </div>
  </div>
</div>


<footer>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>



</body>
</html>
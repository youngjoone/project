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

#infoView{
padding : 60px 0px;
}

.btn btn-dark{
text-align: right;
}

.joinBtn{
margin-left: 5px;
}
</style>

</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/header.jsp" />
	</header>

<div id="infoView">
<form action="update" method="post">
<div class="row">
	<div class="col-2"></div>
	<div class="col-8">
	<h3><b>회원수정</b></h3><br>
		<table class="table table-invoice bd-b rounded-40" border=0>
            <tbody>
              <tr>
                <td class="tx-nowrap">아이디</td>
                <td class="tx-nowrap">
                 ${memberVO.id }
                 <input type="hidden" name="id" value="${memberVO.id }">
                </td>
              </tr>
              <tr>
                <td class="tx-nowrap">비밀번호</td>
                <td class="tx-nowrap"><input type="text" name="pw" value="${memberVO.pw }" class="form-control" required></td>
              </tr>
              <tr>
                <td class="tx-nowrap">이름</td>
                <td class="tx-nowrap"><input type="text" name="name" value="${memberVO.name }" class="form-control"></td>
              </tr>
              <tr>
                <td class="tx-nowrap">생년월일</td>
                <td class="tx-nowrap"><fmt:formatDate value="${memberVO.birth }" />
                </td>
              </tr>
              <tr>
                <td class="tx-nowrap">휴대폰번호</td>
                <td class="tx-nowrap">
                <div class="input-group">
  				<div class="input-group-prepend">
    				<span class="input-group-text">010</span>
  				</div>
  				<input id="tel" type="text" name="tel" class="form-control" value="${memberVO.tel }" placeholder="숫자 8자리만 입력하세요" maxlength="8" required>
			</div></td>
              </tr>
              <tr>
                <td class="tx-nowrap">이메일</td>
                <td class="tx-nowrap"><input type="text" name="email" value="${memberVO.email }" class="form-control"></td>
              </tr>
            </tbody>
          </table>
	</div>
	<div class="col-2"></div>
</div>
<div class="row">
	<div class="col-10"> <!-- 페이지 뒤로가기 : onclick="history.go(-1); return false;" -->
		<button class="btn btn-dark joinBtn" onclick="location.href='../mypage'" style="float: right;">취소</button>
		<button class="btn btn-dark joinBtn" style="float: right;">회원수정</button>
	</div>
 	<div class="col-2"></div>
</div>
</form>
</div>

	<footer>
		<jsp:include page="/WEB-INF/views/footer.jsp" />
	</footer>
</body>
</html>
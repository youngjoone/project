<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 등록 확인</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
table{ 
	border-top : 1px solid black;
	border-bottom : 1px solid #C8C8C8;	
}

input[type=text] {
  width: 50%;
  padding: 5px 20px;
  margin: 8px 10px;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  
}

#text1 {
  	margin: 8px 0;
  	display: inline-block;
  	border: 1px solid #ccc;
  	border-radius: 4px;
  	box-sizing: border-box;
}

#t1 {
	border-top: 1px solid #C8C8C8;
	border-bottom: 1px solid #C8C8C8;
}
#container {
	/* background : skyblue; */
	width : 50%;
	margin : 0 auto;
	margin-top : 100px;
}


input[type=button] {
	text-align:right; 
	margin-top: 30px;
}

figcaption{
	font-size : 25px;
	font-weight: bold;
}

input[type=button] {
  text-align:right;
  align:right;
}
</style>
<script type="text/javascript">
function backToList(obj){
    obj.action="list";
    obj.submit();
 }
</script>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/adminHeader.jsp" />
</header>

<div id="container">
<figure>
	<figcaption>
		등록확인
	</figcaption>
</figure>
<form>
	<table>
	<c:if test="${ret==0 }">
		<tr>
			<td>글이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${ret>0 }">
		<tr>
			<td width="20%"><strong>제목</strong></td>
			<td><input type="text" value="${noticeVO.nTitle }" size="67"  maxlength="500" name="nTitle" disabled="disabled"/></td>
		</tr>
		<tr>
			<td colspan=2 id="t1" ><strong>구분</strong></td>
			<td><input type="text" value="${noticeVO.category}" size="67"  maxlength="500" name="category" disabled="disabled"/></td>
		</tr>
		<tr>
			<td><strong>내용</strong></td>
			<td colspan=2><textarea id="text1" name="nContent" rows="15" cols="65" maxlength="4000" disabled="disabled">${noticeVO.nContent}</textarea></td>
		</tr>	
	</c:if>
	</table>
	<div align="right">
		<input type=button value="목록보기" class="w3-button w3-dark-grey w3-round w3-padding-small" onClick="backToList(this.form)" />
	</div>
    	
</form>
</div>
<footer>
   <jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</body>
</html>
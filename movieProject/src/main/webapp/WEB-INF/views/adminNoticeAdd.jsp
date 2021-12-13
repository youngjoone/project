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
<script type="text/javascript">
function backToList(obj){
    obj.action="list";
    obj.submit();
}

function chageLangSelect() { 
	var langSelect = document.getElementById("selectbox"); 
	// select element에서 선택된 option의 value가 저장된다. 
	var selectValue = langSelect.options[langSelect.selectedIndex].value; 
	// select element에서 선택된 option의 text가 저장된다. 
	var selectText = langSelect.options[langSelect.selectedIndex].text; }


</script>
<title>공지사항 추가</title>
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

input[type=button] {
	margin-top: 10px;
}

input[type=submit] {
	margin-top: 10px;
}

select {
	width: 15%;
 	padding: 5px 20px;
  	margin: 8px 10px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}


#container {
	/* background : skyblue; */
	width : 50%;
	margin : 0 auto;
	margin-top : 100px;
}

#text1 {
  	margin: 8px 0;
  	display: inline-block;
  	border: 1px solid #ccc;
  	border-radius: 4px;
  	box-sizing: border-box;
}

#con1 {
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

#show {
	width : 200px;
	height : 200px;
	margin-left: 10px; 
}

#t1 {
	border-top: 1px solid #C8C8C8;
	border-bottom: 1px solid #C8C8C8;
}

#t2 {
	border-bottom: 1px solid #C8C8C8;
}

#wr {
	border: none;
}

figcaption{
	font-size : 25px;
	font-weight: bold;
}
		
</style>
</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/adminHeader.jsp" />
</header>

	<div id="container">
		<figure>
			<figcaption>
				공지사항 등록
			</figcaption>
		</figure>
		<form name="noticeForm" action="add" method="POST">
			<table>

				<tr>
					<td width="20%"><strong>제목</strong></td>
					<td><input type="text" size="67"  maxlength="500" name="nTitle" /></td>
				</tr>
			
				<tr>
					<td colspan="2" id="t1" ><strong>구분</strong> 
					  
						<select name="category" id="selectBox" onchange="chageLangSelect()">
						
							<option value="좌석">좌석</option>
							<option value="극장">극장</option>
							<option value="요금">요금</option>
							<option value="주차">주차</option>
						
						</select>
				    </td>
				</tr>
				<tr>
					<td><strong>내용</strong></td>
					<td colspan=2><textarea id="text1" name="nContent" rows="15" cols="65" maxlength="4000" ></textarea> </td>
				</tr>
			</table>	
			
			<div align="right">
				<input type="submit" class="w3-button w3-dark-grey w3-round w3-padding-small" value="글쓰기" />
				<input type=button class="w3-button w3-dark-grey w3-round w3-padding-small" value="목록보기" onClick="backToList(this.form)" />
			</div>
			  
		</form>		
	</div>
<footer>
   <jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/clapperboard.png">

<script>
function backToList(obj){
	obj.action = "list";
	obj.submit();
}
</script>
<title>관리자용 공지사항 관리</title>
</head>
<body>
<c:if test="${ret>0 }">
	<script>
      setTimeout(function(){
    	 var yesno = confirm("수정되었습니다.");
         location.href='/admin/notice/list';
         
      },0000)
      </script>
</c:if>

<c:if test="${ret==0 }">
	<script>
      setTimeout(function(){
    	 var yesno = confirm("수정에 실패하였습니다.");
         location.href='/admin/notice/list';
         
      },0000)
      </script>
</c:if>
</body>
</html>
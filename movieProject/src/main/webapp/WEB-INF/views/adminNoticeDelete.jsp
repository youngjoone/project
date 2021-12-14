<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 삭제</title>
</head>
<body>

<c:if test="${ret>0 }">
	<script>
      setTimeout(function(){
    	 confirm("삭제되었습니다.");
         location.href='/admin/notice/list';
         
      },0000)
      </script>
</c:if>

<c:if test="${ret==0 }">
	<script>
      setTimeout(function(){
    	 confirm("삭제에 실패하였습니다.");
         location.href='/admin/notice/list';
         
      },0000)
      </script>
</c:if>
	
</body>
</html>
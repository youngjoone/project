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
<style>
.board_view_area{margin-top:19px;}
.board_view_area{margin-top:19px;}
.top_title_faq{overflow:hidden;padding:11px;border-top:solid 1px #b8b6aa;background-color:#f8f8f8;}
.top_title_faq .title{float:left;font-size:12px;font-weight:500;display:block;overflow:hidden;width:500px;white-space:nowrap;text-overflow:ellipsis;}
.top_title_faq .stit_area{float:right;font-size:12px; line-height: 16px; }
.top_title_faq .stit_area em { line-height: 16px; vertical-align: middle; }
.top_title_faq .stit_area .check_tit_area{margin-left:30px;}
.top_title_faq .stit_area .check_num, .top_title_faq .stit_area .regist_day{margin-left:9px;font-size:12px ;font-family:'Verdana'; color: #222;}
.movie_grade .egg_point .title {
    font-size: 24px;
    line-height: 30px;
    position: absolute;
    top: 35px;
    left: 0;
}

.movie_grade .chart_total .title {
    position: relative;
    padding-top: 28px;
    padding-left: 30px;
    font-size: 20px;
    line-height: 1.5em;
    color: #222222;
    font-weight: 500;
}
.real-rating .title {
    font-size: 17px;
    color: #212224;
    font-weight: 500;
    line-height: 1.8em;
}
.real-rating .title strong {
    color: #fb4357;
}
.customer_btn {
   margin:20px 0px 30px 0px;text-align:center;
}

.customer1_btn {
	margin:20px 0px 30px 0px;text-align:center;
}

.btm_sup_list .check_writ_area .check_num{display:inline-block;width:100px;margin-left:5px;font-size:12px ;font-family:'Verdana';text-align:right;*display:inline;*zoom:1;}

.container {
   width: 55%;
   border-radius: 20px;
   margin: 0 auto;
   margin-top: 30px;
}
.check_tit_area {
	line-height:20px;
	width:1000%;
}

</style>

<script type="text/javascript">
function fn_enable(obj){ /* 수정하기 클릭시 */
	document.getElementById("i_nTitle").disabled = false;
	document.getElementById("i_nContent").disabled = false;
	
	document.getElementById("tr_btn_modify").style.display = "block";
	document.getElementById("tr_btn").style.display = "none";
}

function fn_modify_notice(obj){ /* 수정반영하기 클릭시 */
	obj.action="update";
	obj.method = "post";
	obj.submit();
}

function fn_remove_article(noticeNO){ /* 삭제하기 */
	/* 진짜 삭제하시겠습니까 -> 묻기 */
	var yesno = confirm("정말 삭제하시겠습니까?");
	/* yesno, trur */
	if(yesno == true){
		location.href = "delete?noticeNO="+noticeNO; 
		
	} else if (yesno == false){
		location.href = "list";	
	}	
}

function backToList(obj){
	obj.action = "list";
	obj.submit();
}

function readURL(input){
	/* console.log(input.files) */
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			$('#preview').attr('src',e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

</script> 
<title>관리자 공지사항</title>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/adminHeader.jsp" />
</header>
<form name="frmNotice" method="post" action="update" >
   <div class="board_view_area container" style="margin-top:70px;" >
      <ul class="top_title_faq">
         <li class="title" >
         	<span class="check_tit_area"> <em class="check_num">[ ${noticeVO.category } ]</em>
         	<input type="text" style="width:100%;" value="${noticeVO.nTitle }" name="nTitle" id="i_nTitle" disabled/></span>
         </li>
         <li class="stit_area">
            <span>등록일<fmt:formatDate value="${noticeVO.date}" pattern="yyyy/MM/dd" /></span>
            <span class="check_tit_area">조회수 <em class="check_num">10</em></span>
         </li>
      </ul>
      <div class="view_area">

		<p><input type="hidden" value="${noticeVO.noticeNO }" name="noticeNO" id="i_noticeNO" disabled />
			<!-- ***hidden값으로 articleNO값 넘겨줘야함!!! -->
			<input type="hidden" name="noticeNO" value="${noticeVO.noticeNO }" /></p>

         <p><textarea rows="20" cols="85" name="nContent" id="i_nContent" disabled>${noticeVO.nContent}</textarea><br/>
            <span style="font-family:맑은 고딕"></span></p>
      </div>
      <div id="tr_btn_modify" class="customer1_btn" style="display:none">
      	 <input type="button" class="w3-button w3-indigo w3-round" value="수정하기" onclick="fn_modify_notice(frmNotice)"/>
         <input type="button" class="w3-button w3-indigo w3-round" value="취소하기" onclick="backToList(this.form)" />
      </div>
      <div class="customer_btn" id="tr_btn" style="margin-bottom:70px;">
      	 <input type="button" class="w3-button w3-dark-grey w3-round " value="수정" onClick="fn_enable(this.form)"/>
         <input type=button class="w3-button w3-dark-grey w3-round" value="목록" onclick="location.href='list'" />
         <input type="button" class="w3-button w3-dark-grey w3-round" value="삭제" onclick="fn_remove_article(${noticeVO.noticeNO})"/>
      </div>
   </div>
</form>

<footer>
   <jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</body>
</html>
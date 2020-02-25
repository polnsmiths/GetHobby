<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="today" class="java.util.Date" />
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<!-- 웹사이트 파비콘 -->
<link rel=" shortcut icon" href="/resources/image/logo/logo-favicon.png">
<link rel="icon" href="/resources/image/logo/logo-favicon.png">

<!-- favicon 404 에러 안보이게  -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<!-- 웹 폰트 (나눔고딕) -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean"
	rel="stylesheet">


<!--부트스트랩 CSS-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- fontawesome cdn(웹 아이콘 라이브러리) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- jQuery js -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 부트스트랩 js -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>


<!-- 공통 CSS -->
<link rel="stylesheet" href="/resources/css/common.css">



<link rel="shortcut icon" href="/static/pc/images/favicon.ico">

 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script> 
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Header js & css -->
<script src="/resources/javascript/commonHeader.js"></script>
<link rel="stylesheet" href="/resources/css/commonHeader.css" />


<style type="text/css">
 .wholeGetEvent{
 	border-radius: 10px;
 	height: 20rem;
 	width: 100%;
 	object-fit: cover;
 }

#dropdownButton{
	height: 2rem;
	width: 4rem;
	font-size: 16px;
}

#cannotdeleteEvent{
	background-color: grey;
}
</style>

<script type="text/javascript">

$(function() {
	var eventId = $('input:hidden[name=eventId]').val();

	$("#updateEvent").on("click", function() {
		
		//alert('eventId-'+eventId);
		//self.location = "/event/updateOneEventView?eventId="+eventId;
		$("#getEventForm").attr("method", "POST").attr("action", "/event/updateOneEventViewAdmin").submit();
		
	});
	
	$("#deleteEvent").on("click", function() {
		
		//alert('eventId-'+eventId);
		$("#getEventForm").attr("method", "POST").attr("action", "/event/deleteOneEventAdmin").submit();
		
	});
	
	$("#cannotdeleteEvent").on("click", function() {
		
		swal.fire("삭제불가", "진행중인 이벤트는 삭제할 수 업습니다 :)", "error");
		
	});
	
})

</script>

</head>
<body>
<!--  
	<c:if test="${user.userId eq 'admin@naver.com'}">
	<jsp:include page="/admin/sidebarAdmin.jsp" />
	</c:if> -->
	
	<!-- toolbar -->
	<jsp:include page="/common/header.jsp" />
<!-- 
	<c:if test="${user.userId eq 'admin@naver.com'}">
	<div id="content">
	</c:if>  -->

	<!-- 전체 묶음 -->
	<div class="wholeGetEvent container mt-5">
	
	<form name="getEventForm" id="getEventForm">
	<input type="hidden" id="eventId" name="eventId" value="${event.eventId }">
	
	<div id="contents" class="">
	
		<!-- event-detail -->
		<div class="event-detail">
		
		</br>
		</br>
		</br>
			<h2 class="tit">${event.eventTitle }</h2>
			
	<c:if test="${user.userId eq 'admin@naver.com'}">
	
			<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="to_day"/>  
			<fmt:formatDate value="${event.eventEndDate}" pattern="yyyy-MM-dd" var="event_End_Date"/>  
			<!-- Small button groups (default and split) -->
			<div class="btn-group">
  				<button class="btn btn-sm dropdown-toggle bi-three dots vertical" id="dropdownButton" type="button" data-toggle="dropdown" >
    			 관리
 				</button>
  				<div class="dropdown-menu">
    				<a class="dropdown-item" id="updateEvent" href="#">수정</a>
    				<c:if test="${to_day > event_End_Date}"> <!-- 종료된 이벤트만 삭제가능하도록... -->
   					<a class="dropdown-item" id="deleteEvent" href="#">삭제</a>
   					</c:if>
   					<c:if test="${to_day <= event_End_Date}">
   					<a class="dropdown-item" id="cannotdeleteEvent" href="#">삭제불가</a>
   					</c:if>
  				</div>
  				
			</div>
			
	</c:if>		
			<p class="event-detail-date">
				<span>기간</span>
				<em>${event.eventStartDate } ~ ${event.eventEndDate }</em>
			</p>

			<!--
				가로가 100% 일때
				<div class="event-html full">

				가로가 1100px 일때
				<div class="event-html">
			-->
				
					<div class="event-html">
						<p>${event.eventContent }</p>
					</div>

		</div>

		
	</div>
	
	

</form>

</div>
<jsp:include page="/common/footer.jsp" />

</body>

</html>
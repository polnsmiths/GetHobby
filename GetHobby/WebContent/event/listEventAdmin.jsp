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

<!-- 메인 메뉴 CSS -->
<link rel="stylesheet" href="/resources/css/header.css">
<!-- 메인 메뉴 js -->
<script src="/resources/javascript/header.js"></script>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<style type="text/css">

.card-img-top {
	border-radius: 10px;
	height: 20rem;
	width: 100%;
	object-fit: cover;
}

.breadcrumb{
	background-color: white;
}

.breadcrumb-item{
	align-self: center;
	width: 4em;
}

.add_Event{
	width: 43em;
}

#deleteButton{
	width: 4em;
	height : 2em;
	
}



</style>
<script type="text/javascript">
	
$(function() {
	
	//이벤트이름 클릭시
	$(".event_title_class").on("click", function() {
		
/* 		//alert('이미지클릭');
		var beforeSplit = $(this).attr('id');
		alert(beforeSplit);
		var afterSplit = beforeSplit.split('_');
		var eventNo = afterSplit[1];
		console.log('eventNo--'+eventNo+'--');
		alert(eventNo); */
		alert('선택');
 		//var eventId = $(this).parents('.kyung-card').find('.eventId_hidden').val();
 		
		//var eventTitle = $(this).text(); 
		var eventId = $(this).children('input:hidden[name=eventId]').val();
		
		alert('eventId-'+eventId);
 		//console.log('eventId ? : ' + eventId);

		self.location = "/event/getEvent?eventId="+eventId;
		
	})
	
	$("#onGoing").on("click", function() {
		
		//alert('진행중');
		fnGetListEvent('0');

		
	})
	
	$("#entireEvent").on("click", function() {
		
		//alert('전체');
		fnGetListEvent('1');
		
	})
	
	$("#ended").on("click", function() {
		
		//alert('종료');
		fnGetListEvent('2');
	})
	
	$(".bi-plus").on("click", function() {
		
		alert('이벤트추가');
		self.location = "/event/addEvent.jsp";

	})
	
	
	$("input[name='eventId']").on("click", function() {
		
		//alert('선택');
		var eventId = $(this).val();
		//alert('eventId--'+eventId);
	
	   	var checkboxValues = [];
		//체크박스의 값들을 배열에 담는다.
	    $("input[name='eventId']:checked").each(function(i) {
	    	
	        checkboxValues.push($(this).val());
	       // console.log('checkboxValues--'+checkboxValues);
	        //alert('checkboxValues=='+checkboxValues);
	      
	    }); 
			console.log('checkboxValuesConsole 전체--'+checkboxValues);
			
	})//checkBox OnCLick
	
	
	$("#deleteButton").on("click", function() {
		alert('dd');
		var eventIds = [];
		
		$("input[name='eventId']:checked").each(function(i) {
		    	
			eventIds.push($(this).val());
		      
		}); 
		
		console.log('삭제할 eventId들--'+eventIds);
			
		if(eventIds == null || eventIds.length <1){
			alert("삭제할 이벤트를 선택해주세요");
			return;
		}
		self.location = "/event/deleteSelectedEvent?eventIds="+eventIds;
		
	});//deleteButton
		
	
})//function


	function fnGetListEvent(searchCondition) {
		
		//alert('함수시작');
		//alert('searchCondition--'+searchCondition);
		self.location = "/event/eventList?searchCondition="+searchCondition;
	};


	//////////////////////////////////////////////////////////////////////////////////
</script>

</head>

<body>

	<div class="whole container mt-5">
	<!-- toolbar -->
	<jsp:include page="/common/header.jsp" />


	<!-- 전체 묶음 -->
	
	<h2>${total}개의 이벤트</h2>
	<hr>
	
  <ol class="breadcrumb">
	   <div class="add_Event">
	      	<svg class="bi bi-plus" width="4em" height="4em" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 			 	<path fill-rule="evenodd" d="M10 5.5a.5.5 0 01.5.5v4a.5.5 0 01-.5.5H6a.5.5 0 010-1h3.5V6a.5.5 0 01.5-.5z" clip-rule="evenodd"></path>
 			 	<path fill-rule="evenodd" d="M9.5 10a.5.5 0 01.5-.5h4a.5.5 0 010 1h-3.5V14a.5.5 0 01-1 0v-4z" clip-rule="evenodd"></path>
		  	</svg>이벤트등록하기
	    </div>
    <li class="breadcrumb-item" id="onGoing" value="진행중"><a href="#">진행중</a></li>
    <li class="breadcrumb-item" id="entireEvent" value="전체"><a href="#">전체</a></li>
    <li class="breadcrumb-item active" id="ended" value="종료" aria-current="page">종료</li>
  </ol>
	    
	    
	<button id="deleteButton" type="button" class="btn btn-basic m-1">삭제</button>
	
	<table class="table">
  <thead>
    <tr>
      <th scope="col">선택</th>
      <th scope="col">No</th>
      <th scope="col">이벤트 이름</th>
      <th scope="col">이벤트기간</th>
    </tr>
  </thead>
  
<!--   //전체선택 체크박스를 선택하면 그 아래의 모든 체크박스를 선택 jQuery

  $(function(){
    $("#check_all").click(function(){
        var chk = $(this).is(":checked");//.attr('checked');
        if(chk) $(".select_subject input").prop('checked', true);
        else  $(".select_subject input").prop('checked', false);
    });
}); -->


  
  <tbody>
  <c:set var="i" value="0"/>
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="to_day"/>  
	<c:forEach var="eventList" items="${list}" varStatus="status" >
	<fmt:formatDate value="${list[i].eventEndDate}" pattern="yyyy-MM-dd" var="event_End_Date"/>  
	
			<c:if test="${list.size() < 1 }">
			 이벤트가 없습니다.
			</c:if> 
    <tr>
      <th scope="row">
	<c:if test="${to_day > event_End_Date}"> <!-- 종료된 이벤트만 삭제가능하도록... -->
      	<div class="form-check form-check-inline">
  			<input class="form-check-input" name="eventId" type="checkbox" id="categoryCheckbox1" value="${list[i].eventId }">
		</div>
	</c:if>
	 </th>
      <td>${i+1}</td>
      <td id="eventTitle" class="event_title_class"><input type="hidden" id="eventId" name="eventId" value="${list[i].eventId }">${list[i].eventId }..${list[i].eventTitle }</input></td>
     
      <td>${list[i].eventStartDate} ~ ${list[i].eventEndDate}</td>
    </tr>
    
    <c:set var="i" value="${i+1}"/>
    </c:forEach>

  </tbody>
</table>
	
	
	
	
	

	</div>
</body>
</html>
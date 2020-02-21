<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    
    <!-- 웹사이트 파비콘 -->
    <link rel=" shortcut icon" href="/resources/image/logo/logo-favicon.png">
    <link rel="icon" href="/resources/image/logo/logo-favicon.png">
    
    <!-- favicon 404 에러 안보이게  -->
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">

    <!-- 웹 폰트 (나눔고딕) -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">


    <!--부트스트랩 CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- fontawesome cdn(웹 아이콘 라이브러리) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />



    <!-- jQuery js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- 부트스트랩 js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    <!-- 공통 CSS -->
    <link rel="stylesheet" href="/resources/css/common.css">

    <!-- 메인 메뉴 CSS -->
    <link rel="stylesheet" href="/resources/css/header.css">
    <!-- 메인 메뉴 js -->
    <script src="/resources/javascript/header.js"></script>
	<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	<style type="text/css">
	
    .btn-basic {
        background-color: #F2B33D;
        color: white;
    }

    .btn-basic:hover {
        background-color: #F2D64B;
        color: white;

    }
    
    .btn-outline-basic {
        border: 1px solid #F2B33D;
        color: #F2B33D;
    }
    
    .btn-outline-basic:hover {
        background-color: #F2B33D;
        color: white;
    }
	
    </style>

<script type="text/javascript">
	////////////////////////////////////////////////////////////////////////////////////
	
	$(function() {
		
		var articleNo = $('#articleNo_hidden').val();
			
		$(document).on("click", "#deleteArticleButton", function() {
			
			alert('정말로 삭제하시겠습니까?');
			//alert('articleNo---'+articleNo);
			$("form").attr("method", "POST").attr("action", "/community/deleteCommunityArticle").submit();

		})
		
		
		$(document).on("click", "#updateArticleButton", function() {
			
			//alert('수정버튼');
			//alert('articleNo---'+articleNo);
			
			self.location = "/community/getCommunityArticleUpdateView?articleNo="+articleNo;
			
		})
				
	});


</script>
</head>

<body>

			<!-- toolbar -->
			<jsp:include page="/common/header.jsp"/>
			
	<!-- 전체 묶음 -->
	<div class="container mt-5">
	
	<form name="getCommunity">
	
	
  		<input type="hidden" id="articleNo_hidden" name="articleNo" value="${article.articleNo}">
  		<input type="hidden" id="hobbyClassNo" name="HobbyClass.hobbyClassNo" value="${article.hobbyClass.hobbyClassNo}">
  					
	    <div class="p-3 py-4 mb-2 text-left rounded">
          <svg id="beforeAddArticleButton" class="bi bi-chevron-left" width="4em" height="4em" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 		 	<path fill-rule="evenodd" d="M13.354 3.646a.5.5 0 010 .708L7.707 10l5.647 5.646a.5.5 0 01-.708.708l-6-6a.5.5 0 010-.708l6-6a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
		 </svg>
		<c:if test="${article.user.nickName == null}">
		${article.user.name }
		</c:if>
		${article.user.nickName } 님의 발자취
		
  		<!-- Default dropright button -->
			<div class="btn-group dropright">
 	 			<button type="button" class="btn btn btn-basic s-1 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    	---
  				</button>
  				<div class="dropdown-menu">
    		    		<button id="deleteArticleButton" class="btn btn btn-outline-basic s-1">삭제</button>
    					<button id="updateArticleButton" class="btn btn btn-basic s-1">수정</button>
 				</div>
			</div>
		<!-- Default dropright button -->
  			
    </div>
	
	

	

	
	<!-- 글 -->
	
	<div class="card">
	<!-- 
 		 <div class="card-header d-flex justify-content-center" > -->
 		 <div class="card-header" style="size: 40px;"  >
 			<img alt="" src="/resources/image/min/default-profile.jpg">
			
			<span style="width: 50px;">
				<c:if test="${article.user.nickName == null}">
				${article.user.name }
				</c:if>
				${article.user.nickName }
				
				<br>${article.regDate}
				<!-- 
				<h5 class="articleUserName">글작성자 : ${article.user.name}</h5>
				<h5 class="articleRegDate">글작성일 : ${article.regDate}</h5>     -->
			</span>
 		</div>
  		<div class="card-body" style="width: 700px;"> <!-- 자동개행되게 할것 -->
			<span class="articleContentSpan" ><h5>${article.articleContent}</h5></span>
		 		<img alt="" src="/resources/image/kyung/Music_1.jpeg"> 
  		</div>
  		
	</div>


	<hr class="PostView__Divider-sc-10vzch8-1 dqoMju">
	<!-- 댓글 -->
	<h4>${article.user.name}님의 글에 달린 댓글</h4>
 <c:set var="i" value="0"/>
 <c:forEach var="replyList" items="${replyList}"> <!-- items를 var라는 이름으로 저장 -->
		
	<div class="card">
 		 <div class="card-header" style="size: 40px;">

			 <img alt="" src="/resources/image/min/default-profile.jpg"> 
				${article.user.name}
				<br>${article.regDate}
 		 <!--  
				<h5 class="articleUserName">${replyList.user.name}</h5>
				<h5 class="articleRegDate">${replyList.regDate}</h5>    -->
 		 </div>
  		<div class="card-body">
		<span class="articleContentSpan"><h5>${replyList.replyContent}</h5></span>

  		</div>
	</div>

	<hr class="PostView__Divider-sc-10vzch8-1 dqoMju">	
		

		<c:set var="i" value="${i+1}"/><!-- 초기값0에서 1씩 증가 -->
</c:forEach>

		</form>
	</div>
	<!-- 전체 묶음 끝 -->
	
</body>
</html>
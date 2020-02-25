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

	<!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	<!-- Header -->
	<script src="/resources/javascript/commonHeader.js"></script>
	<link rel="stylesheet" href="/resources/css/commonHeader.css">
	<link rel="stylesheet" href="/resources/css/min/listCommunity.css">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script> 
	<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	</head>
	<!-- ////////////////////////////////////////////////////////========HEAD 끝==========/////////////////////////////////////////////////////////// -->
	<body class="listcommunity-body-class">
	
		<!-- toolbar -->
		<jsp:include page="/common/header.jsp"/>
				
	<div class="container mt-5">
	
		<div class="lcmnt-top-out-div">
			<h3 class="lcmnt-top-h3">커뮤니티 </h3>
		</div>
			
			
			<!-- ////// INPUT HIDDEN /////////// -->	
			<input type="hidden" name="hidden_hobbyClassNo" id="hidden_hobbyClassNo" value="${hobbyClassNo}">	
			<input type="hidden" name="hidden_totalCount" id="hidden_totalCount" value="${resultPage.totalCount}">	
			<input type="hidden" name="hidden_session_userId" id="hidden_session_userId" class="hidden_session_userId" value="${sessionUser.userId}">
			<input type="hidden" name="hidden_session_name" id=hidden_session_name class="hidden_session_name" value="${sessionUser.name}">
			<input type="hidden" name="hidden_session_profileImage" id="hidden_session_profileImage" class="hidden_session_profileImage" value="${sessionUser.profileImage}">
			<input type="hidden" name="hidden_session_nickName" id="hidden_session_nickName" class="hidden_session_nickName" value="${sessionUser.nickName}">
			<input type="hidden" class="hidden_articleNo" id="hidden_articleNo" value="${article.articleNo }" />

			<div class="outer_div">
				<div class="article_div">
					<div class="lcmnt-winf">
						<span class="lcmnt-fpiod">
							<c:if test="${article.user.profileImage == null }">
								<img src="/resources/image/min/default-profile.jpg" class="RatioImage__Img-wwqqoo-1 gRslZu lcmnt-apfi" style="size: 40px; width: 40px;">
							</c:if>
							<c:if test="${atricle.user.profileImage != null }">
								<img src="/resources/image/min/${article.user.profileImage}" class="RatioImage__Img-wwqqoo-1 gRslZu lcmnt-apfi" style="size: 40px; width: 40px;">
							</c:if>
						</span>
						
						<div class="lcmnet-ah34-od">
							<!-- default가 닉네임 => 없으면 이름으로 표시 -->
							<h3 class="lcmnt-ah3">
							<c:if test="${article.user.nickName == null}">
								${article.user.name}
							</c:if>
							<c:if test="${article.user.nickName != null}">
								${article.user.nickName}
							</c:if>
							</h3>
							
							<h4 class="articleRegDate lcmnt-ah4">${article.regDate}</h4>
						</div>
					</div>	
					
					</div>	
						<span class="article_Content lcmnt-span">							
							${article.articleContent}
						</span>

						<div class="report-update-and-so-on">
							<c:if test="${sessionScope.user.userId == article.user.userId }">
								<span class="report-update-and-so-on-inner-span mr-2">
									수정
								</span>
								<span class="report-update-and-so-on-inner-span mr-2">
									삭제
								</span>
							</c:if>
							<c:if test="${sessionScope.user.userId != article.user.userId }">
								<span class="report-update-and-so-on-inner-span mr-2">
									신고
								</span>
							</c:if>
						</div>
						<br/><hr/>
				</div>
					
					<div class="outer_reply_div" >
					<div class="reply_div" >

					
						<!-- ////// INPUT HIDDEN /////////// -->	
						<input type="hidden" class="hidden_replyNo" id="hidden_replyNo" value="${array.replyNo}" />
						<input type="hidden" class="hidden_replyContent" id="hidden_replyContent" value="${array.replyContent}" />
						<input type="hidden" class="hidden_reply_userprofileImage" id="hidden_reply_userprofileImage" value="${array.user.profileImage}" />
						<input type="hidden" class="hidden_reply_username" id="hidden_reply_username" value="${array.user.name}" />
						<input type="hidden" class="hidden_reply_userId" id="hidden_reply_userId" value="${array.user.userId}" />
						<input type="hidden" class="hidden_reply_usernickName" id="hidden_reply_usernickName" value="${array.user.nickName}" />
						<input type="hidden" class="hidden_reply_regDate" id="hidden_reply_regDate" value="${array.regDate}" />
						
					<c:forEach var="reply" items="${replyList }">
					<!-- 작성 정보 -->
					<div class="lcmnt-winf mt-3">	
						<!-- 프로필 사진 -->
						<span class="lcmnt-fpiod-reply">
						<c:if test="${reply.user.profileImage == null }">
							<img src="/resources/image/min/default-profile.jpg" class="RatioImage__Img-wwqqoo-1 gRslZu" style="size: 22px; width: 22px;">
						</c:if>
						<c:if test="${reply.user.profileImage != null }">
							${reply.user.profileImage }
						</c:if>
						</span>
						
						<!-- default가 닉네임 => 없으면 이름으로 표시 -->
						<div class="lcmnet-ah34-od">	
							<h6 class="replyUserName lcmnt-ah3">
							<c:if test="${reply.user.nickName == null}">
							${reply.user.name }
							</c:if>
							<c:if test="${reply.user.nickName != null}">
							${reply.user.nickName }
							</c:if>
							</h6>
							
							<h6 class="replyRegDate lcmnt-ah4  mb-1">${reply.regDate}</h6>						
						</div>
					</div>
						<span class="reply_Content lcmnt-span">${reply.replyContent}</span>
						<hr/>
					</c:forEach>	

						
					</div><!-- reply_div 끝 -->

				</div>
				
			</div><!-- outer_div 끝 -->
			
			<hr/>
			
			
			</div>
	
	
	</div> 

</body>
</html>
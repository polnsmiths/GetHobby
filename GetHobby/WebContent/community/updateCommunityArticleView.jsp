<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
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

<!-- 메인 메뉴 CSS 
<link rel="stylesheet" href="/resources/css/header.css"> -->
<!-- 메인 메뉴 js 
<script src="/resources/javascript/header.js"></script> -->


<link rel="shortcut icon" href="/static/pc/images/favicon.ico">
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Header js & css -->
<script src="/resources/javascript/commonHeader.js"></script>
<link rel="stylesheet" href="/resources/css/commonHeader.css" />



<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script> 

<style type="text/css">

</style>

<script type="text/javascript">
	////////////////////////////////////////////////////////////////////////////////////
	
	$(function() {
		
		
		//취소하기 버튼 클릭시
			$(document).on("click", "#beforeUpdateArticleButton", function() {
				
				var articleNo = $("input[class='hobbyClassNo']").val();
/* 				swal({
					title : '취소하시겠습니까?',
					text : '작성한 내용은 저장되지않습니다',
					icon : 'info',
					closeOnClickOutside : false,
					button : {
						cancle : {
							text : '페이지 머물기',
							value : false,
							className : 'btn btn-outline-primary'
						},
						confirm : {
							text : '로그인 창으로',
							value : true,
							className : 'btn btn-outline-primary'
						}
					}
				}); */
				
				self.location = "/community/getCommunity?articleNo="+articleNo;
			})
		
		
		$(document).on("click", "#updateArticleContentButton", function() {
			
			//alert('수정버튼');
			$("form").attr("method", "POST").attr("action", "/community/updateCommunityArticle").submit();

		})
				
	});


</script>

</head>

<body>
	<!-- toolbar -->
	<jsp:include page="/common/header.jsp" />



	<!-- 전체 묶음 -->
	<div class="container">

	</br></br></br></br>
	</br></br></br></br>
	
	
	<h1 class="sol-board-header">클래스커뮤니티 게시글 수정</h1>
	<hr>
			 
<form name="updateCommunityArticle" class="form-group  py-5">


		<input type="hidden" name="HobbyClass.hobbyClassNo" class="hobbyClassNo" value="${article.hobbyClass.hobbyClassNo}">
		<input type="hidden" name="articleNo" value="${article.articleNo}">
		<!--  <input type="hidden" name="User.userId" value="${article.user.userId}"> -->

<!--
  <nav class="Navigation-sc-17umbag-0 kqGpgu">
  	<div class="Navigation__NavigationContainer-sc-17umbag-1 hfOPGX">
  			<h3>
  			<button type="button" class="sc-jTzLTM flMyeK sc-kkGfuU hjumiI  btn btn-basic s-1" color="white">
  				<span class="sc-fjdhpX kCztpU">
  				<svg width="24" height="24" fill="none" viewBox="0 0 24 24"> 
  					<path fill-rule="evenodd" clip-rule="evenodd" d="M15.5 5.5l-6 6.5 6 6.5L14 20l-7.5-8L14 4l1.5 1.5z" fill="#3e4042"></path>
  				</svg>
  				</span>
  			</button>
  				<span class="Navigation__NavigationHeader-sc-17umbag-2 eMcHAM"><b>글 수정하기</b></span>
  				
  			<button id="updateArticleContentButton" type="button" class="sc-jTzLTM flMyeK sc-iAyFgw gTFMnn btn btn-basic s-1" color="red">
  			수정
  			</button>
  			</h3>
  	</div>
  </nav>


<div class="PostFormContainer__Content-sc-1dbr3fx-1 jIIgxK">
 	<div class="PostForm__PostFormContainer-scsgdl-0 heHYdN">
		
		<div class="PostForm__FormHeader-scsgdl-1 gCJWVj">
			<div class="PostForm__ProfileContainer-scsgdl-5 pXRTy">
				<div size="28" class="ProfileImage__Container-sc-1h9kedz-0 hdmaQX">
					<span class="RatioImage__Container-wwqqoo-0 eAfAEc ProfileImage__UserProfileImage-sc-1h9kedz-1 bKTweb">
					</span>
				</div>
						<div class="sc-bdVaJa hBKkTB PostForm__ProfileText-scsgdl-6 hVkmYW">
						</div>
			</div>
		</div>
	</div>
</div>
  -->

	
  			<textarea id="summernote" name="articleContent">${article.articleContent}</textarea>
  			
  			<div class="form-row d-flex justify-content-center my-5">
                <button type="button" class="btn btn-outline-basic m-1" id="beforeUpdateArticleButton">취소</button>
                <button type="button" class="btn btn-basic m-1" id="updateArticleContentButton">등록</button>
            </div>
  	</form>

</div>
<!-- 전체 묶음 -->


    <script>
    $(document).ready(function() {
    	$('#summernote').summernote({
    		//placeholder: '글씨를 입력해주세요',
    		lang: 'ko-KR',
    		tabsize: 2,
    		height: 700,
    		width: 1100,
/*     		  toolbar: [
    		    // [groupName, [list of button]]
    		    ['style', ['bold', 'italic', 'underline', 'clear']],
    		    ['font', ['strikethrough', 'superscript', 'subscript']],
    		    ['fontsize', ['fontsize']],
    		    ['color', ['color']],
    		    ['para', ['ul', 'ol', 'paragraph']],
    		    ['height', ['height']],
    		    ['view', ['codeview', 'help']]
    		  ], */
    		});
    });
    
    </script>
    
    	</br>
    	</br>
    	</br>
    	</br>
  	<jsp:include page="/common/footer.jsp" />

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>GetHobby</title>
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
				
				var articleNo = $("input[name=articleNo]").val();
				//alert('articleNo--'+articleNo);
				var hobbyClassNo = $("input[class=hobbyClassNo]").val();
				
				self.location = "/community/getCommunity?articleNo="+articleNo+"&hobbyClassNo="+hobbyClassNo;
			})
		
		
		$(document).on("click", "#updateArticleContentButton", function() {
			
			//alert('수정버튼');
			var articleNo = $("input[name=articleNo]").val();
			var hobbyClassNo = $("input[class=hobbyClassNo]").val();
			var articleContent = $('textarea').val();
			//alert(articleContent);
			//alert(articleNo);
			//alert('articleNo-'+articleNo);
			
			$("form#updateArticleContentForm").attr("method", "POST").attr("action", "/community/updateCommunityArticle").submit();
			//self.location = "/community/updateCommunityArticle?articleNo="+articleNo+"&hobbyClassNo="+hobbyClassNo+"&articleContent="+articleContent;

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
			 

	<form id="updateArticleContentForm">
		<input type="hidden" name="hobbyClass.hobbyClassNo" class="hobbyClassNo" value="${article.hobbyClass.hobbyClassNo}">
		<input type="hidden" name="articleNo" value="${article.articleNo}">
		<!--  <input type="hidden" name="User.userId" value="${article.user.userId}"> -->



	
  			<textarea id="summernote" name="articleContent">${article.articleContent}</textarea>
	</form>
  			
  			<div class="form-row d-flex justify-content-center my-5">
                <button type="button" class="btn btn-outline-basic m-1" id="beforeUpdateArticleButton">취소</button>
                <button type="button" class="btn btn-basic m-1" id="updateArticleContentButton">수정</button>
            </div>

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
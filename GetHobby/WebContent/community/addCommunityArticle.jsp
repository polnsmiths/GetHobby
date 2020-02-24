<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<link rel="shortcut icon" href="/static/pc/images/favicon.ico">
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>

 
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
			
			///글 등록하기 버튼 클릭시
			$(document).on("click", "#addArticleButton", function() {
				
				alert('글 등록 버튼');
				//로그인 정보는 세션에서 가져가고
				//클래스No는 input으로 받을 예정.
				var articleContent = $('#summernote').val();
				//console.log(articleContent);
				//alert(articleContent);
				
				if(articleContent == null || articleContent.length<1){
					alert('글 내용을 입력해주세요.....');
					return;
				}
				$("form").attr("method", "POST").attr("action", "/community/addCommunityArticle").submit();
				
			})
			
			///글 등록하기 버튼 클릭시
			$(document).on("click", "#beforeAddArticleButton", function() {
				
				//alert('뒤로가기 버튼');
				history.go(-1);
			})
			
			
		});
	

	    $(document).ready(function() {
	    	
	    	$('#summernote').summernote({
	    		placeholder: '글씨를 입력해주세요',
	    		lang: 'ko-KR',
	    		tabsize: 2,
	    		height: 700,
	    		minHeight : 350,
	    		maxHeight : 350,
	    		width: 1024,
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
	    		callbacks : {
	    			onImageUpload: function(files, editor, welEditable) {
	    				//alert(files);
	    				//alert(editor);
	    				//alert(welEditable);
	    				for (var i = files.length-1 ; i >=0 ; i--) {
							sendArticleFile(files[i], this);
							
						}
					}
	    		}  
	    		  
	    		});//summerNote
	    	
	    });//ready
	    
		function sendArticleFile(file, el) {
			var form_data = new FormData();
	      	form_data.append('file', file);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: '/community/json/makeArticleFileUpload',
	        	cache: false,
	        	contentType: false,
	        	enctype: 'multipart/form-data',
	        	processData: false,
	        	success: function(img_name) {
	        		console.log('파일이 저장된 path--'+img_name);
	        		var path = "";
	        		var result_img_name = img_name+'" style="width: 1024px;"';
	        		console.log(path);
	        		//var url = ""
	        		//$(el).summernote('editor.insertImage', path);
	        		$('#summernote').summernote('insertImage', '/images/kyung/'+img_name);
	        		//$('#summernote').summernote('insertImage', '/images/kyung/'+result_img_name);
	        		//$("textarea").html(path);
					
	        	},
	        	error:function(request,status,error){
			            alert("ajax과정 실패");
			       }
			}); //ajax
		}//sendArticleFile    
	    
    
	</script>
</head>

<body>

	<!-- toolbar -->
	<jsp:include page="/common/header.jsp" />

	<!-- 전체 묶음 -->
	<div class="wholeGetEvent container mt-5">

<form name="addCommunityArticle">

<!-- 일단 때려박음 -->
	<input type="hidden" name="HobbyClass.hobbyClassNo" value="10005">
	
  
        <div class="p-3 py-4 mb-2 text-left rounded">
          <svg id="beforeAddArticleButton" class="bi bi-chevron-left" width="4em" height="4em" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 		 	<path fill-rule="evenodd" d="M13.354 3.646a.5.5 0 010 .708L7.707 10l5.647 5.646a.5.5 0 01-.708.708l-6-6a.5.5 0 010-.708l6-6a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
		 </svg>
		 글 작성하기
		   	<button id="addArticleButton" type="button" class="btn btn-basic m-1" >
  				등록
  			</button>
        </div>
  
 	<!-- 이벤트 내용 --> 
 	<div class="input-group">

			<textarea  class="form-control" id="summernote" name="articleContent"  aria-label="With textarea"></textarea>
	</div>
	
  	
  </form>
  
  <p>footer</p>	



</div>

</body>
</html>
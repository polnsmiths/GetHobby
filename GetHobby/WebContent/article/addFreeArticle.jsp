<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
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


<!-- ////////////////////////위를 복사하세요//////////////////////////////////////// -->



	<link rel="stylesheet" href="/resources/css/sol/article.css">

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="/resources/javascript/summernote/lang/summernote-ko-KR.js"></script>
<style>
</style>

<script>

function fncAddBoardArticle(){
	var boardCode = $("input[name='boardCode']").val();
	var articleType = $("select[name='articleType']").val();
	var articleTitle = $("input[name='articleTitle']").val();
	var articleContent = $("textarea[name='articleContent']").val();


	if(articleType == null || articleType.length < 1){
		alert("말머리를 선택해주세요.");
		return false;
	}
	
	if(articleTitle == null || articleTitle.length < 1){
		alert("게시글 제목을 입력해주세요.");
		return false;
	}
	
	if(articleContent == null || articleContent.length < 1){
		alert("게시글 내용을 입력해주세요.");
		return false;
	}
	 
	$("form").attr("method","POST").attr("action","/article/addBoardArticle").submit();
}


	
	$(function() {

		$('#summernote').summernote({
			minHeight: 600,
	        maxHeight: 600,
			lang : 'ko-KR',
			callbacks: {
	        	onImageUpload: function(files, editor, welEditable) {
	                for (var i = files.length - 1; i >= 0; i--) {
	                  sendFile(files[i], this);
	                }
	              }
        	},
        	disableResizeEditor: true
		});
		$('.note-statusbar').hide();
		
		$("button.btn-basic").on("click", function(){
			fncAddBoardArticle();
		});

	});
	
	function sendFile(file, el) {
		console.log("??????????????" + el);
		var boardCode = $("input[name='boardCode']").val();
	    var form_data = new FormData();
	    form_data.append('file', file);
	    form_data.append('boardCode', boardCode);
	    $.ajax({
	      data: form_data,
	      type: "POST",
	      url: '/article/json/saveImage',
	      cache: false,
	      contentType: false,
	      enctype: 'multipart/form-data',
	      processData: false,
	      success: function(form_data) {
	        $(el).summernote('editor.insertImage', '/images/sol/free_board/' + form_data.fileName);
	        
	      }
	    });
	  }
</script>


</head>

<body>

	<div class="container">
    <h1 class="sol-board-header">자유게시판 게시글 작성</h1>
        <form class="form-group my-5 py-5">
            <input type="hidden" name="boardCode" value="0">
            <div class="form-row my-3">
                <div class="input-group col-lg-3">
                    <select class="form-control" name="articleType">
                        <option selected disabled>말머리 선택</option>
                        <option value="001">꿀팁</option>
                        <option value="002">잡담</option>
                        <option value="003">질문</option>
                    </select>
                </div>
                <div class="input-group col-lg-9">
                    <input type="text" class="form-control" name="articleTitle" placeholder="게시글 제목을 입력하세요">
                </div>
            </div>
            <textarea id="summernote" name="articleContent"></textarea>
            
            <div class="form-row d-flex justify-content-center my-5">
                <button type="button" class="btn btn-outline-basic m-1">취소</button>
                <button type="button" class="btn btn-basic m-1">등록</button>
            </div>
        </form>

    </div>
</body>

</html>
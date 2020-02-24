<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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



<!-- ////////////////////////위를 복사하세요//////////////////////////////////////// -->
<!-- header CSS -->
	<link rel="stylesheet" href="/resources/css/commonHeader.css" />
	<!-- header js -->
	<script src="/resources/javascript/commonHeader.js"></script>


	<link rel="stylesheet" href="/resources/css/woo/article.css">
<style>
</style>
<script type="text/javascript">
	
	$(function(){
		/* $("#bcc").on("click",function(){ */
		$(document).on("click",'#bcc',function(){
			/* self.location = "/user/getNotice/"+$($(this).parent().siblings("#articleNo")).val();	 */	
			self.location = "/user/getNotice/"+$(this).find("#articleNo").val();	
		});	
		$("button.btn.btn-basic.btn-sm").on("click",function(){
			self.location = "/user/addNotice";
		});
	});
	
</script>
</head>
<body>
<jsp:include page="/common/header.jsp"/>

	
	    <div class="container">
        <h1 class="sol-board-header">공지사항</h1>

        <form class="form-group search my-5 pt-5 d-flex justify-content-between">
            <h4 class="font-weight-bold"><i class="far fa-file-alt mx-3"></i>공지사항 목록</h4>
            <input type="hidden" name="boardCode" value="0">
            <input type="hidden" id="currentPage" name="currentPage" value=""/>
        </form>
		
        <table class="table table-borderless sol-article-table">
            <thead>
                <tr>
                    <th class="py-3" scope="col" style="width: 70%">글제목</th>
                    <th class="py-3" scope="col" style="width: 20% text-align: center;">작성날짜</th>
                    <th class="py-3" scope="col" style="width: 10%">조회수</th>
                </tr>
            </thead>
            <tbody>
				<c:set var="i" value="0"/>
				<c:forEach var="article" items="${list}">
				<c:set var="i" value="${i+1}"/>
				
				<tr class="bg-basic">
										
						<td scope="row" id="bcc" style="cursor: pointer;"><input type="hidden" id="articleNo" value="${article.articleNo}">${article.articleTitle}</td>
						<td scope="row">${article.regDate}	</td>				
						<td scope="row">${article.totalView}</td>			
				
						
						</tr>
			</c:forEach>
            </tbody>
        </table>

        <div class="row d-flex justify-content-end">
            <button type="button" class="btn btn-basic btn-sm"> <i class="fas fa-pencil-alt"></i> 작성</button>
        </div>
<jsp:include page="/common/pagenation.jsp"/>
</div>
</body>
</html>
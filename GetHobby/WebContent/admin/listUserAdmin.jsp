<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- //2020-02-19 Git Commit --%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="/resources/css/commonAdmin.css">
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	 <!-- fontawesome cdn(웹 아이콘 라이브러리) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	<style>
		/*
    DEMO STYLE
*/

@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
body {
    font-family: 'Poppins', sans-serif;
    background: #fafafa;
}

p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}

a,
a:hover,
a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
    clear: left;
}

.navbar {
	position: fixed;
	left:0px;
	top: 0px;
	z-index: 1000;
	width:100%;
	
    padding: 14px 16px;
    height: 57px;
    background: #fff;
    border: none;
    border-radius: 0;
    margin-bottom: 40px;
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.navbar-btn {
    box-shadow: none;
    outline: none !important;
    border: none;
}

.line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 40px 0;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */

.wrapper {
    display: flex;
    width: 100%;
}

#sidebar {
    width: 250px;
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    z-index: 999;
    background: white;
    color: rgb(97, 101, 104);
    transition: all 0.3s;
}

#sidebar.active {
    margin-left: -250px;
}

#sidebar .sidebar-header {
    padding: 20px;
    background: white;
    font-size: 14px;
}

#sidebar ul.components {
    padding: 20px 0;
    font-size: 14px;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}

#sidebar ul li a:hover {
    color: rgb(97, 101, 104);
    background: #fff;
}

#sidebar ul li.active>a,
a[aria-expanded="true"] {
    color: rgb(27, 28, 29);
    font-weight: bold;
    background: white;
    position: relative;
}

a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}

ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}

ul.CTAs {
    padding: 20px;
}

ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}

a.download {
    background: #fff;
    color: #7386D5;
}

a.article,
a.article:hover {
    background: #6d7fcc !important;
    color: #fff !important;
}

/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */

#content {
    width: calc(100% - 250px);
    padding: 81px 24px 57px;
    min-height: 100vh;
    transition: all 0.3s;
    position: absolute;
    top: 0px;
    right: 0px;
}

#content.active {
    width: 100%;
}

/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */

@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
    }
    #sidebar.active {
        margin-left: 0;
    }
    #content {
        width: 100%;
    }
    #content.active {
        width: calc(100% - 250px);
    }
    #sidebarCollapse span {
        display: block;
    }
}

/* Css Custom */

.adminAction-button {
	background-color:#4267b2; 
	border:0; 
	outline: none; 
	width:40px; 
	height:24px; 
	padding: 0px;
}
.sidebar-text{
	margin: 6px 8px;
	top:120px;
	float: left;
			
}
.sidebar-text:hover{
	font-weight: 700;
}
.sidebar-svg {
	margin: 6px 0px 6px 12px;
	width: 24px;
	height: 24px;
	float: left;
}
h1 {
	font-size: 24px;
   font-weight: bold;
   color: rgb(62, 64, 66);
   line-height: 32px;
   letter-spacing: -0.4px;
   margin: 0px;
}
.manager-title {
	margin: 23px 0px 15px 32px;
}
.manager-content {
	margin: 0px;
}
.manager-title-searchbar {
	width: 360px;
    height: 100%;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    cursor: pointer;
    box-shadow: rgba(0, 0, 0, 0.04) 0px 0px 1px 0px, rgba(41, 42, 43, 0.16) 0px 1px 3px 0px;
    padding: 10px 16px;
    border-radius: 3px;
    
}
.manager-title-search-input-box {
	border:0; 
	outline:none;
	width:360px;
	
}
.manager-no {
	width: 20px;
}
.delete-event-div {
	display: flex;
	height: 44px;
    align-items: center;
    font-size: 16px;
    margin-left: 8px;
}
.add-event-div {
	display: flex;
	height: 44px;
    align-items: center;
    font-size: 16px;
    cursor: pointer;
    
}
.add-event-div:hover {
 	text-decoration: underline;
 	text-decoration-color:rgb(95, 174, 201);
}
.update-event-div {
	display: flex;
	height: 44px;
    align-items: center;
    font-size: 16px;
    margin-left: 8px;
}
.black-hover:hover {
	font-weight: 700;
}

.manage-menu-div {
	width: 100%;
	display: flex;
	justify-content: space-between;	
}
.manage-search-menu-div-left-sort {
	width: 100%;
	display: flex;
	justify-content: left;
	
}
.manager-search-menu-div {
	display: flex;
	justify-content: left;
}
.manage-sort-button-div {	
	height: 44px;			
}

.manage-sort-button {
	border: 0;
	outline: none;
	width:120px;	
	color:rgb(62, 64, 66);
	background-color: white;
}
.manage-sort-button:focus {
	border: 0;
	outline: none;
}
::selection { 
	background-color: rgb(255, 89, 70) !important;
 		color: rgb(255, 255, 255) !important;
}
.dropdown-item:focus {
	background-color: white;
	color: rgb(255, 146, 43);
}
.dropdown-menu {
	border: 0;
	box-shadow: rgba(41, 42, 43, 0.2) 0px 8px 10px -4px;
	outline: 0 none;
	
}
.button:hover {
	border: 0;
	outline: 0 none;
	background-color: white;
}

.button,textarea:focus {
	border: 0 !important;
	outline: 0 none !important;
	background-color: white;	
}

.button:not(:hover) {
	border: 0;
	outline: 0 none;
	background-color: white;
}
.manager-title-state {
	font-size: 14px;
	margin-left: 8px;
}
.page-item a {
	color: rgb(62, 64, 66);
	border: 0;
	outline: 0 none;
}
.page-item:focus {
	border: 0;
	outline: 0 none;
}
.page-item a:hover {
	color: rgb(62, 64, 66);
	font-weight: 700;
	border: 0;
	outline: 0 none;
}
.flow-button {
	border: 0;
	outline: 0 none;
	background-color: white;
	width:32px;
	height:32px;
	padding:0px;
}
.flow-button:hover {
	border: 0;
	outline: 0 none;
	font-weight: 500;
	
}
.flow-button:focus {
	border: 0;
	outline: 0 none;			
}
.page-link:focus {
	border: 0;
	box-shadow: none;
	outline: 0 none;
 }
 .page-link {
 	border: 0;
	box-shadow: none;
	outline: 0 none;
 }
.sidebar-text{
	margin: 6px 8px;
	top:120px;
	float: left;
	
}
.sidebar-svg {
	margin: 6px 0px 6px 12px;
	width: 24px;
	height: 24px;
	float: left;
}
h1 {
	font-size: 24px;
   font-weight: bold;
   color: rgb(62, 64, 66);
   line-height: 32px;
   letter-spacing: -0.4px;
   margin: 0px;
}
.manager-title {
	margin: 16px 0px 32px 32px;
}
.manager-content {
	margin: 0px;
}
.manage-no-page-span {
	color: rgb(220, 220, 220);	
	cursor: not-allowed;
	border: 0;
	outline 0 none;
}
				
	</style>
</head>

<body>
<form >
    <div class="wrapper">
        
        <!-- Sidebar
        <jsp:include page="sidebarAdmin.jsp" /> -->
		<jsp:include page="/admin/sidebarAdmin.jsp" />
        <!-- Page Content  -->
        <div id="content">

			<!-- Toolbar
            <jsp:include page="toolbarAdmin.jsp" /> -->
            <jsp:include page="/admin/toolbarAdmin.jsp" />
            <!--------------------------------------------------------------------------------------------------------------------------------------------------->
            <!---------------------------------------------------------------------- 관리화면 ---------------------------------------------------------------------->
            
            <!-- 모듈관리명 -->
			<div class="manager-title">
            	<h1>회원 관리
            	<span class="manager-title-state">총 회원 : ${purchaseMap.purchaseTotalCount}명</span>
            	<span class="manager-title-state">총 크리에이터 회원 : ${purchaseMap.purchasePaymentCount}명</span>
            	<span class="manager-title-state">총 정지 회원 : ${purchaseMap.purchaseRefundCount}명</span>
            	<span class="manager-title-state">총 탈퇴 회원 : ${purchaseMap.purchaseRefundCount}명</span>
            	</h1>          	
            </div>
            
            <!-- 관리 메뉴( 검색창, 정렬버튼, 수정버튼, 삭제버튼 ) -->
            <div class="manage-menu-div">
            	<%-- <div class="">
						<select class="" name="searchCondition">
							<option value="0"
								${! empty search.searchCondition && search.searchCondition == 0 ? "selected" : "" }>아이디(이메일)</option>
							<option value="1"
								${! empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>상품가격</option>

						</select>
					</div> --%>
            	<!-- 검색창 -->
	            <div class="manager-title-searchbar">
	            	<input type="text" name="searchKeyword" class="manager-title-search-input-box" placeholder="아이디 검색" value="">
	            	<svg width="24" height="24" class="SearchBox__SearchIcon-rplyxp-2 beZsar" viewBox="0 0 24 24">
		            	<path fill="#3e4042" fill-rule="evenodd" d="M15.593 14.54L20.5 19 19 20.5l-4.46-4.907a6.5 6.5 0 111.054-1.054zM10.5 15a4.5 4.5 0 100-9 4.5 4.5 0 000 9z" />
	            	</svg>	
	            </div>
	            
	            <div class="manage-search-menu-div-left-sort">
		            <!-- 정렬버튼 -->
		            <div class="btn-group manage-sort-button-div">
					  <!-- <button type="button" class="btn-outline-light manage-sort-button black-hover" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    	회원자격
					    	<svg width="20" height="20" viewBox="0 0 24 28">
						    	<path fill="#3e4042" fill-rule="evenodd" d="M5.5 8.5l6.5 6 6.5-6L20 10l-8 7.5L4 10z" />
					    	</svg>
					  </button> 
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="#">전체</a>
					    <a class="dropdown-item" href="#">일반 회원</a>
					    <a class="dropdown-item" href="#">크리에이터 회원</a>
					    <a class="dropdown-item" href="#">정지 회원</a>
					    <a class="dropdown-item" href="#">탈퇴 회원</a>-->
					     <div>					     
					     <select id="searchCondition" class="form-control cvzQqA" name="searchCondition">
						<option  selected disabled>회원자격</option>
						<option value="3">전체</option>
						<option  value="0">일반 회원</option>
						<option  value="1">크리에이터 회원</option>
						<option  value="2">정지 회원</option>
						
						</select>
					  </div> 
					 
					</div>				
		            
	            </div>
	            
            </div>
            
            
            <div class="manager-content">
	            <table class="table table-borderless">
				  <thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">아이디(이메일)</th>
				      <th scope="col">이름</th>
				      <th scope="col">생년월일</th>
				      <th scope="col">회원자격</th>
				      <th scope="col">가입 날짜</th>
				      <th scope="col">정지 날짜</th>
				      <th scope="col">탈퇴 날짜</th>
				      <th scope="col">상태변경</th>				      
				    </tr>
				  </thead>
				  <tbody class="purchaseAdmin-tbody">
				  
			  		
				  	
				    <c:set var="i" value="0" />
					<c:forEach var="user" items="${userList}">
					<c:set var="i" value="${i+1}" />
					
				    <tr class="bg-basic">
				    
				      <input type="hidden" name="userId" value="${user.userId}">
				      <!-- 번호 -->
				      <th scope="row" class="purchaseIdAdmin"></th>
				      
				      <!-- 유저 아이디 -->				      
				      <td class="userIdInfo" style="cursor: pointer;">${user.userId}</td> 
				      
				      
				      <!-- 이름 -->
				      <td class="userNameInfo">${user.name}</td>
				      
				      <!-- 생년월일 -->		 
				      <td class="userBirthInfo"><%-- <fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd" /> --%>${user.birth}</td>
				       
				       <!-- 회원 자격 -->
				      <td class="userRoleInfo">
				      <c:if test="${user.role == '0'}">일반 회원</c:if>
				      <c:if test="${user.role == '1'}">크리에이터 회원</c:if>
				       <c:if test="${user.role == '2'}">관리자</c:if>
				       <c:if test="${user.role == '8'}">정지 회원</c:if>
				       <c:if test="${user.role == '9'}">탈퇴 회원</c:if>
				       </td>
				      <!-- 가입 날짜 -->
				      <td class="addUserInfo"><fmt:formatDate value="${user.addDate}" pattern="yyyy-mm-dd"/></td>
				      
				      <!-- 정지 날짜 -->
				      <td class="stopUserInfo"><fmt:formatDate value="${user.stopDate}" pattern="yyyy-mm-dd"/></td>
				      
				      <!-- 탈퇴 날짜 -->
				      <td class="retireUserInfo"><fmt:formatDate value="${user.retireDate}" pattern="yyyy-mm-dd"/></td>
				      
				      <!-- 정지 -->
				      
				      <td class="addstopUser" style="font-size: 25px;"><i class="fas fa-user-times"></i>&nbsp;&nbsp;<i class="fas fa-user"></i>&nbsp;&nbsp;
				      <i class="fas fa-user-minus"></i>&nbsp;&nbsp;<i class="fas fa-user-plus"></i></td>
				      <%-- <c:choose>
				      	<c:when test="${user.role == '2'}">관리자</c:when>				      	
				      </c:choose>				     
				      <c:otherwise>
				      	정지/탈퇴
				    	<!-- <div>정지 시키기</div>
				    	<div>/</div>
				    	<div>탈퇴 시키기</div>  -->
				      </c:otherwise>
				      </td> --%>
				  
				    </tr>	
				    					    
				    </c:forEach> 					
				  </tbody>
				</table>
				
				<!-- Pagination -->
					<jsp:include page="/admin/paginationAdmin.jsp" />
				
			</div>


            
        </div>
    </div>

   			
		   	<%-- 	<input type="hidden" name="searchKeyword" value="">
		   		<input type="hidden" name="searchCondition" value="">
		   		<input type="hidden" name="category" value="">
		   		<input type="hidden" name="currentPage" value="${resultPage.currentPage}">
		   		<input type="hidden" name="maxPage" value="${resultPage.maxPage}"> --%>
		   	</form>

    <script type="text/javascript">
    
	   $(function(){
		  /////////// 유저 정보 상세 보기    //////
		   $(".userIdInfo").on("click", function(){
			  
			   self.location="/user/getUser?userId="+$(this).siblings("input[name='userId']").val();	
			   
		   });		  
		 //////////////////////////////////
		
		
		$("#searchKeyword").change("click",function(){
			var searchKey = $("#searchKeyword").val(); 
		});
		 	
		 $("#searchCondition").change("click",function(){
			 $("form").attr("method","post").attr("action","/admin/user/listUserAdmin").submit();		
			 
			/*  $.ajax ({
				
				 url : "/admin/json/user/getSearchlistUserAdmin",
			 	 method : "post",
			 	 dataType : "json",
			 	 headers : {
			 		 "Accept" : "application/json",
			 		 "content-type" : "application/json"
			 	 },
			 	 data : JSON.stringify({
			 		 searchCondition : searchCon
			 	 }),
				 success : function(JSONData,status){
					self.location="/admin/user/getSearchlistUserAdmin/"+JSONData;
				 }
			 
			 }) */
		 }); 
	   });
	   
	  
    </script>
</body>

</html>